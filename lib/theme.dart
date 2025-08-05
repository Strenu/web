import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- PALETA DE COLORES ESTRATÉGICA ---
  static const Color primaryColor = Color(0xFF1E88E5);
  static const Color accentColor = Color(0xFFFF9900);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF000000);
  static const Color borderColor = Colors.white24;
  static const Color textPrimaryColor = Colors.white;
  static const Color textSecondaryColor = Colors.white70;

  static ThemeData get themeData {
    final baseTextTheme = GoogleFonts.poppinsTextTheme(
      const TextTheme(
        bodyMedium: TextStyle(color: textSecondaryColor),
        bodyLarge: TextStyle(color: textSecondaryColor),
        labelLarge: TextStyle(color: textPrimaryColor),
      ),
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,

      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        background: backgroundColor,
        surface: surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: textPrimaryColor,
        onSurface: textPrimaryColor,
        error: Colors.redAccent,
        onError: Colors.white,
      ),

      // --- TEMA DE TEXTO CON MÁS IMPACTO ---
      textTheme: baseTextTheme.copyWith(
        // Para el titular principal de la Hero Section
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 52, // Aumentado
        ),
        // Para titulares de página (About, Services)
        displaySmall: baseTextTheme.displaySmall?.copyWith(
          color: textPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 48, // Aumentado
        ),
        // Para titulares de sección en la Home
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 40, // Aumentado
        ),
        // Para los títulos de las tarjetas
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: textPrimaryColor,
          fontWeight: FontWeight.w600, // Ligeramente más grueso
          fontSize: 20, // Aumentado
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          fontSize: 16,
          height: 1.5,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          fontSize: 20,
          height: 1.6,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18), // Un poco más alto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),

      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor, width: 1),
        ),
        margin: const EdgeInsets.all(8),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        labelStyle: TextStyle(color: textSecondaryColor),
      ),
    );
  }
}