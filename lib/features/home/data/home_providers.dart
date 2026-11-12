import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/core/network/network_providers.dart';
import 'package:j_donuts_app/features/home/data/catalog_remote_source.dart';
import 'package:j_donuts_app/features/home/data/catalog_seeder.dart';
import 'package:j_donuts_app/features/home/data/catalog_store.dart';
import 'package:j_donuts_app/features/home/data/drift_home_repository.dart';
import 'package:j_donuts_app/features/home/domain/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@Riverpod(keepAlive: true)
CatalogStore catalogStore(Ref ref) =>
    CatalogStore(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
CatalogRemoteSource catalogRemoteSource(Ref ref) => FakeCatalogRemoteSource();

// seed must finish before the first query
@Riverpod(keepAlive: true)
Future<void> catalogSeed(Ref ref) =>
    CatalogSeeder(ref.watch(catalogStoreProvider)).seedIfEmpty();

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) => DriftHomeRepository(
  database: ref.watch(appDatabaseProvider),
  store: ref.watch(catalogStoreProvider),
  remote: ref.watch(catalogRemoteSourceProvider),
  reachability: ref.watch(reachabilityProvider),
);
