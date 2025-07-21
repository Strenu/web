import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strenu_web/widgets/service_card.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('services'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: [
            Text(
              'Nuestros Servicios',
              style: GoogleFonts.poppins(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'Ofrecemos un abanico completo de soluciones para llevar tu empresa al siguiente nivel.',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            const Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                ServiceCard(
                  icon: Icons.code_rounded,
                  title: 'Desarrollo de Software a Medida',
                  description:
                      'Analizamos tus necesidades para construir soluciones robustas, escalables y seguras que se integran perfectamente con tus operaciones. Creamos desde sistemas de gestión interna (ERP, CRM) hasta plataformas complejas de alta demanda.',
                ),
                ServiceCard(
                  icon: Icons.devices_rounded,
                  title: 'Aplicaciones Web y Móviles',
                  description:
                      'Diseñamos y desarrollamos aplicaciones nativas (iOS/Android) y web progresivas (PWA) centradas en una experiencia de usuario excepcional. Tu negocio en el bolsillo de tus clientes, disponible en cualquier momento y lugar.',
                ),
                ServiceCard(
                  icon: Icons.cloud_upload_rounded,
                  title: 'Soluciones Cloud',
                  description:
                      'Migramos tu infraestructura a la nube (AWS, Google Cloud, Azure) y gestionamos servicios para optimizar costes, mejorar la seguridad y garantizar una alta disponibilidad. Automatización, despliegue continuo y monitorización proactiva.',
                ),
                ServiceCard(
                  icon: Icons.support_agent_rounded,
                  title: 'Consultoría Tecnológica',
                  description:
                      'Te asesoramos para que tomes las mejores decisiones tecnológicas. Realizamos auditorías de sistemas, definimos arquitecturas de software y diseñamos una hoja de ruta digital alineada con tus objetivos de negocio.',
                ),
              ],
            ),
            const SizedBox(height: 120),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: CtaSection(),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
