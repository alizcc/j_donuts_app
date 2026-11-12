import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:j_donuts_app/core/network/reachability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_providers.g.dart';

@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) => Connectivity();

@Riverpod(keepAlive: true)
Reachability reachability(Ref ref) => const Reachability();

@Riverpod(keepAlive: true)
Stream<bool> isOnline(Ref ref) async* {
  final reachability = ref.watch(reachabilityProvider);
  yield await reachability.isReachable();
  await for (final results
      in ref.watch(connectivityProvider).onConnectivityChanged) {
    final hasInterface = !results.contains(ConnectivityResult.none);
    yield hasInterface && await reachability.isReachable();
  }
}
