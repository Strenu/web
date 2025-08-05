import 'package:flutter/material.dart';

class StrenuDivider extends StatelessWidget {
  const StrenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary.withOpacity(0.5);

    return Padding(
      // El padding controla el espaciado vertical total del separador
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: color, endIndent: 20)),
          Icon(Icons.diamond_outlined, color: color, size: 16),
          Expanded(child: Divider(color: color, indent: 20)),
        ],
      ),
    );
  }
}