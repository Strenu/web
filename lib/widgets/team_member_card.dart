import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 60),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            role,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF00BFFF),
            ),
          ),
        ],
      ),
    );
  }
}
