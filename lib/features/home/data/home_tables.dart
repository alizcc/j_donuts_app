import 'package:drift/drift.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';

@DataClassName('BannerRow')
class Banners extends Table {
  TextColumn get id => text()();
  TextColumn get tag => text()();
  TextColumn get title => text()();
  TextColumn get color => text()();
  IntColumn get position => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ShopRow')
class Shops extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get color => text()();
  IntColumn get position => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SectionItemRow')
class SectionItems extends Table {
  TextColumn get section => textEnum<HomeSection>()();
  TextColumn get productId => text()();
  IntColumn get position => integer()();

  @override
  Set<Column<Object>> get primaryKey => {section, productId};
}
