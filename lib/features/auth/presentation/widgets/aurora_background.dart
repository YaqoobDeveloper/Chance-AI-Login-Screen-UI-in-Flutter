import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Soft light pools over a dark base, like an out-of-focus lens.
class AuroraBackground extends StatelessWidget {
  const AuroraBackground({
    super.key,
    required this.background,
    required this.glow,
  });

  final Color background;
  final Color glow;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AuroraPainter(background: background, glow: glow),
    );
  }
}

class _AuroraPainter extends CustomPainter {
  const _AuroraPainter({required this.background, required this.glow});

  final Color background;
  final Color glow;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    final bright = Color.lerp(glow, Colors.white, 0.12)!;
    final dim = Color.lerp(background, Colors.black, 0.2)!;
    const shadow = Color(0xFF000000);

    // (centre, radius, colour) on a 620×1344 canvas.
    final blobs = <(Offset, double, Color)>[
      (const Offset(620, 120), 420, glow),
      (const Offset(-40, 330), 230, bright),
      (const Offset(80, 0), 260, dim),
      (const Offset(330, 500), 270, const Color(0xFF02040F)),
      (const Offset(-20, 900), 330, shadow),
      (const Offset(-40, 1000), 260, shadow),
      (const Offset(320, 840), 150, bright),
      (const Offset(660, 900), 220, background),
      (const Offset(330, 1390), 260, glow),
    ];

    final sx = size.width / 620;
    final sy = size.height / 1344;
    final k = math.min(sx, sy);

    for (final (center, radius, color) in blobs) {
      final c = Offset(center.dx * sx, center.dy * sy);
      final r = radius * k * 1.6;
      canvas.drawCircle(
        c,
        r,
        Paint()
          ..shader = ui.Gradient.radial(
            c,
            r,
            [color, color.withValues(alpha: 0.6), color.withValues(alpha: 0)],
            [0, 0.45, 1],
          ),
      );
    }
  }

  @override
  bool shouldRepaint(_AuroraPainter oldDelegate) =>
      oldDelegate.background != background || oldDelegate.glow != glow;
}
