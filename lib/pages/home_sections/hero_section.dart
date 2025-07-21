import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight - kToolbarHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00BFFF), Color(0xFF1E90FF)],
            ).createShader(bounds),
            child: Text(
              'Transformamos Ideas en Soluciones Digitales de Alto Impacto',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Creamos software a medida, aplicaciones web y móviles que potencian el crecimiento y la eficiencia de tu empresa.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BFFF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 8,
              shadowColor: const Color(0xFF00BFFF).withOpacity(0.5),
            ),
            onPressed: () => context.go('/services'),
            child: Text(
              'Explora Nuestros Servicios',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}