import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strenu_web/widgets/feature_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          Text(
            'Nuestros Servicios Principales',
            style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            'Soluciones tecnológicas diseñadas para resolver tus desafíos más complejos.',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 50),
          const Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              FeatureCard(
                icon: Icons.code,
                title: 'Desarrollo a Medida',
                description: 'Plataformas y sistemas únicos, construidos desde cero para adaptarse perfectamente a tus procesos de negocio.',
              ),
              FeatureCard(
                icon: Icons.web,
                title: 'Aplicaciones Web y Móviles',
                description: 'Experiencias de usuario fluidas y atractivas en cualquier dispositivo, conectando tu negocio con tus clientes.',
              ),
              FeatureCard(
                icon: Icons.cloud_queue,
                title: 'Soluciones en la Nube',
                description: 'Infraestructura escalable, segura y de alto rendimiento para garantizar la continuidad y eficiencia de tus operaciones.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}