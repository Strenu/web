import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        children: [
          Text(
            'Let’s Build Something Amazing Together',
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
          ElevatedButton(
            onPressed: () => context.go('/contact'),
            child: const Text('Get in Touch'),
          ),
        ],
      ),
    );
  }
}
