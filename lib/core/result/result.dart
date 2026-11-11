import 'package:j_donuts_app/core/result/failure.dart';

/// The outcome of an operation that can fail: either [Success] or [Err].
sealed class Result<T> {
  const Result();

  /// Collapses both branches into a single value.
  R fold<R>(
    R Function(Failure failure) onFailure,
    R Function(T value) onSuccess,
  ) => switch (this) {
    Success(:final value) => onSuccess(value),
    Err(:final failure) => onFailure(failure),
  };
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);

  final Failure failure;
}
