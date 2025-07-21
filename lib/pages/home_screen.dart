import 'package:flutter/material.dart';
import 'package:strenu_web/pages/home_sections/hero_section.dart';
import 'package:strenu_web/pages/home_sections/services_section.dart';
import 'package:strenu_web/pages/home_sections/whyus_section.dart';
import 'package:strenu_web/pages/home_sections/cta_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: ValueKey('home'),
      child: Column(
        children: [
          HeroSection(),
          SizedBox(height: 100),
          ServicesSection(),
          SizedBox(height: 100),
          WhyUsSection(),
          SizedBox(height: 100),
          CtaSection(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}