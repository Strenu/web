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
              const Spacer(), // Empuja el contenido a los lados
              // Ocultamos los botones de texto en pantallas más pequeñas
              if (MediaQuery.of(context).size.width > 720)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton(text: 'Inicio', onPressed: () => context.go('/'), isActive: currentLocation == '/'),
                    NavButton(text: 'Servicios', onPressed: () => context.go('/services'), isActive: currentLocation == '/services'),
                    NavButton(text: 'Sobre Nosotros', onPressed: () => context.go('/about'), isActive: currentLocation == '/about'),
                    const SizedBox(width: 20),
                    // El botón de Contactar, siempre visible si hay espacio
                    ElevatedButton(
                      onPressed: () => context.go('/contact'),
                      child: const Text('Contactar'),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
      // Aquí podrías configurar un Drawer para la navegación en móvil
      // drawer: MediaQuery.of(context).size.width <= 720 ? const AppDrawer() : null,
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
          child, // Aquí se renderiza la página actual (HomeScreen, etc.)
        ],
      ),
    );
  }
}