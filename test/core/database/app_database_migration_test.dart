import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/database/app_database.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  test('upgrading from v1 keeps users and adds the catalog tables', () async {
    final database = AppDatabase(
      NativeDatabase.memory(
        setup: (raw) => raw
          ..execute(
            'CREATE TABLE users (phone TEXT NOT NULL PRIMARY KEY, '
            'first_name TEXT NOT NULL, last_name TEXT, '
            'date_of_birth INTEGER NOT NULL)',
          )
          ..execute(
            "INSERT INTO users VALUES ('+959254135592', 'Ye Min', NULL, 0)",
          )
          ..execute('PRAGMA user_version = 1'),
      ),
    );
    addTearDown(database.close);

    expect(await database.users.count().getSingle(), 1);
    expect(await database.products.count().getSingle(), 0);
    expect(await database.members.count().getSingle(), 0);
  });
}
