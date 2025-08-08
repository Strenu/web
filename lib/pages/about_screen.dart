import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/benefit_item.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/team_member_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';
import 'package:strenu_web/widgets/strenu_divider.dart';
import 'package:strenu_web/widgets/max_width_container.dart';
import 'package:strenu_web/widgets/mission_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const double verticalSpacing = 80.0;

    final List<Widget> sections = [
      _buildMissionSection(context),
      const StrenuDivider(),
      _buildValuesSection(context),
      const StrenuDivider(),
      _buildTeamSection(context),
      const StrenuDivider(),
      const CtaSection(),
    ];

    return ListView(
      key: const ValueKey('about'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: verticalSpacing),
          child: MaxWidthContainer(
            child: Text(
              'About Us',
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
                  SlideEffect(
                    begin: const Offset(0, 0.05),
                    curve: Curves.easeOut,
                  ),
                ],
                children: sections,
              ),
            ),
          ),
        ),
        const SizedBox(height: verticalSpacing),
        const Footer(),
      ],
    );
  }

  Widget _buildMissionSection(BuildContext context) {
    return const MissionCard(
      title: 'Our Mission',
      description:
          'To architect robust, scalable, and high-performance digital solutions that drive strategic growth and operational excellence for our partners.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1678565869434-c81195861939?q=80&w=1170&auto.format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const values = [
      BenefitItem(
        enableHover: false,
        icon: Icons.shield_outlined,
        title: 'Robustness by Design',
        description:
            'Quality is not an afterthought; it is the core principle of our engineering process.',
      ),
      BenefitItem(
        enableHover: false,
        icon: Icons.rocket_launch_outlined,
        title: 'Technical Excellence',
        description:
            'We leverage cutting-edge technology to build future-proof solutions.',
      ),
      BenefitItem(
        enableHover: false,
        icon: Icons.handshake_outlined,
        title: 'Strategic Partnership',
        description:
            'We function as an extension of your team. Your objectives become our objectives.',
      ),
      BenefitItem(
        enableHover: false,
        icon: Icons.flash_on_rounded,
        title: 'Agile Execution',
        description:
            'We operate with speed and adaptability to deliver superior results, faster.',
      ),
      BenefitItem(
        enableHover: false,
        icon: Icons.verified_user_outlined,
        title: 'Uncompromising Integrity',
        description:
            'Trust is the bedrock of our practice. We are committed to absolute transparency.',
      ),
    ];

    return Column(
      children: [
        Text(
          'Our Core Values',
          style: textTheme.displaySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 60),
        LayoutBuilder(
          builder: (context, constraints) {
            // --- LA CORRECCIÓN ESTÁ AQUÍ ---
            // Hemos bajado el punto de ruptura de 1100 a 960
            if (constraints.maxWidth > 960) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: values[0]),
                        const SizedBox(width: 40),
                        Expanded(child: values[1]),
                        const SizedBox(width: 40),
                        Expanded(child: values[2]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: values[3]),
                        const SizedBox(width: 40),
                        Expanded(child: values[4]),
                      ],
                    ),
                  ),
                ],
              );
            }
            // En pantallas estrechas, la columna normal.
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < values.length; i++) ...[
                  values[i],
                  if (i < values.length - 1) const SizedBox(height: 40),
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'Meet the Leadership',
          style: textTheme.displaySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'The architects and engineers behind our solutions.',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 60),
        const ResponsiveCardLayout(
          cards: [
            TeamMemberCard(
              name: 'Julen Rico',
              role: 'Software Engineer & AWS Expert',
              imageUrl:
                  'https://media.licdn.com/dms/image/D4D03AQHWeT2GjC_p_A/profile-displayphoto-shrink_400_400/0/1715017260534?e=1728518400&v=beta&t=UeJ3w-84j94rM1mJ66kRkH0fQ-25kLkyvO_o97h6Z6A',
            ),
            TeamMemberCard(
              name: 'Mikel Pastor',
              role: 'Software Developer & Flutter Expert',
              imageUrl:
                  'https://media.licdn.com/dms/image/D4D03AQHykUj4rPzLMA/profile-displayphoto-shrink_400_400/0/1691656093554?e=1728518400&v=beta&t=4cR5h8iQjNqY9_dYnQ7t7d8U9a9o6f7i8l8c4k5z6fM',
            ),
          ],
        ),
      ],
    );
  }
}
