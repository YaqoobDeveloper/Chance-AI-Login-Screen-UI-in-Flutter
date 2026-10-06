import 'auth_method.dart';

/// A signed-in user, as the rest of the app sees it.
class AuthUser {
  const AuthUser({
    required this.id,
    required this.name,
    required this.email,
    required this.method,
  });

  final String id;
  final String name;
  final String email;
  final AuthMethod method;
}
