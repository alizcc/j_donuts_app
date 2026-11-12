import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_status.g.dart';

enum AuthStatus { authenticated, unauthenticated }

@Riverpod(keepAlive: true)
class AuthStatusController extends _$AuthStatusController {
  @override
  AuthStatus build() => AuthStatus.unauthenticated;

  // update(x) reads better than a setter here
  // ignore: use_setters_to_change_properties
  void update(AuthStatus status) => state = status;
}
