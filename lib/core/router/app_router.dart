import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/app/app_shell.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/router/auth_redirect.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';
import 'package:j_donuts_app/core/router/route_transitions.dart';
import 'package:j_donuts_app/core/widgets/placeholder_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/date_of_birth_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/name_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/phone_screen.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/welcome_screen.dart';
import 'package:j_donuts_app/features/home/presentation/home_screen.dart';
import 'package:j_donuts_app/features/product/presentation/product_detail_screen.dart';
import 'package:j_donuts_app/features/rewards/presentation/rewards_screen.dart';
import 'package:j_donuts_app/features/settings/presentation/settings_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.onboarding,
    redirect: (context, state) => resolveAuthRedirect(
      status: ref.read(authStatusControllerProvider),
      location: state.matchedLocation,
    ),
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) =>
            fadeThroughPage(state: state, child: const OnboardingScreen()),
      ),
      GoRoute(
        path: AppRoutes.registerPhone,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const PhoneScreen()),
      ),
      GoRoute(
        path: AppRoutes.registerOtp,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const OtpScreen()),
      ),
      GoRoute(
        path: AppRoutes.registerName,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const NameScreen()),
      ),
      GoRoute(
        path: AppRoutes.registerDateOfBirth,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const DateOfBirthScreen()),
      ),
      GoRoute(
        path: AppRoutes.loginPhone,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const PhoneScreen()),
      ),
      GoRoute(
        path: AppRoutes.loginOtp,
        pageBuilder: (context, state) =>
            sharedAxisPage(state: state, child: const OtpScreen()),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        pageBuilder: (context, state) =>
            fadeThroughPage(state: state, child: const WelcomeScreen()),
      ),
      GoRoute(
        path: AppRoutes.product,
        pageBuilder: (context, state) => fadeThroughPage(
          state: state,
          child: ProductDetailScreen(
            productId: state.pathParameters[AppRoutes.productIdParam]!,
            heroTag: state.extra as String?,
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.rewards,
                builder: (context, state) => const RewardsScreen(),
              ),
            ],
          ),
          _tab(AppRoutes.scan, (l10n) => l10n.navScan),
          _tab(AppRoutes.wallet, (l10n) => l10n.navWallet),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

StatefulShellBranch _tab(
  String path,
  String Function(AppLocalizations l10n) title,
) {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: path,
        builder: (context, state) =>
            PlaceholderScreen(title: title(context.l10n)),
      ),
    ],
  );
}
