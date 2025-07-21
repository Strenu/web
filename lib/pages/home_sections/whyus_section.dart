import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strenu_web/widgets/benefit_item.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
           Text(
            '¿Por Qué Elegirnos?',
            style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          const Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              BenefitItem(
                icon: Icons.person_search_rounded,
                title: 'Enfoque en el Cliente',
                description: 'Tu éxito es nuestro objetivo. Trabajamos contigo en cada paso para asegurar que la solución final supere tus expectativas.'
              ),
              BenefitItem(
                icon: Icons.groups_2_rounded,
                title: 'Equipo Experto',
                description: 'Contamos con un equipo de desarrolladores, diseñadores y estrategas apasionados por la tecnología y la innovación.'
              ),
              BenefitItem(
                icon: Icons.rule_rounded,
                title: 'Calidad y Metodología',
                description: 'Aplicamos metodologías ágiles y los más altos estándares de calidad para entregar productos robustos y fiables a tiempo.'
              ),
            ],
          )
        ],
      ),
    );
  }
}