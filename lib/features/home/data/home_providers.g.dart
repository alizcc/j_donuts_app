// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(catalogStore)
final catalogStoreProvider = CatalogStoreProvider._();

final class CatalogStoreProvider
    extends $FunctionalProvider<CatalogStore, CatalogStore, CatalogStore>
    with $Provider<CatalogStore> {
  CatalogStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogStoreHash();

  @$internal
  @override
  $ProviderElement<CatalogStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CatalogStore create(Ref ref) {
    return catalogStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogStore>(value),
    );
  }
}

String _$catalogStoreHash() => r'd76fe61f5d188b634b2d0266afe9571a471f3e83';

@ProviderFor(catalogRemoteSource)
final catalogRemoteSourceProvider = CatalogRemoteSourceProvider._();

final class CatalogRemoteSourceProvider
    extends
        $FunctionalProvider<
          CatalogRemoteSource,
          CatalogRemoteSource,
          CatalogRemoteSource
        >
    with $Provider<CatalogRemoteSource> {
  CatalogRemoteSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogRemoteSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogRemoteSourceHash();

  @$internal
  @override
  $ProviderElement<CatalogRemoteSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogRemoteSource create(Ref ref) {
    return catalogRemoteSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogRemoteSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogRemoteSource>(value),
    );
  }
}

String _$catalogRemoteSourceHash() =>
    r'11bdf7508069eca56b99d3833565d5fc3179cc54';

@ProviderFor(catalogSeed)
final catalogSeedProvider = CatalogSeedProvider._();

final class CatalogSeedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  CatalogSeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogSeedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogSeedHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return catalogSeed(ref);
  }
}

String _$catalogSeedHash() => r'90d4c096c99f9669e99bc36e8647f39db993b4cb';

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'02a5b5c1c75e0f0bb97524410cb09f39d8d2a4ae';
