// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeBanners)
final homeBannersProvider = HomeBannersProvider._();

final class HomeBannersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeBanner>>,
          List<HomeBanner>,
          Stream<List<HomeBanner>>
        >
    with $FutureModifier<List<HomeBanner>>, $StreamProvider<List<HomeBanner>> {
  HomeBannersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeBannersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeBannersHash();

  @$internal
  @override
  $StreamProviderElement<List<HomeBanner>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<HomeBanner>> create(Ref ref) {
    return homeBanners(ref);
  }
}

String _$homeBannersHash() => r'e135546be7a2d634100edd66bd0d129999c01cca';

@ProviderFor(homeSection)
final homeSectionProvider = HomeSectionFamily._();

final class HomeSectionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          Stream<List<Product>>
        >
    with $FutureModifier<List<Product>>, $StreamProvider<List<Product>> {
  HomeSectionProvider._({
    required HomeSectionFamily super.from,
    required HomeSection super.argument,
  }) : super(
         retry: null,
         name: r'homeSectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeSectionHash();

  @override
  String toString() {
    return r'homeSectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Product>> create(Ref ref) {
    final argument = this.argument as HomeSection;
    return homeSection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeSectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeSectionHash() => r'2256763345964d95e8aed39eb710008b178c9595';

final class HomeSectionFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Product>>, HomeSection> {
  HomeSectionFamily._()
    : super(
        retry: null,
        name: r'homeSectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeSectionProvider call(HomeSection section) =>
      HomeSectionProvider._(argument: section, from: this);

  @override
  String toString() => r'homeSectionProvider';
}

@ProviderFor(nearbyShops)
final nearbyShopsProvider = NearbyShopsProvider._();

final class NearbyShopsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shop>>,
          List<Shop>,
          Stream<List<Shop>>
        >
    with $FutureModifier<List<Shop>>, $StreamProvider<List<Shop>> {
  NearbyShopsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyShopsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyShopsHash();

  @$internal
  @override
  $StreamProviderElement<List<Shop>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Shop>> create(Ref ref) {
    return nearbyShops(ref);
  }
}

String _$nearbyShopsHash() => r'c07493bc6b5c7f33a2d8a6fb38c337c1341b993e';

@ProviderFor(signedInFirstName)
final signedInFirstNameProvider = SignedInFirstNameProvider._();

final class SignedInFirstNameProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  SignedInFirstNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signedInFirstNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signedInFirstNameHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return signedInFirstName(ref);
  }
}

String _$signedInFirstNameHash() => r'be8ff29faba3493053a01ee74720473639ad85d7';
