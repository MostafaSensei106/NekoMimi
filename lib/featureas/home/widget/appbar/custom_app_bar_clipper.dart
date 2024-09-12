import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final double carveHeight = 20.h;

    final FirstCarve = Offset(0, size.height - carveHeight);
    final SecundCarve = Offset(30.w, size.height - carveHeight);

    final secundFirstCarve = Offset(0, size.height - carveHeight);
    final secundSecundCarve = Offset(size.width - 30.w, size.height - carveHeight);

    final thFirstCarve = Offset(size.width, size.height - carveHeight);
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
