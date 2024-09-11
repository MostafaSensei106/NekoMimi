import 'package:flutter/material.dart';

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final FirstCarve = Offset(0, size.height - 20);
    final SecundCarve = Offset(30, size.height - 20);

    final secundFirstCarve = Offset(0, size.height - 20);
    final secundSecundCarve = Offset(size.width - 30, size.height - 20);

    final thFirstCarve = Offset(size.width, size.height - 20);
    final thSecundCarve = Offset(size.width, size.height);

    path.quadraticBezierTo(
        FirstCarve.dx, FirstCarve.dy, SecundCarve.dx, SecundCarve.dy);

    path.quadraticBezierTo(secundFirstCarve.dx, secundFirstCarve.dy,
        secundSecundCarve.dx, secundSecundCarve.dy);

    path.quadraticBezierTo(
        thFirstCarve.dx, thFirstCarve.dy, thSecundCarve.dx, thSecundCarve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
