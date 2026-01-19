import 'package:flutter/material.dart';

class BellShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Punto inicial izquierda
    path.moveTo(0, size.height * 0.35);

    // Curva superior (campana)
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height * 0.35);

    // Bajamos y abrimos
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(size.width * 0.15, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
