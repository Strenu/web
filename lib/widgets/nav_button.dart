import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const NavButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // La lógica para determinar el estado es perfecta, la mantenemos.
    final bool isUnderlined = _isHovered || widget.isActive;
    // El color del texto depende solo de si la ruta está activa.
    final Color textColor = widget.isActive ? colorScheme.primary : colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          // Usamos el estilo del tema como base, pero quitamos el splash effect.
          splashFactory: NoSplash.splashFactory,
          // El padding lo manejaremos dentro del Column para un mejor control.
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              // Usamos el estilo 'labelLarge' del tema, que es el semántico para botones.
              style: textTheme.labelLarge?.copyWith(
                color: textColor, // Aplicamos el color que hemos calculado.
              ),
            ),
            const SizedBox(height: 4),
            // Tu implementación de AnimatedContainer es genial, solo la hacemos 'theme-aware'.
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isUnderlined ? 30 : 0,
              // El color del subrayado siempre es el primario.
              color: colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}