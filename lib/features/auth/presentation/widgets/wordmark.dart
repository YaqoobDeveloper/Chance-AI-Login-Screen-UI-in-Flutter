import 'package:flutter/material.dart';

/// The big script logo text.
class Wordmark extends StatelessWidget {
  const Wordmark({
    super.key,
    required this.scale,
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
  });

  final double scale;
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize * scale,
      height: 1.2,
      color: color,
    );

    // Sacramento is a hairline script; a matching stroke underneath gives it
    // a heavier pen weight.
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          style: style.copyWith(
            color: null,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.1 * scale
              ..strokeJoin = StrokeJoin.round
              ..color = color,
          ),
        ),
        Text(text, style: style),
      ],
    );
  }
}
