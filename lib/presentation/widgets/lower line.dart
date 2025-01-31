import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade100.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.85, size.width * 0.6, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.75, size.width, size.height * 0.8);

    final paint2 = Paint()
      ..color = Colors.blue.shade200.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path2 = Path();
    path2.moveTo(0, size.height * 0.85);
    path2.quadraticBezierTo(
        size.width * 0.4, size.height * 0.9, size.width * 0.7, size.height * 0.85);
    path2.quadraticBezierTo(
        size.width * 0.95, size.height * 0.8, size.width, size.height * 0.85);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}