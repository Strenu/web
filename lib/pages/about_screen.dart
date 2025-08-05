import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:strenu_web/widgets/footer.dart';
import 'package:strenu_web/widgets/team_member_card.dart';
import 'package:strenu_web/widgets/responsive_card_layout.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';
import 'package:strenu_web/widgets/value_pillar.dart';
import 'package:strenu_web/widgets/strenu_divider.dart';
import 'package:strenu_web/widgets/max_width_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
          padding: const EdgeInsets.symmetric(vertical: 80.0),
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

  Widget _buildMissionSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    // LA IMAGEN QUE HAS ELEGIDO
    const missionImage = 'https://plus.unsplash.com/premium_photo-1678565869434-c81195861939?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    final imageContent = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(missionImage, fit: BoxFit.cover, height: 350),
    );

    final textContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Our Mission', style: textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: 20),
        Text(
          'To architect robust, scalable, and high-performance digital solutions that drive strategic growth and operational excellence for our partners.',
          style: textTheme.bodyLarge,
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 3, child: textContent),
              const SizedBox(width: 60),
              Expanded(flex: 2, child: imageContent),
            ],
          );
        }
        return Column(
          children: [
            imageContent,
            const SizedBox(height: 40),
            textContent,
          ],
        );
      },
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const pillars = [
      ValuePillar(icon: Icons.lightbulb_outline_rounded, title: 'Relentless Innovation', description: 'We are driven by curiosity to explore emerging technologies and apply them to deliver cutting-edge, future-proof solutions.'),
      ValuePillar(icon: Icons.handshake_rounded, title: 'Strategic Partnership', description: 'We operate as an extension of your team. Your success is our metric, and we build lasting relationships founded on shared goals.'),
      ValuePillar(icon: Icons.verified_user_outlined, title: 'Uncompromising Integrity', description: 'Trust is the bedrock of our practice. We are committed to absolute transparency and ethical conduct in every engagement.'),
    ];
    return Column(
      children: [
        Text('Our Core Values', style: textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: 60),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: pillars[0]),
              const SizedBox(width: 40),
              Expanded(child: pillars[1]),
              const SizedBox(width: 40),
              Expanded(child: pillars[2]),
            ]);
          }
          return Column(children: [
            pillars[0], const SizedBox(height: 60), pillars[1], const SizedBox(height: 60), pillars[2],
          ]);
        }),
      ],
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text('Meet the Leadership', style: textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: 15),
        Text('The architects and engineers behind our solutions.', style: textTheme.bodyMedium),
        const SizedBox(height: 60),
        const ResponsiveCardLayout(cards: [
          TeamMemberCard(name: 'Julen Rico', role: 'Software Engineer & AWS Expert', imageUrl: 'https://media.licdn.com/dms/image/D4D03AQHWeT2GjC_p_A/profile-displayphoto-shrink_400_400/0/1715017260534?e=1728518400&v=beta&t=UeJ3w-84j94rM1mJ66kRkH0fQ-25kLkyvO_o97h6Z6A'),
          TeamMemberCard(name: 'Mikel Pastor', role: 'Software Developer & Flutter Expert', imageUrl: 'https://media.licdn.com/dms/image/D4D03AQHykUj4rPzLMA/profile-displayphoto-shrink_400_400/0/1691656093554?e=1728518400&v=beta&t=4cR5h8iQjNqY9_dYnQ7t7d8U9a9o6f7i8l8c4k5z6fM'),
        ]),
      ],
    );
  }
}