import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/service_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart'; // Reusamos el CtaSection

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const double sectionSpacing = 120.0;

    // Esta página SÍ tiene scroll (ListView) porque es una página completa.
    return ListView(
      key: const ValueKey('services'),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      children: [
        const SizedBox(height: 80),
        Text(
          'Our Services',
          // Usamos displaySmall para los títulos de página
          style: textTheme.displaySmall,
          textAlign: TextAlign.center,
        ).animate().fade(duration: 500.ms),
        const SizedBox(height: 20),
        Text(
          'We provide a comprehensive range of services to elevate your business.',
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ).animate().fade(duration: 500.ms, delay: 200.ms),
        const SizedBox(height: 60),
        const ResponsiveCardLayout(
          cards: [
            ServiceCard(icon: Icons.code_rounded, title: 'Custom Software Development', description: 'Tailored solutions to meet your unique business needs.'),
            ServiceCard(icon: Icons.devices_rounded, title: 'Web & Mobile Applications', description: 'Engaging apps designed for seamless user experiences.'),
            ServiceCard(icon: Icons.cloud_upload_rounded, title: 'Cloud Solutions & AWS Consulting', description: 'Secure, scalable cloud infrastructure and expert AWS guidance.'),
          ],
        ).animate().fade(duration: 500.ms).slideY(begin: 0.1),
        const SizedBox(height: sectionSpacing),
        const CtaSection().animate().fade(duration: 500.ms),
        const SizedBox(height: 80),
        const Footer(),
      ],
    );
  }
}