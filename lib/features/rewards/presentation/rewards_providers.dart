import 'package:j_donuts_app/features/home/data/home_providers.dart';
import 'package:j_donuts_app/features/rewards/data/challenge_providers.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rewards_providers.g.dart';

@riverpod
Stream<List<Challenge>> challenges(Ref ref, RewardTab tab) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(challengeRepositoryProvider).watchChallenges(tab);
}

@riverpod
class SelectedRewardTab extends _$SelectedRewardTab {
  @override
  RewardTab build() => RewardTab.eat;

  // select(tab) reads better than a setter here
  // ignore: use_setters_to_change_properties
  void select(RewardTab tab) => state = tab;
}
