import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/app/app_shell.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/router/auth_redirect.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';
import 'package:j_donuts_app/core/router/route_transitions.dart';
import 'package:j_donuts_app/core/widgets/placeholder_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// The app's routes. Screens are placeholders until each feature lands.
///
/// `redirect` runs on every navigation and reads the current auth status.
/// After logging in or out, screens call `context.go(...)` themselves.
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
        pageBuilder: (context, state) => fadeThroughPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenOnboarding),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerPhone,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenPhone),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerOtp,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenOtp),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerName,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenName),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerDateOfBirth,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenDateOfBirth),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginPhone,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenPhone),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginOtp,
        pageBuilder: (context, state) => sharedAxisPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenOtp),
        ),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        pageBuilder: (context, state) => fadeThroughPage(
          state: state,
          child: PlaceholderScreen(title: context.l10n.screenWelcome),
        ),
      ),
      GoRoute(
        path: AppRoutes.product,
        pageBuilder: (context, state) => fadeThroughPage(
          state: state,
          child: PlaceholderScreen(
            title: context.l10n.screenProduct(
              state.pathParameters[AppRoutes.productIdParam]!,
            ),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          _tab(AppRoutes.home, (l10n) => l10n.navHome),
          _tab(AppRoutes.rewards, (l10n) => l10n.navReward),
          _tab(AppRoutes.scan, (l10n) => l10n.navScan),
          _tab(AppRoutes.wallet, (l10n) => l10n.navWallet),
          _tab(AppRoutes.settings, (l10n) => l10n.navSettings),
        ],
      ),
    ],
  );
}

/// One bottom-nav tab. [title] picks the tab's name from the translations.
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
