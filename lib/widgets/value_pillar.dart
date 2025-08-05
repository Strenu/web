import 'package:flutter/material.dart';

class ValuePillar extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ValuePillar({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}