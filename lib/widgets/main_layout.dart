import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'animated_background.dart';
import 'nav_button.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Obtenemos los estilos y la ruta actual una sola vez para ser más eficientes.
    final textTheme = Theme.of(context).textTheme;
    final String currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();

    return Scaffold(
      // El AppBar tomará su estilo (transparente, sin elevación) del AppTheme.
      appBar: AppBar(
        // Usamos un estilo semántico para el título.
        title: Text(
          'STRENU',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: <Widget>[
          NavButton(
            text: 'Inicio',
            onPressed: () => context.go('/'),
            // La lógica de 'isActive' ahora es mucho más limpia.
            isActive: currentLocation == '/',
          ),
          NavButton(
            text: 'Servicios',
            onPressed: () => context.go('/services'),
            isActive: currentLocation == '/services',
          ),
          NavButton(
            text: 'Sobre Nosotros',
            onPressed: () => context.go('/about'),
            isActive: currentLocation == '/about',
          ),
          const SizedBox(width: 40),
        ],
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          // El contenido de la página se renderiza por encima del fondo.
          child,
        ],
      ),
    );
  }
}