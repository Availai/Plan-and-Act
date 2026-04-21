import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/shared/data/local/app_database.dart';

/// Singleton provider for the Drift database.
///
/// The database instance is shared across the entire app.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});
