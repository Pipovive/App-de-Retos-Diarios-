import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Línea recta superior
    path.lineTo(0, 0);

    // Bajamos al inicio de las olas
    path.lineTo(0, 30);

    final waveHeight = 20; // profundidad de la ola
    final waveWidth = size.width / 6; // cantidad de olas (más pequeño = más olas)

    double x = 0;

    while (x < size.width) {
      path.quadraticBezierTo(
        x + waveWidth / 2,
        30 + waveHeight.toDouble(), // 👈 ola hacia abajo
        x + waveWidth,
        30,
      );
      x += waveWidth;
    }

    // Cerrar forma
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
