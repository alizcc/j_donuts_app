import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';

void main() {
  const silver = Member(
    id: 'me',
    tier: MemberTier.silver,
    points: 680000,
    nextTierPoints: 680500,
  );

  test('counts the points left to the next tier', () {
    expect(silver.pointsToNextTier, 500);
  });

  test('never reports negative points left', () {
    expect(silver.copyWith(points: 700000).pointsToNextTier, 0);
  });

  test('silver members move up to gold next', () {
    expect(silver.nextTier, MemberTier.gold);
  });

  test('platinum members have no next tier', () {
    expect(silver.copyWith(tier: MemberTier.platinum).nextTier, isNull);
  });
}
