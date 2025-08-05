import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/animated_hover_card.dart';

class StrenuBaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool enableHover; // Nuevo parámetro

  const StrenuBaseCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.enableHover = true, // Por defecto, el hover está activado
  });

  @override
  Widget build(BuildContext context) {
    // Si el hover está activado, usamos el widget animado.
    if (enableHover) {
      return AnimatedHoverCard(
        child: SizedBox(
          width: 320,
          child: Card(
            child: Padding(
              padding: padding!,
              child: child,
            ),
          ),
        ),
      );
    }

    // Si no, devolvemos la tarjeta sin la animación.
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}