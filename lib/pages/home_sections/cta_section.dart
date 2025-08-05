import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tema y los estilos del contexto.
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      decoration: BoxDecoration(
        color: colorScheme.primary, // El azul principal
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Let’s Build Something Amazing Together',
            // Usamos el estilo del tema directamente. AppTheme ya define el color
            // correcto para el texto sobre un fondo primario (onPrimary).
            style: textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Contact us today to discuss how we can help you achieve your goals.',
            // Lo mismo aquí. El color del bodyMedium ya es el correcto.
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            // Este estilo de excepción para el botón es perfecto.
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.onPrimary, // Fondo blanco
              foregroundColor: colorScheme.primary,   // Texto azul
            ).merge(Theme.of(context).elevatedButtonTheme.style), // Mantiene padding y forma
            onPressed: () => context.go('/contact'),
            child: const Text('Get in Touch'),
          ),
        ],
      ),
    );
  }
}