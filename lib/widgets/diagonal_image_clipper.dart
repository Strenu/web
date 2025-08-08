import 'package:flutter/material.dart';

class DiagonalImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // ANTES: path.moveTo(size.width * 0.55, 0);
    // AHORA: Empezamos más a la derecha, en el 65% del ancho.
    path.moveTo(size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    // ANTES: path.lineTo(size.width * 0.25, size.height);
    // AHORA: Terminamos más a la derecha, en el 50% del ancho.
    path.lineTo(size.width * 0.50, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
