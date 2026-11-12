import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/features/rewards/data/drift_challenge_repository.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_providers.g.dart';

@Riverpod(keepAlive: true)
ChallengeRepository challengeRepository(Ref ref) =>
    DriftChallengeRepository(ref.watch(appDatabaseProvider));
