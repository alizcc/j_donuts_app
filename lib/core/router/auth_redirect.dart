import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';

String? resolveAuthRedirect({
  required AuthStatus status,
  required String location,
}) {
  final isPublic = AppRoutes.public.contains(location);
  return switch (status) {
    AuthStatus.unauthenticated => isPublic ? null : AppRoutes.onboarding,
    AuthStatus.authenticated => isPublic ? AppRoutes.home : null,
  };
}
