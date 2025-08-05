import 'package:flutter/material.dart';

// Un contenedor que centra a su hijo y le aplica un ancho máximo estándar para web.
class MaxWidthContainer extends StatelessWidget {
  final Widget child;

  const MaxWidthContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200), // Ancho máximo
        child: child,
      ),
    );
  }
}