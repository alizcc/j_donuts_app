// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(member)
final memberProvider = MemberProvider._();

final class MemberProvider
    extends $FunctionalProvider<AsyncValue<Member?>, Member?, Stream<Member?>>
    with $FutureModifier<Member?>, $StreamProvider<Member?> {
  MemberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memberProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memberHash();

  @$internal
  @override
  $StreamProviderElement<Member?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Member?> create(Ref ref) {
    return member(ref);
  }
}

String _$memberHash() => r'1dfc94c491491786ec4210a931a8070aff153546';
