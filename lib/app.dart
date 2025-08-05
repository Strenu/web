import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';

import 'pages/home_screen.dart';
import 'pages/services_screen.dart';
import 'pages/about_screen.dart';
import 'widgets/main_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return MainLayout(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => _buildPageWithFadeTransition(
                context: context,
                state: state,
                child: const HomeScreen(),
              ),
            ),
            GoRoute(
              path: '/services',
              pageBuilder: (context, state) => _buildPageWithFadeTransition(
                context: context,
                state: state,
                child: const ServicesScreen(),
              ),
            ),
            GoRoute(
              path: '/about',
              pageBuilder: (context, state) => _buildPageWithFadeTransition(
                context: context,
                state: state,
                child: const AboutScreen(),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Strenu Tech Landing',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData, // Use the unified theme
      routerConfig: router,
    );
  }
}

CustomTransitionPage _buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  Duration duration = const Duration(milliseconds: 400),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
        ),
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: secondaryAnimation,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          ).drive(Tween<double>(begin: 1.0, end: 0.0)),
          child: child,
        ),
      );
    },
  );
}