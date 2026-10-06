import '../error/failures.dart';

/// Either a value or a [Failure], so callers must handle both cases.
///
/// ```dart
/// switch (result) {
///   case Success(:final value): ...
///   case Failed(:final failure): ...
/// }
/// ```
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

class Failed<T> extends Result<T> {
  const Failed(this.failure);

  final Failure failure;
}
