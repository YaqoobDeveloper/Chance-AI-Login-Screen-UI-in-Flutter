import 'package:flutter/foundation.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/auth_method.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/usecases/sign_in.dart';

/// Holds the login screen's state and talks to the domain layer.
class LoginController extends ChangeNotifier {
  LoginController(this._signIn);

  final SignIn _signIn;

  /// The method currently signing in, or `null` when idle.
  AuthMethod? loadingMethod;

  bool get isLoading => loadingMethod != null;

  /// Signs in and returns the result so the page can navigate or show errors.
  Future<Result<AuthUser>> signIn(AuthMethod method) async {
    loadingMethod = method;
    notifyListeners();

    final result = await _signIn(method);

    loadingMethod = null;
    notifyListeners();
    return result;
  }
}
