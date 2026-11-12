import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/home/data/catalog_seeder.dart';
import 'package:j_donuts_app/features/home/data/catalog_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late AppDatabase database;
  late CatalogSeeder seeder;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    seeder = CatalogSeeder(CatalogStore(database));
  });

  tearDown(() => database.close());

  test('seeds the bundled catalog on first launch', () async {
    await seeder.seedIfEmpty();

    final coconut = await (database.select(
      database.products,
    )..where((row) => row.id.equals('p_coconut'))).getSingle();
    expect(coconut.priceMmk, 3200);
    expect(await database.members.count().getSingle(), 1);
    expect(await database.shops.count().getSingle(), 4);
  });

  test('does not seed again once data exists', () async {
    await seeder.seedIfEmpty();
    await database
        .update(database.products)
        .write(const ProductsCompanion(priceMmk: Value(1)));

    await seeder.seedIfEmpty();

    final prices = await database.select(database.products).get();
    expect(prices.every((row) => row.priceMmk == 1), isTrue);
  });
}
