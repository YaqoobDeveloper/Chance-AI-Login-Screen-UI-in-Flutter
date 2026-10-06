/// Thrown by data sources; repositories turn these into [Failure]s.
class ServerException implements Exception {
  const ServerException(this.message);

  final String message;
}

class NetworkException implements Exception {
  const NetworkException();
}
