import 'package:flutter/material.dart';
import 'package:strenu_web/widgets/service_card.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos los estilos del tema para usarlos en la página.
    final textTheme = Theme.of(context).textTheme;
    const double sectionSpacing = 120.0;

    return SingleChildScrollView(
      key: const ValueKey('services'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Text(
              'Our Services',
              // Usamos el estilo para el titular principal de una página.
              style: textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'We provide a comprehensive range of services to elevate your business.',
              // Usamos el estilo para párrafos descriptivos importantes.
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            // Gracias a que 'ServiceCard' ya está tematizado, esto simplemente funciona.
            const Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
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
                  title: 'Cloud Solutions & AWS Consulting', // Ampliado para ser más específico
                  description: 'Secure, scalable cloud infrastructure and expert AWS guidance.',
                ),
                // Podrías añadir más servicios aquí fácilmente
              ],
            ),
            const SizedBox(height: sectionSpacing),
            const CtaSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}