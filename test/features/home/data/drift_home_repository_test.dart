import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/core/network/reachability.dart';
import 'package:j_donuts_app/core/result/failure.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/home/data/catalog_remote_source.dart';
import 'package:j_donuts_app/features/home/data/catalog_store.dart';
import 'package:j_donuts_app/features/home/data/drift_home_repository.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:mocktail/mocktail.dart';

import '../catalog_fixture.dart';

class MockCatalogRemoteSource extends Mock implements CatalogRemoteSource {}

class MockReachability extends Mock implements Reachability {}

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late AppDatabase database;
  late MockCatalogRemoteSource remote;
  late MockReachability reachability;
  late DriftHomeRepository repository;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    remote = MockCatalogRemoteSource();
    reachability = MockReachability();
    final store = CatalogStore(database);
    repository = DriftHomeRepository(
      database: database,
      store: store,
      remote: remote,
      reachability: reachability,
    );
    await store.save(testCatalog());
  });

  tearDown(() => database.close());

  Future<List<String>> popularNames() async {
    final products = await repository.watchSection(HomeSection.popular).first;
    return [for (final product in products) product.name];
  }

  test('lists section products in their saved order', () async {
    expect(await popularNames(), ['Donut a', 'Donut b']);
  });

  test('returns NetworkFailure when offline and keeps cached data', () async {
    when(() => reachability.isReachable()).thenAnswer((_) async => false);

    final result = await repository.refresh();

    expect(result, isA<Err<void>>());
    expect((result as Err<void>).failure, isA<NetworkFailure>());
    expect(await popularNames(), ['Donut a', 'Donut b']);
    verifyNever(() => remote.fetchCatalog());
  });

  test('replaces cached data with the remote catalog when online', () async {
    when(() => reachability.isReachable()).thenAnswer((_) async => true);
    when(
      () => remote.fetchCatalog(),
    ).thenAnswer((_) async => testCatalog(products: [testProduct('c')]));

    final result = await repository.refresh();

    expect(result, isA<Success<void>>());
    expect(await popularNames(), ['Donut c']);
  });

  test('returns NetworkFailure when the remote call throws', () async {
    when(() => reachability.isReachable()).thenAnswer((_) async => true);
    when(() => remote.fetchCatalog()).thenThrow(Exception('timeout'));

    final result = await repository.refresh();

    expect((result as Err<void>).failure, isA<NetworkFailure>());
    expect(await popularNames(), ['Donut a', 'Donut b']);
  });
}
