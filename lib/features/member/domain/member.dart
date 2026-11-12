import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

enum MemberTier { bronze, silver, gold, platinum }

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required MemberTier tier,
    required int points,
    required int nextTierPoints,
    @Default(0) int tierStartPoints,
    @Default(0) int notificationCount,
    @Default(0) int rewardCount,
  }) = _Member;

  const Member._();

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  MemberTier? get nextTier =>
      tier == MemberTier.platinum ? null : MemberTier.values[tier.index + 1];

  double get tierProgress {
    final tierSize = nextTierPoints - tierStartPoints;
    if (tierSize <= 0) return 1;
    return ((points - tierStartPoints) / tierSize).clamp(0, 1);
  }

  int get pointsToNextTier =>
      points >= nextTierPoints ? 0 : nextTierPoints - points;
}
