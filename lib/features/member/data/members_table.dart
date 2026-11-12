import 'package:drift/drift.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';

@DataClassName('MemberRow')
class Members extends Table {
  TextColumn get id => text()();
  TextColumn get tier => textEnum<MemberTier>()();
  IntColumn get points => integer()();
  IntColumn get nextTierPoints => integer()();
  IntColumn get notificationCount => integer()();
  IntColumn get rewardCount => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
