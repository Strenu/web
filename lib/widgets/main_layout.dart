import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_background.dart';
import 'nav_button.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0D1B2A).withOpacity(0.85),
        title: Text(
          'STRENU',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          NavButton(
            text: 'Inicio',
            onPressed: () => context.go('/'),
            isActive:
                GoRouter.of(
                  context,
                ).routerDelegate.currentConfiguration.uri.toString() ==
                '/',
          ),
          NavButton(
            text: 'Servicios',
            onPressed: () => context.go('/services'),
            isActive:
                GoRouter.of(
                  context,
                ).routerDelegate.currentConfiguration.uri.toString() ==
                '/services',
          ),
          NavButton(
            text: 'Sobre Nosotros',
            onPressed: () => context.go('/about'),
            isActive:
                GoRouter.of(
                  context,
                ).routerDelegate.currentConfiguration.uri.toString() ==
                '/about',
          ),
          const SizedBox(width: 40),
        ],
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
            child,
        ],
      ),
    );
  }
}
