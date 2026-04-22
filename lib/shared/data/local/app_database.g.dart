// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _preferredToneMeta = const VerificationMeta(
    'preferredTone',
  );
  @override
  late final GeneratedColumn<String> preferredTone = GeneratedColumn<String>(
    'preferred_tone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('direct'),
  );
  static const VerificationMeta _preferredLocaleMeta = const VerificationMeta(
    'preferredLocale',
  );
  @override
  late final GeneratedColumn<String> preferredLocale = GeneratedColumn<String>(
    'preferred_locale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('tr'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    email,
    preferredTone,
    preferredLocale,
    createdAt,
    updatedAt,
    deletedAt,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('preferred_tone')) {
      context.handle(
        _preferredToneMeta,
        preferredTone.isAcceptableOrUnknown(
          data['preferred_tone']!,
          _preferredToneMeta,
        ),
      );
    }
    if (data.containsKey('preferred_locale')) {
      context.handle(
        _preferredLocaleMeta,
        preferredLocale.isAcceptableOrUnknown(
          data['preferred_locale']!,
          _preferredLocaleMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      preferredTone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preferred_tone'],
      )!,
      preferredLocale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preferred_locale'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String displayName;
  final String? email;
  final String preferredTone;
  final String preferredLocale;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int version;
  const User({
    required this.id,
    required this.displayName,
    this.email,
    required this.preferredTone,
    required this.preferredLocale,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['preferred_tone'] = Variable<String>(preferredTone);
    map['preferred_locale'] = Variable<String>(preferredLocale);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['version'] = Variable<int>(version);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      displayName: Value(displayName),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      preferredTone: Value(preferredTone),
      preferredLocale: Value(preferredLocale),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      version: Value(version),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      email: serializer.fromJson<String?>(json['email']),
      preferredTone: serializer.fromJson<String>(json['preferredTone']),
      preferredLocale: serializer.fromJson<String>(json['preferredLocale']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String?>(email),
      'preferredTone': serializer.toJson<String>(preferredTone),
      'preferredLocale': serializer.toJson<String>(preferredLocale),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'version': serializer.toJson<int>(version),
    };
  }

  User copyWith({
    String? id,
    String? displayName,
    Value<String?> email = const Value.absent(),
    String? preferredTone,
    String? preferredLocale,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? version,
  }) => User(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    email: email.present ? email.value : this.email,
    preferredTone: preferredTone ?? this.preferredTone,
    preferredLocale: preferredLocale ?? this.preferredLocale,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    version: version ?? this.version,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      preferredTone: data.preferredTone.present
          ? data.preferredTone.value
          : this.preferredTone,
      preferredLocale: data.preferredLocale.present
          ? data.preferredLocale.value
          : this.preferredLocale,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('preferredTone: $preferredTone, ')
          ..write('preferredLocale: $preferredLocale, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    email,
    preferredTone,
    preferredLocale,
    createdAt,
    updatedAt,
    deletedAt,
    version,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.preferredTone == this.preferredTone &&
          other.preferredLocale == this.preferredLocale &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.version == this.version);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> email;
  final Value<String> preferredTone;
  final Value<String> preferredLocale;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> version;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.preferredTone = const Value.absent(),
    this.preferredLocale = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.preferredTone = const Value.absent(),
    this.preferredLocale = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? preferredTone,
    Expression<String>? preferredLocale,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? version,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (preferredTone != null) 'preferred_tone': preferredTone,
      if (preferredLocale != null) 'preferred_locale': preferredLocale,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (version != null) 'version': version,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? email,
    Value<String>? preferredTone,
    Value<String>? preferredLocale,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? version,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      preferredTone: preferredTone ?? this.preferredTone,
      preferredLocale: preferredLocale ?? this.preferredLocale,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      version: version ?? this.version,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (preferredTone.present) {
      map['preferred_tone'] = Variable<String>(preferredTone.value);
    }
    if (preferredLocale.present) {
      map['preferred_locale'] = Variable<String>(preferredLocale.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('preferredTone: $preferredTone, ')
          ..write('preferredLocale: $preferredLocale, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('version: $version, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanCategoriesTable extends PlanCategories
    with TableInfo<$PlanCategoriesTable, PlanCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('category'),
  );
  static const VerificationMeta _colorKeyMeta = const VerificationMeta(
    'colorKey',
  );
  @override
  late final GeneratedColumn<String> colorKey = GeneratedColumn<String>(
    'color_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('primary'),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    slug,
    name,
    iconKey,
    colorKey,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    }
    if (data.containsKey('color_key')) {
      context.handle(
        _colorKeyMeta,
        colorKey.isAcceptableOrUnknown(data['color_key']!, _colorKeyMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      colorKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_key'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PlanCategoriesTable createAlias(String alias) {
    return $PlanCategoriesTable(attachedDatabase, alias);
  }
}

class PlanCategory extends DataClass implements Insertable<PlanCategory> {
  final String id;
  final String slug;
  final String name;
  final String iconKey;
  final String colorKey;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PlanCategory({
    required this.id,
    required this.slug,
    required this.name,
    required this.iconKey,
    required this.colorKey,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    map['icon_key'] = Variable<String>(iconKey);
    map['color_key'] = Variable<String>(colorKey);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PlanCategoriesCompanion toCompanion(bool nullToAbsent) {
    return PlanCategoriesCompanion(
      id: Value(id),
      slug: Value(slug),
      name: Value(name),
      iconKey: Value(iconKey),
      colorKey: Value(colorKey),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlanCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanCategory(
      id: serializer.fromJson<String>(json['id']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      colorKey: serializer.fromJson<String>(json['colorKey']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'iconKey': serializer.toJson<String>(iconKey),
      'colorKey': serializer.toJson<String>(colorKey),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PlanCategory copyWith({
    String? id,
    String? slug,
    String? name,
    String? iconKey,
    String? colorKey,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PlanCategory(
    id: id ?? this.id,
    slug: slug ?? this.slug,
    name: name ?? this.name,
    iconKey: iconKey ?? this.iconKey,
    colorKey: colorKey ?? this.colorKey,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PlanCategory copyWithCompanion(PlanCategoriesCompanion data) {
    return PlanCategory(
      id: data.id.present ? data.id.value : this.id,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      colorKey: data.colorKey.present ? data.colorKey.value : this.colorKey,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanCategory(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('iconKey: $iconKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    slug,
    name,
    iconKey,
    colorKey,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanCategory &&
          other.id == this.id &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.iconKey == this.iconKey &&
          other.colorKey == this.colorKey &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlanCategoriesCompanion extends UpdateCompanion<PlanCategory> {
  final Value<String> id;
  final Value<String> slug;
  final Value<String> name;
  final Value<String> iconKey;
  final Value<String> colorKey;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PlanCategoriesCompanion({
    this.id = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.colorKey = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanCategoriesCompanion.insert({
    required String id,
    required String slug,
    required String name,
    this.iconKey = const Value.absent(),
    this.colorKey = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       slug = Value(slug),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PlanCategory> custom({
    Expression<String>? id,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? iconKey,
    Expression<String>? colorKey,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (iconKey != null) 'icon_key': iconKey,
      if (colorKey != null) 'color_key': colorKey,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? slug,
    Value<String>? name,
    Value<String>? iconKey,
    Value<String>? colorKey,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PlanCategoriesCompanion(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      iconKey: iconKey ?? this.iconKey,
      colorKey: colorKey ?? this.colorKey,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (colorKey.present) {
      map['color_key'] = Variable<String>(colorKey.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('iconKey: $iconKey, ')
          ..write('colorKey: $colorKey, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanTagsTable extends PlanTags with TableInfo<$PlanTagsTable, PlanTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, label, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlanTagsTable createAlias(String alias) {
    return $PlanTagsTable(attachedDatabase, alias);
  }
}

class PlanTag extends DataClass implements Insertable<PlanTag> {
  final String id;
  final String userId;
  final String label;
  final DateTime createdAt;
  const PlanTag({
    required this.id,
    required this.userId,
    required this.label,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['label'] = Variable<String>(label);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlanTagsCompanion toCompanion(bool nullToAbsent) {
    return PlanTagsCompanion(
      id: Value(id),
      userId: Value(userId),
      label: Value(label),
      createdAt: Value(createdAt),
    );
  }

  factory PlanTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanTag(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      label: serializer.fromJson<String>(json['label']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'label': serializer.toJson<String>(label),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlanTag copyWith({
    String? id,
    String? userId,
    String? label,
    DateTime? createdAt,
  }) => PlanTag(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    label: label ?? this.label,
    createdAt: createdAt ?? this.createdAt,
  );
  PlanTag copyWithCompanion(PlanTagsCompanion data) {
    return PlanTag(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      label: data.label.present ? data.label.value : this.label,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanTag(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, label, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanTag &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.label == this.label &&
          other.createdAt == this.createdAt);
}

class PlanTagsCompanion extends UpdateCompanion<PlanTag> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> label;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PlanTagsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.label = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanTagsCompanion.insert({
    required String id,
    required String userId,
    required String label,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       label = Value(label),
       createdAt = Value(createdAt);
  static Insertable<PlanTag> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? label,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (label != null) 'label': label,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanTagsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? label,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PlanTagsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanTagsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('label: $label, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlansTable extends Plans with TableInfo<$PlansTable, Plan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _scheduledDateMeta = const VerificationMeta(
    'scheduledDate',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledDate =
      GeneratedColumn<DateTime>(
        'scheduled_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _scheduledTimeLocalMeta =
      const VerificationMeta('scheduledTimeLocal');
  @override
  late final GeneratedColumn<String> scheduledTimeLocal =
      GeneratedColumn<String>(
        'scheduled_time_local',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _scheduledTimezoneMeta = const VerificationMeta(
    'scheduledTimezone',
  );
  @override
  late final GeneratedColumn<String> scheduledTimezone =
      GeneratedColumn<String>(
        'scheduled_timezone',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('Europe/Istanbul'),
      );
  static const VerificationMeta _scheduledAtUtcMeta = const VerificationMeta(
    'scheduledAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAtUtc =
      GeneratedColumn<DateTime>(
        'scheduled_at_utc',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('medium'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('planned'),
  );
  static const VerificationMeta _reminderEnabledMeta = const VerificationMeta(
    'reminderEnabled',
  );
  @override
  late final GeneratedColumn<bool> reminderEnabled = GeneratedColumn<bool>(
    'reminder_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderTimeLocalMeta = const VerificationMeta(
    'reminderTimeLocal',
  );
  @override
  late final GeneratedColumn<String> reminderTimeLocal =
      GeneratedColumn<String>(
        'reminder_time_local',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _reminderAtUtcMeta = const VerificationMeta(
    'reminderAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> reminderAtUtc =
      GeneratedColumn<DateTime>(
        'reminder_at_utc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _postponedCountMeta = const VerificationMeta(
    'postponedCount',
  );
  @override
  late final GeneratedColumn<int> postponedCount = GeneratedColumn<int>(
    'postponed_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _motivationContextSnapshotMeta =
      const VerificationMeta('motivationContextSnapshot');
  @override
  late final GeneratedColumn<String> motivationContextSnapshot =
      GeneratedColumn<String>(
        'motivation_context_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    description,
    scheduledDate,
    scheduledTimeLocal,
    scheduledTimezone,
    scheduledAtUtc,
    durationMinutes,
    categoryId,
    priority,
    status,
    reminderEnabled,
    reminderTimeLocal,
    reminderAtUtc,
    postponedCount,
    motivationContextSnapshot,
    createdAt,
    updatedAt,
    completedAt,
    deletedAt,
    version,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<Plan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_date')) {
      context.handle(
        _scheduledDateMeta,
        scheduledDate.isAcceptableOrUnknown(
          data['scheduled_date']!,
          _scheduledDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledDateMeta);
    }
    if (data.containsKey('scheduled_time_local')) {
      context.handle(
        _scheduledTimeLocalMeta,
        scheduledTimeLocal.isAcceptableOrUnknown(
          data['scheduled_time_local']!,
          _scheduledTimeLocalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTimeLocalMeta);
    }
    if (data.containsKey('scheduled_timezone')) {
      context.handle(
        _scheduledTimezoneMeta,
        scheduledTimezone.isAcceptableOrUnknown(
          data['scheduled_timezone']!,
          _scheduledTimezoneMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_at_utc')) {
      context.handle(
        _scheduledAtUtcMeta,
        scheduledAtUtc.isAcceptableOrUnknown(
          data['scheduled_at_utc']!,
          _scheduledAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtUtcMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('reminder_enabled')) {
      context.handle(
        _reminderEnabledMeta,
        reminderEnabled.isAcceptableOrUnknown(
          data['reminder_enabled']!,
          _reminderEnabledMeta,
        ),
      );
    }
    if (data.containsKey('reminder_time_local')) {
      context.handle(
        _reminderTimeLocalMeta,
        reminderTimeLocal.isAcceptableOrUnknown(
          data['reminder_time_local']!,
          _reminderTimeLocalMeta,
        ),
      );
    }
    if (data.containsKey('reminder_at_utc')) {
      context.handle(
        _reminderAtUtcMeta,
        reminderAtUtc.isAcceptableOrUnknown(
          data['reminder_at_utc']!,
          _reminderAtUtcMeta,
        ),
      );
    }
    if (data.containsKey('postponed_count')) {
      context.handle(
        _postponedCountMeta,
        postponedCount.isAcceptableOrUnknown(
          data['postponed_count']!,
          _postponedCountMeta,
        ),
      );
    }
    if (data.containsKey('motivation_context_snapshot')) {
      context.handle(
        _motivationContextSnapshotMeta,
        motivationContextSnapshot.isAcceptableOrUnknown(
          data['motivation_context_snapshot']!,
          _motivationContextSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      scheduledDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_date'],
      )!,
      scheduledTimeLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheduled_time_local'],
      )!,
      scheduledTimezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheduled_timezone'],
      )!,
      scheduledAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at_utc'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reminderEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_enabled'],
      )!,
      reminderTimeLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reminder_time_local'],
      ),
      reminderAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reminder_at_utc'],
      ),
      postponedCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}postponed_count'],
      )!,
      motivationContextSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}motivation_context_snapshot'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }
}

class Plan extends DataClass implements Insertable<Plan> {
  final String id;
  final String userId;
  final String title;
  final String description;
  final DateTime scheduledDate;
  final String scheduledTimeLocal;
  final String scheduledTimezone;
  final DateTime scheduledAtUtc;
  final int? durationMinutes;
  final String? categoryId;
  final String priority;
  final String status;
  final bool reminderEnabled;
  final String? reminderTimeLocal;
  final DateTime? reminderAtUtc;
  final int postponedCount;
  final String? motivationContextSnapshot;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final DateTime? deletedAt;
  final int version;
  const Plan({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.scheduledDate,
    required this.scheduledTimeLocal,
    required this.scheduledTimezone,
    required this.scheduledAtUtc,
    this.durationMinutes,
    this.categoryId,
    required this.priority,
    required this.status,
    required this.reminderEnabled,
    this.reminderTimeLocal,
    this.reminderAtUtc,
    required this.postponedCount,
    this.motivationContextSnapshot,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.deletedAt,
    required this.version,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['scheduled_date'] = Variable<DateTime>(scheduledDate);
    map['scheduled_time_local'] = Variable<String>(scheduledTimeLocal);
    map['scheduled_timezone'] = Variable<String>(scheduledTimezone);
    map['scheduled_at_utc'] = Variable<DateTime>(scheduledAtUtc);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['priority'] = Variable<String>(priority);
    map['status'] = Variable<String>(status);
    map['reminder_enabled'] = Variable<bool>(reminderEnabled);
    if (!nullToAbsent || reminderTimeLocal != null) {
      map['reminder_time_local'] = Variable<String>(reminderTimeLocal);
    }
    if (!nullToAbsent || reminderAtUtc != null) {
      map['reminder_at_utc'] = Variable<DateTime>(reminderAtUtc);
    }
    map['postponed_count'] = Variable<int>(postponedCount);
    if (!nullToAbsent || motivationContextSnapshot != null) {
      map['motivation_context_snapshot'] = Variable<String>(
        motivationContextSnapshot,
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['version'] = Variable<int>(version);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      description: Value(description),
      scheduledDate: Value(scheduledDate),
      scheduledTimeLocal: Value(scheduledTimeLocal),
      scheduledTimezone: Value(scheduledTimezone),
      scheduledAtUtc: Value(scheduledAtUtc),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      priority: Value(priority),
      status: Value(status),
      reminderEnabled: Value(reminderEnabled),
      reminderTimeLocal: reminderTimeLocal == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTimeLocal),
      reminderAtUtc: reminderAtUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderAtUtc),
      postponedCount: Value(postponedCount),
      motivationContextSnapshot:
          motivationContextSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(motivationContextSnapshot),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      version: Value(version),
    );
  }

  factory Plan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plan(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      scheduledDate: serializer.fromJson<DateTime>(json['scheduledDate']),
      scheduledTimeLocal: serializer.fromJson<String>(
        json['scheduledTimeLocal'],
      ),
      scheduledTimezone: serializer.fromJson<String>(json['scheduledTimezone']),
      scheduledAtUtc: serializer.fromJson<DateTime>(json['scheduledAtUtc']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      priority: serializer.fromJson<String>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      reminderEnabled: serializer.fromJson<bool>(json['reminderEnabled']),
      reminderTimeLocal: serializer.fromJson<String?>(
        json['reminderTimeLocal'],
      ),
      reminderAtUtc: serializer.fromJson<DateTime?>(json['reminderAtUtc']),
      postponedCount: serializer.fromJson<int>(json['postponedCount']),
      motivationContextSnapshot: serializer.fromJson<String?>(
        json['motivationContextSnapshot'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'scheduledDate': serializer.toJson<DateTime>(scheduledDate),
      'scheduledTimeLocal': serializer.toJson<String>(scheduledTimeLocal),
      'scheduledTimezone': serializer.toJson<String>(scheduledTimezone),
      'scheduledAtUtc': serializer.toJson<DateTime>(scheduledAtUtc),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'categoryId': serializer.toJson<String?>(categoryId),
      'priority': serializer.toJson<String>(priority),
      'status': serializer.toJson<String>(status),
      'reminderEnabled': serializer.toJson<bool>(reminderEnabled),
      'reminderTimeLocal': serializer.toJson<String?>(reminderTimeLocal),
      'reminderAtUtc': serializer.toJson<DateTime?>(reminderAtUtc),
      'postponedCount': serializer.toJson<int>(postponedCount),
      'motivationContextSnapshot': serializer.toJson<String?>(
        motivationContextSnapshot,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'version': serializer.toJson<int>(version),
    };
  }

  Plan copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    DateTime? scheduledDate,
    String? scheduledTimeLocal,
    String? scheduledTimezone,
    DateTime? scheduledAtUtc,
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    String? priority,
    String? status,
    bool? reminderEnabled,
    Value<String?> reminderTimeLocal = const Value.absent(),
    Value<DateTime?> reminderAtUtc = const Value.absent(),
    int? postponedCount,
    Value<String?> motivationContextSnapshot = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    int? version,
  }) => Plan(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    description: description ?? this.description,
    scheduledDate: scheduledDate ?? this.scheduledDate,
    scheduledTimeLocal: scheduledTimeLocal ?? this.scheduledTimeLocal,
    scheduledTimezone: scheduledTimezone ?? this.scheduledTimezone,
    scheduledAtUtc: scheduledAtUtc ?? this.scheduledAtUtc,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    priority: priority ?? this.priority,
    status: status ?? this.status,
    reminderEnabled: reminderEnabled ?? this.reminderEnabled,
    reminderTimeLocal: reminderTimeLocal.present
        ? reminderTimeLocal.value
        : this.reminderTimeLocal,
    reminderAtUtc: reminderAtUtc.present
        ? reminderAtUtc.value
        : this.reminderAtUtc,
    postponedCount: postponedCount ?? this.postponedCount,
    motivationContextSnapshot: motivationContextSnapshot.present
        ? motivationContextSnapshot.value
        : this.motivationContextSnapshot,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    version: version ?? this.version,
  );
  Plan copyWithCompanion(PlansCompanion data) {
    return Plan(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      scheduledDate: data.scheduledDate.present
          ? data.scheduledDate.value
          : this.scheduledDate,
      scheduledTimeLocal: data.scheduledTimeLocal.present
          ? data.scheduledTimeLocal.value
          : this.scheduledTimeLocal,
      scheduledTimezone: data.scheduledTimezone.present
          ? data.scheduledTimezone.value
          : this.scheduledTimezone,
      scheduledAtUtc: data.scheduledAtUtc.present
          ? data.scheduledAtUtc.value
          : this.scheduledAtUtc,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      reminderEnabled: data.reminderEnabled.present
          ? data.reminderEnabled.value
          : this.reminderEnabled,
      reminderTimeLocal: data.reminderTimeLocal.present
          ? data.reminderTimeLocal.value
          : this.reminderTimeLocal,
      reminderAtUtc: data.reminderAtUtc.present
          ? data.reminderAtUtc.value
          : this.reminderAtUtc,
      postponedCount: data.postponedCount.present
          ? data.postponedCount.value
          : this.postponedCount,
      motivationContextSnapshot: data.motivationContextSnapshot.present
          ? data.motivationContextSnapshot.value
          : this.motivationContextSnapshot,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plan(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('scheduledTimeLocal: $scheduledTimeLocal, ')
          ..write('scheduledTimezone: $scheduledTimezone, ')
          ..write('scheduledAtUtc: $scheduledAtUtc, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('categoryId: $categoryId, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('reminderEnabled: $reminderEnabled, ')
          ..write('reminderTimeLocal: $reminderTimeLocal, ')
          ..write('reminderAtUtc: $reminderAtUtc, ')
          ..write('postponedCount: $postponedCount, ')
          ..write('motivationContextSnapshot: $motivationContextSnapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    title,
    description,
    scheduledDate,
    scheduledTimeLocal,
    scheduledTimezone,
    scheduledAtUtc,
    durationMinutes,
    categoryId,
    priority,
    status,
    reminderEnabled,
    reminderTimeLocal,
    reminderAtUtc,
    postponedCount,
    motivationContextSnapshot,
    createdAt,
    updatedAt,
    completedAt,
    deletedAt,
    version,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plan &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.scheduledDate == this.scheduledDate &&
          other.scheduledTimeLocal == this.scheduledTimeLocal &&
          other.scheduledTimezone == this.scheduledTimezone &&
          other.scheduledAtUtc == this.scheduledAtUtc &&
          other.durationMinutes == this.durationMinutes &&
          other.categoryId == this.categoryId &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.reminderEnabled == this.reminderEnabled &&
          other.reminderTimeLocal == this.reminderTimeLocal &&
          other.reminderAtUtc == this.reminderAtUtc &&
          other.postponedCount == this.postponedCount &&
          other.motivationContextSnapshot == this.motivationContextSnapshot &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.completedAt == this.completedAt &&
          other.deletedAt == this.deletedAt &&
          other.version == this.version);
}

class PlansCompanion extends UpdateCompanion<Plan> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> scheduledDate;
  final Value<String> scheduledTimeLocal;
  final Value<String> scheduledTimezone;
  final Value<DateTime> scheduledAtUtc;
  final Value<int?> durationMinutes;
  final Value<String?> categoryId;
  final Value<String> priority;
  final Value<String> status;
  final Value<bool> reminderEnabled;
  final Value<String?> reminderTimeLocal;
  final Value<DateTime?> reminderAtUtc;
  final Value<int> postponedCount;
  final Value<String?> motivationContextSnapshot;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> version;
  final Value<int> rowid;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.scheduledTimeLocal = const Value.absent(),
    this.scheduledTimezone = const Value.absent(),
    this.scheduledAtUtc = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.reminderEnabled = const Value.absent(),
    this.reminderTimeLocal = const Value.absent(),
    this.reminderAtUtc = const Value.absent(),
    this.postponedCount = const Value.absent(),
    this.motivationContextSnapshot = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlansCompanion.insert({
    required String id,
    required String userId,
    required String title,
    this.description = const Value.absent(),
    required DateTime scheduledDate,
    required String scheduledTimeLocal,
    this.scheduledTimezone = const Value.absent(),
    required DateTime scheduledAtUtc,
    this.durationMinutes = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.reminderEnabled = const Value.absent(),
    this.reminderTimeLocal = const Value.absent(),
    this.reminderAtUtc = const Value.absent(),
    this.postponedCount = const Value.absent(),
    this.motivationContextSnapshot = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.completedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title),
       scheduledDate = Value(scheduledDate),
       scheduledTimeLocal = Value(scheduledTimeLocal),
       scheduledAtUtc = Value(scheduledAtUtc),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Plan> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? scheduledDate,
    Expression<String>? scheduledTimeLocal,
    Expression<String>? scheduledTimezone,
    Expression<DateTime>? scheduledAtUtc,
    Expression<int>? durationMinutes,
    Expression<String>? categoryId,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<bool>? reminderEnabled,
    Expression<String>? reminderTimeLocal,
    Expression<DateTime>? reminderAtUtc,
    Expression<int>? postponedCount,
    Expression<String>? motivationContextSnapshot,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? version,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (scheduledDate != null) 'scheduled_date': scheduledDate,
      if (scheduledTimeLocal != null)
        'scheduled_time_local': scheduledTimeLocal,
      if (scheduledTimezone != null) 'scheduled_timezone': scheduledTimezone,
      if (scheduledAtUtc != null) 'scheduled_at_utc': scheduledAtUtc,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (categoryId != null) 'category_id': categoryId,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (reminderEnabled != null) 'reminder_enabled': reminderEnabled,
      if (reminderTimeLocal != null) 'reminder_time_local': reminderTimeLocal,
      if (reminderAtUtc != null) 'reminder_at_utc': reminderAtUtc,
      if (postponedCount != null) 'postponed_count': postponedCount,
      if (motivationContextSnapshot != null)
        'motivation_context_snapshot': motivationContextSnapshot,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (version != null) 'version': version,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlansCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? scheduledDate,
    Value<String>? scheduledTimeLocal,
    Value<String>? scheduledTimezone,
    Value<DateTime>? scheduledAtUtc,
    Value<int?>? durationMinutes,
    Value<String?>? categoryId,
    Value<String>? priority,
    Value<String>? status,
    Value<bool>? reminderEnabled,
    Value<String?>? reminderTimeLocal,
    Value<DateTime?>? reminderAtUtc,
    Value<int>? postponedCount,
    Value<String?>? motivationContextSnapshot,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? completedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? version,
    Value<int>? rowid,
  }) {
    return PlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      scheduledTimeLocal: scheduledTimeLocal ?? this.scheduledTimeLocal,
      scheduledTimezone: scheduledTimezone ?? this.scheduledTimezone,
      scheduledAtUtc: scheduledAtUtc ?? this.scheduledAtUtc,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      categoryId: categoryId ?? this.categoryId,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      reminderTimeLocal: reminderTimeLocal ?? this.reminderTimeLocal,
      reminderAtUtc: reminderAtUtc ?? this.reminderAtUtc,
      postponedCount: postponedCount ?? this.postponedCount,
      motivationContextSnapshot:
          motivationContextSnapshot ?? this.motivationContextSnapshot,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      version: version ?? this.version,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (scheduledDate.present) {
      map['scheduled_date'] = Variable<DateTime>(scheduledDate.value);
    }
    if (scheduledTimeLocal.present) {
      map['scheduled_time_local'] = Variable<String>(scheduledTimeLocal.value);
    }
    if (scheduledTimezone.present) {
      map['scheduled_timezone'] = Variable<String>(scheduledTimezone.value);
    }
    if (scheduledAtUtc.present) {
      map['scheduled_at_utc'] = Variable<DateTime>(scheduledAtUtc.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reminderEnabled.present) {
      map['reminder_enabled'] = Variable<bool>(reminderEnabled.value);
    }
    if (reminderTimeLocal.present) {
      map['reminder_time_local'] = Variable<String>(reminderTimeLocal.value);
    }
    if (reminderAtUtc.present) {
      map['reminder_at_utc'] = Variable<DateTime>(reminderAtUtc.value);
    }
    if (postponedCount.present) {
      map['postponed_count'] = Variable<int>(postponedCount.value);
    }
    if (motivationContextSnapshot.present) {
      map['motivation_context_snapshot'] = Variable<String>(
        motivationContextSnapshot.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('scheduledTimeLocal: $scheduledTimeLocal, ')
          ..write('scheduledTimezone: $scheduledTimezone, ')
          ..write('scheduledAtUtc: $scheduledAtUtc, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('categoryId: $categoryId, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('reminderEnabled: $reminderEnabled, ')
          ..write('reminderTimeLocal: $reminderTimeLocal, ')
          ..write('reminderAtUtc: $reminderAtUtc, ')
          ..write('postponedCount: $postponedCount, ')
          ..write('motivationContextSnapshot: $motivationContextSnapshot, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('version: $version, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanTagLinksTable extends PlanTagLinks
    with TableInfo<$PlanTagLinksTable, PlanTagLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanTagLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [planId, tagId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_tag_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanTagLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {planId, tagId};
  @override
  PlanTagLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanTagLink(
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlanTagLinksTable createAlias(String alias) {
    return $PlanTagLinksTable(attachedDatabase, alias);
  }
}

class PlanTagLink extends DataClass implements Insertable<PlanTagLink> {
  final String planId;
  final String tagId;
  final DateTime createdAt;
  const PlanTagLink({
    required this.planId,
    required this.tagId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['plan_id'] = Variable<String>(planId);
    map['tag_id'] = Variable<String>(tagId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlanTagLinksCompanion toCompanion(bool nullToAbsent) {
    return PlanTagLinksCompanion(
      planId: Value(planId),
      tagId: Value(tagId),
      createdAt: Value(createdAt),
    );
  }

  factory PlanTagLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanTagLink(
      planId: serializer.fromJson<String>(json['planId']),
      tagId: serializer.fromJson<String>(json['tagId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'planId': serializer.toJson<String>(planId),
      'tagId': serializer.toJson<String>(tagId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PlanTagLink copyWith({String? planId, String? tagId, DateTime? createdAt}) =>
      PlanTagLink(
        planId: planId ?? this.planId,
        tagId: tagId ?? this.tagId,
        createdAt: createdAt ?? this.createdAt,
      );
  PlanTagLink copyWithCompanion(PlanTagLinksCompanion data) {
    return PlanTagLink(
      planId: data.planId.present ? data.planId.value : this.planId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanTagLink(')
          ..write('planId: $planId, ')
          ..write('tagId: $tagId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(planId, tagId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanTagLink &&
          other.planId == this.planId &&
          other.tagId == this.tagId &&
          other.createdAt == this.createdAt);
}

class PlanTagLinksCompanion extends UpdateCompanion<PlanTagLink> {
  final Value<String> planId;
  final Value<String> tagId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PlanTagLinksCompanion({
    this.planId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanTagLinksCompanion.insert({
    required String planId,
    required String tagId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : planId = Value(planId),
       tagId = Value(tagId),
       createdAt = Value(createdAt);
  static Insertable<PlanTagLink> custom({
    Expression<String>? planId,
    Expression<String>? tagId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (planId != null) 'plan_id': planId,
      if (tagId != null) 'tag_id': tagId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanTagLinksCompanion copyWith({
    Value<String>? planId,
    Value<String>? tagId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PlanTagLinksCompanion(
      planId: planId ?? this.planId,
      tagId: tagId ?? this.tagId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanTagLinksCompanion(')
          ..write('planId: $planId, ')
          ..write('tagId: $tagId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanStatusHistoryTable extends PlanStatusHistory
    with TableInfo<$PlanStatusHistoryTable, PlanStatusHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanStatusHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromStatusMeta = const VerificationMeta(
    'fromStatus',
  );
  @override
  late final GeneratedColumn<String> fromStatus = GeneratedColumn<String>(
    'from_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toStatusMeta = const VerificationMeta(
    'toStatus',
  );
  @override
  late final GeneratedColumn<String> toStatus = GeneratedColumn<String>(
    'to_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _changeReasonMeta = const VerificationMeta(
    'changeReason',
  );
  @override
  late final GeneratedColumn<String> changeReason = GeneratedColumn<String>(
    'change_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _changedAtMeta = const VerificationMeta(
    'changedAt',
  );
  @override
  late final GeneratedColumn<DateTime> changedAt = GeneratedColumn<DateTime>(
    'changed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planId,
    userId,
    fromStatus,
    toStatus,
    changeReason,
    metadataJson,
    changedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_status_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanStatusHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('from_status')) {
      context.handle(
        _fromStatusMeta,
        fromStatus.isAcceptableOrUnknown(data['from_status']!, _fromStatusMeta),
      );
    }
    if (data.containsKey('to_status')) {
      context.handle(
        _toStatusMeta,
        toStatus.isAcceptableOrUnknown(data['to_status']!, _toStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_toStatusMeta);
    }
    if (data.containsKey('change_reason')) {
      context.handle(
        _changeReasonMeta,
        changeReason.isAcceptableOrUnknown(
          data['change_reason']!,
          _changeReasonMeta,
        ),
      );
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('changed_at')) {
      context.handle(
        _changedAtMeta,
        changedAt.isAcceptableOrUnknown(data['changed_at']!, _changedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_changedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanStatusHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanStatusHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      fromStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_status'],
      ),
      toStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_status'],
      )!,
      changeReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}change_reason'],
      ),
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      ),
      changedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}changed_at'],
      )!,
    );
  }

  @override
  $PlanStatusHistoryTable createAlias(String alias) {
    return $PlanStatusHistoryTable(attachedDatabase, alias);
  }
}

class PlanStatusHistoryData extends DataClass
    implements Insertable<PlanStatusHistoryData> {
  final String id;
  final String planId;
  final String userId;
  final String? fromStatus;
  final String toStatus;
  final String? changeReason;
  final String? metadataJson;
  final DateTime changedAt;
  const PlanStatusHistoryData({
    required this.id,
    required this.planId,
    required this.userId,
    this.fromStatus,
    required this.toStatus,
    this.changeReason,
    this.metadataJson,
    required this.changedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || fromStatus != null) {
      map['from_status'] = Variable<String>(fromStatus);
    }
    map['to_status'] = Variable<String>(toStatus);
    if (!nullToAbsent || changeReason != null) {
      map['change_reason'] = Variable<String>(changeReason);
    }
    if (!nullToAbsent || metadataJson != null) {
      map['metadata_json'] = Variable<String>(metadataJson);
    }
    map['changed_at'] = Variable<DateTime>(changedAt);
    return map;
  }

  PlanStatusHistoryCompanion toCompanion(bool nullToAbsent) {
    return PlanStatusHistoryCompanion(
      id: Value(id),
      planId: Value(planId),
      userId: Value(userId),
      fromStatus: fromStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(fromStatus),
      toStatus: Value(toStatus),
      changeReason: changeReason == null && nullToAbsent
          ? const Value.absent()
          : Value(changeReason),
      metadataJson: metadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataJson),
      changedAt: Value(changedAt),
    );
  }

  factory PlanStatusHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanStatusHistoryData(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      userId: serializer.fromJson<String>(json['userId']),
      fromStatus: serializer.fromJson<String?>(json['fromStatus']),
      toStatus: serializer.fromJson<String>(json['toStatus']),
      changeReason: serializer.fromJson<String?>(json['changeReason']),
      metadataJson: serializer.fromJson<String?>(json['metadataJson']),
      changedAt: serializer.fromJson<DateTime>(json['changedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'userId': serializer.toJson<String>(userId),
      'fromStatus': serializer.toJson<String?>(fromStatus),
      'toStatus': serializer.toJson<String>(toStatus),
      'changeReason': serializer.toJson<String?>(changeReason),
      'metadataJson': serializer.toJson<String?>(metadataJson),
      'changedAt': serializer.toJson<DateTime>(changedAt),
    };
  }

  PlanStatusHistoryData copyWith({
    String? id,
    String? planId,
    String? userId,
    Value<String?> fromStatus = const Value.absent(),
    String? toStatus,
    Value<String?> changeReason = const Value.absent(),
    Value<String?> metadataJson = const Value.absent(),
    DateTime? changedAt,
  }) => PlanStatusHistoryData(
    id: id ?? this.id,
    planId: planId ?? this.planId,
    userId: userId ?? this.userId,
    fromStatus: fromStatus.present ? fromStatus.value : this.fromStatus,
    toStatus: toStatus ?? this.toStatus,
    changeReason: changeReason.present ? changeReason.value : this.changeReason,
    metadataJson: metadataJson.present ? metadataJson.value : this.metadataJson,
    changedAt: changedAt ?? this.changedAt,
  );
  PlanStatusHistoryData copyWithCompanion(PlanStatusHistoryCompanion data) {
    return PlanStatusHistoryData(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      userId: data.userId.present ? data.userId.value : this.userId,
      fromStatus: data.fromStatus.present
          ? data.fromStatus.value
          : this.fromStatus,
      toStatus: data.toStatus.present ? data.toStatus.value : this.toStatus,
      changeReason: data.changeReason.present
          ? data.changeReason.value
          : this.changeReason,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      changedAt: data.changedAt.present ? data.changedAt.value : this.changedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanStatusHistoryData(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('userId: $userId, ')
          ..write('fromStatus: $fromStatus, ')
          ..write('toStatus: $toStatus, ')
          ..write('changeReason: $changeReason, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('changedAt: $changedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planId,
    userId,
    fromStatus,
    toStatus,
    changeReason,
    metadataJson,
    changedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanStatusHistoryData &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.userId == this.userId &&
          other.fromStatus == this.fromStatus &&
          other.toStatus == this.toStatus &&
          other.changeReason == this.changeReason &&
          other.metadataJson == this.metadataJson &&
          other.changedAt == this.changedAt);
}

class PlanStatusHistoryCompanion
    extends UpdateCompanion<PlanStatusHistoryData> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> userId;
  final Value<String?> fromStatus;
  final Value<String> toStatus;
  final Value<String?> changeReason;
  final Value<String?> metadataJson;
  final Value<DateTime> changedAt;
  final Value<int> rowid;
  const PlanStatusHistoryCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.userId = const Value.absent(),
    this.fromStatus = const Value.absent(),
    this.toStatus = const Value.absent(),
    this.changeReason = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.changedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanStatusHistoryCompanion.insert({
    required String id,
    required String planId,
    required String userId,
    this.fromStatus = const Value.absent(),
    required String toStatus,
    this.changeReason = const Value.absent(),
    this.metadataJson = const Value.absent(),
    required DateTime changedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       planId = Value(planId),
       userId = Value(userId),
       toStatus = Value(toStatus),
       changedAt = Value(changedAt);
  static Insertable<PlanStatusHistoryData> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? userId,
    Expression<String>? fromStatus,
    Expression<String>? toStatus,
    Expression<String>? changeReason,
    Expression<String>? metadataJson,
    Expression<DateTime>? changedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (userId != null) 'user_id': userId,
      if (fromStatus != null) 'from_status': fromStatus,
      if (toStatus != null) 'to_status': toStatus,
      if (changeReason != null) 'change_reason': changeReason,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (changedAt != null) 'changed_at': changedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanStatusHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? planId,
    Value<String>? userId,
    Value<String?>? fromStatus,
    Value<String>? toStatus,
    Value<String?>? changeReason,
    Value<String?>? metadataJson,
    Value<DateTime>? changedAt,
    Value<int>? rowid,
  }) {
    return PlanStatusHistoryCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      userId: userId ?? this.userId,
      fromStatus: fromStatus ?? this.fromStatus,
      toStatus: toStatus ?? this.toStatus,
      changeReason: changeReason ?? this.changeReason,
      metadataJson: metadataJson ?? this.metadataJson,
      changedAt: changedAt ?? this.changedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (fromStatus.present) {
      map['from_status'] = Variable<String>(fromStatus.value);
    }
    if (toStatus.present) {
      map['to_status'] = Variable<String>(toStatus.value);
    }
    if (changeReason.present) {
      map['change_reason'] = Variable<String>(changeReason.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (changedAt.present) {
      map['changed_at'] = Variable<DateTime>(changedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanStatusHistoryCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('userId: $userId, ')
          ..write('fromStatus: $fromStatus, ')
          ..write('toStatus: $toStatus, ')
          ..write('changeReason: $changeReason, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('changedAt: $changedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StreakSnapshotsTable extends StreakSnapshots
    with TableInfo<$StreakSnapshotsTable, StreakSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreakSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotDateMeta = const VerificationMeta(
    'snapshotDate',
  );
  @override
  late final GeneratedColumn<DateTime> snapshotDate = GeneratedColumn<DateTime>(
    'snapshot_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedCountMeta = const VerificationMeta(
    'completedCount',
  );
  @override
  late final GeneratedColumn<int> completedCount = GeneratedColumn<int>(
    'completed_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalCountMeta = const VerificationMeta(
    'totalCount',
  );
  @override
  late final GeneratedColumn<int> totalCount = GeneratedColumn<int>(
    'total_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    snapshotDate,
    completedCount,
    totalCount,
    currentStreak,
    longestStreak,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streak_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<StreakSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('snapshot_date')) {
      context.handle(
        _snapshotDateMeta,
        snapshotDate.isAcceptableOrUnknown(
          data['snapshot_date']!,
          _snapshotDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotDateMeta);
    }
    if (data.containsKey('completed_count')) {
      context.handle(
        _completedCountMeta,
        completedCount.isAcceptableOrUnknown(
          data['completed_count']!,
          _completedCountMeta,
        ),
      );
    }
    if (data.containsKey('total_count')) {
      context.handle(
        _totalCountMeta,
        totalCount.isAcceptableOrUnknown(data['total_count']!, _totalCountMeta),
      );
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StreakSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StreakSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      snapshotDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snapshot_date'],
      )!,
      completedCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_count'],
      )!,
      totalCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_count'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StreakSnapshotsTable createAlias(String alias) {
    return $StreakSnapshotsTable(attachedDatabase, alias);
  }
}

class StreakSnapshot extends DataClass implements Insertable<StreakSnapshot> {
  final String id;
  final String userId;
  final DateTime snapshotDate;
  final int completedCount;
  final int totalCount;
  final int currentStreak;
  final int longestStreak;
  final DateTime createdAt;
  const StreakSnapshot({
    required this.id,
    required this.userId,
    required this.snapshotDate,
    required this.completedCount,
    required this.totalCount,
    required this.currentStreak,
    required this.longestStreak,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['snapshot_date'] = Variable<DateTime>(snapshotDate);
    map['completed_count'] = Variable<int>(completedCount);
    map['total_count'] = Variable<int>(totalCount);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StreakSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return StreakSnapshotsCompanion(
      id: Value(id),
      userId: Value(userId),
      snapshotDate: Value(snapshotDate),
      completedCount: Value(completedCount),
      totalCount: Value(totalCount),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      createdAt: Value(createdAt),
    );
  }

  factory StreakSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StreakSnapshot(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      snapshotDate: serializer.fromJson<DateTime>(json['snapshotDate']),
      completedCount: serializer.fromJson<int>(json['completedCount']),
      totalCount: serializer.fromJson<int>(json['totalCount']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'snapshotDate': serializer.toJson<DateTime>(snapshotDate),
      'completedCount': serializer.toJson<int>(completedCount),
      'totalCount': serializer.toJson<int>(totalCount),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StreakSnapshot copyWith({
    String? id,
    String? userId,
    DateTime? snapshotDate,
    int? completedCount,
    int? totalCount,
    int? currentStreak,
    int? longestStreak,
    DateTime? createdAt,
  }) => StreakSnapshot(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    snapshotDate: snapshotDate ?? this.snapshotDate,
    completedCount: completedCount ?? this.completedCount,
    totalCount: totalCount ?? this.totalCount,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    createdAt: createdAt ?? this.createdAt,
  );
  StreakSnapshot copyWithCompanion(StreakSnapshotsCompanion data) {
    return StreakSnapshot(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      snapshotDate: data.snapshotDate.present
          ? data.snapshotDate.value
          : this.snapshotDate,
      completedCount: data.completedCount.present
          ? data.completedCount.value
          : this.completedCount,
      totalCount: data.totalCount.present
          ? data.totalCount.value
          : this.totalCount,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StreakSnapshot(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('snapshotDate: $snapshotDate, ')
          ..write('completedCount: $completedCount, ')
          ..write('totalCount: $totalCount, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    snapshotDate,
    completedCount,
    totalCount,
    currentStreak,
    longestStreak,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StreakSnapshot &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.snapshotDate == this.snapshotDate &&
          other.completedCount == this.completedCount &&
          other.totalCount == this.totalCount &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.createdAt == this.createdAt);
}

class StreakSnapshotsCompanion extends UpdateCompanion<StreakSnapshot> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> snapshotDate;
  final Value<int> completedCount;
  final Value<int> totalCount;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StreakSnapshotsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.snapshotDate = const Value.absent(),
    this.completedCount = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StreakSnapshotsCompanion.insert({
    required String id,
    required String userId,
    required DateTime snapshotDate,
    this.completedCount = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       snapshotDate = Value(snapshotDate),
       createdAt = Value(createdAt);
  static Insertable<StreakSnapshot> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? snapshotDate,
    Expression<int>? completedCount,
    Expression<int>? totalCount,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (snapshotDate != null) 'snapshot_date': snapshotDate,
      if (completedCount != null) 'completed_count': completedCount,
      if (totalCount != null) 'total_count': totalCount,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StreakSnapshotsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? snapshotDate,
    Value<int>? completedCount,
    Value<int>? totalCount,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return StreakSnapshotsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      snapshotDate: snapshotDate ?? this.snapshotDate,
      completedCount: completedCount ?? this.completedCount,
      totalCount: totalCount ?? this.totalCount,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (snapshotDate.present) {
      map['snapshot_date'] = Variable<DateTime>(snapshotDate.value);
    }
    if (completedCount.present) {
      map['completed_count'] = Variable<int>(completedCount.value);
    }
    if (totalCount.present) {
      map['total_count'] = Variable<int>(totalCount.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreakSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('snapshotDate: $snapshotDate, ')
          ..write('completedCount: $completedCount, ')
          ..write('totalCount: $totalCount, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoricalFiguresTable extends HistoricalFigures
    with TableInfo<$HistoricalFiguresTable, HistoricalFigure> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoricalFiguresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eraMeta = const VerificationMeta('era');
  @override
  late final GeneratedColumn<String> era = GeneratedColumn<String>(
    'era',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shortBioMeta = const VerificationMeta(
    'shortBio',
  );
  @override
  late final GeneratedColumn<String> shortBio = GeneratedColumn<String>(
    'short_bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    era,
    shortBio,
    imageUrl,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historical_figures';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoricalFigure> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('era')) {
      context.handle(
        _eraMeta,
        era.isAcceptableOrUnknown(data['era']!, _eraMeta),
      );
    }
    if (data.containsKey('short_bio')) {
      context.handle(
        _shortBioMeta,
        shortBio.isAcceptableOrUnknown(data['short_bio']!, _shortBioMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoricalFigure map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoricalFigure(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      era: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}era'],
      ),
      shortBio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_bio'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $HistoricalFiguresTable createAlias(String alias) {
    return $HistoricalFiguresTable(attachedDatabase, alias);
  }
}

class HistoricalFigure extends DataClass
    implements Insertable<HistoricalFigure> {
  final String id;
  final String name;
  final String? era;
  final String? shortBio;
  final String? imageUrl;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const HistoricalFigure({
    required this.id,
    required this.name,
    this.era,
    this.shortBio,
    this.imageUrl,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || era != null) {
      map['era'] = Variable<String>(era);
    }
    if (!nullToAbsent || shortBio != null) {
      map['short_bio'] = Variable<String>(shortBio);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HistoricalFiguresCompanion toCompanion(bool nullToAbsent) {
    return HistoricalFiguresCompanion(
      id: Value(id),
      name: Value(name),
      era: era == null && nullToAbsent ? const Value.absent() : Value(era),
      shortBio: shortBio == null && nullToAbsent
          ? const Value.absent()
          : Value(shortBio),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory HistoricalFigure.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoricalFigure(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      era: serializer.fromJson<String?>(json['era']),
      shortBio: serializer.fromJson<String?>(json['shortBio']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'era': serializer.toJson<String?>(era),
      'shortBio': serializer.toJson<String?>(shortBio),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  HistoricalFigure copyWith({
    String? id,
    String? name,
    Value<String?> era = const Value.absent(),
    Value<String?> shortBio = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => HistoricalFigure(
    id: id ?? this.id,
    name: name ?? this.name,
    era: era.present ? era.value : this.era,
    shortBio: shortBio.present ? shortBio.value : this.shortBio,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  HistoricalFigure copyWithCompanion(HistoricalFiguresCompanion data) {
    return HistoricalFigure(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      era: data.era.present ? data.era.value : this.era,
      shortBio: data.shortBio.present ? data.shortBio.value : this.shortBio,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalFigure(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('era: $era, ')
          ..write('shortBio: $shortBio, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    era,
    shortBio,
    imageUrl,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoricalFigure &&
          other.id == this.id &&
          other.name == this.name &&
          other.era == this.era &&
          other.shortBio == this.shortBio &&
          other.imageUrl == this.imageUrl &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HistoricalFiguresCompanion extends UpdateCompanion<HistoricalFigure> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> era;
  final Value<String?> shortBio;
  final Value<String?> imageUrl;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const HistoricalFiguresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.era = const Value.absent(),
    this.shortBio = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistoricalFiguresCompanion.insert({
    required String id,
    required String name,
    this.era = const Value.absent(),
    this.shortBio = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HistoricalFigure> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? era,
    Expression<String>? shortBio,
    Expression<String>? imageUrl,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (era != null) 'era': era,
      if (shortBio != null) 'short_bio': shortBio,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistoricalFiguresCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? era,
    Value<String?>? shortBio,
    Value<String?>? imageUrl,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return HistoricalFiguresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      era: era ?? this.era,
      shortBio: shortBio ?? this.shortBio,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (era.present) {
      map['era'] = Variable<String>(era.value);
    }
    if (shortBio.present) {
      map['short_bio'] = Variable<String>(shortBio.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalFiguresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('era: $era, ')
          ..write('shortBio: $shortBio, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FigureDomainsTable extends FigureDomains
    with TableInfo<$FigureDomainsTable, FigureDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FigureDomainsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'figure_domains';
  @override
  VerificationContext validateIntegrity(
    Insertable<FigureDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FigureDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FigureDomain(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FigureDomainsTable createAlias(String alias) {
    return $FigureDomainsTable(attachedDatabase, alias);
  }
}

class FigureDomain extends DataClass implements Insertable<FigureDomain> {
  final String id;
  final String name;
  final DateTime createdAt;
  const FigureDomain({
    required this.id,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FigureDomainsCompanion toCompanion(bool nullToAbsent) {
    return FigureDomainsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory FigureDomain.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FigureDomain(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FigureDomain copyWith({String? id, String? name, DateTime? createdAt}) =>
      FigureDomain(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  FigureDomain copyWithCompanion(FigureDomainsCompanion data) {
    return FigureDomain(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FigureDomain(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FigureDomain &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class FigureDomainsCompanion extends UpdateCompanion<FigureDomain> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FigureDomainsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FigureDomainsCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<FigureDomain> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FigureDomainsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FigureDomainsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FigureDomainsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoricalFigureDomainsTable extends HistoricalFigureDomains
    with TableInfo<$HistoricalFigureDomainsTable, HistoricalFigureDomain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoricalFigureDomainsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _figureIdMeta = const VerificationMeta(
    'figureId',
  );
  @override
  late final GeneratedColumn<String> figureId = GeneratedColumn<String>(
    'figure_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domainIdMeta = const VerificationMeta(
    'domainId',
  );
  @override
  late final GeneratedColumn<String> domainId = GeneratedColumn<String>(
    'domain_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [figureId, domainId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historical_figure_domains';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoricalFigureDomain> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('figure_id')) {
      context.handle(
        _figureIdMeta,
        figureId.isAcceptableOrUnknown(data['figure_id']!, _figureIdMeta),
      );
    } else if (isInserting) {
      context.missing(_figureIdMeta);
    }
    if (data.containsKey('domain_id')) {
      context.handle(
        _domainIdMeta,
        domainId.isAcceptableOrUnknown(data['domain_id']!, _domainIdMeta),
      );
    } else if (isInserting) {
      context.missing(_domainIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {figureId, domainId};
  @override
  HistoricalFigureDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoricalFigureDomain(
      figureId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}figure_id'],
      )!,
      domainId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domain_id'],
      )!,
    );
  }

  @override
  $HistoricalFigureDomainsTable createAlias(String alias) {
    return $HistoricalFigureDomainsTable(attachedDatabase, alias);
  }
}

class HistoricalFigureDomain extends DataClass
    implements Insertable<HistoricalFigureDomain> {
  final String figureId;
  final String domainId;
  const HistoricalFigureDomain({
    required this.figureId,
    required this.domainId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['figure_id'] = Variable<String>(figureId);
    map['domain_id'] = Variable<String>(domainId);
    return map;
  }

  HistoricalFigureDomainsCompanion toCompanion(bool nullToAbsent) {
    return HistoricalFigureDomainsCompanion(
      figureId: Value(figureId),
      domainId: Value(domainId),
    );
  }

  factory HistoricalFigureDomain.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoricalFigureDomain(
      figureId: serializer.fromJson<String>(json['figureId']),
      domainId: serializer.fromJson<String>(json['domainId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'figureId': serializer.toJson<String>(figureId),
      'domainId': serializer.toJson<String>(domainId),
    };
  }

  HistoricalFigureDomain copyWith({String? figureId, String? domainId}) =>
      HistoricalFigureDomain(
        figureId: figureId ?? this.figureId,
        domainId: domainId ?? this.domainId,
      );
  HistoricalFigureDomain copyWithCompanion(
    HistoricalFigureDomainsCompanion data,
  ) {
    return HistoricalFigureDomain(
      figureId: data.figureId.present ? data.figureId.value : this.figureId,
      domainId: data.domainId.present ? data.domainId.value : this.domainId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalFigureDomain(')
          ..write('figureId: $figureId, ')
          ..write('domainId: $domainId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(figureId, domainId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoricalFigureDomain &&
          other.figureId == this.figureId &&
          other.domainId == this.domainId);
}

class HistoricalFigureDomainsCompanion
    extends UpdateCompanion<HistoricalFigureDomain> {
  final Value<String> figureId;
  final Value<String> domainId;
  final Value<int> rowid;
  const HistoricalFigureDomainsCompanion({
    this.figureId = const Value.absent(),
    this.domainId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistoricalFigureDomainsCompanion.insert({
    required String figureId,
    required String domainId,
    this.rowid = const Value.absent(),
  }) : figureId = Value(figureId),
       domainId = Value(domainId);
  static Insertable<HistoricalFigureDomain> custom({
    Expression<String>? figureId,
    Expression<String>? domainId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (figureId != null) 'figure_id': figureId,
      if (domainId != null) 'domain_id': domainId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistoricalFigureDomainsCompanion copyWith({
    Value<String>? figureId,
    Value<String>? domainId,
    Value<int>? rowid,
  }) {
    return HistoricalFigureDomainsCompanion(
      figureId: figureId ?? this.figureId,
      domainId: domainId ?? this.domainId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (figureId.present) {
      map['figure_id'] = Variable<String>(figureId.value);
    }
    if (domainId.present) {
      map['domain_id'] = Variable<String>(domainId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalFigureDomainsCompanion(')
          ..write('figureId: $figureId, ')
          ..write('domainId: $domainId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuoteSourcesTable extends QuoteSources
    with TableInfo<$QuoteSourcesTable, QuoteSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuoteSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('book'),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTrustedMeta = const VerificationMeta(
    'isTrusted',
  );
  @override
  late final GeneratedColumn<bool> isTrusted = GeneratedColumn<bool>(
    'is_trusted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trusted" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sourceType,
    url,
    isTrusted,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quote_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuoteSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('is_trusted')) {
      context.handle(
        _isTrustedMeta,
        isTrusted.isAcceptableOrUnknown(data['is_trusted']!, _isTrustedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuoteSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuoteSource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      isTrusted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_trusted'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $QuoteSourcesTable createAlias(String alias) {
    return $QuoteSourcesTable(attachedDatabase, alias);
  }
}

class QuoteSource extends DataClass implements Insertable<QuoteSource> {
  final String id;
  final String name;
  final String sourceType;
  final String? url;
  final bool isTrusted;
  final DateTime createdAt;
  const QuoteSource({
    required this.id,
    required this.name,
    required this.sourceType,
    this.url,
    required this.isTrusted,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['is_trusted'] = Variable<bool>(isTrusted);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  QuoteSourcesCompanion toCompanion(bool nullToAbsent) {
    return QuoteSourcesCompanion(
      id: Value(id),
      name: Value(name),
      sourceType: Value(sourceType),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      isTrusted: Value(isTrusted),
      createdAt: Value(createdAt),
    );
  }

  factory QuoteSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuoteSource(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      url: serializer.fromJson<String?>(json['url']),
      isTrusted: serializer.fromJson<bool>(json['isTrusted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sourceType': serializer.toJson<String>(sourceType),
      'url': serializer.toJson<String?>(url),
      'isTrusted': serializer.toJson<bool>(isTrusted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  QuoteSource copyWith({
    String? id,
    String? name,
    String? sourceType,
    Value<String?> url = const Value.absent(),
    bool? isTrusted,
    DateTime? createdAt,
  }) => QuoteSource(
    id: id ?? this.id,
    name: name ?? this.name,
    sourceType: sourceType ?? this.sourceType,
    url: url.present ? url.value : this.url,
    isTrusted: isTrusted ?? this.isTrusted,
    createdAt: createdAt ?? this.createdAt,
  );
  QuoteSource copyWithCompanion(QuoteSourcesCompanion data) {
    return QuoteSource(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      url: data.url.present ? data.url.value : this.url,
      isTrusted: data.isTrusted.present ? data.isTrusted.value : this.isTrusted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuoteSource(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, sourceType, url, isTrusted, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteSource &&
          other.id == this.id &&
          other.name == this.name &&
          other.sourceType == this.sourceType &&
          other.url == this.url &&
          other.isTrusted == this.isTrusted &&
          other.createdAt == this.createdAt);
}

class QuoteSourcesCompanion extends UpdateCompanion<QuoteSource> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sourceType;
  final Value<String?> url;
  final Value<bool> isTrusted;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const QuoteSourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.url = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuoteSourcesCompanion.insert({
    required String id,
    required String name,
    this.sourceType = const Value.absent(),
    this.url = const Value.absent(),
    this.isTrusted = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<QuoteSource> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sourceType,
    Expression<String>? url,
    Expression<bool>? isTrusted,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sourceType != null) 'source_type': sourceType,
      if (url != null) 'url': url,
      if (isTrusted != null) 'is_trusted': isTrusted,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuoteSourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? sourceType,
    Value<String?>? url,
    Value<bool>? isTrusted,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return QuoteSourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sourceType: sourceType ?? this.sourceType,
      url: url ?? this.url,
      isTrusted: isTrusted ?? this.isTrusted,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (isTrusted.present) {
      map['is_trusted'] = Variable<bool>(isTrusted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteSourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuotesTable extends Quotes with TableInfo<$QuotesTable, Quote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteTextMeta = const VerificationMeta(
    'quoteText',
  );
  @override
  late final GeneratedColumn<String> quoteText = GeneratedColumn<String>(
    'quote_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _figureIdMeta = const VerificationMeta(
    'figureId',
  );
  @override
  late final GeneratedColumn<String> figureId = GeneratedColumn<String>(
    'figure_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('tr'),
  );
  static const VerificationMeta _trustStatusMeta = const VerificationMeta(
    'trustStatus',
  );
  @override
  late final GeneratedColumn<String> trustStatus = GeneratedColumn<String>(
    'trust_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('attributed'),
  );
  static const VerificationMeta _attributionConfidenceMeta =
      const VerificationMeta('attributionConfidence');
  @override
  late final GeneratedColumn<double> attributionConfidence =
      GeneratedColumn<double>(
        'attribution_confidence',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0.8),
      );
  static const VerificationMeta _toneMeta = const VerificationMeta('tone');
  @override
  late final GeneratedColumn<String> tone = GeneratedColumn<String>(
    'tone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('direct'),
  );
  static const VerificationMeta _usageFrequencyCapMeta = const VerificationMeta(
    'usageFrequencyCap',
  );
  @override
  late final GeneratedColumn<int> usageFrequencyCap = GeneratedColumn<int>(
    'usage_frequency_cap',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _sensitivityNotesMeta = const VerificationMeta(
    'sensitivityNotes',
  );
  @override
  late final GeneratedColumn<String> sensitivityNotes = GeneratedColumn<String>(
    'sensitivity_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    quoteText,
    figureId,
    sourceId,
    languageCode,
    trustStatus,
    attributionConfidence,
    tone,
    usageFrequencyCap,
    sensitivityNotes,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Quote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('quote_text')) {
      context.handle(
        _quoteTextMeta,
        quoteText.isAcceptableOrUnknown(data['quote_text']!, _quoteTextMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteTextMeta);
    }
    if (data.containsKey('figure_id')) {
      context.handle(
        _figureIdMeta,
        figureId.isAcceptableOrUnknown(data['figure_id']!, _figureIdMeta),
      );
    } else if (isInserting) {
      context.missing(_figureIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    }
    if (data.containsKey('trust_status')) {
      context.handle(
        _trustStatusMeta,
        trustStatus.isAcceptableOrUnknown(
          data['trust_status']!,
          _trustStatusMeta,
        ),
      );
    }
    if (data.containsKey('attribution_confidence')) {
      context.handle(
        _attributionConfidenceMeta,
        attributionConfidence.isAcceptableOrUnknown(
          data['attribution_confidence']!,
          _attributionConfidenceMeta,
        ),
      );
    }
    if (data.containsKey('tone')) {
      context.handle(
        _toneMeta,
        tone.isAcceptableOrUnknown(data['tone']!, _toneMeta),
      );
    }
    if (data.containsKey('usage_frequency_cap')) {
      context.handle(
        _usageFrequencyCapMeta,
        usageFrequencyCap.isAcceptableOrUnknown(
          data['usage_frequency_cap']!,
          _usageFrequencyCapMeta,
        ),
      );
    }
    if (data.containsKey('sensitivity_notes')) {
      context.handle(
        _sensitivityNotesMeta,
        sensitivityNotes.isAcceptableOrUnknown(
          data['sensitivity_notes']!,
          _sensitivityNotesMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quote(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      quoteText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_text'],
      )!,
      figureId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}figure_id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      trustStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trust_status'],
      )!,
      attributionConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}attribution_confidence'],
      )!,
      tone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tone'],
      )!,
      usageFrequencyCap: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_frequency_cap'],
      )!,
      sensitivityNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sensitivity_notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuotesTable createAlias(String alias) {
    return $QuotesTable(attachedDatabase, alias);
  }
}

class Quote extends DataClass implements Insertable<Quote> {
  final String id;
  final String quoteText;
  final String figureId;
  final String? sourceId;
  final String languageCode;

  /// Trust level: verified, attributed, uncertain, fake
  final String trustStatus;

  /// Attribution confidence 0.0 - 1.0
  final double attributionConfidence;

  /// Tone label: calm, direct, intense, compassionate, strategic
  final String tone;

  /// Max times this quote can be shown before cooldown
  final int usageFrequencyCap;

  /// Sensitivity notes (e.g. "avoid after repeated failure")
  final String? sensitivityNotes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Quote({
    required this.id,
    required this.quoteText,
    required this.figureId,
    this.sourceId,
    required this.languageCode,
    required this.trustStatus,
    required this.attributionConfidence,
    required this.tone,
    required this.usageFrequencyCap,
    this.sensitivityNotes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['quote_text'] = Variable<String>(quoteText);
    map['figure_id'] = Variable<String>(figureId);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    map['language_code'] = Variable<String>(languageCode);
    map['trust_status'] = Variable<String>(trustStatus);
    map['attribution_confidence'] = Variable<double>(attributionConfidence);
    map['tone'] = Variable<String>(tone);
    map['usage_frequency_cap'] = Variable<int>(usageFrequencyCap);
    if (!nullToAbsent || sensitivityNotes != null) {
      map['sensitivity_notes'] = Variable<String>(sensitivityNotes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuotesCompanion toCompanion(bool nullToAbsent) {
    return QuotesCompanion(
      id: Value(id),
      quoteText: Value(quoteText),
      figureId: Value(figureId),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      languageCode: Value(languageCode),
      trustStatus: Value(trustStatus),
      attributionConfidence: Value(attributionConfidence),
      tone: Value(tone),
      usageFrequencyCap: Value(usageFrequencyCap),
      sensitivityNotes: sensitivityNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(sensitivityNotes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Quote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quote(
      id: serializer.fromJson<String>(json['id']),
      quoteText: serializer.fromJson<String>(json['quoteText']),
      figureId: serializer.fromJson<String>(json['figureId']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      trustStatus: serializer.fromJson<String>(json['trustStatus']),
      attributionConfidence: serializer.fromJson<double>(
        json['attributionConfidence'],
      ),
      tone: serializer.fromJson<String>(json['tone']),
      usageFrequencyCap: serializer.fromJson<int>(json['usageFrequencyCap']),
      sensitivityNotes: serializer.fromJson<String?>(json['sensitivityNotes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'quoteText': serializer.toJson<String>(quoteText),
      'figureId': serializer.toJson<String>(figureId),
      'sourceId': serializer.toJson<String?>(sourceId),
      'languageCode': serializer.toJson<String>(languageCode),
      'trustStatus': serializer.toJson<String>(trustStatus),
      'attributionConfidence': serializer.toJson<double>(attributionConfidence),
      'tone': serializer.toJson<String>(tone),
      'usageFrequencyCap': serializer.toJson<int>(usageFrequencyCap),
      'sensitivityNotes': serializer.toJson<String?>(sensitivityNotes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Quote copyWith({
    String? id,
    String? quoteText,
    String? figureId,
    Value<String?> sourceId = const Value.absent(),
    String? languageCode,
    String? trustStatus,
    double? attributionConfidence,
    String? tone,
    int? usageFrequencyCap,
    Value<String?> sensitivityNotes = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Quote(
    id: id ?? this.id,
    quoteText: quoteText ?? this.quoteText,
    figureId: figureId ?? this.figureId,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    languageCode: languageCode ?? this.languageCode,
    trustStatus: trustStatus ?? this.trustStatus,
    attributionConfidence: attributionConfidence ?? this.attributionConfidence,
    tone: tone ?? this.tone,
    usageFrequencyCap: usageFrequencyCap ?? this.usageFrequencyCap,
    sensitivityNotes: sensitivityNotes.present
        ? sensitivityNotes.value
        : this.sensitivityNotes,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Quote copyWithCompanion(QuotesCompanion data) {
    return Quote(
      id: data.id.present ? data.id.value : this.id,
      quoteText: data.quoteText.present ? data.quoteText.value : this.quoteText,
      figureId: data.figureId.present ? data.figureId.value : this.figureId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      trustStatus: data.trustStatus.present
          ? data.trustStatus.value
          : this.trustStatus,
      attributionConfidence: data.attributionConfidence.present
          ? data.attributionConfidence.value
          : this.attributionConfidence,
      tone: data.tone.present ? data.tone.value : this.tone,
      usageFrequencyCap: data.usageFrequencyCap.present
          ? data.usageFrequencyCap.value
          : this.usageFrequencyCap,
      sensitivityNotes: data.sensitivityNotes.present
          ? data.sensitivityNotes.value
          : this.sensitivityNotes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quote(')
          ..write('id: $id, ')
          ..write('quoteText: $quoteText, ')
          ..write('figureId: $figureId, ')
          ..write('sourceId: $sourceId, ')
          ..write('languageCode: $languageCode, ')
          ..write('trustStatus: $trustStatus, ')
          ..write('attributionConfidence: $attributionConfidence, ')
          ..write('tone: $tone, ')
          ..write('usageFrequencyCap: $usageFrequencyCap, ')
          ..write('sensitivityNotes: $sensitivityNotes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    quoteText,
    figureId,
    sourceId,
    languageCode,
    trustStatus,
    attributionConfidence,
    tone,
    usageFrequencyCap,
    sensitivityNotes,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quote &&
          other.id == this.id &&
          other.quoteText == this.quoteText &&
          other.figureId == this.figureId &&
          other.sourceId == this.sourceId &&
          other.languageCode == this.languageCode &&
          other.trustStatus == this.trustStatus &&
          other.attributionConfidence == this.attributionConfidence &&
          other.tone == this.tone &&
          other.usageFrequencyCap == this.usageFrequencyCap &&
          other.sensitivityNotes == this.sensitivityNotes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuotesCompanion extends UpdateCompanion<Quote> {
  final Value<String> id;
  final Value<String> quoteText;
  final Value<String> figureId;
  final Value<String?> sourceId;
  final Value<String> languageCode;
  final Value<String> trustStatus;
  final Value<double> attributionConfidence;
  final Value<String> tone;
  final Value<int> usageFrequencyCap;
  final Value<String?> sensitivityNotes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const QuotesCompanion({
    this.id = const Value.absent(),
    this.quoteText = const Value.absent(),
    this.figureId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.trustStatus = const Value.absent(),
    this.attributionConfidence = const Value.absent(),
    this.tone = const Value.absent(),
    this.usageFrequencyCap = const Value.absent(),
    this.sensitivityNotes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuotesCompanion.insert({
    required String id,
    required String quoteText,
    required String figureId,
    this.sourceId = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.trustStatus = const Value.absent(),
    this.attributionConfidence = const Value.absent(),
    this.tone = const Value.absent(),
    this.usageFrequencyCap = const Value.absent(),
    this.sensitivityNotes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       quoteText = Value(quoteText),
       figureId = Value(figureId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Quote> custom({
    Expression<String>? id,
    Expression<String>? quoteText,
    Expression<String>? figureId,
    Expression<String>? sourceId,
    Expression<String>? languageCode,
    Expression<String>? trustStatus,
    Expression<double>? attributionConfidence,
    Expression<String>? tone,
    Expression<int>? usageFrequencyCap,
    Expression<String>? sensitivityNotes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quoteText != null) 'quote_text': quoteText,
      if (figureId != null) 'figure_id': figureId,
      if (sourceId != null) 'source_id': sourceId,
      if (languageCode != null) 'language_code': languageCode,
      if (trustStatus != null) 'trust_status': trustStatus,
      if (attributionConfidence != null)
        'attribution_confidence': attributionConfidence,
      if (tone != null) 'tone': tone,
      if (usageFrequencyCap != null) 'usage_frequency_cap': usageFrequencyCap,
      if (sensitivityNotes != null) 'sensitivity_notes': sensitivityNotes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuotesCompanion copyWith({
    Value<String>? id,
    Value<String>? quoteText,
    Value<String>? figureId,
    Value<String?>? sourceId,
    Value<String>? languageCode,
    Value<String>? trustStatus,
    Value<double>? attributionConfidence,
    Value<String>? tone,
    Value<int>? usageFrequencyCap,
    Value<String?>? sensitivityNotes,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return QuotesCompanion(
      id: id ?? this.id,
      quoteText: quoteText ?? this.quoteText,
      figureId: figureId ?? this.figureId,
      sourceId: sourceId ?? this.sourceId,
      languageCode: languageCode ?? this.languageCode,
      trustStatus: trustStatus ?? this.trustStatus,
      attributionConfidence:
          attributionConfidence ?? this.attributionConfidence,
      tone: tone ?? this.tone,
      usageFrequencyCap: usageFrequencyCap ?? this.usageFrequencyCap,
      sensitivityNotes: sensitivityNotes ?? this.sensitivityNotes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (quoteText.present) {
      map['quote_text'] = Variable<String>(quoteText.value);
    }
    if (figureId.present) {
      map['figure_id'] = Variable<String>(figureId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (trustStatus.present) {
      map['trust_status'] = Variable<String>(trustStatus.value);
    }
    if (attributionConfidence.present) {
      map['attribution_confidence'] = Variable<double>(
        attributionConfidence.value,
      );
    }
    if (tone.present) {
      map['tone'] = Variable<String>(tone.value);
    }
    if (usageFrequencyCap.present) {
      map['usage_frequency_cap'] = Variable<int>(usageFrequencyCap.value);
    }
    if (sensitivityNotes.present) {
      map['sensitivity_notes'] = Variable<String>(sensitivityNotes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotesCompanion(')
          ..write('id: $id, ')
          ..write('quoteText: $quoteText, ')
          ..write('figureId: $figureId, ')
          ..write('sourceId: $sourceId, ')
          ..write('languageCode: $languageCode, ')
          ..write('trustStatus: $trustStatus, ')
          ..write('attributionConfidence: $attributionConfidence, ')
          ..write('tone: $tone, ')
          ..write('usageFrequencyCap: $usageFrequencyCap, ')
          ..write('sensitivityNotes: $sensitivityNotes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuoteTagsTable extends QuoteTags
    with TableInfo<$QuoteTagsTable, QuoteTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuoteTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, slug, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quote_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuoteTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuoteTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuoteTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $QuoteTagsTable createAlias(String alias) {
    return $QuoteTagsTable(attachedDatabase, alias);
  }
}

class QuoteTag extends DataClass implements Insertable<QuoteTag> {
  final String id;
  final String slug;
  final String name;
  final DateTime createdAt;
  const QuoteTag({
    required this.id,
    required this.slug,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  QuoteTagsCompanion toCompanion(bool nullToAbsent) {
    return QuoteTagsCompanion(
      id: Value(id),
      slug: Value(slug),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory QuoteTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuoteTag(
      id: serializer.fromJson<String>(json['id']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  QuoteTag copyWith({
    String? id,
    String? slug,
    String? name,
    DateTime? createdAt,
  }) => QuoteTag(
    id: id ?? this.id,
    slug: slug ?? this.slug,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  QuoteTag copyWithCompanion(QuoteTagsCompanion data) {
    return QuoteTag(
      id: data.id.present ? data.id.value : this.id,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuoteTag(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, slug, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteTag &&
          other.id == this.id &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class QuoteTagsCompanion extends UpdateCompanion<QuoteTag> {
  final Value<String> id;
  final Value<String> slug;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const QuoteTagsCompanion({
    this.id = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuoteTagsCompanion.insert({
    required String id,
    required String slug,
    required String name,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       slug = Value(slug),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<QuoteTag> custom({
    Expression<String>? id,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuoteTagsCompanion copyWith({
    Value<String>? id,
    Value<String>? slug,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return QuoteTagsCompanion(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteTagsCompanion(')
          ..write('id: $id, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuoteTagLinksTable extends QuoteTagLinks
    with TableInfo<$QuoteTagLinksTable, QuoteTagLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuoteTagLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _quoteIdMeta = const VerificationMeta(
    'quoteId',
  );
  @override
  late final GeneratedColumn<String> quoteId = GeneratedColumn<String>(
    'quote_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relevanceWeightMeta = const VerificationMeta(
    'relevanceWeight',
  );
  @override
  late final GeneratedColumn<double> relevanceWeight = GeneratedColumn<double>(
    'relevance_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [quoteId, tagId, relevanceWeight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quote_tag_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuoteTagLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quote_id')) {
      context.handle(
        _quoteIdMeta,
        quoteId.isAcceptableOrUnknown(data['quote_id']!, _quoteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('relevance_weight')) {
      context.handle(
        _relevanceWeightMeta,
        relevanceWeight.isAcceptableOrUnknown(
          data['relevance_weight']!,
          _relevanceWeightMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {quoteId, tagId};
  @override
  QuoteTagLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuoteTagLink(
      quoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
      relevanceWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}relevance_weight'],
      )!,
    );
  }

  @override
  $QuoteTagLinksTable createAlias(String alias) {
    return $QuoteTagLinksTable(attachedDatabase, alias);
  }
}

class QuoteTagLink extends DataClass implements Insertable<QuoteTagLink> {
  final String quoteId;
  final String tagId;
  final double relevanceWeight;
  const QuoteTagLink({
    required this.quoteId,
    required this.tagId,
    required this.relevanceWeight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['quote_id'] = Variable<String>(quoteId);
    map['tag_id'] = Variable<String>(tagId);
    map['relevance_weight'] = Variable<double>(relevanceWeight);
    return map;
  }

  QuoteTagLinksCompanion toCompanion(bool nullToAbsent) {
    return QuoteTagLinksCompanion(
      quoteId: Value(quoteId),
      tagId: Value(tagId),
      relevanceWeight: Value(relevanceWeight),
    );
  }

  factory QuoteTagLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuoteTagLink(
      quoteId: serializer.fromJson<String>(json['quoteId']),
      tagId: serializer.fromJson<String>(json['tagId']),
      relevanceWeight: serializer.fromJson<double>(json['relevanceWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'quoteId': serializer.toJson<String>(quoteId),
      'tagId': serializer.toJson<String>(tagId),
      'relevanceWeight': serializer.toJson<double>(relevanceWeight),
    };
  }

  QuoteTagLink copyWith({
    String? quoteId,
    String? tagId,
    double? relevanceWeight,
  }) => QuoteTagLink(
    quoteId: quoteId ?? this.quoteId,
    tagId: tagId ?? this.tagId,
    relevanceWeight: relevanceWeight ?? this.relevanceWeight,
  );
  QuoteTagLink copyWithCompanion(QuoteTagLinksCompanion data) {
    return QuoteTagLink(
      quoteId: data.quoteId.present ? data.quoteId.value : this.quoteId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      relevanceWeight: data.relevanceWeight.present
          ? data.relevanceWeight.value
          : this.relevanceWeight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuoteTagLink(')
          ..write('quoteId: $quoteId, ')
          ..write('tagId: $tagId, ')
          ..write('relevanceWeight: $relevanceWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(quoteId, tagId, relevanceWeight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteTagLink &&
          other.quoteId == this.quoteId &&
          other.tagId == this.tagId &&
          other.relevanceWeight == this.relevanceWeight);
}

class QuoteTagLinksCompanion extends UpdateCompanion<QuoteTagLink> {
  final Value<String> quoteId;
  final Value<String> tagId;
  final Value<double> relevanceWeight;
  final Value<int> rowid;
  const QuoteTagLinksCompanion({
    this.quoteId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.relevanceWeight = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuoteTagLinksCompanion.insert({
    required String quoteId,
    required String tagId,
    this.relevanceWeight = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : quoteId = Value(quoteId),
       tagId = Value(tagId);
  static Insertable<QuoteTagLink> custom({
    Expression<String>? quoteId,
    Expression<String>? tagId,
    Expression<double>? relevanceWeight,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (quoteId != null) 'quote_id': quoteId,
      if (tagId != null) 'tag_id': tagId,
      if (relevanceWeight != null) 'relevance_weight': relevanceWeight,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuoteTagLinksCompanion copyWith({
    Value<String>? quoteId,
    Value<String>? tagId,
    Value<double>? relevanceWeight,
    Value<int>? rowid,
  }) {
    return QuoteTagLinksCompanion(
      quoteId: quoteId ?? this.quoteId,
      tagId: tagId ?? this.tagId,
      relevanceWeight: relevanceWeight ?? this.relevanceWeight,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (quoteId.present) {
      map['quote_id'] = Variable<String>(quoteId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (relevanceWeight.present) {
      map['relevance_weight'] = Variable<double>(relevanceWeight.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteTagLinksCompanion(')
          ..write('quoteId: $quoteId, ')
          ..write('tagId: $tagId, ')
          ..write('relevanceWeight: $relevanceWeight, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WisdomRuleWeightsTable extends WisdomRuleWeights
    with TableInfo<$WisdomRuleWeightsTable, WisdomRuleWeight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WisdomRuleWeightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dimensionKeyMeta = const VerificationMeta(
    'dimensionKey',
  );
  @override
  late final GeneratedColumn<String> dimensionKey = GeneratedColumn<String>(
    'dimension_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dimensionKey,
    weight,
    description,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wisdom_rule_weights';
  @override
  VerificationContext validateIntegrity(
    Insertable<WisdomRuleWeight> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dimension_key')) {
      context.handle(
        _dimensionKeyMeta,
        dimensionKey.isAcceptableOrUnknown(
          data['dimension_key']!,
          _dimensionKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dimensionKeyMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WisdomRuleWeight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WisdomRuleWeight(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dimensionKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dimension_key'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WisdomRuleWeightsTable createAlias(String alias) {
    return $WisdomRuleWeightsTable(attachedDatabase, alias);
  }
}

class WisdomRuleWeight extends DataClass
    implements Insertable<WisdomRuleWeight> {
  final String id;
  final String dimensionKey;
  final double weight;
  final String? description;
  final DateTime updatedAt;
  const WisdomRuleWeight({
    required this.id,
    required this.dimensionKey,
    required this.weight,
    this.description,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dimension_key'] = Variable<String>(dimensionKey);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WisdomRuleWeightsCompanion toCompanion(bool nullToAbsent) {
    return WisdomRuleWeightsCompanion(
      id: Value(id),
      dimensionKey: Value(dimensionKey),
      weight: Value(weight),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      updatedAt: Value(updatedAt),
    );
  }

  factory WisdomRuleWeight.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WisdomRuleWeight(
      id: serializer.fromJson<String>(json['id']),
      dimensionKey: serializer.fromJson<String>(json['dimensionKey']),
      weight: serializer.fromJson<double>(json['weight']),
      description: serializer.fromJson<String?>(json['description']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dimensionKey': serializer.toJson<String>(dimensionKey),
      'weight': serializer.toJson<double>(weight),
      'description': serializer.toJson<String?>(description),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WisdomRuleWeight copyWith({
    String? id,
    String? dimensionKey,
    double? weight,
    Value<String?> description = const Value.absent(),
    DateTime? updatedAt,
  }) => WisdomRuleWeight(
    id: id ?? this.id,
    dimensionKey: dimensionKey ?? this.dimensionKey,
    weight: weight ?? this.weight,
    description: description.present ? description.value : this.description,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WisdomRuleWeight copyWithCompanion(WisdomRuleWeightsCompanion data) {
    return WisdomRuleWeight(
      id: data.id.present ? data.id.value : this.id,
      dimensionKey: data.dimensionKey.present
          ? data.dimensionKey.value
          : this.dimensionKey,
      weight: data.weight.present ? data.weight.value : this.weight,
      description: data.description.present
          ? data.description.value
          : this.description,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WisdomRuleWeight(')
          ..write('id: $id, ')
          ..write('dimensionKey: $dimensionKey, ')
          ..write('weight: $weight, ')
          ..write('description: $description, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, dimensionKey, weight, description, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WisdomRuleWeight &&
          other.id == this.id &&
          other.dimensionKey == this.dimensionKey &&
          other.weight == this.weight &&
          other.description == this.description &&
          other.updatedAt == this.updatedAt);
}

class WisdomRuleWeightsCompanion extends UpdateCompanion<WisdomRuleWeight> {
  final Value<String> id;
  final Value<String> dimensionKey;
  final Value<double> weight;
  final Value<String?> description;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const WisdomRuleWeightsCompanion({
    this.id = const Value.absent(),
    this.dimensionKey = const Value.absent(),
    this.weight = const Value.absent(),
    this.description = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WisdomRuleWeightsCompanion.insert({
    required String id,
    required String dimensionKey,
    required double weight,
    this.description = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dimensionKey = Value(dimensionKey),
       weight = Value(weight),
       updatedAt = Value(updatedAt);
  static Insertable<WisdomRuleWeight> custom({
    Expression<String>? id,
    Expression<String>? dimensionKey,
    Expression<double>? weight,
    Expression<String>? description,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dimensionKey != null) 'dimension_key': dimensionKey,
      if (weight != null) 'weight': weight,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WisdomRuleWeightsCompanion copyWith({
    Value<String>? id,
    Value<String>? dimensionKey,
    Value<double>? weight,
    Value<String?>? description,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return WisdomRuleWeightsCompanion(
      id: id ?? this.id,
      dimensionKey: dimensionKey ?? this.dimensionKey,
      weight: weight ?? this.weight,
      description: description ?? this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dimensionKey.present) {
      map['dimension_key'] = Variable<String>(dimensionKey.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WisdomRuleWeightsCompanion(')
          ..write('id: $id, ')
          ..write('dimensionKey: $dimensionKey, ')
          ..write('weight: $weight, ')
          ..write('description: $description, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WisdomSynonymsTable extends WisdomSynonyms
    with TableInfo<$WisdomSynonymsTable, WisdomSynonym> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WisdomSynonymsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _canonicalTermMeta = const VerificationMeta(
    'canonicalTerm',
  );
  @override
  late final GeneratedColumn<String> canonicalTerm = GeneratedColumn<String>(
    'canonical_term',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, word, canonicalTerm];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wisdom_synonyms';
  @override
  VerificationContext validateIntegrity(
    Insertable<WisdomSynonym> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('canonical_term')) {
      context.handle(
        _canonicalTermMeta,
        canonicalTerm.isAcceptableOrUnknown(
          data['canonical_term']!,
          _canonicalTermMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_canonicalTermMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WisdomSynonym map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WisdomSynonym(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      canonicalTerm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}canonical_term'],
      )!,
    );
  }

  @override
  $WisdomSynonymsTable createAlias(String alias) {
    return $WisdomSynonymsTable(attachedDatabase, alias);
  }
}

class WisdomSynonym extends DataClass implements Insertable<WisdomSynonym> {
  final String id;
  final String word;
  final String canonicalTerm;
  const WisdomSynonym({
    required this.id,
    required this.word,
    required this.canonicalTerm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['word'] = Variable<String>(word);
    map['canonical_term'] = Variable<String>(canonicalTerm);
    return map;
  }

  WisdomSynonymsCompanion toCompanion(bool nullToAbsent) {
    return WisdomSynonymsCompanion(
      id: Value(id),
      word: Value(word),
      canonicalTerm: Value(canonicalTerm),
    );
  }

  factory WisdomSynonym.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WisdomSynonym(
      id: serializer.fromJson<String>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      canonicalTerm: serializer.fromJson<String>(json['canonicalTerm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'word': serializer.toJson<String>(word),
      'canonicalTerm': serializer.toJson<String>(canonicalTerm),
    };
  }

  WisdomSynonym copyWith({String? id, String? word, String? canonicalTerm}) =>
      WisdomSynonym(
        id: id ?? this.id,
        word: word ?? this.word,
        canonicalTerm: canonicalTerm ?? this.canonicalTerm,
      );
  WisdomSynonym copyWithCompanion(WisdomSynonymsCompanion data) {
    return WisdomSynonym(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      canonicalTerm: data.canonicalTerm.present
          ? data.canonicalTerm.value
          : this.canonicalTerm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WisdomSynonym(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('canonicalTerm: $canonicalTerm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, canonicalTerm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WisdomSynonym &&
          other.id == this.id &&
          other.word == this.word &&
          other.canonicalTerm == this.canonicalTerm);
}

class WisdomSynonymsCompanion extends UpdateCompanion<WisdomSynonym> {
  final Value<String> id;
  final Value<String> word;
  final Value<String> canonicalTerm;
  final Value<int> rowid;
  const WisdomSynonymsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.canonicalTerm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WisdomSynonymsCompanion.insert({
    required String id,
    required String word,
    required String canonicalTerm,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       word = Value(word),
       canonicalTerm = Value(canonicalTerm);
  static Insertable<WisdomSynonym> custom({
    Expression<String>? id,
    Expression<String>? word,
    Expression<String>? canonicalTerm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (canonicalTerm != null) 'canonical_term': canonicalTerm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WisdomSynonymsCompanion copyWith({
    Value<String>? id,
    Value<String>? word,
    Value<String>? canonicalTerm,
    Value<int>? rowid,
  }) {
    return WisdomSynonymsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      canonicalTerm: canonicalTerm ?? this.canonicalTerm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (canonicalTerm.present) {
      map['canonical_term'] = Variable<String>(canonicalTerm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WisdomSynonymsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('canonicalTerm: $canonicalTerm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WisdomKeywordMapTable extends WisdomKeywordMap
    with TableInfo<$WisdomKeywordMapTable, WisdomKeywordMapData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WisdomKeywordMapTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keywordMeta = const VerificationMeta(
    'keyword',
  );
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
    'keyword',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semanticBucketMeta = const VerificationMeta(
    'semanticBucket',
  );
  @override
  late final GeneratedColumn<String> semanticBucket = GeneratedColumn<String>(
    'semantic_bucket',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    keyword,
    semanticBucket,
    confidence,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wisdom_keyword_map';
  @override
  VerificationContext validateIntegrity(
    Insertable<WisdomKeywordMapData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('keyword')) {
      context.handle(
        _keywordMeta,
        keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordMeta);
    }
    if (data.containsKey('semantic_bucket')) {
      context.handle(
        _semanticBucketMeta,
        semanticBucket.isAcceptableOrUnknown(
          data['semantic_bucket']!,
          _semanticBucketMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_semanticBucketMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WisdomKeywordMapData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WisdomKeywordMapData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      keyword: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keyword'],
      )!,
      semanticBucket: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}semantic_bucket'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
    );
  }

  @override
  $WisdomKeywordMapTable createAlias(String alias) {
    return $WisdomKeywordMapTable(attachedDatabase, alias);
  }
}

class WisdomKeywordMapData extends DataClass
    implements Insertable<WisdomKeywordMapData> {
  final String id;
  final String keyword;
  final String semanticBucket;
  final double confidence;
  const WisdomKeywordMapData({
    required this.id,
    required this.keyword,
    required this.semanticBucket,
    required this.confidence,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['keyword'] = Variable<String>(keyword);
    map['semantic_bucket'] = Variable<String>(semanticBucket);
    map['confidence'] = Variable<double>(confidence);
    return map;
  }

  WisdomKeywordMapCompanion toCompanion(bool nullToAbsent) {
    return WisdomKeywordMapCompanion(
      id: Value(id),
      keyword: Value(keyword),
      semanticBucket: Value(semanticBucket),
      confidence: Value(confidence),
    );
  }

  factory WisdomKeywordMapData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WisdomKeywordMapData(
      id: serializer.fromJson<String>(json['id']),
      keyword: serializer.fromJson<String>(json['keyword']),
      semanticBucket: serializer.fromJson<String>(json['semanticBucket']),
      confidence: serializer.fromJson<double>(json['confidence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'keyword': serializer.toJson<String>(keyword),
      'semanticBucket': serializer.toJson<String>(semanticBucket),
      'confidence': serializer.toJson<double>(confidence),
    };
  }

  WisdomKeywordMapData copyWith({
    String? id,
    String? keyword,
    String? semanticBucket,
    double? confidence,
  }) => WisdomKeywordMapData(
    id: id ?? this.id,
    keyword: keyword ?? this.keyword,
    semanticBucket: semanticBucket ?? this.semanticBucket,
    confidence: confidence ?? this.confidence,
  );
  WisdomKeywordMapData copyWithCompanion(WisdomKeywordMapCompanion data) {
    return WisdomKeywordMapData(
      id: data.id.present ? data.id.value : this.id,
      keyword: data.keyword.present ? data.keyword.value : this.keyword,
      semanticBucket: data.semanticBucket.present
          ? data.semanticBucket.value
          : this.semanticBucket,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WisdomKeywordMapData(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('semanticBucket: $semanticBucket, ')
          ..write('confidence: $confidence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, keyword, semanticBucket, confidence);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WisdomKeywordMapData &&
          other.id == this.id &&
          other.keyword == this.keyword &&
          other.semanticBucket == this.semanticBucket &&
          other.confidence == this.confidence);
}

class WisdomKeywordMapCompanion extends UpdateCompanion<WisdomKeywordMapData> {
  final Value<String> id;
  final Value<String> keyword;
  final Value<String> semanticBucket;
  final Value<double> confidence;
  final Value<int> rowid;
  const WisdomKeywordMapCompanion({
    this.id = const Value.absent(),
    this.keyword = const Value.absent(),
    this.semanticBucket = const Value.absent(),
    this.confidence = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WisdomKeywordMapCompanion.insert({
    required String id,
    required String keyword,
    required String semanticBucket,
    this.confidence = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       keyword = Value(keyword),
       semanticBucket = Value(semanticBucket);
  static Insertable<WisdomKeywordMapData> custom({
    Expression<String>? id,
    Expression<String>? keyword,
    Expression<String>? semanticBucket,
    Expression<double>? confidence,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (keyword != null) 'keyword': keyword,
      if (semanticBucket != null) 'semantic_bucket': semanticBucket,
      if (confidence != null) 'confidence': confidence,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WisdomKeywordMapCompanion copyWith({
    Value<String>? id,
    Value<String>? keyword,
    Value<String>? semanticBucket,
    Value<double>? confidence,
    Value<int>? rowid,
  }) {
    return WisdomKeywordMapCompanion(
      id: id ?? this.id,
      keyword: keyword ?? this.keyword,
      semanticBucket: semanticBucket ?? this.semanticBucket,
      confidence: confidence ?? this.confidence,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (semanticBucket.present) {
      map['semantic_bucket'] = Variable<String>(semanticBucket.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WisdomKeywordMapCompanion(')
          ..write('id: $id, ')
          ..write('keyword: $keyword, ')
          ..write('semanticBucket: $semanticBucket, ')
          ..write('confidence: $confidence, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuoteUsageHistoryTable extends QuoteUsageHistory
    with TableInfo<$QuoteUsageHistoryTable, QuoteUsageHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuoteUsageHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteIdMeta = const VerificationMeta(
    'quoteId',
  );
  @override
  late final GeneratedColumn<String> quoteId = GeneratedColumn<String>(
    'quote_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shownAtMeta = const VerificationMeta(
    'shownAt',
  );
  @override
  late final GeneratedColumn<DateTime> shownAt = GeneratedColumn<DateTime>(
    'shown_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, quoteId, planId, shownAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quote_usage_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuoteUsageHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('quote_id')) {
      context.handle(
        _quoteIdMeta,
        quoteId.isAcceptableOrUnknown(data['quote_id']!, _quoteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteIdMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    }
    if (data.containsKey('shown_at')) {
      context.handle(
        _shownAtMeta,
        shownAt.isAcceptableOrUnknown(data['shown_at']!, _shownAtMeta),
      );
    } else if (isInserting) {
      context.missing(_shownAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuoteUsageHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuoteUsageHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      quoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      ),
      shownAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}shown_at'],
      )!,
    );
  }

  @override
  $QuoteUsageHistoryTable createAlias(String alias) {
    return $QuoteUsageHistoryTable(attachedDatabase, alias);
  }
}

class QuoteUsageHistoryData extends DataClass
    implements Insertable<QuoteUsageHistoryData> {
  final String id;
  final String userId;
  final String quoteId;
  final String? planId;
  final DateTime shownAt;
  const QuoteUsageHistoryData({
    required this.id,
    required this.userId,
    required this.quoteId,
    this.planId,
    required this.shownAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['quote_id'] = Variable<String>(quoteId);
    if (!nullToAbsent || planId != null) {
      map['plan_id'] = Variable<String>(planId);
    }
    map['shown_at'] = Variable<DateTime>(shownAt);
    return map;
  }

  QuoteUsageHistoryCompanion toCompanion(bool nullToAbsent) {
    return QuoteUsageHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      quoteId: Value(quoteId),
      planId: planId == null && nullToAbsent
          ? const Value.absent()
          : Value(planId),
      shownAt: Value(shownAt),
    );
  }

  factory QuoteUsageHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuoteUsageHistoryData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      quoteId: serializer.fromJson<String>(json['quoteId']),
      planId: serializer.fromJson<String?>(json['planId']),
      shownAt: serializer.fromJson<DateTime>(json['shownAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'quoteId': serializer.toJson<String>(quoteId),
      'planId': serializer.toJson<String?>(planId),
      'shownAt': serializer.toJson<DateTime>(shownAt),
    };
  }

  QuoteUsageHistoryData copyWith({
    String? id,
    String? userId,
    String? quoteId,
    Value<String?> planId = const Value.absent(),
    DateTime? shownAt,
  }) => QuoteUsageHistoryData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    quoteId: quoteId ?? this.quoteId,
    planId: planId.present ? planId.value : this.planId,
    shownAt: shownAt ?? this.shownAt,
  );
  QuoteUsageHistoryData copyWithCompanion(QuoteUsageHistoryCompanion data) {
    return QuoteUsageHistoryData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      quoteId: data.quoteId.present ? data.quoteId.value : this.quoteId,
      planId: data.planId.present ? data.planId.value : this.planId,
      shownAt: data.shownAt.present ? data.shownAt.value : this.shownAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuoteUsageHistoryData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('quoteId: $quoteId, ')
          ..write('planId: $planId, ')
          ..write('shownAt: $shownAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, quoteId, planId, shownAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteUsageHistoryData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.quoteId == this.quoteId &&
          other.planId == this.planId &&
          other.shownAt == this.shownAt);
}

class QuoteUsageHistoryCompanion
    extends UpdateCompanion<QuoteUsageHistoryData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> quoteId;
  final Value<String?> planId;
  final Value<DateTime> shownAt;
  final Value<int> rowid;
  const QuoteUsageHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.quoteId = const Value.absent(),
    this.planId = const Value.absent(),
    this.shownAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuoteUsageHistoryCompanion.insert({
    required String id,
    required String userId,
    required String quoteId,
    this.planId = const Value.absent(),
    required DateTime shownAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       quoteId = Value(quoteId),
       shownAt = Value(shownAt);
  static Insertable<QuoteUsageHistoryData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? quoteId,
    Expression<String>? planId,
    Expression<DateTime>? shownAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (quoteId != null) 'quote_id': quoteId,
      if (planId != null) 'plan_id': planId,
      if (shownAt != null) 'shown_at': shownAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuoteUsageHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? quoteId,
    Value<String?>? planId,
    Value<DateTime>? shownAt,
    Value<int>? rowid,
  }) {
    return QuoteUsageHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      quoteId: quoteId ?? this.quoteId,
      planId: planId ?? this.planId,
      shownAt: shownAt ?? this.shownAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (quoteId.present) {
      map['quote_id'] = Variable<String>(quoteId.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (shownAt.present) {
      map['shown_at'] = Variable<DateTime>(shownAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteUsageHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('quoteId: $quoteId, ')
          ..write('planId: $planId, ')
          ..write('shownAt: $shownAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionLogsTable extends DecisionLogs
    with TableInfo<$DecisionLogsTable, DecisionLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedQuoteIdMeta = const VerificationMeta(
    'selectedQuoteId',
  );
  @override
  late final GeneratedColumn<String> selectedQuoteId = GeneratedColumn<String>(
    'selected_quote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _candidatePoolSizeMeta = const VerificationMeta(
    'candidatePoolSize',
  );
  @override
  late final GeneratedColumn<int> candidatePoolSize = GeneratedColumn<int>(
    'candidate_pool_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fallbackTierMeta = const VerificationMeta(
    'fallbackTier',
  );
  @override
  late final GeneratedColumn<int> fallbackTier = GeneratedColumn<int>(
    'fallback_tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _finalScoreMeta = const VerificationMeta(
    'finalScore',
  );
  @override
  late final GeneratedColumn<double> finalScore = GeneratedColumn<double>(
    'final_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _contextFeaturesJsonMeta =
      const VerificationMeta('contextFeaturesJson');
  @override
  late final GeneratedColumn<String> contextFeaturesJson =
      GeneratedColumn<String>(
        'context_features_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _userFacingExplanationMeta =
      const VerificationMeta('userFacingExplanation');
  @override
  late final GeneratedColumn<String> userFacingExplanation =
      GeneratedColumn<String>(
        'user_facing_explanation',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _debugExplanationMeta = const VerificationMeta(
    'debugExplanation',
  );
  @override
  late final GeneratedColumn<String> debugExplanation = GeneratedColumn<String>(
    'debug_explanation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    planId,
    selectedQuoteId,
    candidatePoolSize,
    fallbackTier,
    finalScore,
    contextFeaturesJson,
    userFacingExplanation,
    debugExplanation,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('selected_quote_id')) {
      context.handle(
        _selectedQuoteIdMeta,
        selectedQuoteId.isAcceptableOrUnknown(
          data['selected_quote_id']!,
          _selectedQuoteIdMeta,
        ),
      );
    }
    if (data.containsKey('candidate_pool_size')) {
      context.handle(
        _candidatePoolSizeMeta,
        candidatePoolSize.isAcceptableOrUnknown(
          data['candidate_pool_size']!,
          _candidatePoolSizeMeta,
        ),
      );
    }
    if (data.containsKey('fallback_tier')) {
      context.handle(
        _fallbackTierMeta,
        fallbackTier.isAcceptableOrUnknown(
          data['fallback_tier']!,
          _fallbackTierMeta,
        ),
      );
    }
    if (data.containsKey('final_score')) {
      context.handle(
        _finalScoreMeta,
        finalScore.isAcceptableOrUnknown(data['final_score']!, _finalScoreMeta),
      );
    }
    if (data.containsKey('context_features_json')) {
      context.handle(
        _contextFeaturesJsonMeta,
        contextFeaturesJson.isAcceptableOrUnknown(
          data['context_features_json']!,
          _contextFeaturesJsonMeta,
        ),
      );
    }
    if (data.containsKey('user_facing_explanation')) {
      context.handle(
        _userFacingExplanationMeta,
        userFacingExplanation.isAcceptableOrUnknown(
          data['user_facing_explanation']!,
          _userFacingExplanationMeta,
        ),
      );
    }
    if (data.containsKey('debug_explanation')) {
      context.handle(
        _debugExplanationMeta,
        debugExplanation.isAcceptableOrUnknown(
          data['debug_explanation']!,
          _debugExplanationMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      selectedQuoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_quote_id'],
      ),
      candidatePoolSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}candidate_pool_size'],
      )!,
      fallbackTier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fallback_tier'],
      )!,
      finalScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}final_score'],
      )!,
      contextFeaturesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context_features_json'],
      ),
      userFacingExplanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_facing_explanation'],
      ),
      debugExplanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}debug_explanation'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DecisionLogsTable createAlias(String alias) {
    return $DecisionLogsTable(attachedDatabase, alias);
  }
}

class DecisionLog extends DataClass implements Insertable<DecisionLog> {
  final String id;
  final String userId;
  final String planId;
  final String? selectedQuoteId;
  final int candidatePoolSize;
  final int fallbackTier;
  final double finalScore;
  final String? contextFeaturesJson;
  final String? userFacingExplanation;
  final String? debugExplanation;
  final DateTime createdAt;
  const DecisionLog({
    required this.id,
    required this.userId,
    required this.planId,
    this.selectedQuoteId,
    required this.candidatePoolSize,
    required this.fallbackTier,
    required this.finalScore,
    this.contextFeaturesJson,
    this.userFacingExplanation,
    this.debugExplanation,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['plan_id'] = Variable<String>(planId);
    if (!nullToAbsent || selectedQuoteId != null) {
      map['selected_quote_id'] = Variable<String>(selectedQuoteId);
    }
    map['candidate_pool_size'] = Variable<int>(candidatePoolSize);
    map['fallback_tier'] = Variable<int>(fallbackTier);
    map['final_score'] = Variable<double>(finalScore);
    if (!nullToAbsent || contextFeaturesJson != null) {
      map['context_features_json'] = Variable<String>(contextFeaturesJson);
    }
    if (!nullToAbsent || userFacingExplanation != null) {
      map['user_facing_explanation'] = Variable<String>(userFacingExplanation);
    }
    if (!nullToAbsent || debugExplanation != null) {
      map['debug_explanation'] = Variable<String>(debugExplanation);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DecisionLogsCompanion toCompanion(bool nullToAbsent) {
    return DecisionLogsCompanion(
      id: Value(id),
      userId: Value(userId),
      planId: Value(planId),
      selectedQuoteId: selectedQuoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedQuoteId),
      candidatePoolSize: Value(candidatePoolSize),
      fallbackTier: Value(fallbackTier),
      finalScore: Value(finalScore),
      contextFeaturesJson: contextFeaturesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(contextFeaturesJson),
      userFacingExplanation: userFacingExplanation == null && nullToAbsent
          ? const Value.absent()
          : Value(userFacingExplanation),
      debugExplanation: debugExplanation == null && nullToAbsent
          ? const Value.absent()
          : Value(debugExplanation),
      createdAt: Value(createdAt),
    );
  }

  factory DecisionLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionLog(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      planId: serializer.fromJson<String>(json['planId']),
      selectedQuoteId: serializer.fromJson<String?>(json['selectedQuoteId']),
      candidatePoolSize: serializer.fromJson<int>(json['candidatePoolSize']),
      fallbackTier: serializer.fromJson<int>(json['fallbackTier']),
      finalScore: serializer.fromJson<double>(json['finalScore']),
      contextFeaturesJson: serializer.fromJson<String?>(
        json['contextFeaturesJson'],
      ),
      userFacingExplanation: serializer.fromJson<String?>(
        json['userFacingExplanation'],
      ),
      debugExplanation: serializer.fromJson<String?>(json['debugExplanation']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'planId': serializer.toJson<String>(planId),
      'selectedQuoteId': serializer.toJson<String?>(selectedQuoteId),
      'candidatePoolSize': serializer.toJson<int>(candidatePoolSize),
      'fallbackTier': serializer.toJson<int>(fallbackTier),
      'finalScore': serializer.toJson<double>(finalScore),
      'contextFeaturesJson': serializer.toJson<String?>(contextFeaturesJson),
      'userFacingExplanation': serializer.toJson<String?>(
        userFacingExplanation,
      ),
      'debugExplanation': serializer.toJson<String?>(debugExplanation),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DecisionLog copyWith({
    String? id,
    String? userId,
    String? planId,
    Value<String?> selectedQuoteId = const Value.absent(),
    int? candidatePoolSize,
    int? fallbackTier,
    double? finalScore,
    Value<String?> contextFeaturesJson = const Value.absent(),
    Value<String?> userFacingExplanation = const Value.absent(),
    Value<String?> debugExplanation = const Value.absent(),
    DateTime? createdAt,
  }) => DecisionLog(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    planId: planId ?? this.planId,
    selectedQuoteId: selectedQuoteId.present
        ? selectedQuoteId.value
        : this.selectedQuoteId,
    candidatePoolSize: candidatePoolSize ?? this.candidatePoolSize,
    fallbackTier: fallbackTier ?? this.fallbackTier,
    finalScore: finalScore ?? this.finalScore,
    contextFeaturesJson: contextFeaturesJson.present
        ? contextFeaturesJson.value
        : this.contextFeaturesJson,
    userFacingExplanation: userFacingExplanation.present
        ? userFacingExplanation.value
        : this.userFacingExplanation,
    debugExplanation: debugExplanation.present
        ? debugExplanation.value
        : this.debugExplanation,
    createdAt: createdAt ?? this.createdAt,
  );
  DecisionLog copyWithCompanion(DecisionLogsCompanion data) {
    return DecisionLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      planId: data.planId.present ? data.planId.value : this.planId,
      selectedQuoteId: data.selectedQuoteId.present
          ? data.selectedQuoteId.value
          : this.selectedQuoteId,
      candidatePoolSize: data.candidatePoolSize.present
          ? data.candidatePoolSize.value
          : this.candidatePoolSize,
      fallbackTier: data.fallbackTier.present
          ? data.fallbackTier.value
          : this.fallbackTier,
      finalScore: data.finalScore.present
          ? data.finalScore.value
          : this.finalScore,
      contextFeaturesJson: data.contextFeaturesJson.present
          ? data.contextFeaturesJson.value
          : this.contextFeaturesJson,
      userFacingExplanation: data.userFacingExplanation.present
          ? data.userFacingExplanation.value
          : this.userFacingExplanation,
      debugExplanation: data.debugExplanation.present
          ? data.debugExplanation.value
          : this.debugExplanation,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planId: $planId, ')
          ..write('selectedQuoteId: $selectedQuoteId, ')
          ..write('candidatePoolSize: $candidatePoolSize, ')
          ..write('fallbackTier: $fallbackTier, ')
          ..write('finalScore: $finalScore, ')
          ..write('contextFeaturesJson: $contextFeaturesJson, ')
          ..write('userFacingExplanation: $userFacingExplanation, ')
          ..write('debugExplanation: $debugExplanation, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    planId,
    selectedQuoteId,
    candidatePoolSize,
    fallbackTier,
    finalScore,
    contextFeaturesJson,
    userFacingExplanation,
    debugExplanation,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.planId == this.planId &&
          other.selectedQuoteId == this.selectedQuoteId &&
          other.candidatePoolSize == this.candidatePoolSize &&
          other.fallbackTier == this.fallbackTier &&
          other.finalScore == this.finalScore &&
          other.contextFeaturesJson == this.contextFeaturesJson &&
          other.userFacingExplanation == this.userFacingExplanation &&
          other.debugExplanation == this.debugExplanation &&
          other.createdAt == this.createdAt);
}

class DecisionLogsCompanion extends UpdateCompanion<DecisionLog> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> planId;
  final Value<String?> selectedQuoteId;
  final Value<int> candidatePoolSize;
  final Value<int> fallbackTier;
  final Value<double> finalScore;
  final Value<String?> contextFeaturesJson;
  final Value<String?> userFacingExplanation;
  final Value<String?> debugExplanation;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DecisionLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.planId = const Value.absent(),
    this.selectedQuoteId = const Value.absent(),
    this.candidatePoolSize = const Value.absent(),
    this.fallbackTier = const Value.absent(),
    this.finalScore = const Value.absent(),
    this.contextFeaturesJson = const Value.absent(),
    this.userFacingExplanation = const Value.absent(),
    this.debugExplanation = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionLogsCompanion.insert({
    required String id,
    required String userId,
    required String planId,
    this.selectedQuoteId = const Value.absent(),
    this.candidatePoolSize = const Value.absent(),
    this.fallbackTier = const Value.absent(),
    this.finalScore = const Value.absent(),
    this.contextFeaturesJson = const Value.absent(),
    this.userFacingExplanation = const Value.absent(),
    this.debugExplanation = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       planId = Value(planId),
       createdAt = Value(createdAt);
  static Insertable<DecisionLog> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? planId,
    Expression<String>? selectedQuoteId,
    Expression<int>? candidatePoolSize,
    Expression<int>? fallbackTier,
    Expression<double>? finalScore,
    Expression<String>? contextFeaturesJson,
    Expression<String>? userFacingExplanation,
    Expression<String>? debugExplanation,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (planId != null) 'plan_id': planId,
      if (selectedQuoteId != null) 'selected_quote_id': selectedQuoteId,
      if (candidatePoolSize != null) 'candidate_pool_size': candidatePoolSize,
      if (fallbackTier != null) 'fallback_tier': fallbackTier,
      if (finalScore != null) 'final_score': finalScore,
      if (contextFeaturesJson != null)
        'context_features_json': contextFeaturesJson,
      if (userFacingExplanation != null)
        'user_facing_explanation': userFacingExplanation,
      if (debugExplanation != null) 'debug_explanation': debugExplanation,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? planId,
    Value<String?>? selectedQuoteId,
    Value<int>? candidatePoolSize,
    Value<int>? fallbackTier,
    Value<double>? finalScore,
    Value<String?>? contextFeaturesJson,
    Value<String?>? userFacingExplanation,
    Value<String?>? debugExplanation,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DecisionLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planId: planId ?? this.planId,
      selectedQuoteId: selectedQuoteId ?? this.selectedQuoteId,
      candidatePoolSize: candidatePoolSize ?? this.candidatePoolSize,
      fallbackTier: fallbackTier ?? this.fallbackTier,
      finalScore: finalScore ?? this.finalScore,
      contextFeaturesJson: contextFeaturesJson ?? this.contextFeaturesJson,
      userFacingExplanation:
          userFacingExplanation ?? this.userFacingExplanation,
      debugExplanation: debugExplanation ?? this.debugExplanation,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (selectedQuoteId.present) {
      map['selected_quote_id'] = Variable<String>(selectedQuoteId.value);
    }
    if (candidatePoolSize.present) {
      map['candidate_pool_size'] = Variable<int>(candidatePoolSize.value);
    }
    if (fallbackTier.present) {
      map['fallback_tier'] = Variable<int>(fallbackTier.value);
    }
    if (finalScore.present) {
      map['final_score'] = Variable<double>(finalScore.value);
    }
    if (contextFeaturesJson.present) {
      map['context_features_json'] = Variable<String>(
        contextFeaturesJson.value,
      );
    }
    if (userFacingExplanation.present) {
      map['user_facing_explanation'] = Variable<String>(
        userFacingExplanation.value,
      );
    }
    if (debugExplanation.present) {
      map['debug_explanation'] = Variable<String>(debugExplanation.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planId: $planId, ')
          ..write('selectedQuoteId: $selectedQuoteId, ')
          ..write('candidatePoolSize: $candidatePoolSize, ')
          ..write('fallbackTier: $fallbackTier, ')
          ..write('finalScore: $finalScore, ')
          ..write('contextFeaturesJson: $contextFeaturesJson, ')
          ..write('userFacingExplanation: $userFacingExplanation, ')
          ..write('debugExplanation: $debugExplanation, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DecisionLogCandidatesTable extends DecisionLogCandidates
    with TableInfo<$DecisionLogCandidatesTable, DecisionLogCandidate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionLogCandidatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decisionLogIdMeta = const VerificationMeta(
    'decisionLogId',
  );
  @override
  late final GeneratedColumn<String> decisionLogId = GeneratedColumn<String>(
    'decision_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteIdMeta = const VerificationMeta(
    'quoteId',
  );
  @override
  late final GeneratedColumn<String> quoteId = GeneratedColumn<String>(
    'quote_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalScoreMeta = const VerificationMeta(
    'totalScore',
  );
  @override
  late final GeneratedColumn<double> totalScore = GeneratedColumn<double>(
    'total_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreBreakdownJsonMeta =
      const VerificationMeta('scoreBreakdownJson');
  @override
  late final GeneratedColumn<String> scoreBreakdownJson =
      GeneratedColumn<String>(
        'score_breakdown_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _rejectionReasonMeta = const VerificationMeta(
    'rejectionReason',
  );
  @override
  late final GeneratedColumn<String> rejectionReason = GeneratedColumn<String>(
    'rejection_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    decisionLogId,
    quoteId,
    totalScore,
    scoreBreakdownJson,
    rejectionReason,
    rank,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decision_log_candidates';
  @override
  VerificationContext validateIntegrity(
    Insertable<DecisionLogCandidate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('decision_log_id')) {
      context.handle(
        _decisionLogIdMeta,
        decisionLogId.isAcceptableOrUnknown(
          data['decision_log_id']!,
          _decisionLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_decisionLogIdMeta);
    }
    if (data.containsKey('quote_id')) {
      context.handle(
        _quoteIdMeta,
        quoteId.isAcceptableOrUnknown(data['quote_id']!, _quoteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quoteIdMeta);
    }
    if (data.containsKey('total_score')) {
      context.handle(
        _totalScoreMeta,
        totalScore.isAcceptableOrUnknown(data['total_score']!, _totalScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_totalScoreMeta);
    }
    if (data.containsKey('score_breakdown_json')) {
      context.handle(
        _scoreBreakdownJsonMeta,
        scoreBreakdownJson.isAcceptableOrUnknown(
          data['score_breakdown_json']!,
          _scoreBreakdownJsonMeta,
        ),
      );
    }
    if (data.containsKey('rejection_reason')) {
      context.handle(
        _rejectionReasonMeta,
        rejectionReason.isAcceptableOrUnknown(
          data['rejection_reason']!,
          _rejectionReasonMeta,
        ),
      );
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DecisionLogCandidate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DecisionLogCandidate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      decisionLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decision_log_id'],
      )!,
      quoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_id'],
      )!,
      totalScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_score'],
      )!,
      scoreBreakdownJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}score_breakdown_json'],
      ),
      rejectionReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rejection_reason'],
      ),
      rank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rank'],
      )!,
    );
  }

  @override
  $DecisionLogCandidatesTable createAlias(String alias) {
    return $DecisionLogCandidatesTable(attachedDatabase, alias);
  }
}

class DecisionLogCandidate extends DataClass
    implements Insertable<DecisionLogCandidate> {
  final String id;
  final String decisionLogId;
  final String quoteId;
  final double totalScore;
  final String? scoreBreakdownJson;
  final String? rejectionReason;
  final int rank;
  const DecisionLogCandidate({
    required this.id,
    required this.decisionLogId,
    required this.quoteId,
    required this.totalScore,
    this.scoreBreakdownJson,
    this.rejectionReason,
    required this.rank,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['decision_log_id'] = Variable<String>(decisionLogId);
    map['quote_id'] = Variable<String>(quoteId);
    map['total_score'] = Variable<double>(totalScore);
    if (!nullToAbsent || scoreBreakdownJson != null) {
      map['score_breakdown_json'] = Variable<String>(scoreBreakdownJson);
    }
    if (!nullToAbsent || rejectionReason != null) {
      map['rejection_reason'] = Variable<String>(rejectionReason);
    }
    map['rank'] = Variable<int>(rank);
    return map;
  }

  DecisionLogCandidatesCompanion toCompanion(bool nullToAbsent) {
    return DecisionLogCandidatesCompanion(
      id: Value(id),
      decisionLogId: Value(decisionLogId),
      quoteId: Value(quoteId),
      totalScore: Value(totalScore),
      scoreBreakdownJson: scoreBreakdownJson == null && nullToAbsent
          ? const Value.absent()
          : Value(scoreBreakdownJson),
      rejectionReason: rejectionReason == null && nullToAbsent
          ? const Value.absent()
          : Value(rejectionReason),
      rank: Value(rank),
    );
  }

  factory DecisionLogCandidate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DecisionLogCandidate(
      id: serializer.fromJson<String>(json['id']),
      decisionLogId: serializer.fromJson<String>(json['decisionLogId']),
      quoteId: serializer.fromJson<String>(json['quoteId']),
      totalScore: serializer.fromJson<double>(json['totalScore']),
      scoreBreakdownJson: serializer.fromJson<String?>(
        json['scoreBreakdownJson'],
      ),
      rejectionReason: serializer.fromJson<String?>(json['rejectionReason']),
      rank: serializer.fromJson<int>(json['rank']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'decisionLogId': serializer.toJson<String>(decisionLogId),
      'quoteId': serializer.toJson<String>(quoteId),
      'totalScore': serializer.toJson<double>(totalScore),
      'scoreBreakdownJson': serializer.toJson<String?>(scoreBreakdownJson),
      'rejectionReason': serializer.toJson<String?>(rejectionReason),
      'rank': serializer.toJson<int>(rank),
    };
  }

  DecisionLogCandidate copyWith({
    String? id,
    String? decisionLogId,
    String? quoteId,
    double? totalScore,
    Value<String?> scoreBreakdownJson = const Value.absent(),
    Value<String?> rejectionReason = const Value.absent(),
    int? rank,
  }) => DecisionLogCandidate(
    id: id ?? this.id,
    decisionLogId: decisionLogId ?? this.decisionLogId,
    quoteId: quoteId ?? this.quoteId,
    totalScore: totalScore ?? this.totalScore,
    scoreBreakdownJson: scoreBreakdownJson.present
        ? scoreBreakdownJson.value
        : this.scoreBreakdownJson,
    rejectionReason: rejectionReason.present
        ? rejectionReason.value
        : this.rejectionReason,
    rank: rank ?? this.rank,
  );
  DecisionLogCandidate copyWithCompanion(DecisionLogCandidatesCompanion data) {
    return DecisionLogCandidate(
      id: data.id.present ? data.id.value : this.id,
      decisionLogId: data.decisionLogId.present
          ? data.decisionLogId.value
          : this.decisionLogId,
      quoteId: data.quoteId.present ? data.quoteId.value : this.quoteId,
      totalScore: data.totalScore.present
          ? data.totalScore.value
          : this.totalScore,
      scoreBreakdownJson: data.scoreBreakdownJson.present
          ? data.scoreBreakdownJson.value
          : this.scoreBreakdownJson,
      rejectionReason: data.rejectionReason.present
          ? data.rejectionReason.value
          : this.rejectionReason,
      rank: data.rank.present ? data.rank.value : this.rank,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DecisionLogCandidate(')
          ..write('id: $id, ')
          ..write('decisionLogId: $decisionLogId, ')
          ..write('quoteId: $quoteId, ')
          ..write('totalScore: $totalScore, ')
          ..write('scoreBreakdownJson: $scoreBreakdownJson, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    decisionLogId,
    quoteId,
    totalScore,
    scoreBreakdownJson,
    rejectionReason,
    rank,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DecisionLogCandidate &&
          other.id == this.id &&
          other.decisionLogId == this.decisionLogId &&
          other.quoteId == this.quoteId &&
          other.totalScore == this.totalScore &&
          other.scoreBreakdownJson == this.scoreBreakdownJson &&
          other.rejectionReason == this.rejectionReason &&
          other.rank == this.rank);
}

class DecisionLogCandidatesCompanion
    extends UpdateCompanion<DecisionLogCandidate> {
  final Value<String> id;
  final Value<String> decisionLogId;
  final Value<String> quoteId;
  final Value<double> totalScore;
  final Value<String?> scoreBreakdownJson;
  final Value<String?> rejectionReason;
  final Value<int> rank;
  final Value<int> rowid;
  const DecisionLogCandidatesCompanion({
    this.id = const Value.absent(),
    this.decisionLogId = const Value.absent(),
    this.quoteId = const Value.absent(),
    this.totalScore = const Value.absent(),
    this.scoreBreakdownJson = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    this.rank = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionLogCandidatesCompanion.insert({
    required String id,
    required String decisionLogId,
    required String quoteId,
    required double totalScore,
    this.scoreBreakdownJson = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    required int rank,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       decisionLogId = Value(decisionLogId),
       quoteId = Value(quoteId),
       totalScore = Value(totalScore),
       rank = Value(rank);
  static Insertable<DecisionLogCandidate> custom({
    Expression<String>? id,
    Expression<String>? decisionLogId,
    Expression<String>? quoteId,
    Expression<double>? totalScore,
    Expression<String>? scoreBreakdownJson,
    Expression<String>? rejectionReason,
    Expression<int>? rank,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (decisionLogId != null) 'decision_log_id': decisionLogId,
      if (quoteId != null) 'quote_id': quoteId,
      if (totalScore != null) 'total_score': totalScore,
      if (scoreBreakdownJson != null)
        'score_breakdown_json': scoreBreakdownJson,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (rank != null) 'rank': rank,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionLogCandidatesCompanion copyWith({
    Value<String>? id,
    Value<String>? decisionLogId,
    Value<String>? quoteId,
    Value<double>? totalScore,
    Value<String?>? scoreBreakdownJson,
    Value<String?>? rejectionReason,
    Value<int>? rank,
    Value<int>? rowid,
  }) {
    return DecisionLogCandidatesCompanion(
      id: id ?? this.id,
      decisionLogId: decisionLogId ?? this.decisionLogId,
      quoteId: quoteId ?? this.quoteId,
      totalScore: totalScore ?? this.totalScore,
      scoreBreakdownJson: scoreBreakdownJson ?? this.scoreBreakdownJson,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      rank: rank ?? this.rank,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (decisionLogId.present) {
      map['decision_log_id'] = Variable<String>(decisionLogId.value);
    }
    if (quoteId.present) {
      map['quote_id'] = Variable<String>(quoteId.value);
    }
    if (totalScore.present) {
      map['total_score'] = Variable<double>(totalScore.value);
    }
    if (scoreBreakdownJson.present) {
      map['score_breakdown_json'] = Variable<String>(scoreBreakdownJson.value);
    }
    if (rejectionReason.present) {
      map['rejection_reason'] = Variable<String>(rejectionReason.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionLogCandidatesCompanion(')
          ..write('id: $id, ')
          ..write('decisionLogId: $decisionLogId, ')
          ..write('quoteId: $quoteId, ')
          ..write('totalScore: $totalScore, ')
          ..write('scoreBreakdownJson: $scoreBreakdownJson, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('rank: $rank, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformNotificationIdMeta =
      const VerificationMeta('platformNotificationId');
  @override
  late final GeneratedColumn<int> platformNotificationId = GeneratedColumn<int>(
    'platform_notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('scheduled'),
  );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastScheduledAtMeta = const VerificationMeta(
    'lastScheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastScheduledAt =
      GeneratedColumn<DateTime>(
        'last_scheduled_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planId,
    title,
    body,
    platformNotificationId,
    status,
    scheduledFor,
    timezone,
    lastError,
    lastScheduledAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('platform_notification_id')) {
      context.handle(
        _platformNotificationIdMeta,
        platformNotificationId.isAcceptableOrUnknown(
          data['platform_notification_id']!,
          _platformNotificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_platformNotificationIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('last_scheduled_at')) {
      context.handle(
        _lastScheduledAtMeta,
        lastScheduledAt.isAcceptableOrUnknown(
          data['last_scheduled_at']!,
          _lastScheduledAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      platformNotificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}platform_notification_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_for'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      lastScheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_scheduled_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final String id;
  final String planId;
  final String title;
  final String body;
  final int platformNotificationId;
  final String status;
  final DateTime scheduledFor;
  final String timezone;
  final String? lastError;
  final DateTime? lastScheduledAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Notification({
    required this.id,
    required this.planId,
    required this.title,
    required this.body,
    required this.platformNotificationId,
    required this.status,
    required this.scheduledFor,
    required this.timezone,
    this.lastError,
    this.lastScheduledAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['platform_notification_id'] = Variable<int>(platformNotificationId);
    map['status'] = Variable<String>(status);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['timezone'] = Variable<String>(timezone);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || lastScheduledAt != null) {
      map['last_scheduled_at'] = Variable<DateTime>(lastScheduledAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      planId: Value(planId),
      title: Value(title),
      body: Value(body),
      platformNotificationId: Value(platformNotificationId),
      status: Value(status),
      scheduledFor: Value(scheduledFor),
      timezone: Value(timezone),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      lastScheduledAt: lastScheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastScheduledAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Notification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      platformNotificationId: serializer.fromJson<int>(
        json['platformNotificationId'],
      ),
      status: serializer.fromJson<String>(json['status']),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      timezone: serializer.fromJson<String>(json['timezone']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      lastScheduledAt: serializer.fromJson<DateTime?>(json['lastScheduledAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'platformNotificationId': serializer.toJson<int>(platformNotificationId),
      'status': serializer.toJson<String>(status),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'timezone': serializer.toJson<String>(timezone),
      'lastError': serializer.toJson<String?>(lastError),
      'lastScheduledAt': serializer.toJson<DateTime?>(lastScheduledAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Notification copyWith({
    String? id,
    String? planId,
    String? title,
    String? body,
    int? platformNotificationId,
    String? status,
    DateTime? scheduledFor,
    String? timezone,
    Value<String?> lastError = const Value.absent(),
    Value<DateTime?> lastScheduledAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Notification(
    id: id ?? this.id,
    planId: planId ?? this.planId,
    title: title ?? this.title,
    body: body ?? this.body,
    platformNotificationId:
        platformNotificationId ?? this.platformNotificationId,
    status: status ?? this.status,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    timezone: timezone ?? this.timezone,
    lastError: lastError.present ? lastError.value : this.lastError,
    lastScheduledAt: lastScheduledAt.present
        ? lastScheduledAt.value
        : this.lastScheduledAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Notification copyWithCompanion(NotificationsCompanion data) {
    return Notification(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      platformNotificationId: data.platformNotificationId.present
          ? data.platformNotificationId.value
          : this.platformNotificationId,
      status: data.status.present ? data.status.value : this.status,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      lastScheduledAt: data.lastScheduledAt.present
          ? data.lastScheduledAt.value
          : this.lastScheduledAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('platformNotificationId: $platformNotificationId, ')
          ..write('status: $status, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('timezone: $timezone, ')
          ..write('lastError: $lastError, ')
          ..write('lastScheduledAt: $lastScheduledAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planId,
    title,
    body,
    platformNotificationId,
    status,
    scheduledFor,
    timezone,
    lastError,
    lastScheduledAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.title == this.title &&
          other.body == this.body &&
          other.platformNotificationId == this.platformNotificationId &&
          other.status == this.status &&
          other.scheduledFor == this.scheduledFor &&
          other.timezone == this.timezone &&
          other.lastError == this.lastError &&
          other.lastScheduledAt == this.lastScheduledAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> title;
  final Value<String> body;
  final Value<int> platformNotificationId;
  final Value<String> status;
  final Value<DateTime> scheduledFor;
  final Value<String> timezone;
  final Value<String?> lastError;
  final Value<DateTime?> lastScheduledAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.platformNotificationId = const Value.absent(),
    this.status = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.timezone = const Value.absent(),
    this.lastError = const Value.absent(),
    this.lastScheduledAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    required String id,
    required String planId,
    required String title,
    required String body,
    required int platformNotificationId,
    this.status = const Value.absent(),
    required DateTime scheduledFor,
    required String timezone,
    this.lastError = const Value.absent(),
    this.lastScheduledAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       planId = Value(planId),
       title = Value(title),
       body = Value(body),
       platformNotificationId = Value(platformNotificationId),
       scheduledFor = Value(scheduledFor),
       timezone = Value(timezone),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Notification> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? platformNotificationId,
    Expression<String>? status,
    Expression<DateTime>? scheduledFor,
    Expression<String>? timezone,
    Expression<String>? lastError,
    Expression<DateTime>? lastScheduledAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (platformNotificationId != null)
        'platform_notification_id': platformNotificationId,
      if (status != null) 'status': status,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (timezone != null) 'timezone': timezone,
      if (lastError != null) 'last_error': lastError,
      if (lastScheduledAt != null) 'last_scheduled_at': lastScheduledAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith({
    Value<String>? id,
    Value<String>? planId,
    Value<String>? title,
    Value<String>? body,
    Value<int>? platformNotificationId,
    Value<String>? status,
    Value<DateTime>? scheduledFor,
    Value<String>? timezone,
    Value<String?>? lastError,
    Value<DateTime?>? lastScheduledAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return NotificationsCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      title: title ?? this.title,
      body: body ?? this.body,
      platformNotificationId:
          platformNotificationId ?? this.platformNotificationId,
      status: status ?? this.status,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      timezone: timezone ?? this.timezone,
      lastError: lastError ?? this.lastError,
      lastScheduledAt: lastScheduledAt ?? this.lastScheduledAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (platformNotificationId.present) {
      map['platform_notification_id'] = Variable<int>(
        platformNotificationId.value,
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (lastScheduledAt.present) {
      map['last_scheduled_at'] = Variable<DateTime>(lastScheduledAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('platformNotificationId: $platformNotificationId, ')
          ..write('status: $status, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('timezone: $timezone, ')
          ..write('lastError: $lastError, ')
          ..write('lastScheduledAt: $lastScheduledAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTableMeta = const VerificationMeta(
    'targetTable',
  );
  @override
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
    'target_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  @override
  late final GeneratedColumn<String> rowId = GeneratedColumn<String>(
    'row_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    targetTable,
    rowId,
    operation,
    payloadJson,
    retryCount,
    createdAt,
    lastAttemptAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('target_table')) {
      context.handle(
        _targetTableMeta,
        targetTable.isAcceptableOrUnknown(
          data['target_table']!,
          _targetTableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('row_id')) {
      context.handle(
        _rowIdMeta,
        rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rowIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      targetTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_table'],
      )!,
      rowId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}row_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final String id;
  final String targetTable;
  final String rowId;
  final String operation;
  final String payloadJson;
  final int retryCount;
  final DateTime createdAt;
  final DateTime? lastAttemptAt;
  const SyncQueueData({
    required this.id,
    required this.targetTable,
    required this.rowId,
    required this.operation,
    required this.payloadJson,
    required this.retryCount,
    required this.createdAt,
    this.lastAttemptAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['target_table'] = Variable<String>(targetTable);
    map['row_id'] = Variable<String>(rowId);
    map['operation'] = Variable<String>(operation);
    map['payload_json'] = Variable<String>(payloadJson);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      targetTable: Value(targetTable),
      rowId: Value(rowId),
      operation: Value(operation),
      payloadJson: Value(payloadJson),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<String>(json['id']),
      targetTable: serializer.fromJson<String>(json['targetTable']),
      rowId: serializer.fromJson<String>(json['rowId']),
      operation: serializer.fromJson<String>(json['operation']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'targetTable': serializer.toJson<String>(targetTable),
      'rowId': serializer.toJson<String>(rowId),
      'operation': serializer.toJson<String>(operation),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  SyncQueueData copyWith({
    String? id,
    String? targetTable,
    String? rowId,
    String? operation,
    String? payloadJson,
    int? retryCount,
    DateTime? createdAt,
    Value<DateTime?> lastAttemptAt = const Value.absent(),
  }) => SyncQueueData(
    id: id ?? this.id,
    targetTable: targetTable ?? this.targetTable,
    rowId: rowId ?? this.rowId,
    operation: operation ?? this.operation,
    payloadJson: payloadJson ?? this.payloadJson,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      targetTable: data.targetTable.present
          ? data.targetTable.value
          : this.targetTable,
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('rowId: $rowId, ')
          ..write('operation: $operation, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    targetTable,
    rowId,
    operation,
    payloadJson,
    retryCount,
    createdAt,
    lastAttemptAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.targetTable == this.targetTable &&
          other.rowId == this.rowId &&
          other.operation == this.operation &&
          other.payloadJson == this.payloadJson &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<String> id;
  final Value<String> targetTable;
  final Value<String> rowId;
  final Value<String> operation;
  final Value<String> payloadJson;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastAttemptAt;
  final Value<int> rowid;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.targetTable = const Value.absent(),
    this.rowId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required String id,
    required String targetTable,
    required String rowId,
    required String operation,
    required String payloadJson,
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
    this.lastAttemptAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       targetTable = Value(targetTable),
       rowId = Value(rowId),
       operation = Value(operation),
       payloadJson = Value(payloadJson),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<String>? id,
    Expression<String>? targetTable,
    Expression<String>? rowId,
    Expression<String>? operation,
    Expression<String>? payloadJson,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastAttemptAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetTable != null) 'target_table': targetTable,
      if (rowId != null) 'row_id': rowId,
      if (operation != null) 'operation': operation,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueCompanion copyWith({
    Value<String>? id,
    Value<String>? targetTable,
    Value<String>? rowId,
    Value<String>? operation,
    Value<String>? payloadJson,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastAttemptAt,
    Value<int>? rowid,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      targetTable: targetTable ?? this.targetTable,
      rowId: rowId ?? this.rowId,
      operation: operation ?? this.operation,
      payloadJson: payloadJson ?? this.payloadJson,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (targetTable.present) {
      map['target_table'] = Variable<String>(targetTable.value);
    }
    if (rowId.present) {
      map['row_id'] = Variable<String>(rowId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('rowId: $rowId, ')
          ..write('operation: $operation, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $PlanCategoriesTable planCategories = $PlanCategoriesTable(this);
  late final $PlanTagsTable planTags = $PlanTagsTable(this);
  late final $PlansTable plans = $PlansTable(this);
  late final $PlanTagLinksTable planTagLinks = $PlanTagLinksTable(this);
  late final $PlanStatusHistoryTable planStatusHistory =
      $PlanStatusHistoryTable(this);
  late final $StreakSnapshotsTable streakSnapshots = $StreakSnapshotsTable(
    this,
  );
  late final $HistoricalFiguresTable historicalFigures =
      $HistoricalFiguresTable(this);
  late final $FigureDomainsTable figureDomains = $FigureDomainsTable(this);
  late final $HistoricalFigureDomainsTable historicalFigureDomains =
      $HistoricalFigureDomainsTable(this);
  late final $QuoteSourcesTable quoteSources = $QuoteSourcesTable(this);
  late final $QuotesTable quotes = $QuotesTable(this);
  late final $QuoteTagsTable quoteTags = $QuoteTagsTable(this);
  late final $QuoteTagLinksTable quoteTagLinks = $QuoteTagLinksTable(this);
  late final $WisdomRuleWeightsTable wisdomRuleWeights =
      $WisdomRuleWeightsTable(this);
  late final $WisdomSynonymsTable wisdomSynonyms = $WisdomSynonymsTable(this);
  late final $WisdomKeywordMapTable wisdomKeywordMap = $WisdomKeywordMapTable(
    this,
  );
  late final $QuoteUsageHistoryTable quoteUsageHistory =
      $QuoteUsageHistoryTable(this);
  late final $DecisionLogsTable decisionLogs = $DecisionLogsTable(this);
  late final $DecisionLogCandidatesTable decisionLogCandidates =
      $DecisionLogCandidatesTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final PlansDao plansDao = PlansDao(this as AppDatabase);
  late final WisdomDao wisdomDao = WisdomDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    planCategories,
    planTags,
    plans,
    planTagLinks,
    planStatusHistory,
    streakSnapshots,
    historicalFigures,
    figureDomains,
    historicalFigureDomains,
    quoteSources,
    quotes,
    quoteTags,
    quoteTagLinks,
    wisdomRuleWeights,
    wisdomSynonyms,
    wisdomKeywordMap,
    quoteUsageHistory,
    decisionLogs,
    decisionLogCandidates,
    notifications,
    syncQueue,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      Value<String> displayName,
      Value<String?> email,
      Value<String> preferredTone,
      Value<String> preferredLocale,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> version,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<String?> email,
      Value<String> preferredTone,
      Value<String> preferredLocale,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> version,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preferredTone => $composableBuilder(
    column: $table.preferredTone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preferredLocale => $composableBuilder(
    column: $table.preferredLocale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preferredTone => $composableBuilder(
    column: $table.preferredTone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preferredLocale => $composableBuilder(
    column: $table.preferredLocale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get preferredTone => $composableBuilder(
    column: $table.preferredTone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get preferredLocale => $composableBuilder(
    column: $table.preferredLocale,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> preferredTone = const Value.absent(),
                Value<String> preferredLocale = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                email: email,
                preferredTone: preferredTone,
                preferredLocale: preferredLocale,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                version: version,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> preferredTone = const Value.absent(),
                Value<String> preferredLocale = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                email: email,
                preferredTone: preferredTone,
                preferredLocale: preferredLocale,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                version: version,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$PlanCategoriesTableCreateCompanionBuilder =
    PlanCategoriesCompanion Function({
      required String id,
      required String slug,
      required String name,
      Value<String> iconKey,
      Value<String> colorKey,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PlanCategoriesTableUpdateCompanionBuilder =
    PlanCategoriesCompanion Function({
      Value<String> id,
      Value<String> slug,
      Value<String> name,
      Value<String> iconKey,
      Value<String> colorKey,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PlanCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $PlanCategoriesTable> {
  $$PlanCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanCategoriesTable> {
  $$PlanCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorKey => $composableBuilder(
    column: $table.colorKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanCategoriesTable> {
  $$PlanCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<String> get colorKey =>
      $composableBuilder(column: $table.colorKey, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PlanCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanCategoriesTable,
          PlanCategory,
          $$PlanCategoriesTableFilterComposer,
          $$PlanCategoriesTableOrderingComposer,
          $$PlanCategoriesTableAnnotationComposer,
          $$PlanCategoriesTableCreateCompanionBuilder,
          $$PlanCategoriesTableUpdateCompanionBuilder,
          (
            PlanCategory,
            BaseReferences<_$AppDatabase, $PlanCategoriesTable, PlanCategory>,
          ),
          PlanCategory,
          PrefetchHooks Function()
        > {
  $$PlanCategoriesTableTableManager(
    _$AppDatabase db,
    $PlanCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<String> colorKey = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanCategoriesCompanion(
                id: id,
                slug: slug,
                name: name,
                iconKey: iconKey,
                colorKey: colorKey,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String slug,
                required String name,
                Value<String> iconKey = const Value.absent(),
                Value<String> colorKey = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PlanCategoriesCompanion.insert(
                id: id,
                slug: slug,
                name: name,
                iconKey: iconKey,
                colorKey: colorKey,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanCategoriesTable,
      PlanCategory,
      $$PlanCategoriesTableFilterComposer,
      $$PlanCategoriesTableOrderingComposer,
      $$PlanCategoriesTableAnnotationComposer,
      $$PlanCategoriesTableCreateCompanionBuilder,
      $$PlanCategoriesTableUpdateCompanionBuilder,
      (
        PlanCategory,
        BaseReferences<_$AppDatabase, $PlanCategoriesTable, PlanCategory>,
      ),
      PlanCategory,
      PrefetchHooks Function()
    >;
typedef $$PlanTagsTableCreateCompanionBuilder =
    PlanTagsCompanion Function({
      required String id,
      required String userId,
      required String label,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PlanTagsTableUpdateCompanionBuilder =
    PlanTagsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> label,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PlanTagsTableFilterComposer
    extends Composer<_$AppDatabase, $PlanTagsTable> {
  $$PlanTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanTagsTable> {
  $$PlanTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanTagsTable> {
  $$PlanTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlanTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanTagsTable,
          PlanTag,
          $$PlanTagsTableFilterComposer,
          $$PlanTagsTableOrderingComposer,
          $$PlanTagsTableAnnotationComposer,
          $$PlanTagsTableCreateCompanionBuilder,
          $$PlanTagsTableUpdateCompanionBuilder,
          (PlanTag, BaseReferences<_$AppDatabase, $PlanTagsTable, PlanTag>),
          PlanTag,
          PrefetchHooks Function()
        > {
  $$PlanTagsTableTableManager(_$AppDatabase db, $PlanTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanTagsCompanion(
                id: id,
                userId: userId,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String label,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PlanTagsCompanion.insert(
                id: id,
                userId: userId,
                label: label,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanTagsTable,
      PlanTag,
      $$PlanTagsTableFilterComposer,
      $$PlanTagsTableOrderingComposer,
      $$PlanTagsTableAnnotationComposer,
      $$PlanTagsTableCreateCompanionBuilder,
      $$PlanTagsTableUpdateCompanionBuilder,
      (PlanTag, BaseReferences<_$AppDatabase, $PlanTagsTable, PlanTag>),
      PlanTag,
      PrefetchHooks Function()
    >;
typedef $$PlansTableCreateCompanionBuilder =
    PlansCompanion Function({
      required String id,
      required String userId,
      required String title,
      Value<String> description,
      required DateTime scheduledDate,
      required String scheduledTimeLocal,
      Value<String> scheduledTimezone,
      required DateTime scheduledAtUtc,
      Value<int?> durationMinutes,
      Value<String?> categoryId,
      Value<String> priority,
      Value<String> status,
      Value<bool> reminderEnabled,
      Value<String?> reminderTimeLocal,
      Value<DateTime?> reminderAtUtc,
      Value<int> postponedCount,
      Value<String?> motivationContextSnapshot,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> completedAt,
      Value<DateTime?> deletedAt,
      Value<int> version,
      Value<int> rowid,
    });
typedef $$PlansTableUpdateCompanionBuilder =
    PlansCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> title,
      Value<String> description,
      Value<DateTime> scheduledDate,
      Value<String> scheduledTimeLocal,
      Value<String> scheduledTimezone,
      Value<DateTime> scheduledAtUtc,
      Value<int?> durationMinutes,
      Value<String?> categoryId,
      Value<String> priority,
      Value<String> status,
      Value<bool> reminderEnabled,
      Value<String?> reminderTimeLocal,
      Value<DateTime?> reminderAtUtc,
      Value<int> postponedCount,
      Value<String?> motivationContextSnapshot,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> completedAt,
      Value<DateTime?> deletedAt,
      Value<int> version,
      Value<int> rowid,
    });

class $$PlansTableFilterComposer extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduledTimeLocal => $composableBuilder(
    column: $table.scheduledTimeLocal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduledTimezone => $composableBuilder(
    column: $table.scheduledTimezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAtUtc => $composableBuilder(
    column: $table.scheduledAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderTimeLocal => $composableBuilder(
    column: $table.reminderTimeLocal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reminderAtUtc => $composableBuilder(
    column: $table.reminderAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get postponedCount => $composableBuilder(
    column: $table.postponedCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motivationContextSnapshot => $composableBuilder(
    column: $table.motivationContextSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduledTimeLocal => $composableBuilder(
    column: $table.scheduledTimeLocal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduledTimezone => $composableBuilder(
    column: $table.scheduledTimezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAtUtc => $composableBuilder(
    column: $table.scheduledAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderTimeLocal => $composableBuilder(
    column: $table.reminderTimeLocal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reminderAtUtc => $composableBuilder(
    column: $table.reminderAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get postponedCount => $composableBuilder(
    column: $table.postponedCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motivationContextSnapshot => $composableBuilder(
    column: $table.motivationContextSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledDate => $composableBuilder(
    column: $table.scheduledDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scheduledTimeLocal => $composableBuilder(
    column: $table.scheduledTimeLocal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scheduledTimezone => $composableBuilder(
    column: $table.scheduledTimezone,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAtUtc => $composableBuilder(
    column: $table.scheduledAtUtc,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reminderTimeLocal => $composableBuilder(
    column: $table.reminderTimeLocal,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get reminderAtUtc => $composableBuilder(
    column: $table.reminderAtUtc,
    builder: (column) => column,
  );

  GeneratedColumn<int> get postponedCount => $composableBuilder(
    column: $table.postponedCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get motivationContextSnapshot => $composableBuilder(
    column: $table.motivationContextSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$PlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlansTable,
          Plan,
          $$PlansTableFilterComposer,
          $$PlansTableOrderingComposer,
          $$PlansTableAnnotationComposer,
          $$PlansTableCreateCompanionBuilder,
          $$PlansTableUpdateCompanionBuilder,
          (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
          Plan,
          PrefetchHooks Function()
        > {
  $$PlansTableTableManager(_$AppDatabase db, $PlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> scheduledDate = const Value.absent(),
                Value<String> scheduledTimeLocal = const Value.absent(),
                Value<String> scheduledTimezone = const Value.absent(),
                Value<DateTime> scheduledAtUtc = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> reminderEnabled = const Value.absent(),
                Value<String?> reminderTimeLocal = const Value.absent(),
                Value<DateTime?> reminderAtUtc = const Value.absent(),
                Value<int> postponedCount = const Value.absent(),
                Value<String?> motivationContextSnapshot = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlansCompanion(
                id: id,
                userId: userId,
                title: title,
                description: description,
                scheduledDate: scheduledDate,
                scheduledTimeLocal: scheduledTimeLocal,
                scheduledTimezone: scheduledTimezone,
                scheduledAtUtc: scheduledAtUtc,
                durationMinutes: durationMinutes,
                categoryId: categoryId,
                priority: priority,
                status: status,
                reminderEnabled: reminderEnabled,
                reminderTimeLocal: reminderTimeLocal,
                reminderAtUtc: reminderAtUtc,
                postponedCount: postponedCount,
                motivationContextSnapshot: motivationContextSnapshot,
                createdAt: createdAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                deletedAt: deletedAt,
                version: version,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String title,
                Value<String> description = const Value.absent(),
                required DateTime scheduledDate,
                required String scheduledTimeLocal,
                Value<String> scheduledTimezone = const Value.absent(),
                required DateTime scheduledAtUtc,
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> reminderEnabled = const Value.absent(),
                Value<String?> reminderTimeLocal = const Value.absent(),
                Value<DateTime?> reminderAtUtc = const Value.absent(),
                Value<int> postponedCount = const Value.absent(),
                Value<String?> motivationContextSnapshot = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlansCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                description: description,
                scheduledDate: scheduledDate,
                scheduledTimeLocal: scheduledTimeLocal,
                scheduledTimezone: scheduledTimezone,
                scheduledAtUtc: scheduledAtUtc,
                durationMinutes: durationMinutes,
                categoryId: categoryId,
                priority: priority,
                status: status,
                reminderEnabled: reminderEnabled,
                reminderTimeLocal: reminderTimeLocal,
                reminderAtUtc: reminderAtUtc,
                postponedCount: postponedCount,
                motivationContextSnapshot: motivationContextSnapshot,
                createdAt: createdAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                deletedAt: deletedAt,
                version: version,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlansTable,
      Plan,
      $$PlansTableFilterComposer,
      $$PlansTableOrderingComposer,
      $$PlansTableAnnotationComposer,
      $$PlansTableCreateCompanionBuilder,
      $$PlansTableUpdateCompanionBuilder,
      (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
      Plan,
      PrefetchHooks Function()
    >;
typedef $$PlanTagLinksTableCreateCompanionBuilder =
    PlanTagLinksCompanion Function({
      required String planId,
      required String tagId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PlanTagLinksTableUpdateCompanionBuilder =
    PlanTagLinksCompanion Function({
      Value<String> planId,
      Value<String> tagId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PlanTagLinksTableFilterComposer
    extends Composer<_$AppDatabase, $PlanTagLinksTable> {
  $$PlanTagLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanTagLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanTagLinksTable> {
  $$PlanTagLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanTagLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanTagLinksTable> {
  $$PlanTagLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlanTagLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanTagLinksTable,
          PlanTagLink,
          $$PlanTagLinksTableFilterComposer,
          $$PlanTagLinksTableOrderingComposer,
          $$PlanTagLinksTableAnnotationComposer,
          $$PlanTagLinksTableCreateCompanionBuilder,
          $$PlanTagLinksTableUpdateCompanionBuilder,
          (
            PlanTagLink,
            BaseReferences<_$AppDatabase, $PlanTagLinksTable, PlanTagLink>,
          ),
          PlanTagLink,
          PrefetchHooks Function()
        > {
  $$PlanTagLinksTableTableManager(_$AppDatabase db, $PlanTagLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanTagLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanTagLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanTagLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> planId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanTagLinksCompanion(
                planId: planId,
                tagId: tagId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String planId,
                required String tagId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PlanTagLinksCompanion.insert(
                planId: planId,
                tagId: tagId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanTagLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanTagLinksTable,
      PlanTagLink,
      $$PlanTagLinksTableFilterComposer,
      $$PlanTagLinksTableOrderingComposer,
      $$PlanTagLinksTableAnnotationComposer,
      $$PlanTagLinksTableCreateCompanionBuilder,
      $$PlanTagLinksTableUpdateCompanionBuilder,
      (
        PlanTagLink,
        BaseReferences<_$AppDatabase, $PlanTagLinksTable, PlanTagLink>,
      ),
      PlanTagLink,
      PrefetchHooks Function()
    >;
typedef $$PlanStatusHistoryTableCreateCompanionBuilder =
    PlanStatusHistoryCompanion Function({
      required String id,
      required String planId,
      required String userId,
      Value<String?> fromStatus,
      required String toStatus,
      Value<String?> changeReason,
      Value<String?> metadataJson,
      required DateTime changedAt,
      Value<int> rowid,
    });
typedef $$PlanStatusHistoryTableUpdateCompanionBuilder =
    PlanStatusHistoryCompanion Function({
      Value<String> id,
      Value<String> planId,
      Value<String> userId,
      Value<String?> fromStatus,
      Value<String> toStatus,
      Value<String?> changeReason,
      Value<String?> metadataJson,
      Value<DateTime> changedAt,
      Value<int> rowid,
    });

class $$PlanStatusHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $PlanStatusHistoryTable> {
  $$PlanStatusHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toStatus => $composableBuilder(
    column: $table.toStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get changedAt => $composableBuilder(
    column: $table.changedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanStatusHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanStatusHistoryTable> {
  $$PlanStatusHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toStatus => $composableBuilder(
    column: $table.toStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get changedAt => $composableBuilder(
    column: $table.changedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanStatusHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanStatusHistoryTable> {
  $$PlanStatusHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toStatus =>
      $composableBuilder(column: $table.toStatus, builder: (column) => column);

  GeneratedColumn<String> get changeReason => $composableBuilder(
    column: $table.changeReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get changedAt =>
      $composableBuilder(column: $table.changedAt, builder: (column) => column);
}

class $$PlanStatusHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanStatusHistoryTable,
          PlanStatusHistoryData,
          $$PlanStatusHistoryTableFilterComposer,
          $$PlanStatusHistoryTableOrderingComposer,
          $$PlanStatusHistoryTableAnnotationComposer,
          $$PlanStatusHistoryTableCreateCompanionBuilder,
          $$PlanStatusHistoryTableUpdateCompanionBuilder,
          (
            PlanStatusHistoryData,
            BaseReferences<
              _$AppDatabase,
              $PlanStatusHistoryTable,
              PlanStatusHistoryData
            >,
          ),
          PlanStatusHistoryData,
          PrefetchHooks Function()
        > {
  $$PlanStatusHistoryTableTableManager(
    _$AppDatabase db,
    $PlanStatusHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanStatusHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanStatusHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanStatusHistoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> fromStatus = const Value.absent(),
                Value<String> toStatus = const Value.absent(),
                Value<String?> changeReason = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                Value<DateTime> changedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanStatusHistoryCompanion(
                id: id,
                planId: planId,
                userId: userId,
                fromStatus: fromStatus,
                toStatus: toStatus,
                changeReason: changeReason,
                metadataJson: metadataJson,
                changedAt: changedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String planId,
                required String userId,
                Value<String?> fromStatus = const Value.absent(),
                required String toStatus,
                Value<String?> changeReason = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                required DateTime changedAt,
                Value<int> rowid = const Value.absent(),
              }) => PlanStatusHistoryCompanion.insert(
                id: id,
                planId: planId,
                userId: userId,
                fromStatus: fromStatus,
                toStatus: toStatus,
                changeReason: changeReason,
                metadataJson: metadataJson,
                changedAt: changedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanStatusHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanStatusHistoryTable,
      PlanStatusHistoryData,
      $$PlanStatusHistoryTableFilterComposer,
      $$PlanStatusHistoryTableOrderingComposer,
      $$PlanStatusHistoryTableAnnotationComposer,
      $$PlanStatusHistoryTableCreateCompanionBuilder,
      $$PlanStatusHistoryTableUpdateCompanionBuilder,
      (
        PlanStatusHistoryData,
        BaseReferences<
          _$AppDatabase,
          $PlanStatusHistoryTable,
          PlanStatusHistoryData
        >,
      ),
      PlanStatusHistoryData,
      PrefetchHooks Function()
    >;
typedef $$StreakSnapshotsTableCreateCompanionBuilder =
    StreakSnapshotsCompanion Function({
      required String id,
      required String userId,
      required DateTime snapshotDate,
      Value<int> completedCount,
      Value<int> totalCount,
      Value<int> currentStreak,
      Value<int> longestStreak,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$StreakSnapshotsTableUpdateCompanionBuilder =
    StreakSnapshotsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> snapshotDate,
      Value<int> completedCount,
      Value<int> totalCount,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$StreakSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $StreakSnapshotsTable> {
  $$StreakSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedCount => $composableBuilder(
    column: $table.completedCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCount => $composableBuilder(
    column: $table.totalCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StreakSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $StreakSnapshotsTable> {
  $$StreakSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedCount => $composableBuilder(
    column: $table.completedCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCount => $composableBuilder(
    column: $table.totalCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StreakSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreakSnapshotsTable> {
  $$StreakSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get snapshotDate => $composableBuilder(
    column: $table.snapshotDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedCount => $composableBuilder(
    column: $table.completedCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCount => $composableBuilder(
    column: $table.totalCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StreakSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreakSnapshotsTable,
          StreakSnapshot,
          $$StreakSnapshotsTableFilterComposer,
          $$StreakSnapshotsTableOrderingComposer,
          $$StreakSnapshotsTableAnnotationComposer,
          $$StreakSnapshotsTableCreateCompanionBuilder,
          $$StreakSnapshotsTableUpdateCompanionBuilder,
          (
            StreakSnapshot,
            BaseReferences<
              _$AppDatabase,
              $StreakSnapshotsTable,
              StreakSnapshot
            >,
          ),
          StreakSnapshot,
          PrefetchHooks Function()
        > {
  $$StreakSnapshotsTableTableManager(
    _$AppDatabase db,
    $StreakSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreakSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreakSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreakSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> snapshotDate = const Value.absent(),
                Value<int> completedCount = const Value.absent(),
                Value<int> totalCount = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StreakSnapshotsCompanion(
                id: id,
                userId: userId,
                snapshotDate: snapshotDate,
                completedCount: completedCount,
                totalCount: totalCount,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime snapshotDate,
                Value<int> completedCount = const Value.absent(),
                Value<int> totalCount = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StreakSnapshotsCompanion.insert(
                id: id,
                userId: userId,
                snapshotDate: snapshotDate,
                completedCount: completedCount,
                totalCount: totalCount,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StreakSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreakSnapshotsTable,
      StreakSnapshot,
      $$StreakSnapshotsTableFilterComposer,
      $$StreakSnapshotsTableOrderingComposer,
      $$StreakSnapshotsTableAnnotationComposer,
      $$StreakSnapshotsTableCreateCompanionBuilder,
      $$StreakSnapshotsTableUpdateCompanionBuilder,
      (
        StreakSnapshot,
        BaseReferences<_$AppDatabase, $StreakSnapshotsTable, StreakSnapshot>,
      ),
      StreakSnapshot,
      PrefetchHooks Function()
    >;
typedef $$HistoricalFiguresTableCreateCompanionBuilder =
    HistoricalFiguresCompanion Function({
      required String id,
      required String name,
      Value<String?> era,
      Value<String?> shortBio,
      Value<String?> imageUrl,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$HistoricalFiguresTableUpdateCompanionBuilder =
    HistoricalFiguresCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> era,
      Value<String?> shortBio,
      Value<String?> imageUrl,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$HistoricalFiguresTableFilterComposer
    extends Composer<_$AppDatabase, $HistoricalFiguresTable> {
  $$HistoricalFiguresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get era => $composableBuilder(
    column: $table.era,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortBio => $composableBuilder(
    column: $table.shortBio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoricalFiguresTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoricalFiguresTable> {
  $$HistoricalFiguresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get era => $composableBuilder(
    column: $table.era,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortBio => $composableBuilder(
    column: $table.shortBio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoricalFiguresTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoricalFiguresTable> {
  $$HistoricalFiguresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get era =>
      $composableBuilder(column: $table.era, builder: (column) => column);

  GeneratedColumn<String> get shortBio =>
      $composableBuilder(column: $table.shortBio, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HistoricalFiguresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoricalFiguresTable,
          HistoricalFigure,
          $$HistoricalFiguresTableFilterComposer,
          $$HistoricalFiguresTableOrderingComposer,
          $$HistoricalFiguresTableAnnotationComposer,
          $$HistoricalFiguresTableCreateCompanionBuilder,
          $$HistoricalFiguresTableUpdateCompanionBuilder,
          (
            HistoricalFigure,
            BaseReferences<
              _$AppDatabase,
              $HistoricalFiguresTable,
              HistoricalFigure
            >,
          ),
          HistoricalFigure,
          PrefetchHooks Function()
        > {
  $$HistoricalFiguresTableTableManager(
    _$AppDatabase db,
    $HistoricalFiguresTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoricalFiguresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoricalFiguresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoricalFiguresTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> era = const Value.absent(),
                Value<String?> shortBio = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HistoricalFiguresCompanion(
                id: id,
                name: name,
                era: era,
                shortBio: shortBio,
                imageUrl: imageUrl,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> era = const Value.absent(),
                Value<String?> shortBio = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => HistoricalFiguresCompanion.insert(
                id: id,
                name: name,
                era: era,
                shortBio: shortBio,
                imageUrl: imageUrl,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoricalFiguresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoricalFiguresTable,
      HistoricalFigure,
      $$HistoricalFiguresTableFilterComposer,
      $$HistoricalFiguresTableOrderingComposer,
      $$HistoricalFiguresTableAnnotationComposer,
      $$HistoricalFiguresTableCreateCompanionBuilder,
      $$HistoricalFiguresTableUpdateCompanionBuilder,
      (
        HistoricalFigure,
        BaseReferences<
          _$AppDatabase,
          $HistoricalFiguresTable,
          HistoricalFigure
        >,
      ),
      HistoricalFigure,
      PrefetchHooks Function()
    >;
typedef $$FigureDomainsTableCreateCompanionBuilder =
    FigureDomainsCompanion Function({
      required String id,
      required String name,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FigureDomainsTableUpdateCompanionBuilder =
    FigureDomainsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FigureDomainsTableFilterComposer
    extends Composer<_$AppDatabase, $FigureDomainsTable> {
  $$FigureDomainsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FigureDomainsTableOrderingComposer
    extends Composer<_$AppDatabase, $FigureDomainsTable> {
  $$FigureDomainsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FigureDomainsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FigureDomainsTable> {
  $$FigureDomainsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FigureDomainsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FigureDomainsTable,
          FigureDomain,
          $$FigureDomainsTableFilterComposer,
          $$FigureDomainsTableOrderingComposer,
          $$FigureDomainsTableAnnotationComposer,
          $$FigureDomainsTableCreateCompanionBuilder,
          $$FigureDomainsTableUpdateCompanionBuilder,
          (
            FigureDomain,
            BaseReferences<_$AppDatabase, $FigureDomainsTable, FigureDomain>,
          ),
          FigureDomain,
          PrefetchHooks Function()
        > {
  $$FigureDomainsTableTableManager(_$AppDatabase db, $FigureDomainsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FigureDomainsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FigureDomainsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FigureDomainsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FigureDomainsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FigureDomainsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FigureDomainsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FigureDomainsTable,
      FigureDomain,
      $$FigureDomainsTableFilterComposer,
      $$FigureDomainsTableOrderingComposer,
      $$FigureDomainsTableAnnotationComposer,
      $$FigureDomainsTableCreateCompanionBuilder,
      $$FigureDomainsTableUpdateCompanionBuilder,
      (
        FigureDomain,
        BaseReferences<_$AppDatabase, $FigureDomainsTable, FigureDomain>,
      ),
      FigureDomain,
      PrefetchHooks Function()
    >;
typedef $$HistoricalFigureDomainsTableCreateCompanionBuilder =
    HistoricalFigureDomainsCompanion Function({
      required String figureId,
      required String domainId,
      Value<int> rowid,
    });
typedef $$HistoricalFigureDomainsTableUpdateCompanionBuilder =
    HistoricalFigureDomainsCompanion Function({
      Value<String> figureId,
      Value<String> domainId,
      Value<int> rowid,
    });

class $$HistoricalFigureDomainsTableFilterComposer
    extends Composer<_$AppDatabase, $HistoricalFigureDomainsTable> {
  $$HistoricalFigureDomainsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get figureId => $composableBuilder(
    column: $table.figureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domainId => $composableBuilder(
    column: $table.domainId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoricalFigureDomainsTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoricalFigureDomainsTable> {
  $$HistoricalFigureDomainsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get figureId => $composableBuilder(
    column: $table.figureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domainId => $composableBuilder(
    column: $table.domainId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoricalFigureDomainsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoricalFigureDomainsTable> {
  $$HistoricalFigureDomainsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get figureId =>
      $composableBuilder(column: $table.figureId, builder: (column) => column);

  GeneratedColumn<String> get domainId =>
      $composableBuilder(column: $table.domainId, builder: (column) => column);
}

class $$HistoricalFigureDomainsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoricalFigureDomainsTable,
          HistoricalFigureDomain,
          $$HistoricalFigureDomainsTableFilterComposer,
          $$HistoricalFigureDomainsTableOrderingComposer,
          $$HistoricalFigureDomainsTableAnnotationComposer,
          $$HistoricalFigureDomainsTableCreateCompanionBuilder,
          $$HistoricalFigureDomainsTableUpdateCompanionBuilder,
          (
            HistoricalFigureDomain,
            BaseReferences<
              _$AppDatabase,
              $HistoricalFigureDomainsTable,
              HistoricalFigureDomain
            >,
          ),
          HistoricalFigureDomain,
          PrefetchHooks Function()
        > {
  $$HistoricalFigureDomainsTableTableManager(
    _$AppDatabase db,
    $HistoricalFigureDomainsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoricalFigureDomainsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HistoricalFigureDomainsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HistoricalFigureDomainsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> figureId = const Value.absent(),
                Value<String> domainId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HistoricalFigureDomainsCompanion(
                figureId: figureId,
                domainId: domainId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String figureId,
                required String domainId,
                Value<int> rowid = const Value.absent(),
              }) => HistoricalFigureDomainsCompanion.insert(
                figureId: figureId,
                domainId: domainId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoricalFigureDomainsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoricalFigureDomainsTable,
      HistoricalFigureDomain,
      $$HistoricalFigureDomainsTableFilterComposer,
      $$HistoricalFigureDomainsTableOrderingComposer,
      $$HistoricalFigureDomainsTableAnnotationComposer,
      $$HistoricalFigureDomainsTableCreateCompanionBuilder,
      $$HistoricalFigureDomainsTableUpdateCompanionBuilder,
      (
        HistoricalFigureDomain,
        BaseReferences<
          _$AppDatabase,
          $HistoricalFigureDomainsTable,
          HistoricalFigureDomain
        >,
      ),
      HistoricalFigureDomain,
      PrefetchHooks Function()
    >;
typedef $$QuoteSourcesTableCreateCompanionBuilder =
    QuoteSourcesCompanion Function({
      required String id,
      required String name,
      Value<String> sourceType,
      Value<String?> url,
      Value<bool> isTrusted,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$QuoteSourcesTableUpdateCompanionBuilder =
    QuoteSourcesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> sourceType,
      Value<String?> url,
      Value<bool> isTrusted,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$QuoteSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $QuoteSourcesTable> {
  $$QuoteSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTrusted => $composableBuilder(
    column: $table.isTrusted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuoteSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuoteSourcesTable> {
  $$QuoteSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTrusted => $composableBuilder(
    column: $table.isTrusted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuoteSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuoteSourcesTable> {
  $$QuoteSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<bool> get isTrusted =>
      $composableBuilder(column: $table.isTrusted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$QuoteSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuoteSourcesTable,
          QuoteSource,
          $$QuoteSourcesTableFilterComposer,
          $$QuoteSourcesTableOrderingComposer,
          $$QuoteSourcesTableAnnotationComposer,
          $$QuoteSourcesTableCreateCompanionBuilder,
          $$QuoteSourcesTableUpdateCompanionBuilder,
          (
            QuoteSource,
            BaseReferences<_$AppDatabase, $QuoteSourcesTable, QuoteSource>,
          ),
          QuoteSource,
          PrefetchHooks Function()
        > {
  $$QuoteSourcesTableTableManager(_$AppDatabase db, $QuoteSourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuoteSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuoteSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuoteSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<bool> isTrusted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuoteSourcesCompanion(
                id: id,
                name: name,
                sourceType: sourceType,
                url: url,
                isTrusted: isTrusted,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> sourceType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<bool> isTrusted = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => QuoteSourcesCompanion.insert(
                id: id,
                name: name,
                sourceType: sourceType,
                url: url,
                isTrusted: isTrusted,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuoteSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuoteSourcesTable,
      QuoteSource,
      $$QuoteSourcesTableFilterComposer,
      $$QuoteSourcesTableOrderingComposer,
      $$QuoteSourcesTableAnnotationComposer,
      $$QuoteSourcesTableCreateCompanionBuilder,
      $$QuoteSourcesTableUpdateCompanionBuilder,
      (
        QuoteSource,
        BaseReferences<_$AppDatabase, $QuoteSourcesTable, QuoteSource>,
      ),
      QuoteSource,
      PrefetchHooks Function()
    >;
typedef $$QuotesTableCreateCompanionBuilder =
    QuotesCompanion Function({
      required String id,
      required String quoteText,
      required String figureId,
      Value<String?> sourceId,
      Value<String> languageCode,
      Value<String> trustStatus,
      Value<double> attributionConfidence,
      Value<String> tone,
      Value<int> usageFrequencyCap,
      Value<String?> sensitivityNotes,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$QuotesTableUpdateCompanionBuilder =
    QuotesCompanion Function({
      Value<String> id,
      Value<String> quoteText,
      Value<String> figureId,
      Value<String?> sourceId,
      Value<String> languageCode,
      Value<String> trustStatus,
      Value<double> attributionConfidence,
      Value<String> tone,
      Value<int> usageFrequencyCap,
      Value<String?> sensitivityNotes,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$QuotesTableFilterComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteText => $composableBuilder(
    column: $table.quoteText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get figureId => $composableBuilder(
    column: $table.figureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trustStatus => $composableBuilder(
    column: $table.trustStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get attributionConfidence => $composableBuilder(
    column: $table.attributionConfidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tone => $composableBuilder(
    column: $table.tone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageFrequencyCap => $composableBuilder(
    column: $table.usageFrequencyCap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sensitivityNotes => $composableBuilder(
    column: $table.sensitivityNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuotesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteText => $composableBuilder(
    column: $table.quoteText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get figureId => $composableBuilder(
    column: $table.figureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trustStatus => $composableBuilder(
    column: $table.trustStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get attributionConfidence => $composableBuilder(
    column: $table.attributionConfidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tone => $composableBuilder(
    column: $table.tone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageFrequencyCap => $composableBuilder(
    column: $table.usageFrequencyCap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sensitivityNotes => $composableBuilder(
    column: $table.sensitivityNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotesTable> {
  $$QuotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quoteText =>
      $composableBuilder(column: $table.quoteText, builder: (column) => column);

  GeneratedColumn<String> get figureId =>
      $composableBuilder(column: $table.figureId, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trustStatus => $composableBuilder(
    column: $table.trustStatus,
    builder: (column) => column,
  );

  GeneratedColumn<double> get attributionConfidence => $composableBuilder(
    column: $table.attributionConfidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tone =>
      $composableBuilder(column: $table.tone, builder: (column) => column);

  GeneratedColumn<int> get usageFrequencyCap => $composableBuilder(
    column: $table.usageFrequencyCap,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sensitivityNotes => $composableBuilder(
    column: $table.sensitivityNotes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$QuotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuotesTable,
          Quote,
          $$QuotesTableFilterComposer,
          $$QuotesTableOrderingComposer,
          $$QuotesTableAnnotationComposer,
          $$QuotesTableCreateCompanionBuilder,
          $$QuotesTableUpdateCompanionBuilder,
          (Quote, BaseReferences<_$AppDatabase, $QuotesTable, Quote>),
          Quote,
          PrefetchHooks Function()
        > {
  $$QuotesTableTableManager(_$AppDatabase db, $QuotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> quoteText = const Value.absent(),
                Value<String> figureId = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> trustStatus = const Value.absent(),
                Value<double> attributionConfidence = const Value.absent(),
                Value<String> tone = const Value.absent(),
                Value<int> usageFrequencyCap = const Value.absent(),
                Value<String?> sensitivityNotes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuotesCompanion(
                id: id,
                quoteText: quoteText,
                figureId: figureId,
                sourceId: sourceId,
                languageCode: languageCode,
                trustStatus: trustStatus,
                attributionConfidence: attributionConfidence,
                tone: tone,
                usageFrequencyCap: usageFrequencyCap,
                sensitivityNotes: sensitivityNotes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String quoteText,
                required String figureId,
                Value<String?> sourceId = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> trustStatus = const Value.absent(),
                Value<double> attributionConfidence = const Value.absent(),
                Value<String> tone = const Value.absent(),
                Value<int> usageFrequencyCap = const Value.absent(),
                Value<String?> sensitivityNotes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => QuotesCompanion.insert(
                id: id,
                quoteText: quoteText,
                figureId: figureId,
                sourceId: sourceId,
                languageCode: languageCode,
                trustStatus: trustStatus,
                attributionConfidence: attributionConfidence,
                tone: tone,
                usageFrequencyCap: usageFrequencyCap,
                sensitivityNotes: sensitivityNotes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuotesTable,
      Quote,
      $$QuotesTableFilterComposer,
      $$QuotesTableOrderingComposer,
      $$QuotesTableAnnotationComposer,
      $$QuotesTableCreateCompanionBuilder,
      $$QuotesTableUpdateCompanionBuilder,
      (Quote, BaseReferences<_$AppDatabase, $QuotesTable, Quote>),
      Quote,
      PrefetchHooks Function()
    >;
typedef $$QuoteTagsTableCreateCompanionBuilder =
    QuoteTagsCompanion Function({
      required String id,
      required String slug,
      required String name,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$QuoteTagsTableUpdateCompanionBuilder =
    QuoteTagsCompanion Function({
      Value<String> id,
      Value<String> slug,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$QuoteTagsTableFilterComposer
    extends Composer<_$AppDatabase, $QuoteTagsTable> {
  $$QuoteTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuoteTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuoteTagsTable> {
  $$QuoteTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuoteTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuoteTagsTable> {
  $$QuoteTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$QuoteTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuoteTagsTable,
          QuoteTag,
          $$QuoteTagsTableFilterComposer,
          $$QuoteTagsTableOrderingComposer,
          $$QuoteTagsTableAnnotationComposer,
          $$QuoteTagsTableCreateCompanionBuilder,
          $$QuoteTagsTableUpdateCompanionBuilder,
          (QuoteTag, BaseReferences<_$AppDatabase, $QuoteTagsTable, QuoteTag>),
          QuoteTag,
          PrefetchHooks Function()
        > {
  $$QuoteTagsTableTableManager(_$AppDatabase db, $QuoteTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuoteTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuoteTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuoteTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuoteTagsCompanion(
                id: id,
                slug: slug,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String slug,
                required String name,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => QuoteTagsCompanion.insert(
                id: id,
                slug: slug,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuoteTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuoteTagsTable,
      QuoteTag,
      $$QuoteTagsTableFilterComposer,
      $$QuoteTagsTableOrderingComposer,
      $$QuoteTagsTableAnnotationComposer,
      $$QuoteTagsTableCreateCompanionBuilder,
      $$QuoteTagsTableUpdateCompanionBuilder,
      (QuoteTag, BaseReferences<_$AppDatabase, $QuoteTagsTable, QuoteTag>),
      QuoteTag,
      PrefetchHooks Function()
    >;
typedef $$QuoteTagLinksTableCreateCompanionBuilder =
    QuoteTagLinksCompanion Function({
      required String quoteId,
      required String tagId,
      Value<double> relevanceWeight,
      Value<int> rowid,
    });
typedef $$QuoteTagLinksTableUpdateCompanionBuilder =
    QuoteTagLinksCompanion Function({
      Value<String> quoteId,
      Value<String> tagId,
      Value<double> relevanceWeight,
      Value<int> rowid,
    });

class $$QuoteTagLinksTableFilterComposer
    extends Composer<_$AppDatabase, $QuoteTagLinksTable> {
  $$QuoteTagLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get relevanceWeight => $composableBuilder(
    column: $table.relevanceWeight,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuoteTagLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $QuoteTagLinksTable> {
  $$QuoteTagLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get relevanceWeight => $composableBuilder(
    column: $table.relevanceWeight,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuoteTagLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuoteTagLinksTable> {
  $$QuoteTagLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get quoteId =>
      $composableBuilder(column: $table.quoteId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<double> get relevanceWeight => $composableBuilder(
    column: $table.relevanceWeight,
    builder: (column) => column,
  );
}

class $$QuoteTagLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuoteTagLinksTable,
          QuoteTagLink,
          $$QuoteTagLinksTableFilterComposer,
          $$QuoteTagLinksTableOrderingComposer,
          $$QuoteTagLinksTableAnnotationComposer,
          $$QuoteTagLinksTableCreateCompanionBuilder,
          $$QuoteTagLinksTableUpdateCompanionBuilder,
          (
            QuoteTagLink,
            BaseReferences<_$AppDatabase, $QuoteTagLinksTable, QuoteTagLink>,
          ),
          QuoteTagLink,
          PrefetchHooks Function()
        > {
  $$QuoteTagLinksTableTableManager(_$AppDatabase db, $QuoteTagLinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuoteTagLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuoteTagLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuoteTagLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> quoteId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<double> relevanceWeight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuoteTagLinksCompanion(
                quoteId: quoteId,
                tagId: tagId,
                relevanceWeight: relevanceWeight,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String quoteId,
                required String tagId,
                Value<double> relevanceWeight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuoteTagLinksCompanion.insert(
                quoteId: quoteId,
                tagId: tagId,
                relevanceWeight: relevanceWeight,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuoteTagLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuoteTagLinksTable,
      QuoteTagLink,
      $$QuoteTagLinksTableFilterComposer,
      $$QuoteTagLinksTableOrderingComposer,
      $$QuoteTagLinksTableAnnotationComposer,
      $$QuoteTagLinksTableCreateCompanionBuilder,
      $$QuoteTagLinksTableUpdateCompanionBuilder,
      (
        QuoteTagLink,
        BaseReferences<_$AppDatabase, $QuoteTagLinksTable, QuoteTagLink>,
      ),
      QuoteTagLink,
      PrefetchHooks Function()
    >;
typedef $$WisdomRuleWeightsTableCreateCompanionBuilder =
    WisdomRuleWeightsCompanion Function({
      required String id,
      required String dimensionKey,
      required double weight,
      Value<String?> description,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$WisdomRuleWeightsTableUpdateCompanionBuilder =
    WisdomRuleWeightsCompanion Function({
      Value<String> id,
      Value<String> dimensionKey,
      Value<double> weight,
      Value<String?> description,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$WisdomRuleWeightsTableFilterComposer
    extends Composer<_$AppDatabase, $WisdomRuleWeightsTable> {
  $$WisdomRuleWeightsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dimensionKey => $composableBuilder(
    column: $table.dimensionKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WisdomRuleWeightsTableOrderingComposer
    extends Composer<_$AppDatabase, $WisdomRuleWeightsTable> {
  $$WisdomRuleWeightsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dimensionKey => $composableBuilder(
    column: $table.dimensionKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WisdomRuleWeightsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WisdomRuleWeightsTable> {
  $$WisdomRuleWeightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dimensionKey => $composableBuilder(
    column: $table.dimensionKey,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$WisdomRuleWeightsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WisdomRuleWeightsTable,
          WisdomRuleWeight,
          $$WisdomRuleWeightsTableFilterComposer,
          $$WisdomRuleWeightsTableOrderingComposer,
          $$WisdomRuleWeightsTableAnnotationComposer,
          $$WisdomRuleWeightsTableCreateCompanionBuilder,
          $$WisdomRuleWeightsTableUpdateCompanionBuilder,
          (
            WisdomRuleWeight,
            BaseReferences<
              _$AppDatabase,
              $WisdomRuleWeightsTable,
              WisdomRuleWeight
            >,
          ),
          WisdomRuleWeight,
          PrefetchHooks Function()
        > {
  $$WisdomRuleWeightsTableTableManager(
    _$AppDatabase db,
    $WisdomRuleWeightsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WisdomRuleWeightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WisdomRuleWeightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WisdomRuleWeightsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dimensionKey = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WisdomRuleWeightsCompanion(
                id: id,
                dimensionKey: dimensionKey,
                weight: weight,
                description: description,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dimensionKey,
                required double weight,
                Value<String?> description = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => WisdomRuleWeightsCompanion.insert(
                id: id,
                dimensionKey: dimensionKey,
                weight: weight,
                description: description,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WisdomRuleWeightsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WisdomRuleWeightsTable,
      WisdomRuleWeight,
      $$WisdomRuleWeightsTableFilterComposer,
      $$WisdomRuleWeightsTableOrderingComposer,
      $$WisdomRuleWeightsTableAnnotationComposer,
      $$WisdomRuleWeightsTableCreateCompanionBuilder,
      $$WisdomRuleWeightsTableUpdateCompanionBuilder,
      (
        WisdomRuleWeight,
        BaseReferences<
          _$AppDatabase,
          $WisdomRuleWeightsTable,
          WisdomRuleWeight
        >,
      ),
      WisdomRuleWeight,
      PrefetchHooks Function()
    >;
typedef $$WisdomSynonymsTableCreateCompanionBuilder =
    WisdomSynonymsCompanion Function({
      required String id,
      required String word,
      required String canonicalTerm,
      Value<int> rowid,
    });
typedef $$WisdomSynonymsTableUpdateCompanionBuilder =
    WisdomSynonymsCompanion Function({
      Value<String> id,
      Value<String> word,
      Value<String> canonicalTerm,
      Value<int> rowid,
    });

class $$WisdomSynonymsTableFilterComposer
    extends Composer<_$AppDatabase, $WisdomSynonymsTable> {
  $$WisdomSynonymsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get canonicalTerm => $composableBuilder(
    column: $table.canonicalTerm,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WisdomSynonymsTableOrderingComposer
    extends Composer<_$AppDatabase, $WisdomSynonymsTable> {
  $$WisdomSynonymsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get canonicalTerm => $composableBuilder(
    column: $table.canonicalTerm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WisdomSynonymsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WisdomSynonymsTable> {
  $$WisdomSynonymsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get canonicalTerm => $composableBuilder(
    column: $table.canonicalTerm,
    builder: (column) => column,
  );
}

class $$WisdomSynonymsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WisdomSynonymsTable,
          WisdomSynonym,
          $$WisdomSynonymsTableFilterComposer,
          $$WisdomSynonymsTableOrderingComposer,
          $$WisdomSynonymsTableAnnotationComposer,
          $$WisdomSynonymsTableCreateCompanionBuilder,
          $$WisdomSynonymsTableUpdateCompanionBuilder,
          (
            WisdomSynonym,
            BaseReferences<_$AppDatabase, $WisdomSynonymsTable, WisdomSynonym>,
          ),
          WisdomSynonym,
          PrefetchHooks Function()
        > {
  $$WisdomSynonymsTableTableManager(
    _$AppDatabase db,
    $WisdomSynonymsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WisdomSynonymsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WisdomSynonymsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WisdomSynonymsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> canonicalTerm = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WisdomSynonymsCompanion(
                id: id,
                word: word,
                canonicalTerm: canonicalTerm,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String word,
                required String canonicalTerm,
                Value<int> rowid = const Value.absent(),
              }) => WisdomSynonymsCompanion.insert(
                id: id,
                word: word,
                canonicalTerm: canonicalTerm,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WisdomSynonymsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WisdomSynonymsTable,
      WisdomSynonym,
      $$WisdomSynonymsTableFilterComposer,
      $$WisdomSynonymsTableOrderingComposer,
      $$WisdomSynonymsTableAnnotationComposer,
      $$WisdomSynonymsTableCreateCompanionBuilder,
      $$WisdomSynonymsTableUpdateCompanionBuilder,
      (
        WisdomSynonym,
        BaseReferences<_$AppDatabase, $WisdomSynonymsTable, WisdomSynonym>,
      ),
      WisdomSynonym,
      PrefetchHooks Function()
    >;
typedef $$WisdomKeywordMapTableCreateCompanionBuilder =
    WisdomKeywordMapCompanion Function({
      required String id,
      required String keyword,
      required String semanticBucket,
      Value<double> confidence,
      Value<int> rowid,
    });
typedef $$WisdomKeywordMapTableUpdateCompanionBuilder =
    WisdomKeywordMapCompanion Function({
      Value<String> id,
      Value<String> keyword,
      Value<String> semanticBucket,
      Value<double> confidence,
      Value<int> rowid,
    });

class $$WisdomKeywordMapTableFilterComposer
    extends Composer<_$AppDatabase, $WisdomKeywordMapTable> {
  $$WisdomKeywordMapTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semanticBucket => $composableBuilder(
    column: $table.semanticBucket,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WisdomKeywordMapTableOrderingComposer
    extends Composer<_$AppDatabase, $WisdomKeywordMapTable> {
  $$WisdomKeywordMapTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semanticBucket => $composableBuilder(
    column: $table.semanticBucket,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WisdomKeywordMapTableAnnotationComposer
    extends Composer<_$AppDatabase, $WisdomKeywordMapTable> {
  $$WisdomKeywordMapTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get keyword =>
      $composableBuilder(column: $table.keyword, builder: (column) => column);

  GeneratedColumn<String> get semanticBucket => $composableBuilder(
    column: $table.semanticBucket,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );
}

class $$WisdomKeywordMapTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WisdomKeywordMapTable,
          WisdomKeywordMapData,
          $$WisdomKeywordMapTableFilterComposer,
          $$WisdomKeywordMapTableOrderingComposer,
          $$WisdomKeywordMapTableAnnotationComposer,
          $$WisdomKeywordMapTableCreateCompanionBuilder,
          $$WisdomKeywordMapTableUpdateCompanionBuilder,
          (
            WisdomKeywordMapData,
            BaseReferences<
              _$AppDatabase,
              $WisdomKeywordMapTable,
              WisdomKeywordMapData
            >,
          ),
          WisdomKeywordMapData,
          PrefetchHooks Function()
        > {
  $$WisdomKeywordMapTableTableManager(
    _$AppDatabase db,
    $WisdomKeywordMapTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WisdomKeywordMapTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WisdomKeywordMapTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WisdomKeywordMapTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> keyword = const Value.absent(),
                Value<String> semanticBucket = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WisdomKeywordMapCompanion(
                id: id,
                keyword: keyword,
                semanticBucket: semanticBucket,
                confidence: confidence,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String keyword,
                required String semanticBucket,
                Value<double> confidence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WisdomKeywordMapCompanion.insert(
                id: id,
                keyword: keyword,
                semanticBucket: semanticBucket,
                confidence: confidence,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WisdomKeywordMapTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WisdomKeywordMapTable,
      WisdomKeywordMapData,
      $$WisdomKeywordMapTableFilterComposer,
      $$WisdomKeywordMapTableOrderingComposer,
      $$WisdomKeywordMapTableAnnotationComposer,
      $$WisdomKeywordMapTableCreateCompanionBuilder,
      $$WisdomKeywordMapTableUpdateCompanionBuilder,
      (
        WisdomKeywordMapData,
        BaseReferences<
          _$AppDatabase,
          $WisdomKeywordMapTable,
          WisdomKeywordMapData
        >,
      ),
      WisdomKeywordMapData,
      PrefetchHooks Function()
    >;
typedef $$QuoteUsageHistoryTableCreateCompanionBuilder =
    QuoteUsageHistoryCompanion Function({
      required String id,
      required String userId,
      required String quoteId,
      Value<String?> planId,
      required DateTime shownAt,
      Value<int> rowid,
    });
typedef $$QuoteUsageHistoryTableUpdateCompanionBuilder =
    QuoteUsageHistoryCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> quoteId,
      Value<String?> planId,
      Value<DateTime> shownAt,
      Value<int> rowid,
    });

class $$QuoteUsageHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $QuoteUsageHistoryTable> {
  $$QuoteUsageHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get shownAt => $composableBuilder(
    column: $table.shownAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuoteUsageHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $QuoteUsageHistoryTable> {
  $$QuoteUsageHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get shownAt => $composableBuilder(
    column: $table.shownAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuoteUsageHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuoteUsageHistoryTable> {
  $$QuoteUsageHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get quoteId =>
      $composableBuilder(column: $table.quoteId, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<DateTime> get shownAt =>
      $composableBuilder(column: $table.shownAt, builder: (column) => column);
}

class $$QuoteUsageHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuoteUsageHistoryTable,
          QuoteUsageHistoryData,
          $$QuoteUsageHistoryTableFilterComposer,
          $$QuoteUsageHistoryTableOrderingComposer,
          $$QuoteUsageHistoryTableAnnotationComposer,
          $$QuoteUsageHistoryTableCreateCompanionBuilder,
          $$QuoteUsageHistoryTableUpdateCompanionBuilder,
          (
            QuoteUsageHistoryData,
            BaseReferences<
              _$AppDatabase,
              $QuoteUsageHistoryTable,
              QuoteUsageHistoryData
            >,
          ),
          QuoteUsageHistoryData,
          PrefetchHooks Function()
        > {
  $$QuoteUsageHistoryTableTableManager(
    _$AppDatabase db,
    $QuoteUsageHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuoteUsageHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuoteUsageHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuoteUsageHistoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> quoteId = const Value.absent(),
                Value<String?> planId = const Value.absent(),
                Value<DateTime> shownAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuoteUsageHistoryCompanion(
                id: id,
                userId: userId,
                quoteId: quoteId,
                planId: planId,
                shownAt: shownAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String quoteId,
                Value<String?> planId = const Value.absent(),
                required DateTime shownAt,
                Value<int> rowid = const Value.absent(),
              }) => QuoteUsageHistoryCompanion.insert(
                id: id,
                userId: userId,
                quoteId: quoteId,
                planId: planId,
                shownAt: shownAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuoteUsageHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuoteUsageHistoryTable,
      QuoteUsageHistoryData,
      $$QuoteUsageHistoryTableFilterComposer,
      $$QuoteUsageHistoryTableOrderingComposer,
      $$QuoteUsageHistoryTableAnnotationComposer,
      $$QuoteUsageHistoryTableCreateCompanionBuilder,
      $$QuoteUsageHistoryTableUpdateCompanionBuilder,
      (
        QuoteUsageHistoryData,
        BaseReferences<
          _$AppDatabase,
          $QuoteUsageHistoryTable,
          QuoteUsageHistoryData
        >,
      ),
      QuoteUsageHistoryData,
      PrefetchHooks Function()
    >;
typedef $$DecisionLogsTableCreateCompanionBuilder =
    DecisionLogsCompanion Function({
      required String id,
      required String userId,
      required String planId,
      Value<String?> selectedQuoteId,
      Value<int> candidatePoolSize,
      Value<int> fallbackTier,
      Value<double> finalScore,
      Value<String?> contextFeaturesJson,
      Value<String?> userFacingExplanation,
      Value<String?> debugExplanation,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DecisionLogsTableUpdateCompanionBuilder =
    DecisionLogsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> planId,
      Value<String?> selectedQuoteId,
      Value<int> candidatePoolSize,
      Value<int> fallbackTier,
      Value<double> finalScore,
      Value<String?> contextFeaturesJson,
      Value<String?> userFacingExplanation,
      Value<String?> debugExplanation,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$DecisionLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionLogsTable> {
  $$DecisionLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedQuoteId => $composableBuilder(
    column: $table.selectedQuoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get candidatePoolSize => $composableBuilder(
    column: $table.candidatePoolSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fallbackTier => $composableBuilder(
    column: $table.fallbackTier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get finalScore => $composableBuilder(
    column: $table.finalScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contextFeaturesJson => $composableBuilder(
    column: $table.contextFeaturesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userFacingExplanation => $composableBuilder(
    column: $table.userFacingExplanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get debugExplanation => $composableBuilder(
    column: $table.debugExplanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DecisionLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionLogsTable> {
  $$DecisionLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedQuoteId => $composableBuilder(
    column: $table.selectedQuoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get candidatePoolSize => $composableBuilder(
    column: $table.candidatePoolSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fallbackTier => $composableBuilder(
    column: $table.fallbackTier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get finalScore => $composableBuilder(
    column: $table.finalScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contextFeaturesJson => $composableBuilder(
    column: $table.contextFeaturesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userFacingExplanation => $composableBuilder(
    column: $table.userFacingExplanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get debugExplanation => $composableBuilder(
    column: $table.debugExplanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecisionLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionLogsTable> {
  $$DecisionLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get selectedQuoteId => $composableBuilder(
    column: $table.selectedQuoteId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get candidatePoolSize => $composableBuilder(
    column: $table.candidatePoolSize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fallbackTier => $composableBuilder(
    column: $table.fallbackTier,
    builder: (column) => column,
  );

  GeneratedColumn<double> get finalScore => $composableBuilder(
    column: $table.finalScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contextFeaturesJson => $composableBuilder(
    column: $table.contextFeaturesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userFacingExplanation => $composableBuilder(
    column: $table.userFacingExplanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get debugExplanation => $composableBuilder(
    column: $table.debugExplanation,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DecisionLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionLogsTable,
          DecisionLog,
          $$DecisionLogsTableFilterComposer,
          $$DecisionLogsTableOrderingComposer,
          $$DecisionLogsTableAnnotationComposer,
          $$DecisionLogsTableCreateCompanionBuilder,
          $$DecisionLogsTableUpdateCompanionBuilder,
          (
            DecisionLog,
            BaseReferences<_$AppDatabase, $DecisionLogsTable, DecisionLog>,
          ),
          DecisionLog,
          PrefetchHooks Function()
        > {
  $$DecisionLogsTableTableManager(_$AppDatabase db, $DecisionLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<String?> selectedQuoteId = const Value.absent(),
                Value<int> candidatePoolSize = const Value.absent(),
                Value<int> fallbackTier = const Value.absent(),
                Value<double> finalScore = const Value.absent(),
                Value<String?> contextFeaturesJson = const Value.absent(),
                Value<String?> userFacingExplanation = const Value.absent(),
                Value<String?> debugExplanation = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionLogsCompanion(
                id: id,
                userId: userId,
                planId: planId,
                selectedQuoteId: selectedQuoteId,
                candidatePoolSize: candidatePoolSize,
                fallbackTier: fallbackTier,
                finalScore: finalScore,
                contextFeaturesJson: contextFeaturesJson,
                userFacingExplanation: userFacingExplanation,
                debugExplanation: debugExplanation,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String planId,
                Value<String?> selectedQuoteId = const Value.absent(),
                Value<int> candidatePoolSize = const Value.absent(),
                Value<int> fallbackTier = const Value.absent(),
                Value<double> finalScore = const Value.absent(),
                Value<String?> contextFeaturesJson = const Value.absent(),
                Value<String?> userFacingExplanation = const Value.absent(),
                Value<String?> debugExplanation = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DecisionLogsCompanion.insert(
                id: id,
                userId: userId,
                planId: planId,
                selectedQuoteId: selectedQuoteId,
                candidatePoolSize: candidatePoolSize,
                fallbackTier: fallbackTier,
                finalScore: finalScore,
                contextFeaturesJson: contextFeaturesJson,
                userFacingExplanation: userFacingExplanation,
                debugExplanation: debugExplanation,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DecisionLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionLogsTable,
      DecisionLog,
      $$DecisionLogsTableFilterComposer,
      $$DecisionLogsTableOrderingComposer,
      $$DecisionLogsTableAnnotationComposer,
      $$DecisionLogsTableCreateCompanionBuilder,
      $$DecisionLogsTableUpdateCompanionBuilder,
      (
        DecisionLog,
        BaseReferences<_$AppDatabase, $DecisionLogsTable, DecisionLog>,
      ),
      DecisionLog,
      PrefetchHooks Function()
    >;
typedef $$DecisionLogCandidatesTableCreateCompanionBuilder =
    DecisionLogCandidatesCompanion Function({
      required String id,
      required String decisionLogId,
      required String quoteId,
      required double totalScore,
      Value<String?> scoreBreakdownJson,
      Value<String?> rejectionReason,
      required int rank,
      Value<int> rowid,
    });
typedef $$DecisionLogCandidatesTableUpdateCompanionBuilder =
    DecisionLogCandidatesCompanion Function({
      Value<String> id,
      Value<String> decisionLogId,
      Value<String> quoteId,
      Value<double> totalScore,
      Value<String?> scoreBreakdownJson,
      Value<String?> rejectionReason,
      Value<int> rank,
      Value<int> rowid,
    });

class $$DecisionLogCandidatesTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionLogCandidatesTable> {
  $$DecisionLogCandidatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get decisionLogId => $composableBuilder(
    column: $table.decisionLogId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalScore => $composableBuilder(
    column: $table.totalScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scoreBreakdownJson => $composableBuilder(
    column: $table.scoreBreakdownJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DecisionLogCandidatesTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionLogCandidatesTable> {
  $$DecisionLogCandidatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get decisionLogId => $composableBuilder(
    column: $table.decisionLogId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteId => $composableBuilder(
    column: $table.quoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalScore => $composableBuilder(
    column: $table.totalScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scoreBreakdownJson => $composableBuilder(
    column: $table.scoreBreakdownJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DecisionLogCandidatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionLogCandidatesTable> {
  $$DecisionLogCandidatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get decisionLogId => $composableBuilder(
    column: $table.decisionLogId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quoteId =>
      $composableBuilder(column: $table.quoteId, builder: (column) => column);

  GeneratedColumn<double> get totalScore => $composableBuilder(
    column: $table.totalScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scoreBreakdownJson => $composableBuilder(
    column: $table.scoreBreakdownJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rejectionReason => $composableBuilder(
    column: $table.rejectionReason,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);
}

class $$DecisionLogCandidatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DecisionLogCandidatesTable,
          DecisionLogCandidate,
          $$DecisionLogCandidatesTableFilterComposer,
          $$DecisionLogCandidatesTableOrderingComposer,
          $$DecisionLogCandidatesTableAnnotationComposer,
          $$DecisionLogCandidatesTableCreateCompanionBuilder,
          $$DecisionLogCandidatesTableUpdateCompanionBuilder,
          (
            DecisionLogCandidate,
            BaseReferences<
              _$AppDatabase,
              $DecisionLogCandidatesTable,
              DecisionLogCandidate
            >,
          ),
          DecisionLogCandidate,
          PrefetchHooks Function()
        > {
  $$DecisionLogCandidatesTableTableManager(
    _$AppDatabase db,
    $DecisionLogCandidatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionLogCandidatesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DecisionLogCandidatesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DecisionLogCandidatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> decisionLogId = const Value.absent(),
                Value<String> quoteId = const Value.absent(),
                Value<double> totalScore = const Value.absent(),
                Value<String?> scoreBreakdownJson = const Value.absent(),
                Value<String?> rejectionReason = const Value.absent(),
                Value<int> rank = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DecisionLogCandidatesCompanion(
                id: id,
                decisionLogId: decisionLogId,
                quoteId: quoteId,
                totalScore: totalScore,
                scoreBreakdownJson: scoreBreakdownJson,
                rejectionReason: rejectionReason,
                rank: rank,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String decisionLogId,
                required String quoteId,
                required double totalScore,
                Value<String?> scoreBreakdownJson = const Value.absent(),
                Value<String?> rejectionReason = const Value.absent(),
                required int rank,
                Value<int> rowid = const Value.absent(),
              }) => DecisionLogCandidatesCompanion.insert(
                id: id,
                decisionLogId: decisionLogId,
                quoteId: quoteId,
                totalScore: totalScore,
                scoreBreakdownJson: scoreBreakdownJson,
                rejectionReason: rejectionReason,
                rank: rank,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DecisionLogCandidatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DecisionLogCandidatesTable,
      DecisionLogCandidate,
      $$DecisionLogCandidatesTableFilterComposer,
      $$DecisionLogCandidatesTableOrderingComposer,
      $$DecisionLogCandidatesTableAnnotationComposer,
      $$DecisionLogCandidatesTableCreateCompanionBuilder,
      $$DecisionLogCandidatesTableUpdateCompanionBuilder,
      (
        DecisionLogCandidate,
        BaseReferences<
          _$AppDatabase,
          $DecisionLogCandidatesTable,
          DecisionLogCandidate
        >,
      ),
      DecisionLogCandidate,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      required String id,
      required String planId,
      required String title,
      required String body,
      required int platformNotificationId,
      Value<String> status,
      required DateTime scheduledFor,
      required String timezone,
      Value<String?> lastError,
      Value<DateTime?> lastScheduledAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<String> id,
      Value<String> planId,
      Value<String> title,
      Value<String> body,
      Value<int> platformNotificationId,
      Value<String> status,
      Value<DateTime> scheduledFor,
      Value<String> timezone,
      Value<String?> lastError,
      Value<DateTime?> lastScheduledAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastScheduledAt => $composableBuilder(
    column: $table.lastScheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastScheduledAt => $composableBuilder(
    column: $table.lastScheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get lastScheduledAt => $composableBuilder(
    column: $table.lastScheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          Notification,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (
            Notification,
            BaseReferences<_$AppDatabase, $NotificationsTable, Notification>,
          ),
          Notification,
          PrefetchHooks Function()
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> platformNotificationId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> scheduledFor = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lastScheduledAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion(
                id: id,
                planId: planId,
                title: title,
                body: body,
                platformNotificationId: platformNotificationId,
                status: status,
                scheduledFor: scheduledFor,
                timezone: timezone,
                lastError: lastError,
                lastScheduledAt: lastScheduledAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String planId,
                required String title,
                required String body,
                required int platformNotificationId,
                Value<String> status = const Value.absent(),
                required DateTime scheduledFor,
                required String timezone,
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> lastScheduledAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion.insert(
                id: id,
                planId: planId,
                title: title,
                body: body,
                platformNotificationId: platformNotificationId,
                status: status,
                scheduledFor: scheduledFor,
                timezone: timezone,
                lastError: lastError,
                lastScheduledAt: lastScheduledAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      Notification,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (
        Notification,
        BaseReferences<_$AppDatabase, $NotificationsTable, Notification>,
      ),
      Notification,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      required String id,
      required String targetTable,
      required String rowId,
      required String operation,
      required String payloadJson,
      Value<int> retryCount,
      required DateTime createdAt,
      Value<DateTime?> lastAttemptAt,
      Value<int> rowid,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<String> id,
      Value<String> targetTable,
      Value<String> rowId,
      Value<String> operation,
      Value<String> payloadJson,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<DateTime?> lastAttemptAt,
      Value<int> rowid,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> targetTable = const Value.absent(),
                Value<String> rowId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                targetTable: targetTable,
                rowId: rowId,
                operation: operation,
                payloadJson: payloadJson,
                retryCount: retryCount,
                createdAt: createdAt,
                lastAttemptAt: lastAttemptAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String targetTable,
                required String rowId,
                required String operation,
                required String payloadJson,
                Value<int> retryCount = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                targetTable: targetTable,
                rowId: rowId,
                operation: operation,
                payloadJson: payloadJson,
                retryCount: retryCount,
                createdAt: createdAt,
                lastAttemptAt: lastAttemptAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$PlanCategoriesTableTableManager get planCategories =>
      $$PlanCategoriesTableTableManager(_db, _db.planCategories);
  $$PlanTagsTableTableManager get planTags =>
      $$PlanTagsTableTableManager(_db, _db.planTags);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db, _db.plans);
  $$PlanTagLinksTableTableManager get planTagLinks =>
      $$PlanTagLinksTableTableManager(_db, _db.planTagLinks);
  $$PlanStatusHistoryTableTableManager get planStatusHistory =>
      $$PlanStatusHistoryTableTableManager(_db, _db.planStatusHistory);
  $$StreakSnapshotsTableTableManager get streakSnapshots =>
      $$StreakSnapshotsTableTableManager(_db, _db.streakSnapshots);
  $$HistoricalFiguresTableTableManager get historicalFigures =>
      $$HistoricalFiguresTableTableManager(_db, _db.historicalFigures);
  $$FigureDomainsTableTableManager get figureDomains =>
      $$FigureDomainsTableTableManager(_db, _db.figureDomains);
  $$HistoricalFigureDomainsTableTableManager get historicalFigureDomains =>
      $$HistoricalFigureDomainsTableTableManager(
        _db,
        _db.historicalFigureDomains,
      );
  $$QuoteSourcesTableTableManager get quoteSources =>
      $$QuoteSourcesTableTableManager(_db, _db.quoteSources);
  $$QuotesTableTableManager get quotes =>
      $$QuotesTableTableManager(_db, _db.quotes);
  $$QuoteTagsTableTableManager get quoteTags =>
      $$QuoteTagsTableTableManager(_db, _db.quoteTags);
  $$QuoteTagLinksTableTableManager get quoteTagLinks =>
      $$QuoteTagLinksTableTableManager(_db, _db.quoteTagLinks);
  $$WisdomRuleWeightsTableTableManager get wisdomRuleWeights =>
      $$WisdomRuleWeightsTableTableManager(_db, _db.wisdomRuleWeights);
  $$WisdomSynonymsTableTableManager get wisdomSynonyms =>
      $$WisdomSynonymsTableTableManager(_db, _db.wisdomSynonyms);
  $$WisdomKeywordMapTableTableManager get wisdomKeywordMap =>
      $$WisdomKeywordMapTableTableManager(_db, _db.wisdomKeywordMap);
  $$QuoteUsageHistoryTableTableManager get quoteUsageHistory =>
      $$QuoteUsageHistoryTableTableManager(_db, _db.quoteUsageHistory);
  $$DecisionLogsTableTableManager get decisionLogs =>
      $$DecisionLogsTableTableManager(_db, _db.decisionLogs);
  $$DecisionLogCandidatesTableTableManager get decisionLogCandidates =>
      $$DecisionLogCandidatesTableTableManager(_db, _db.decisionLogCandidates);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
}
