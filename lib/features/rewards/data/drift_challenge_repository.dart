import 'package:drift/drift.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge_repository.dart';

class DriftChallengeRepository implements ChallengeRepository {
  const DriftChallengeRepository(this._database);

  final AppDatabase _database;

  @override
  Stream<List<Challenge>> watchChallenges(RewardTab tab) {
    final query = _database.select(_database.challenges)
      ..where((row) => row.tab.equalsValue(tab))
      ..orderBy([(row) => OrderingTerm.asc(row.position)]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          Challenge(
            id: row.id,
            tab: row.tab,
            title: row.title,
            points: row.points,
            progress: row.progress,
            goal: row.goal,
            art: row.art,
          ),
      ],
    );
  }
}
