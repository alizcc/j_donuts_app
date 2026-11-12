import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/features/home/data/home_providers.dart';
import 'package:j_donuts_app/features/member/data/member_providers.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_provider.g.dart';

@riverpod
Stream<Member?> member(Ref ref) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(memberRepositoryProvider).watchMember();
}

extension MemberTierName on MemberTier {
  String label(AppLocalizations l10n) => switch (this) {
    MemberTier.bronze => l10n.tierBronze,
    MemberTier.silver => l10n.tierSilver,
    MemberTier.gold => l10n.tierGold,
    MemberTier.platinum => l10n.tierPlatinum,
  };
}
