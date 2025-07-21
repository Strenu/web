import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const NavButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive ? const Color(0xFF00BFFF) : Colors.white;
    final underline = _isHovered || widget.isActive;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: widget.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: underline ? 30 : 0,
              color: const Color(0xFF00BFFF),
            )
          ],
        ),
      ),
    );
  }
}