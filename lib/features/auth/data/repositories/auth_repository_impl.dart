import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/auth_method.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  @override
  Future<Result<AuthUser>> signIn(AuthMethod method) async {
    try {
      return Success(await _remote.signIn(method));
    } on NetworkException {
      return const Failed(NetworkFailure());
    } on ServerException catch (e) {
      return Failed(AuthFailure(e.message));
    }
  }

  @override
  Future<void> signOut() => _remote.signOut();
}
