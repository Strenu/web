import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * pi),
      duration: const Duration(seconds: 10),
      builder: (context, value, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: ParticlePainter(value),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double angle;
  final List<Particle> particles;

  ParticlePainter(this.angle) : particles = _generateParticles();

  static List<Particle> _generateParticles() {
    return List.generate(100, (index) => Particle(seed: index));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppTheme.primaryColor;
    final linePaint = Paint()
      ..strokeWidth = 1
      ..color = AppTheme.primaryColor;
    final positions = particles
        .map((p) => p.calculatePosition(angle, size))
        .toList();

    for (final pos in positions) {
      final particleSize = 2.0;
      canvas.drawCircle(pos, particleSize, paint);
    }

    for (int i = 0; i < positions.length; i++) {
      for (int j = i + 1; j < positions.length; j++) {
        final pos1 = positions[i];
        final pos2 = positions[j];
        final distance = (pos1 - pos2).distance;

        if (distance < 150) {
          linePaint.color = AppTheme.primaryColor.withOpacity(
            (1 - distance / 150) * 0.1,
          );
          canvas.drawLine(pos1, pos2, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) =>
      angle != oldDelegate.angle;
}

class Particle {
  final int seed;
  final double size;
  final double initialX;
  final double initialY;
  final double velocityX;
  final double velocityY;

  Particle({required this.seed})
    : size = Random(seed + 1).nextDouble() * 2 + 1,
      initialX = Random(seed + 2).nextDouble(),
      initialY = Random(seed + 3).nextDouble(),
      velocityX = (Random(seed + 4).nextDouble() - 0.5) * 0.01,
      velocityY = (Random(seed + 5).nextDouble() - 0.5) * 0.01;

  Offset calculatePosition(double angle, Size size) {
    final currentX = (initialX + velocityX * angle) % 1.0;
    final currentY = (initialY + velocityY * angle) % 1.0;
    final wrappedX = currentX < 0 ? 1.0 + currentX : currentX;
    final wrappedY = currentY < 0 ? 1.0 + currentY : currentY;

    return Offset(wrappedX * size.width, wrappedY * size.height);
  }
}
