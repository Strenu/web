import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/widgets/animated_background.dart';
import 'package:strenu_web/widgets/nav_button.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final Key? scrollKey;

  const MainLayout({super.key, required this.child, this.scrollKey});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final String currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: MaxWidthContainer(
          child: Row(
            children: [
              Text(
                'STRENU',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (MediaQuery.of(context).size.width > 720)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton(text: 'Home', onPressed: () => context.go('/'), isActive: currentLocation == '/'),
                    NavButton(text: 'Services', onPressed: () => context.go('/services'), isActive: currentLocation == '/services'),
                    NavButton(text: 'About Us', onPressed: () => context.go('/about'), isActive: currentLocation == '/about'),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => context.go('/contact'),
                      child: const Text('Contact'),
                    )
                  ],
                ),
            ],
          ),
        ),
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
          child,
        ],
      ),
    );
  }
}