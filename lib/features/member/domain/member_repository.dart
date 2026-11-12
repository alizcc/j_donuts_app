import 'package:j_donuts_app/features/member/domain/member.dart';

abstract interface class MemberRepository {
  Stream<Member?> watchMember();
}
