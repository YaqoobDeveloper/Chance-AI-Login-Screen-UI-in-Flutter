import '../../../../core/utils/result.dart';
import '../entities/auth_method.dart';
import '../entities/auth_user.dart';

/// What the app needs from authentication. The data layer decides how
/// (Firebase, your own API, a fake for demos...).
abstract interface class AuthRepository {
  Future<Result<AuthUser>> signIn(AuthMethod method);

  Future<void> signOut();
}
