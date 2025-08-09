import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final String quote;
  final String author;
  final String role;
  final String imageUrl;

  const TestimonialCard({
    super.key,
    required this.quote,
    required this.author,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.format_quote_rounded, color: colorScheme.primary, size: 40),
        const SizedBox(height: 16),
        Expanded(
          child: Text(
            '"$quote"',
            style: textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          author,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );

    final imageContent = CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(imageUrl),
      onBackgroundImageError: (_, __) {},
      backgroundColor: colorScheme.surface,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(flex: 3, child: textContent),
                  const SizedBox(width: 32),
                  Expanded(flex: 2, child: Center(child: imageContent)),
                ],
              );
            }
            return Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const SizedBox(height: 32),
                ...textContent.children.where((w) => w is! Expanded),
              ],
            );
          },
        ),
      ),
    );
  }
}
