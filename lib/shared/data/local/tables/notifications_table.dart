import 'package:drift/drift.dart';

/// Local-only notification scheduling state.
class Notifications extends Table {
  TextColumn get id => text()();
  TextColumn get planId => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  IntColumn get platformNotificationId => integer()();
  TextColumn get status => text().withDefault(const Constant('scheduled'))(); // scheduled, delivered, canceled, failed
  DateTimeColumn get scheduledFor => dateTime()();
  TextColumn get timezone => text()();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get lastScheduledAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
