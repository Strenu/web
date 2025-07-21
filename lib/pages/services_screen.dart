import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strenu_utils/strenu_utils.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey('services'),
      child: Text(
        'Nuestros Servicios',
        style: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    );
  }
}
