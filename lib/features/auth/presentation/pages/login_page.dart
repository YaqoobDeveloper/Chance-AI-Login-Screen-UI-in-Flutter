import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/result.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../domain/entities/auth_method.dart';
import '../controllers/login_controller.dart';
import '../widgets/chance_login_screen.dart';
import '../widgets/google_logo.dart';

/// Connects the [ChanceLoginScreen] UI to the [LoginController].
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = sl.loginController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _notify(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)),
      );
  }

  Future<void> _signIn(AuthMethod method) async {
    final result = await _controller.signIn(method);
    if (!mounted) return;

    switch (result) {
      case Success(:final value):
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage(user: value)),
        );
      case Failed(:final failure):
        _notify(failure.message);
    }
  }

  ChanceLoginButton _button(AuthMethod method, String label, Widget? icon) {
    return ChanceLoginButton(
      label: label,
      icon: icon,
      isLoading: _controller.loadingMethod == method,
      // Disable every button while any sign-in is running.
      onTap: _controller.isLoading ? null : () => _signIn(method),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) => ChanceLoginScreen(
        // Change any of these values to make the screen your own.
        title: AppStrings.title,
        titleFontFamily: AppStrings.titleFont,
        tagline: AppStrings.tagline,
        backgroundColor: AppColors.background,
        glowColor: AppColors.glow,
        languageLabel: AppStrings.language,
        onLanguageTap: () => _notify('Language picker'),
        buttons: [
          _button(
            AuthMethod.apple,
            AppStrings.continueWithApple,
            const Icon(Icons.apple),
          ),
          _button(
            AuthMethod.google,
            AppStrings.continueWithGoogle,
            const GoogleLogo(),
          ),
          _button(AuthMethod.email, AppStrings.continueWithEmail, null),
        ],
        footerLinks: [
          ChanceFooterLink(
            label: AppStrings.privacyPolicy,
            onTap: () => _notify(AppStrings.privacyPolicy),
          ),
          ChanceFooterLink(
            label: AppStrings.termsOfService,
            onTap: () => _notify(AppStrings.termsOfService),
          ),
        ],
      ),
    );
  }
}
