import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/widgets/animated_background.dart';
import 'package:strenu_web/widgets/app_drawer.dart';
import 'package:strenu_web/widgets/nav_button.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final Key? scrollKey;

  const MainLayout({super.key, required this.child, this.scrollKey});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final String currentLocation = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();
    final bool isNarrow = MediaQuery.of(context).size.width < 720;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: isNarrow
            ? Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    tooltip: 'Open navigation menu',
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              )
            : null,
        title: MaxWidthContainer(
          child: Row(
            // En pantallas estrechas, centramos el logo si no hay botones
            mainAxisAlignment: isNarrow
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Text(
                'STRENU',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // El Spacer solo es necesario si hay elementos a la derecha
              if (!isNarrow) const Spacer(),
              if (!isNarrow)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton(
                      text: 'Home',
                      onPressed: () => context.go('/'),
                      isActive: currentLocation == '/',
                    ),
                    NavButton(
                      text: 'Services',
                      onPressed: () => context.go('/services'),
                      isActive: currentLocation == '/services',
                    ),
                    NavButton(
                      text: 'About Us',
                      onPressed: () => context.go('/about'),
                      isActive: currentLocation == '/about',
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => context.go('/contact'),
                      child: const Text('Contact'),
                    ),
                  ],
                ),
            ],
          ),
        ),
        // Esto asegura que el title ocupe todo el espacio para poder centrar bien el MaxWidthContainer
        centerTitle: true,
      ),
      drawer: isNarrow ? const AppDrawer() : null,
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
          child,
        ],
      ),
    );
  }
}
