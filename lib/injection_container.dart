import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_out.dart';
import 'features/auth/presentation/controllers/login_controller.dart';

/// Wires every layer together in one place (a tiny service locator, no
/// packages needed). To use a real backend, swap [FakeAuthRemoteDataSource]
/// for your own [AuthRemoteDataSource] here; nothing else changes.
final sl = InjectionContainer();

class InjectionContainer {
  // Data
  late final AuthRemoteDataSource authRemoteDataSource =
      const FakeAuthRemoteDataSource();
  late final AuthRepository authRepository =
      AuthRepositoryImpl(authRemoteDataSource);

  // Domain
  late final SignIn signIn = SignIn(authRepository);
  late final SignOut signOut = SignOut(authRepository);

  // Presentation: a new controller per screen, since screens dispose them.
  LoginController loginController() => LoginController(signIn);
}
