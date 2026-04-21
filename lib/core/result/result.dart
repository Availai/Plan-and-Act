import 'package:planandact/core/errors/failure.dart';

/// A functional result type that eliminates try/catch at the use-case boundary.
///
/// Usage:
/// ```dart
/// final result = await createPlanUseCase(plan);
/// switch (result) {
///   case Success(:final value): // handle value
///   case Err(:final failure):   // handle failure
/// }
/// ```
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;
}
