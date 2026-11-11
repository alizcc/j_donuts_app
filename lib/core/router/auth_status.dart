import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_status.g.dart';

enum AuthStatus { authenticated, unauthenticated }

@Riverpod(keepAlive: true)
class AuthStatusController extends _$AuthStatusController {
  @override
  AuthStatus build() => AuthStatus.unauthenticated;

  // A setter would read oddly at call sites (`notifier.status = ...`).
  // ignore: use_setters_to_change_properties
  void update(AuthStatus status) => state = status;
}
