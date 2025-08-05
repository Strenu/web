import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/strenu_base_card.dart';

class BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool enableHover;

  const BenefitItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.enableHover = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Lo restauramos para que la tarjeta se ajuste a su contenido
      children: [
        Icon(icon, size: 40, color: colorScheme.primary),
        const SizedBox(height: 20),
        Text(title, style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(description, style: textTheme.bodyMedium),
        // const Spacer(), // <-- LÍNEA ELIMINADA QUE CAUSABA EL ERROR
      ],
    );

    return StrenuBaseCard(
      enableHover: enableHover,
      child: content,
    );
  }
}