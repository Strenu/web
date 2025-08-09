import 'package:flutter/material.dart';

class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final Size? size;

  const AnimatedHoverCard({super.key, required this.child, this.size});

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final transform = _isHovered
        ? (Matrix4.identity()..scale(1.03))
        : Matrix4.identity();

    final shadow = _isHovered
        ? [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ]
        : <BoxShadow>[];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: widget.size?.width,
        height: widget.size?.height,
        transform: transform,
        decoration: BoxDecoration(
          boxShadow: shadow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: widget.child,
      ),
    );
  }
}
