import 'package:flutter/material.dart';

/// One small link at the bottom of the screen.
class ChanceFooterLink {
  const ChanceFooterLink({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;
}

class FooterLink extends StatelessWidget {
  const FooterLink({
    super.key,
    required this.scale,
    required this.data,
    required this.color,
  });

  final double scale;
  final ChanceFooterLink data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: data.onTap,
      child: Padding(
        padding: EdgeInsets.all(6 * scale),
        child: Text(
          data.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: color,
            fontSize: 10 * scale,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
