import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planandact/app/router/route_names.dart';
import 'package:planandact/app/theme/app_colors.dart';

/// Persistent shell with bottom navigation for the main app tabs.
class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});

  final Widget child;

  static int _locationToIndex(String location) {
    if (location.startsWith(RouteNames.reflection)) return 1;
    if (location.startsWith(RouteNames.momentum)) return 2;
    if (location.startsWith(RouteNames.stuck)) return 3;
    return 0;
  }

  static const _destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.today_rounded),
      label: 'Bugün',
    ),
    NavigationDestination(
      icon: Icon(Icons.self_improvement_rounded),
      label: 'Yansıma',
    ),
    NavigationDestination(
      icon: Icon(Icons.bolt_rounded),
      label: 'Momentum',
    ),
    NavigationDestination(
      icon: Icon(Icons.warning_amber_rounded),
      label: 'Durum',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final location =
        GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: SafeArea(child: child),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          final routes = [
            RouteNames.today,
            RouteNames.reflection,
            RouteNames.momentum,
            RouteNames.stuck,
          ];
          context.go(routes[index]);
        },
        destinations: _destinations,
      ),
    );
  }
}
