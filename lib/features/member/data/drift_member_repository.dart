import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/member/domain/member_repository.dart';

class DriftMemberRepository implements MemberRepository {
  const DriftMemberRepository(this._database);

  final AppDatabase _database;

  @override
  Stream<Member?> watchMember() {
    final query = _database.select(_database.members)..limit(1);
    return query.watchSingleOrNull().map(
      (row) => row == null
          ? null
          : Member(
              id: row.id,
              tier: row.tier,
              points: row.points,
              nextTierPoints: row.nextTierPoints,
              tierStartPoints: row.tierStartPoints,
              notificationCount: row.notificationCount,
              rewardCount: row.rewardCount,
            ),
    );
  }
}
