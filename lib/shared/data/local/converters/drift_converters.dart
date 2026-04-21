import 'package:drift/drift.dart';

/// Drift type converters for enums and custom types.

/// Converts a Dart enum to/from its `.name` string for Drift storage.
class EnumNameConverter<T extends Enum> extends TypeConverter<T, String> {
  const EnumNameConverter(this.values);

  final List<T> values;

  @override
  T fromSql(String fromDb) =>
      values.firstWhere((e) => e.name == fromDb);

  @override
  String toSql(T value) => value.name;
}
