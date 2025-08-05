import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/service_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';
import 'package:strenu_web/widgets/strenu_divider.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<Widget> sections = [
      _buildServicesContent(context),
      const StrenuDivider(),
      const CtaSection(),
    ];

    return ListView(
      key: const ValueKey('services'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: MaxWidthContainer(
            child: Text(
              'Our Services',
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ).animate().fade(duration: 500.ms),
          ),
        ),
        MaxWidthContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
        ),
        const SizedBox(height: 80),
        const Footer(),
      ],
    );
  }

  Widget _buildServicesContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'We provide a comprehensive range of services to elevate your business.',
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 60),
        const ResponsiveCardLayout(
          cards: [
            ServiceCard(
              icon: Icons.code_rounded,
              title: 'Custom Software Development',
              description: 'Tailored solutions to meet your unique business needs.',
            ),
            ServiceCard(
              icon: Icons.devices_rounded,
              title: 'Web & Mobile Applications',
              description: 'Engaging apps designed for seamless user experiences.',
            ),
            ServiceCard(
              icon: Icons.cloud_upload_rounded,
              title: 'Cloud Solutions & AWS Consulting',
              description: 'Secure, scalable cloud infrastructure and expert AWS guidance.',
            ),
          ],
        ),
      ],
    );
  }
}