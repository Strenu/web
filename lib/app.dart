import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return MaterialApp.router(
      title: 'Strenu Tech Landing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0D1B2A),
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      routerConfig: router,
    );
  }
}