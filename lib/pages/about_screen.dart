import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strenu_web/widgets/benefit_item.dart';
import 'package:strenu_web/widgets/team_member_card.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('about'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Nuestra Misión',
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Empoderar a las empresas a través de la tecnología, creando soluciones innovadoras que no solo resuelven problemas, sino que también abren nuevas oportunidades de crecimiento y eficiencia.',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Nuestros Valores',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Wrap(
                    spacing: 60,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      BenefitItem(
                        icon: Icons.lightbulb_outline_rounded,
                        title: 'Innovación Constante',
                        description:
                            'Buscamos activamente nuevas y mejores formas de hacer las cosas. La curiosidad es nuestro motor.',
                      ),
                      BenefitItem(
                        icon: Icons.handshake_rounded,
                        title: 'Colaboración Radical',
                        description:
                            'Creemos en el poder de trabajar juntos. Somos un socio estratégico, no un simple proveedor.',
                      ),
                      BenefitItem(
                        icon: Icons.verified_user_outlined,
                        title: 'Integridad Absoluta',
                        description:
                            'Actuamos con honestidad y transparencia en todo momento. La confianza es la base de nuestra relación.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                children: [
                  Text(
                    'Conoce al Equipo',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Las mentes creativas y técnicas detrás de nuestros proyectos.',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      TeamMemberCard(
                        name: 'Ainhoa Rodríguez',
                        role: 'CEO & Fundadora',
                        imageUrl:
                            'https://m.media-amazon.com/images/I/61sLVMb-qqL._AC_SL1060_.jpg',
                      ),
                      TeamMemberCard(
                        name: 'Carlos López',
                        role: 'Director de Tecnología (CTO)',
                        imageUrl:
                            'https://placehold.co/200x200/E2E8F0/4A5568?text=CL',
                      ),
                      TeamMemberCard(
                        name: 'Laura Martínez',
                        role: 'Líder de Diseño UX/UI',
                        imageUrl:
                            'https://placehold.co/200x200/E2E8F0/4A5568?text=LM',
                      ),
                      TeamMemberCard(
                        name: 'David Rodríguez',
                        role: 'Arquitecto de Software Senior',
                        imageUrl:
                            'https://placehold.co/200x200/E2E8F0/4A5568?text=DR',
                      ),
                    ],
                  ),
                ],
              ),
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
