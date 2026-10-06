import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../injection_container.dart';
import '../../../auth/domain/entities/auth_user.dart';
import '../../../auth/presentation/pages/login_page.dart';

/// Shown after a successful sign-in.
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final AuthUser user;

  Future<void> _signOut(BuildContext context) async {
    await sl.signOut();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome, ${user.name}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Signed in with ${user.method.name}',
              style: const TextStyle(color: AppColors.link),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => _signOut(context),
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
