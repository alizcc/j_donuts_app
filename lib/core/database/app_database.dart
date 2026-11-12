import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:j_donuts_app/features/auth/data/users_table.dart';
import 'package:j_donuts_app/features/home/data/home_tables.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/member/data/members_table.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/data/products_table.dart';
import 'package:j_donuts_app/features/rewards/data/challenges_table.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Users, Products, Banners, Shops, SectionItems, Members, Challenges],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'j_donuts'));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(products);
        await migrator.createTable(banners);
        await migrator.createTable(shops);
        await migrator.createTable(sectionItems);
        await migrator.createTable(members);
      }
      if (from < 3) await migrator.createTable(challenges);
      // v1 installs get this column from createTable above
      if (from == 2) {
        await migrator.addColumn(members, members.tierStartPoints);
      }
    },
  );
}
