import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/widgets/animated_background.dart';
import 'package:strenu_web/widgets/nav_button.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // Acepta un solo child (la página entera)

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final String currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'STRENU',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: <Widget>[
          NavButton(text: 'Inicio', onPressed: () => context.go('/'), isActive: currentLocation == '/'),
          NavButton(text: 'Servicios', onPressed: () => context.go('/services'), isActive: currentLocation == '/services'),
          NavButton(text: 'Sobre Nosotros', onPressed: () => context.go('/about'), isActive: currentLocation == '/about'),
          const SizedBox(width: 40),
        ],
      ),
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [Colors.transparent, Colors.black],
                stops: [0.0, 0.75],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: const AnimatedBackground(),
          ),
          // El child (que será la página con su propio ListView) se renderiza aquí.
          child,
        ],
      ),
    );
  }
}