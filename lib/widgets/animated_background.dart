import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../theme.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Cambiamos LoopAnimationBuilder por MirrorAnimationBuilder
    return MirrorAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * pi), // Anima un ciclo completo
      duration: const Duration(seconds: 10), // Aumentamos la duración para un efecto más sutil
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

  // Usamos un inicializador de campo para mejorar el rendimiento.
  // Las partículas solo se generan una vez.
  ParticlePainter(this.angle) : particles = _generateParticles();

  static List<Particle> _generateParticles() {
    return List.generate(100, (index) => Particle(seed: index));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppTheme.primaryColor; // Reutilizamos el objeto Paint
    final linePaint = Paint()
      ..strokeWidth = 1
      ..color = AppTheme.primaryColor; // Reutilizamos el objeto Paint

    // Pre-calculamos todas las posiciones para evitar recalcular en el bucle anidado
    final positions = particles.map((p) => p.calculatePosition(angle, size)).toList();

    for (final pos in positions) {
      // El size ya está en la partícula, pero lo dibujamos aquí
      final particleSize = 2.0; // Puedes ajustar esto
      canvas.drawCircle(pos, particleSize, paint);
    }

    for (int i = 0; i < positions.length; i++) {
      for (int j = i + 1; j < positions.length; j++) {
        final pos1 = positions[i];
        final pos2 = positions[j];
        final distance = (pos1 - pos2).distance;

        if (distance < 150) {
          linePaint.color = AppTheme.primaryColor.withOpacity((1 - distance / 150) * 0.1);
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
  final double size;
  final double initialX;
  final double initialY;
  final double velocityX;
  final double velocityY;

  Particle({required this.seed})
      : size = Random(seed + 1).nextDouble() * 2 + 1,
        initialX = Random(seed + 2).nextDouble(),
        initialY = Random(seed + 3).nextDouble(),
        // Reducimos la velocidad para un movimiento más lento y elegante
        velocityX = (Random(seed + 4).nextDouble() - 0.5) * 0.01,
        velocityY = (Random(seed + 5).nextDouble() - 0.5) * 0.01;

  Offset calculatePosition(double angle, Size size) {
    // Usamos el operador % para que las partículas reaparezcan por el otro lado
    final currentX = (initialX + velocityX * angle) % 1.0;
    final currentY = (initialY + velocityY * angle) % 1.0;
    
    // Si el valor es negativo, lo corregimos para que el % funcione correctamente
    final wrappedX = currentX < 0 ? 1.0 + currentX : currentX;
    final wrappedY = currentY < 0 ? 1.0 + currentY : currentY;

    return Offset(wrappedX * size.width, wrappedY * size.height);
  }
}