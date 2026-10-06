import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/design_scale.dart';
import 'aurora_background.dart';
import 'continue_button.dart';
import 'footer_link.dart';
import 'google_logo.dart';
import 'language_pill.dart';
import 'wordmark.dart';

export 'continue_button.dart' show ChanceLoginButton;
export 'footer_link.dart' show ChanceFooterLink;

/// Sign-in screen with a glowing backdrop, script wordmark, and stacked
/// "Continue with" buttons. Pure UI: every text, colour and button is a
/// parameter, so it can be dropped into any project.
///
/// ```dart
/// ChanceLoginScreen(
///   title: 'MyApp.',
///   glowColor: Colors.purple,
///   buttons: [
///     ChanceLoginButton(label: 'Continue with Email', onTap: () {}),
///   ],
/// )
/// ```
class ChanceLoginScreen extends StatelessWidget {
  const ChanceLoginScreen({
    super.key,
    this.title = AppStrings.title,
    this.titleFontFamily = AppStrings.titleFont,
    this.titleFontSize = 38.5,
    this.titleColor = AppColors.white,
    this.tagline = AppStrings.tagline,
    this.taglineColor = AppColors.white,
    this.backgroundColor = AppColors.background,
    this.glowColor = AppColors.glow,
    this.buttonColor = AppColors.white,
    this.buttonTextColor = AppColors.ink,
    this.footerTextColor = AppColors.link,
    this.languageLabel = AppStrings.language,
    this.onLanguageTap,
    this.buttons = const [
      ChanceLoginButton(
        label: AppStrings.continueWithApple,
        icon: Icon(Icons.apple),
      ),
      ChanceLoginButton(
        label: AppStrings.continueWithGoogle,
        icon: GoogleLogo(),
      ),
      ChanceLoginButton(label: AppStrings.continueWithEmail),
    ],
    this.footerLinks = const [
      ChanceFooterLink(label: AppStrings.privacyPolicy),
      ChanceFooterLink(label: AppStrings.termsOfService),
    ],
  });

  /// Big script wordmark in the middle of the screen.
  final String title;

  /// Must match a `family:` registered in pubspec.yaml.
  final String titleFontFamily;
  final double titleFontSize;
  final Color titleColor;

  /// Small text above the buttons. Use `\n` for a line break.
  final String tagline;
  final Color taglineColor;

  final Color backgroundColor;

  /// Main colour of the soft light pools in the background.
  final Color glowColor;

  final Color buttonColor;
  final Color buttonTextColor;
  final Color footerTextColor;

  /// Text of the top-right pill. Set to `null` to hide the pill.
  final String? languageLabel;
  final VoidCallback? onLanguageTap;

  final List<ChanceLoginButton> buttons;
  final List<ChanceFooterLink> footerLinks;

  @override
  Widget build(BuildContext context) {
    final s = context.designScale;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AuroraBackground(background: backgroundColor, glow: glowColor),
          if (languageLabel != null)
            Positioned(
              top: 48.5 * s,
              right: 15.5 * s,
              child: LanguagePill(
                scale: s,
                label: languageLabel!,
                onTap: onLanguageTap,
              ),
            ),
          Positioned(
            top: 160 * s,
            left: 0,
            right: 0,
            child: Wordmark(
              scale: s,
              text: title,
              fontFamily: titleFontFamily,
              fontSize: titleFontSize,
              color: titleColor,
            ),
          ),
          Positioned(
            left: 33.5 * s,
            right: 33.5 * s,
            bottom: 65.5 * s,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tagline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: taglineColor,
                    fontSize: 9.6 * s,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.05 * s,
                  ),
                ),
                for (var i = 0; i < buttons.length; i++) ...[
                  SizedBox(height: i == 0 ? 15 * s : 7.5 * s),
                  ContinueButton(
                    scale: s,
                    data: buttons[i],
                    color: buttonColor,
                    textColor: buttonTextColor,
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 26.5 * s,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final link in footerLinks)
                  Flexible(
                    child: FooterLink(
                      scale: s,
                      data: link,
                      color: footerTextColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
