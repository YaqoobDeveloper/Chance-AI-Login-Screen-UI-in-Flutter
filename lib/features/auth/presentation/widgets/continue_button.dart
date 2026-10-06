import 'package:flutter/material.dart';

/// One "Continue with ..." button.
class ChanceLoginButton {
  const ChanceLoginButton({
    required this.label,
    this.icon,
    this.onTap,
    this.isLoading = false,
  });

  final String label;

  /// Shown before the label. An [Icon] is sized and coloured automatically.
  final Widget? icon;

  /// `null` disables the button.
  final VoidCallback? onTap;

  /// Replaces the icon with a spinner.
  final bool isLoading;
}

/// White pill button with an optional leading icon.
class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.scale,
    required this.data,
    required this.color,
    required this.textColor,
  });

  final double scale;
  final ChanceLoginButton data;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final leading = data.isLoading
        ? SizedBox.square(
            dimension: 13 * s,
            child: CircularProgressIndicator(strokeWidth: 1.6 * s),
          )
        : data.icon;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20 * s),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40000000),
            blurRadius: 6 * s,
            offset: Offset(0, 2 * s),
          ),
        ],
      ),
      child: Material(
        color: color,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: data.onTap,
          child: SizedBox(
            height: 40 * s,
            width: double.infinity,
            child: IconTheme(
              data: IconThemeData(size: 16 * s, color: textColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) ...[leading, SizedBox(width: 8 * s)],
                  Flexible(
                    child: Text(
                      data.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 11.2 * s,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.05 * s,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
