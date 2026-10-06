import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Four-colour Google "G", drawn so no image asset is needed.
/// Sizes itself from the surrounding [IconTheme], just like an [Icon].
class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    final d = (size ?? IconTheme.of(context).size ?? 24) * 0.875;
    return SizedBox.square(
      dimension: d,
      child: const CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  const _GoogleGPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final d = size.shortestSide;
    final stroke = d * 0.2;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: (d - stroke) / 2,
    );
    Paint arc(Color c) => Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    double rad(double deg) => deg * math.pi / 180;

    canvas
      ..drawArc(rect, rad(0), rad(45), false, arc(const Color(0xFF4285F4)))
      ..drawArc(rect, rad(45), rad(105), false, arc(const Color(0xFF34A853)))
      ..drawArc(rect, rad(150), rad(60), false, arc(const Color(0xFFFBBC05)))
      ..drawArc(rect, rad(210), rad(105), false, arc(const Color(0xFFEA4335)));

    // The crossbar.
    canvas.drawRect(
      Rect.fromLTRB(rect.center.dx, rect.center.dy - stroke / 2,
          rect.right + stroke / 2, rect.center.dy + stroke / 2),
      Paint()..color = const Color(0xFF4285F4),
    );
  }

  @override
  bool shouldRepaint(_GoogleGPainter oldDelegate) => false;
}
