import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planandact/app/router/route_names.dart';
import 'package:planandact/app/theme/app_colors.dart';

/// Persistent shell with bottom navigation for the main app tabs.
class HomeShell extends StatelessWidget {
  const HomeShell({
    super.key,
    required this.child,
  });

  final Widget child;

  static int _locationToIndex(String location) {
    if (location.startsWith(RouteNames.allPlans)) return 1;
    if (location.startsWith(RouteNames.reflection)) return 2;
    if (location.startsWith(RouteNames.momentum)) return 3;
    if (location.startsWith(RouteNames.stuck)) return 4;
    return 0;
  }

  static const _destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.today_rounded),
      label: 'Bugun',
    ),
    NavigationDestination(
      icon: Icon(Icons.list_alt_rounded),
      label: 'Tumu',
    ),
    NavigationDestination(
      icon: Icon(Icons.self_improvement_rounded),
      label: 'Yansima',
    ),
    NavigationDestination(
      icon: Icon(Icons.bolt_rounded),
      label: 'Momentum',
    ),
    NavigationDestination(
      icon: Icon(Icons.warning_amber_rounded),
      label: 'Stuck',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.panelBackground.withValues(alpha: 0.96),
          border: const Border(
            top: BorderSide(color: AppColors.borderSubtle),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.pageBackground.withValues(alpha: 0.34),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            final routes = [
              RouteNames.today,
              RouteNames.allPlans,
              RouteNames.reflection,
              RouteNames.momentum,
              RouteNames.stuck,
            ];
            context.go(routes[index]);
          },
          destinations: _destinations,
        ),
      ),
    );
  }
}
