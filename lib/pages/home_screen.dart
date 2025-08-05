import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/pages/home_sections/hero_section.dart';
import 'package:strenu_web/pages/home_sections/services_section.dart';
import 'package:strenu_web/pages/home_sections/whyus_section.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';
import 'package:strenu_web/widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double sectionSpacing = 80.0;

    // La página es un ListView con su contenido y el Footer.
    return ListView(
      key: const ValueKey('home'),
      children: [
        const HeroSection(),
        const SizedBox(height: 20.0),
        const ServicesSection().animate().fade(duration: 500.ms, delay: 200.ms).slideY(begin: 0.1),
        const SizedBox(height: sectionSpacing),
        const WhyUsSection().animate().fade(duration: 500.ms).slideY(begin: 0.1),
        const SizedBox(height: sectionSpacing),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: const CtaSection().animate().fade(duration: 500.ms),
        ),
        const SizedBox(height: sectionSpacing),
        const Footer(),
      ],
    );
  }
}