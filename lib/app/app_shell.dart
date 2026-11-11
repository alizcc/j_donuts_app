import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';

/// Hosts the five bottom-nav tabs.
///
/// Uses a stock [NavigationBar] for now; the branded sliding-pill bar
/// replaces it with the Home feature.
class AppShell extends StatelessWidget {
  const AppShell({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: _goToBranch,
        destinations: [
          _destination(Icons.home_outlined, l10n.navHome),
          _destination(Icons.workspace_premium_outlined, l10n.navReward),
          _destination(Icons.qr_code_scanner, l10n.navScan),
          _destination(Icons.account_balance_wallet_outlined, l10n.navWallet),
          _destination(Icons.settings_outlined, l10n.navSettings),
        ],
      ),
    );
  }

  void _goToBranch(int index) => shell.goBranch(
    index,
    initialLocation: index == shell.currentIndex,
  );

  NavigationDestination _destination(IconData icon, String label) =>
      NavigationDestination(icon: Icon(icon), label: label);
}
