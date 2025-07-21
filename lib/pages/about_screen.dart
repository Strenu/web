import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey('about'),
      child: Text(
        'Sobre Nosotros',
        style: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    );
  }
}