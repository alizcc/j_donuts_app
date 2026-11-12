// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Challenge _$ChallengeFromJson(Map<String, dynamic> json) => _Challenge(
  id: json['id'] as String,
  tab: $enumDecode(_$RewardTabEnumMap, json['tab']),
  title: json['title'] as String,
  points: (json['points'] as num).toInt(),
  progress: (json['progress'] as num).toInt(),
  goal: (json['goal'] as num).toInt(),
  art: $enumDecode(_$ChallengeArtEnumMap, json['art']),
);

Map<String, dynamic> _$ChallengeToJson(_Challenge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tab': _$RewardTabEnumMap[instance.tab]!,
      'title': instance.title,
      'points': instance.points,
      'progress': instance.progress,
      'goal': instance.goal,
      'art': _$ChallengeArtEnumMap[instance.art]!,
    };

const _$RewardTabEnumMap = {RewardTab.eat: 'eat', RewardTab.gift: 'gift'};

const _$ChallengeArtEnumMap = {
  ChallengeArt.donut: 'donut',
  ChallengeArt.coffee: 'coffee',
};
