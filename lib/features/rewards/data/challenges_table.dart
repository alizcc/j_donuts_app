import 'package:drift/drift.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';

@DataClassName('ChallengeRow')
class Challenges extends Table {
  TextColumn get id => text()();
  TextColumn get tab => textEnum<RewardTab>()();
  TextColumn get title => text()();
  IntColumn get points => integer()();
  IntColumn get progress => integer()();
  IntColumn get goal => integer()();
  TextColumn get art => textEnum<ChallengeArt>()();
  IntColumn get position => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
