import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * pi), // Anima un ciclo completo
      duration: const Duration(seconds: 20),
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

  ParticlePainter(this.angle) : particles = List.generate(100, (index) => Particle(seed: index));

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final linePaint = Paint()..strokeWidth = 1;

    for (var particle in particles) {
      final pos = particle.calculatePosition(angle, size);
      paint.color = AppTheme.primaryColor; // Use theme color
      canvas.drawCircle(pos, particle.size, paint);
    }

    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final pos1 = particles[i].calculatePosition(angle, size);
        final pos2 = particles[j].calculatePosition(angle, size);
        final distance = (pos1 - pos2).distance;

        if (distance < 150) {
          linePaint.color = AppTheme.primaryColor.withOpacity((1 - distance / 150) * 0.1); // Use theme color
          canvas.drawLine(pos1, pos2, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => angle != oldDelegate.angle;
}

class Particle {
  final int seed;
  final Color color;
  final double size;
  final double initialX;
  final double initialY;
  final double velocityX;
  final double velocityY;

  Particle({required this.seed}) : 
    color = Colors.white.withOpacity(Random(seed).nextDouble() * 0.5 + 0.1),
    size = Random(seed+1).nextDouble() * 2 + 1,
    initialX = Random(seed+2).nextDouble(),
    initialY = Random(seed+3).nextDouble(),
    velocityX = (Random(seed+4).nextDouble() - 0.5) * 0.02,
    velocityY = (Random(seed+5).nextDouble() - 0.5) * 0.02;

  Offset calculatePosition(double angle, Size size) {
    final currentX = (initialX + velocityX * angle) % 1.0;
    final currentY = (initialY + velocityY * angle) % 1.0;
    return Offset(currentX * size.width, currentY * size.height);
  }
}