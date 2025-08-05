import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/feature_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart'; // Importamos el nuevo layout

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Expertise',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Innovative solutions tailored to your business needs.',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          // Reemplazamos el Wrap por nuestro nuevo layout inteligente.
          const ResponsiveCardLayout(
            cards: [
              FeatureCard(
                icon: Icons.code_rounded,
                title: 'Custom Development',
                description: 'Bespoke platforms and systems designed to streamline your operations and drive growth.',
              ),
              FeatureCard(
                icon: Icons.smartphone_rounded,
                title: 'Mobile & Web Apps',
                description: 'Engaging and responsive applications that connect your business with your audience. We build solutions that are not only functional but also beautiful and intuitive.',
              ),
              FeatureCard(
                icon: Icons.cloud_rounded,
                title: 'Cloud Solutions',
                description: 'Secure and scalable cloud infrastructure to ensure seamless operations.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}