import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

enum RewardTab { eat, gift }

enum ChallengeArt { donut, coffee }

@freezed
abstract class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required RewardTab tab,
    required String title,
    required int points,
    required int progress,
    required int goal,
    required ChallengeArt art,
  }) = _Challenge;

  const Challenge._();

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  bool get isComplete => progress >= goal;
}
