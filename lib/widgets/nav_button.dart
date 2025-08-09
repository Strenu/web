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

    final bool isUnderlined = _isHovered || widget.isActive;
    final Color textColor = widget.isActive
        ? colorScheme.primary
        : colorScheme.onSurface;

    final TextStyle baseStyle = textTheme.labelLarge ?? const TextStyle();
    final TextStyle buttonTextStyle = baseStyle.copyWith(color: textColor);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.text, style: buttonTextStyle),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isUnderlined ? 30 : 0,
              color: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
