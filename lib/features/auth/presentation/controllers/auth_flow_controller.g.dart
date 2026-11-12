// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_flow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthFlowController)
final authFlowControllerProvider = AuthFlowControllerProvider._();

final class AuthFlowControllerProvider
    extends $NotifierProvider<AuthFlowController, AuthFlowState> {
  AuthFlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authFlowControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authFlowControllerHash();

  @$internal
  @override
  AuthFlowController create() => AuthFlowController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthFlowState>(value),
    );
  }
}

String _$authFlowControllerHash() =>
    r'c2f7d6b4b28f018a142aad39d8c9559f24f05ae0';

abstract class _$AuthFlowController extends $Notifier<AuthFlowState> {
  AuthFlowState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthFlowState, AuthFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthFlowState, AuthFlowState>,
              AuthFlowState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
