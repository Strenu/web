import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Importa el paquete
import 'package:strenu_web/pages/home_sections/hero_section.dart';
import 'package:strenu_web/pages/home_sections/services_section.dart';
import 'package:strenu_web/pages/home_sections/whyus_section.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Espaciado reducido para un look más compacto
    const double sectionSpacing = 80.0;

    return SingleChildScrollView(
      key: const ValueKey('home'),
      child: Column(
        children: [
          const HeroSection(),
          const SizedBox(height: sectionSpacing),
          // Cada sección ahora tiene una animación de entrada
          const ServicesSection().animate().fade(duration: 500.ms).slideY(begin: 0.1),
          const SizedBox(height: sectionSpacing),
          const WhyUsSection().animate().fade(duration: 500.ms).slideY(begin: 0.1),
          const SizedBox(height: sectionSpacing),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: CtaSection(),
          ).animate().fade(duration: 500.ms),
          const SizedBox(height: sectionSpacing),
        ],
      ),
    );
  }
}