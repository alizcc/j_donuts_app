import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/product/data/product_mapper.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:j_donuts_app/features/product/domain/product_repository.dart';

class DriftProductRepository implements ProductRepository {
  const DriftProductRepository(this._database);

  final AppDatabase _database;

  @override
  Stream<Product?> watchProduct(String id) {
    final query = _database.select(_database.products)
      ..where((row) => row.id.equals(id));
    return query.watchSingleOrNull().map((row) => row?.toProduct());
  }
}
