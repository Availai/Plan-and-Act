import 'package:drift/drift.dart';

/// Users table — local user identity and preferences.
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text().withDefault(const Constant(''))();
  TextColumn get email => text().nullable()();
  TextColumn get preferredTone => text().withDefault(const Constant('direct'))();
  TextColumn get preferredLocale => text().withDefault(const Constant('tr'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {id};
}
