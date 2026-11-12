// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Member _$MemberFromJson(Map<String, dynamic> json) => _Member(
  id: json['id'] as String,
  tier: $enumDecode(_$MemberTierEnumMap, json['tier']),
  points: (json['points'] as num).toInt(),
  nextTierPoints: (json['nextTierPoints'] as num).toInt(),
  tierStartPoints: (json['tierStartPoints'] as num?)?.toInt() ?? 0,
  notificationCount: (json['notificationCount'] as num?)?.toInt() ?? 0,
  rewardCount: (json['rewardCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MemberToJson(_Member instance) => <String, dynamic>{
  'id': instance.id,
  'tier': _$MemberTierEnumMap[instance.tier]!,
  'points': instance.points,
  'nextTierPoints': instance.nextTierPoints,
  'tierStartPoints': instance.tierStartPoints,
  'notificationCount': instance.notificationCount,
  'rewardCount': instance.rewardCount,
};

const _$MemberTierEnumMap = {
  MemberTier.bronze: 'bronze',
  MemberTier.silver: 'silver',
  MemberTier.gold: 'gold',
  MemberTier.platinum: 'platinum',
};
