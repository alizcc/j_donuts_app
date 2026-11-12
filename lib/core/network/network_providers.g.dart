// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectivity)
final connectivityProvider = ConnectivityProvider._();

final class ConnectivityProvider
    extends $FunctionalProvider<Connectivity, Connectivity, Connectivity>
    with $Provider<Connectivity> {
  ConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityHash();

  @$internal
  @override
  $ProviderElement<Connectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Connectivity create(Ref ref) {
    return connectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Connectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Connectivity>(value),
    );
  }
}

String _$connectivityHash() => r'e66720f09edf1a8b09e450e1eaedd51da9443f0e';

@ProviderFor(reachability)
final reachabilityProvider = ReachabilityProvider._();

final class ReachabilityProvider
    extends $FunctionalProvider<Reachability, Reachability, Reachability>
    with $Provider<Reachability> {
  ReachabilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reachabilityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reachabilityHash();

  @$internal
  @override
  $ProviderElement<Reachability> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Reachability create(Ref ref) {
    return reachability(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Reachability value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Reachability>(value),
    );
  }
}

String _$reachabilityHash() => r'13ef910ef9e3c0ca184e39f8c8d76ac3b0f32458';

@ProviderFor(isOnline)
final isOnlineProvider = IsOnlineProvider._();

final class IsOnlineProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isOnline(ref);
  }
}

String _$isOnlineHash() => r'cbf7ce2915c6cde578be7e75d882e666c505cfea';
