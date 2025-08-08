import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/animated_background.dart';
import 'package:strenu_web/pages/home_sections/hero_section.dart';
import 'package:strenu_web/pages/home_sections/projects_section.dart';
import 'package:strenu_web/pages/home_sections/testimonials_section.dart';
import 'package:strenu_web/pages/home_sections/whyus_section.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/strenu_divider.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos las secciones que irán dentro del contenedor centrado
    final List<Widget> sections = [
      const ProjectsSection(),
      const StrenuDivider(),
      const WhyUsSection(),
      const StrenuDivider(),
      const TestimonialsSection(),
      const StrenuDivider(),
      const CtaSection(),
    ];

    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const RadialGradient(
              center: Alignment.center,
              radius: 1.2,
              colors: [Colors.transparent, Colors.black],
              stops: [0.0, 0.75],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: const AnimatedBackground(),
        ),
        ListView(
          key: const ValueKey('home'),
          children: [
            const HeroSection(), // Hero Section a ancho completo
            // Contenedor principal para el resto del contenido
            MaxWidthContainer(
              child: Column(
                children: AnimateList(
                  interval: 100.ms,
                  effects: [
                    FadeEffect(duration: 500.ms, curve: Curves.easeOut),
                    SlideEffect(begin: const Offset(0, 0.05), curve: Curves.easeOut),
                  ],
                  children: sections,
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Footer(), // Footer a ancho completo
          ],
        ),
      ],
    );
  }
}