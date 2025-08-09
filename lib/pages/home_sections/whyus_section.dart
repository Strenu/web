import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/benefit_item.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Column(
        children: [
          Text('Why Choose Us?', style: textTheme.headlineMedium),
          const SizedBox(height: 30),
          const ResponsiveCardLayout(
            cards: [
              BenefitItem(
                icon: Icons.person_search_rounded,
                title: 'Customer Focus',
                description:
                    'We prioritize your success by delivering tailored solutions that exceed expectations.',
              ),
              BenefitItem(
                icon: Icons.groups_2_rounded,
                title: 'Expert Team',
                description:
                    'Our team of skilled professionals is passionate about technology and innovation.',
              ),
              BenefitItem(
                icon: Icons.rule_rounded,
                title: 'Quality Assurance',
                description:
                    'We adhere to the highest standards to deliver reliable and robust products.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
