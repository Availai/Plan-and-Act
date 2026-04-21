import 'package:planandact/features/planning/presentation/screens/home_shell.dart';
import 'package:go_router/go_router.dart';
import 'package:planandact/app/router/route_names.dart';
import 'package:planandact/features/planning/presentation/screens/momentum_screen.dart';
import 'package:planandact/features/planning/presentation/screens/reflection_screen.dart';
import 'package:planandact/features/planning/presentation/screens/stuck_screen.dart';
import 'package:planandact/features/planning/presentation/screens/today_screen.dart';
import 'package:planandact/features/settings/presentation/screens/settings_screen.dart';

/// Application-level router configuration.
///
/// Uses ShellRoute for bottom-navigation layout with persistent shell.
final appRouter = GoRouter(
  initialLocation: RouteNames.today,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(
          path: RouteNames.today,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TodayScreen(),
          ),

        ),
        GoRoute(
          path: RouteNames.reflection,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ReflectionScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.momentum,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MomentumScreen(),
          ),
        ),
        GoRoute(
          path: RouteNames.stuck,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: StuckScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: RouteNames.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);


