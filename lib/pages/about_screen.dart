import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/benefit_item.dart';
import 'package:strenu_web/widgets/team_member_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart'; // Importamos el nuevo layout
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double verticalSpacing = 80.0;

    return SingleChildScrollView(
      key: const ValueKey('about'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            const SizedBox(height: verticalSpacing),
            _buildMissionSection(context).animate().fade(duration: 500.ms),
            const SizedBox(height: verticalSpacing),
            _buildValuesSection(context).animate().fade(duration: 500.ms).slideY(begin: 0.1),
            const SizedBox(height: verticalSpacing),
            _buildTeamSection(context).animate().fade(duration: 500.ms).slideY(begin: 0.1),
            const SizedBox(height: verticalSpacing),
            const CtaSection().animate().fade(duration: 500.ms),
            const SizedBox(height: verticalSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'Our Mission',
          style: textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Empowering businesses through technology, creating innovative solutions that not only solve problems but also open new opportunities for growth and efficiency.',
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'Our Values',
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 60),
        // Aplicamos el layout inteligente aquí.
        const ResponsiveCardLayout(
          cards: [
            BenefitItem(
              icon: Icons.lightbulb_outline_rounded,
              title: 'Constant Innovation',
              description: 'We actively seek new and better ways to do things. Curiosity is our driving force.',
            ),
            BenefitItem(
              icon: Icons.handshake_rounded,
              title: 'Radical Collaboration',
              description: 'We are a strategic partner, not just a provider.',
            ),
            BenefitItem(
              icon: Icons.verified_user_outlined,
              title: 'Absolute Integrity',
              description: 'Trust is the foundation of our relationship.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'Meet the Team',
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 15),
        Text(
          'The creative and technical minds behind our projects.',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 60),
        // Y lo aplicamos también aquí.
        const ResponsiveCardLayout(
          cards: [
            TeamMemberCard(
              name: 'Julen Rico',
              role: 'Software Engineer and AWS Expert',
              imageUrl: 'https://media.licdn.com/dms/image/D4D03AQHWeT2GjC_p_A/profile-displayphoto-shrink_400_400/0/1715017260534?e=1728518400&v=beta&t=UeJ3w-84j94rM1mJ66kRkH0fQ-25kLkyvO_o97h6Z6A',
            ),
            TeamMemberCard(
              name: 'Mikel Pastor',
              role: 'Software Developer and Flutter Expert',
              imageUrl: 'https://media.licdn.com/dms/image/D4D03AQHykUj4rPzLMA/profile-displayphoto-shrink_400_400/0/1691656093554?e=1728518400&v=beta&t=4cR5h8iQjNqY9_dYnQ7t7d8U9a9o6f7i8l8c4k5z6fM',
            ),
          ],
        ),
      ],
    );
  }
}