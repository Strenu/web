import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF172A3A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00BFFF).withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF00BFFF), size: 40),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
