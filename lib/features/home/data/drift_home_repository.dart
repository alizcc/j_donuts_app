import 'package:drift/drift.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/core/network/reachability.dart';
import 'package:j_donuts_app/core/result/failure.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/home/data/catalog.dart';
import 'package:j_donuts_app/features/home/data/catalog_remote_source.dart';
import 'package:j_donuts_app/features/home/data/catalog_store.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_repository.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/product/data/product_mapper.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

class DriftHomeRepository implements HomeRepository {
  const DriftHomeRepository({
    required AppDatabase database,
    required CatalogStore store,
    required CatalogRemoteSource remote,
    required Reachability reachability,
  }) : _database = database,
       _store = store,
       _remote = remote,
       _reachability = reachability;

  final AppDatabase _database;
  final CatalogStore _store;
  final CatalogRemoteSource _remote;
  final Reachability _reachability;

  @override
  Stream<List<HomeBanner>> watchBanners() {
    final query = _database.select(_database.banners)
      ..orderBy([(row) => OrderingTerm.asc(row.position)]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          HomeBanner(
            id: row.id,
            tag: row.tag,
            title: row.title,
            color: row.color,
          ),
      ],
    );
  }

  @override
  Stream<List<Product>> watchSection(HomeSection section) {
    final items = _database.sectionItems;
    final products = _database.products;
    final query =
        _database.select(items).join([
            innerJoin(products, products.id.equalsExp(items.productId)),
          ])
          ..where(items.section.equalsValue(section))
          ..orderBy([OrderingTerm.asc(items.position)]);
    return query.watch().map(
      (rows) => [for (final row in rows) row.readTable(products).toProduct()],
    );
  }

  @override
  Stream<List<Shop>> watchShops() {
    final query = _database.select(_database.shops)
      ..orderBy([(row) => OrderingTerm.asc(row.position)]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          Shop(
            id: row.id,
            name: row.name,
            address: row.address,
            color: row.color,
          ),
      ],
    );
  }

  @override
  Future<Result<void>> refresh() async {
    if (!await _reachability.isReachable()) {
      return const Err(NetworkFailure('No internet connection'));
    }
    final Catalog catalog;
    try {
      catalog = await _remote.fetchCatalog();
    } on Exception catch (error) {
      return Err(NetworkFailure('Could not load the catalog', cause: error));
    }
    try {
      await _store.save(catalog);
      return const Success(null);
    } on Exception catch (error) {
      return Err(StorageFailure('Could not save the catalog', cause: error));
    }
  }
}
