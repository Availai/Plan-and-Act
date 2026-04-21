import 'package:flutter/foundation.dart';

/// Lightweight logger that prints in debug mode and stays silent in release.
class AppLogger {
  AppLogger._();

  static void debug(String tag, String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('[$tag] $message');
    }
  }

  static void info(String tag, String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('ℹ️ [$tag] $message');
    }
  }

  static void warning(String tag, String message) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('⚠️ [$tag] $message');
    }
  }

  static void error(String tag, String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      // ignore: avoid_print
      print('❌ [$tag] $message');
      if (error != null) {
        // ignore: avoid_print
        print('   Cause: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('   Stack: $stackTrace');
      }
    }
  }
}
