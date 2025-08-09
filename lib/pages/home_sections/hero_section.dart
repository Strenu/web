import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight - kToolbarHeight),
      padding: const EdgeInsets.all(20.0),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 1),
            child: Text(
              'Empowering Your Digital Transformation',
              textAlign: TextAlign.center,
              style: textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 2),
            child: Text(
              'We deliver innovative software solutions to help your business thrive in the digital age.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => context.go('/services'),
            child: const Text('Discover Our Services'),
          ),
        ],
      ),
    );
  }
}
