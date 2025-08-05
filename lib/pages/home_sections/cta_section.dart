import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Ya no usamos un Container con fondo, sino un Column simple con padding.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        children: [
          Text(
            'Let’s Build Something Amazing Together',
            // Usamos un estilo de titular grande para crear impacto.
            style: textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Contact us today to discuss how we can help you achieve your goals.',
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          // Este es ahora el protagonista indiscutible.
          // Al ser un ElevatedButton, tomará automáticamente el estilo naranja del tema.
          ElevatedButton(
            onPressed: () => context.go('/contact'),
            child: const Text('Get in Touch'),
          ),
        ],
      ),
    );
  }
}