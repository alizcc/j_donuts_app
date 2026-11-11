// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The app's routes. Screens are placeholders until each feature lands.
///
/// `redirect` runs on every navigation and reads the current auth status.
/// After logging in or out, screens call `context.go(...)` themselves.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// The app's routes. Screens are placeholders until each feature lands.
///
/// `redirect` runs on every navigation and reads the current auth status.
/// After logging in or out, screens call `context.go(...)` themselves.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// The app's routes. Screens are placeholders until each feature lands.
  ///
  /// `redirect` runs on every navigation and reads the current auth status.
  /// After logging in or out, screens call `context.go(...)` themselves.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'db2e9ed97cf623ff68ce377a80813f50cf7e84b4';
