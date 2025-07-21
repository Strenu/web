import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/pages/about_screen.dart';
import 'package:strenu_web/pages/home_screen.dart';
import 'package:strenu_web/pages/services_screen.dart';

void main() {
  runApp(MyApp());
}

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
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreen();
              },
            ),
            GoRoute(
              path: '/services',
              builder: (BuildContext context, GoRouterState state) {
                return const ServicesScreen();
              },
            ),
            GoRoute(
              path: '/about',
              builder: (BuildContext context, GoRouterState state) {
                return const AboutScreen();
              },
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }
}

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strenu'),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => context.go('/'),
            child: const Text('Inicio'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => context.go('/services'),
            child: const Text('Servicios'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => context.go('/about'),
            child: const Text('Sobre Nosotros'),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: child,
    );
  }
}