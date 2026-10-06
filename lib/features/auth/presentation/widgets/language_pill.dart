import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Frosted-glass "🌐 English" pill in the top-right corner.
class LanguagePill extends StatelessWidget {
  const LanguagePill({
    super.key,
    required this.scale,
    required this.label,
    this.onTap,
  });

  final double scale;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final shape = StadiumBorder(
      side: BorderSide(color: AppColors.glass, width: 0.75 * s),
    );

    return Material(
      color: AppColors.glass,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onTap,
        child: Container(
          height: 34 * s,
          constraints: BoxConstraints(minWidth: 84 * s),
          padding: EdgeInsets.symmetric(horizontal: 12 * s),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.language, size: 11.5 * s, color: AppColors.white),
              SizedBox(width: 4.5 * s),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.2 * s,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.1 * s,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
