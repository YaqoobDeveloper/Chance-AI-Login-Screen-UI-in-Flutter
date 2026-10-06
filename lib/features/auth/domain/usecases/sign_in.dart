import '../../../../core/utils/result.dart';
import '../entities/auth_method.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

/// Signs the user in with the chosen [AuthMethod].
class SignIn {
  const SignIn(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthUser>> call(AuthMethod method) => _repository.signIn(method);
}
