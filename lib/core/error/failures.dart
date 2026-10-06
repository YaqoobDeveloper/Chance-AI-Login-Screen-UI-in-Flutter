/// A readable error the domain layer hands to the UI.
sealed class Failure {
  const Failure(this.message);

  final String message;
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Check your internet connection.']);
}
