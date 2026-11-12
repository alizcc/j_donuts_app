// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(challenges)
final challengesProvider = ChallengesFamily._();

final class ChallengesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Challenge>>,
          List<Challenge>,
          Stream<List<Challenge>>
        >
    with $FutureModifier<List<Challenge>>, $StreamProvider<List<Challenge>> {
  ChallengesProvider._({
    required ChallengesFamily super.from,
    required RewardTab super.argument,
  }) : super(
         retry: null,
         name: r'challengesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$challengesHash();

  @override
  String toString() {
    return r'challengesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Challenge>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Challenge>> create(Ref ref) {
    final argument = this.argument as RewardTab;
    return challenges(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$challengesHash() => r'7d209a2af7a04b6c1756b09c12dfd6592b8814f4';

final class ChallengesFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Challenge>>, RewardTab> {
  ChallengesFamily._()
    : super(
        retry: null,
        name: r'challengesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChallengesProvider call(RewardTab tab) =>
      ChallengesProvider._(argument: tab, from: this);

  @override
  String toString() => r'challengesProvider';
}

@ProviderFor(SelectedRewardTab)
final selectedRewardTabProvider = SelectedRewardTabProvider._();

final class SelectedRewardTabProvider
    extends $NotifierProvider<SelectedRewardTab, RewardTab> {
  SelectedRewardTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedRewardTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedRewardTabHash();

  @$internal
  @override
  SelectedRewardTab create() => SelectedRewardTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RewardTab value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RewardTab>(value),
    );
  }
}

String _$selectedRewardTabHash() => r'15ffcf47c26a982d3a77853863cb56eb46bb0741';

abstract class _$SelectedRewardTab extends $Notifier<RewardTab> {
  RewardTab build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RewardTab, RewardTab>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RewardTab, RewardTab>,
              RewardTab,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
