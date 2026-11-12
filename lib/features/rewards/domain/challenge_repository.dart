import 'package:j_donuts_app/features/rewards/domain/challenge.dart';

abstract interface class ChallengeRepository {
  Stream<List<Challenge>> watchChallenges(RewardTab tab);
}
