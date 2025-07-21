import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF00BFFF), size: 40),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    );
  }
}