import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/widgets/main_layout.dart';
import 'package:strenu_web/pages/about_screen.dart';
import 'package:strenu_web/pages/home_screen.dart';
import 'package:strenu_web/pages/services_screen.dart';
import 'package:strenu_web/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'STRENU - Software Development',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// Configuración de GoRouter
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    // ShellRoute envuelve todas las rutas hijas con el MainLayout
    ShellRoute(
      builder: (context, state, child) {
        // El 'child' que recibe aquí es la página que corresponde a la ruta (HomeScreen, etc.)
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutScreen(),
        ),
      ],
    ),
  ],
);