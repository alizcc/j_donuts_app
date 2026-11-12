import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/features/member/data/drift_member_repository.dart';
import 'package:j_donuts_app/features/member/domain/member_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_providers.g.dart';

@Riverpod(keepAlive: true)
MemberRepository memberRepository(Ref ref) =>
    DriftMemberRepository(ref.watch(appDatabaseProvider));
