// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthStatusController)
final authStatusControllerProvider = AuthStatusControllerProvider._();

final class AuthStatusControllerProvider
    extends $NotifierProvider<AuthStatusController, AuthStatus> {
  AuthStatusControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStatusControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStatusControllerHash();

  @$internal
  @override
  AuthStatusController create() => AuthStatusController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStatus>(value),
    );
  }
}

String _$authStatusControllerHash() =>
    r'8749a76b4d52e64f1383a73574bc4d4d0ae010de';

abstract class _$AuthStatusController extends $Notifier<AuthStatus> {
  AuthStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthStatus, AuthStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthStatus, AuthStatus>,
              AuthStatus,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
