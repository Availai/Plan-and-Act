/// Base exception hierarchy for the application.
///
/// All domain-specific exceptions extend [AppException] so they can be
/// caught uniformly at the application boundary (use-cases / providers).
sealed class AppException implements Exception {
  const AppException(this.message, [this.cause]);

  final String message;
  final Object? cause;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when a requested entity is not found.
class NotFoundException extends AppException {
  const NotFoundException(super.message, [super.cause]);
}

/// Thrown when a business-rule validation fails.
class ValidationException extends AppException {
  const ValidationException(super.message, [super.cause]);
}

/// Thrown when local database operations fail.
class StorageException extends AppException {
  const StorageException(super.message, [super.cause]);
}

/// Thrown when a remote API call fails.
class NetworkException extends AppException {
  const NetworkException(super.message, [super.cause]);
}

/// Thrown when an unexpected/unrecoverable error occurs.
class UnexpectedException extends AppException {
  const UnexpectedException(super.message, [super.cause]);
}
