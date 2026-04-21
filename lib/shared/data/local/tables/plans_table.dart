import 'package:drift/drift.dart';

/// Core plans table — the main aggregate root of the planning module.
class Plans extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().withDefault(const Constant(''))();

  // Scheduling
  DateTimeColumn get scheduledDate => dateTime()();
  TextColumn get scheduledTimeLocal => text()(); // HH:mm format
  TextColumn get scheduledTimezone => text().withDefault(const Constant('Europe/Istanbul'))();
  DateTimeColumn get scheduledAtUtc => dateTime()();
  IntColumn get durationMinutes => integer().nullable()();

  // Classification
  TextColumn get categoryId => text().nullable()();
  TextColumn get priority => text().withDefault(const Constant('medium'))();
  TextColumn get status => text().withDefault(const Constant('planned'))();

  // Reminder
  BoolColumn get reminderEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get reminderTimeLocal => text().nullable()();
  DateTimeColumn get reminderAtUtc => dateTime().nullable()();

  // Tracking
  IntColumn get postponedCount => integer().withDefault(const Constant(0))();
  TextColumn get motivationContextSnapshot => text().nullable()();

  // Audit
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {id};
}
