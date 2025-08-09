import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strenu_web/widgets/max_width_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  ///TODO: Add links to social media and other pages
  static final Uri _instagramUrl = Uri.parse('https://instagram.com/#');
  static final Uri _linkedinUrl = Uri.parse('https://www.linkedin.com/#');
  static final Uri _xUrl = Uri.parse('https://x.com/#');
  static final Uri _youtubeUrl = Uri.parse('https://youtube.com/#');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final int currentYear = DateTime.now().year;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: MaxWidthContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 720;
                  final crossAxisAlignment = isNarrow
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start;
                  final textAlign = isNarrow
                      ? TextAlign.center
                      : TextAlign.left;

                  if (isNarrow) {
                    return Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [
                        _buildBrandInfo(textTheme, textAlign),
                        const SizedBox(height: 30),
                        _buildLinksColumn(
                          context,
                          textTheme,
                          crossAxisAlignment,
                        ),
                        const SizedBox(height: 30),
                        _buildSocialsColumn(
                          context,
                          textTheme,
                          crossAxisAlignment,
                        ),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildBrandInfo(textTheme, textAlign),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildLinksColumn(
                          context,
                          textTheme,
                          crossAxisAlignment,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: _buildSocialsColumn(
                          context,
                          textTheme,
                          crossAxisAlignment,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              const Divider(thickness: 0.5),
              const SizedBox(height: 20),
              Text(
                '© $currentYear STRENU. All rights reserved.',
                style: textTheme.bodySmall?.copyWith(color: Colors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialsColumn(
    BuildContext context,
    TextTheme textTheme,
    CrossAxisAlignment crossAxisAlignment,
  ) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text('Social', style: textTheme.titleMedium),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram),
              onPressed: () => _launchUrl(_instagramUrl),
              tooltip: 'Instagram',
              color: Colors.white70,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedinIn),
              onPressed: () => _launchUrl(_linkedinUrl),
              tooltip: 'LinkedIn',
              color: Colors.white70,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.xTwitter),
              onPressed: () => _launchUrl(_xUrl),
              tooltip: 'X (Twitter)',
              color: Colors.white70,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.youtube),
              onPressed: () => _launchUrl(_youtubeUrl),
              tooltip: 'YouTube',
              color: Colors.white70,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandInfo(TextTheme textTheme, TextAlign textAlign) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'STRENU',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Custom software development and AWS cloud consulting.',
          style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
          textAlign: textAlign,
        ),
      ],
    );
  }

  Widget _buildLinksColumn(
    BuildContext context,
    TextTheme textTheme,
    CrossAxisAlignment crossAxisAlignment,
  ) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text('Navigation', style: textTheme.titleMedium),
        const SizedBox(height: 10),
        _FooterLink(text: 'Home', onTap: () => context.go('/')),
        _FooterLink(text: 'Services', onTap: () => context.go('/services')),
        _FooterLink(text: 'About Us', onTap: () => context.go('/about')),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        alignment: Alignment.centerLeft,
      ),
      child: Text(text),
    );
  }
}
