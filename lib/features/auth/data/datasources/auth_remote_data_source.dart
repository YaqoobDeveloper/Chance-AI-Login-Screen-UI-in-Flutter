import '../../domain/entities/auth_method.dart';
import '../models/auth_user_model.dart';

/// Talks to the auth backend. Throws exceptions from
/// `core/error/exceptions.dart` when something goes wrong.
abstract interface class AuthRemoteDataSource {
  Future<AuthUserModel> signIn(AuthMethod method);

  Future<void> signOut();
}

/// Pretends to call a server so the UI can be built and demoed without one.
/// Replace it with a Firebase / REST implementation of
/// [AuthRemoteDataSource] and register that in `injection_container.dart`.
class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  const FakeAuthRemoteDataSource({
    this.delay = const Duration(milliseconds: 1200),
  });

  final Duration delay;

  @override
  Future<AuthUserModel> signIn(AuthMethod method) async {
    await Future<void>.delayed(delay);
    return AuthUserModel.fromJson({
      'id': 'demo-${method.name}',
      'name': 'Chance User',
      'email': 'user@example.com',
      'method': method.name,
    });
  }

  @override
  Future<void> signOut() => Future<void>.delayed(delay ~/ 4);
}
