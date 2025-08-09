import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/strenu_base_card.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 40, color: colorScheme.primary),
        const SizedBox(height: 20),
        Text(title, style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(description, style: textTheme.bodyMedium),
      ],
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 280),
      child: StrenuBaseCard(child: content),
    );
  }
}
