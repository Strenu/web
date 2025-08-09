import 'package:flutter/material.dart';

class ResponsiveCardLayout extends StatelessWidget {
  final List<Widget> cards;
  final double breakpoint;
  final double spacing;

  const ResponsiveCardLayout({
    super.key,
    required this.cards,
    this.breakpoint = 900.0,
    this.spacing = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _addSpacing(cards, spacing),
            ),
          );
        } else {
          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            alignment: WrapAlignment.center,
            children: cards,
          );
        }
      },
    );
  }

  List<Widget> _addSpacing(List<Widget> widgets, double spacing) {
    if (widgets.isEmpty) return [];
    final List<Widget> spacedWidgets = [widgets.first];
    for (int i = 1; i < widgets.length; i++) {
      spacedWidgets.add(SizedBox(width: spacing));
      spacedWidgets.add(widgets[i]);
    }
    return spacedWidgets;
  }
}
