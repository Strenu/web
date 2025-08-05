import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final int currentYear = DateTime.now().year;

    // --- LA CORRECCIÓN (Para el copyright) ---
    final TextStyle copyrightStyle = textTheme.bodySmall ?? const TextStyle();

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 720;
              final crossAxisAlignment = isNarrow ? CrossAxisAlignment.center : CrossAxisAlignment.start;
              final textAlign = isNarrow ? TextAlign.center : TextAlign.left;

              if (isNarrow) {
                return Column(
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    _buildBrandInfo(textTheme, textAlign),
                    const SizedBox(height: 30),
                    _buildLinksColumn(context, textTheme, crossAxisAlignment),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Expanded(flex: 2, child: _buildBrandInfo(textTheme, textAlign)),
                  Expanded(flex: 1, child: _buildLinksColumn(context, textTheme, crossAxisAlignment)),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 0.5),
          const SizedBox(height: 20),
          Text(
            '© $currentYear STRENU. Todos los derechos reservados.',
            style: copyrightStyle.copyWith(color: Colors.white54), // Usamos el estilo seguro
          ),
        ],
      ),
    );
  }

  Widget _buildBrandInfo(TextTheme textTheme, TextAlign textAlign) {
    // --- LA CORRECCIÓN ---
    final TextStyle brandNameStyle = textTheme.titleLarge ?? const TextStyle();
    final TextStyle brandDescStyle = textTheme.bodyMedium ?? const TextStyle();

    return Column(
      crossAxisAlignment: textAlign == TextAlign.center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'STRENU',
          style: brandNameStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Custom software development and AWS cloud consulting.',
          style: brandDescStyle.copyWith(color: Colors.white70),
          textAlign: textAlign,
        ),
      ],
    );
  }

  Widget _buildLinksColumn(BuildContext context, TextTheme textTheme, CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text('Navegación', style: textTheme.titleMedium),
        const SizedBox(height: 10),
        _FooterLink(text: 'Inicio', onTap: () => context.go('/')),
        _FooterLink(text: 'Servicios', onTap: () => context.go('/services')),
        _FooterLink(text: 'Sobre Nosotros', onTap: () => context.go('/about')),
      ],
    );
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