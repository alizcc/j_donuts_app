import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:j_donuts_app/features/auth/data/users_table.dart';
import 'package:j_donuts_app/features/home/data/home_tables.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/member/data/members_table.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/data/products_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Users, Products, Banners, Shops, SectionItems, Members])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'j_donuts'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      // v2 adds the offline catalog for Home, Product detail and Rewards.
      if (from < 2) {
        await migrator.createTable(products);
        await migrator.createTable(banners);
        await migrator.createTable(shops);
        await migrator.createTable(sectionItems);
        await migrator.createTable(members);
      }
    },
  );
}
