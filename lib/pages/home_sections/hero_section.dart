import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// No es necesario importar 'AppTheme.dart'

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // Obtenemos los estilos y colores del contexto para una total consistencia.
    final textTheme = Theme.of(context).textTheme;

    return Container(
      // Usamos min-height para asegurar que no se desborde en pantallas pequeñas.
      constraints: BoxConstraints(minHeight: screenHeight - kToolbarHeight),
      padding: const EdgeInsets.all(20.0),
      // El fondo transparente es correcto para que se vea la animación de fondo del Scaffold.
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // NOTA: Para que la animación funcione, necesitarás un StatefulWidget.
          // Por ahora, el widget está, pero la opacidad es fija.
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 1),
            child: Text(
              'Empowering Your Digital Transformation',
              textAlign: TextAlign.center,
              // Usamos el estilo correcto del tema: 'displayMedium' para el titular principal.
              style: textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 2),
            child: Text(
              'We deliver innovative software solutions to help your business thrive in the digital age.',
              textAlign: TextAlign.center,
              // Usamos 'bodyMedium' para el texto de párrafo.
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 40),
          // --- EL CAMBIO MÁS IMPORTANTE ---
          // Simplemente usamos ElevatedButton. No necesita estilo.
          // Automáticamente tomará el estilo naranja de nuestro AppTheme.
          ElevatedButton(
            onPressed: () => context.go('/services'),
            child: const Text('Discover Our Services'),
          ),
        ],
      ),
    );
  }
}