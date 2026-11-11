/// A typed reason an operation failed. Repositories return these inside a
/// `Result` instead of throwing.
sealed class Failure {
  const Failure(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => 'Failure: $message';
}

/// The network is unreachable or the server responded with an error.
final class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.cause});
}

/// Reading or writing local storage (database, secure storage) failed.
final class StorageFailure extends Failure {
  const StorageFailure(super.message, {super.cause});
}

/// The requested record does not exist.
final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, {super.cause});
}

/// Anything not covered above; always carries the original cause.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, {super.cause});
}
