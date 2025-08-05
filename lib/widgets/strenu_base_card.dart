import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/animated_hover_card.dart';

class StrenuBaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const StrenuBaseCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
  });

  @override
  Widget build(BuildContext context) {
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
}