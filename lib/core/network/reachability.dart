import 'dart:async';
import 'dart:io';

// connectivity_plus only knows a network interface is up. This checks the
// internet is actually reachable, e.g. not stuck behind a captive portal.
class Reachability {
  const Reachability();

  static const String _probeHost = 'example.com';
  static const Duration _timeout = Duration(seconds: 3);

  Future<bool> isReachable() async {
    try {
      final addresses = await InternetAddress.lookup(
        _probeHost,
      ).timeout(_timeout);
      return addresses.isNotEmpty;
    } on SocketException {
      return false;
    } on TimeoutException {
      return false;
    }
  }
}
