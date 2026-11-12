import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/app/app.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();

  final result = await container.read(authRepositoryProvider).currentUser();
  final isSignedIn = result.fold((_) => false, (user) => user != null);
  container
      .read(authStatusControllerProvider.notifier)
      .update(
        isSignedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated,
      );

  runApp(UncontrolledProviderScope(container: container, child: const App()));
}
