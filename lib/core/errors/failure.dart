/// UI-facing failure model.
///
/// Unlike [AppException], a [Failure] is not thrown — it is returned
/// inside a [Result] so the presentation layer can pattern-match on it
/// without try/catch noise.
sealed class Failure {
  const Failure(this.message, [this.details]);

  final String message;
  final String? details;
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, [super.details]);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [super.details]);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message, [super.details]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.details]);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, [super.details]);
}
