import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:planandact/shared/data/local/app_database.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  test('migrates v1 database to v2 and drops legacy video tables', () async {
    final tempDir = await Directory.systemTemp.createTemp('planandact_migration_test');
    final dbPath = p.join(tempDir.path, 'planandact.sqlite');
    final legacyDb = sqlite3.open(dbPath);

    legacyDb.execute('PRAGMA user_version = 1;');
    legacyDb.execute('CREATE TABLE plans (id TEXT PRIMARY KEY, title TEXT);');
    legacyDb.execute("INSERT INTO plans (id, title) VALUES ('plan-legacy', 'Keep me');");
    legacyDb.execute('CREATE TABLE video_candidates (id TEXT PRIMARY KEY);');
    legacyDb.execute('CREATE TABLE video_topics (id TEXT PRIMARY KEY);');
    legacyDb.execute('CREATE TABLE video_candidate_topics (video_candidate_id TEXT, topic_id TEXT);');
    legacyDb.execute('CREATE TABLE daily_video_selections (id TEXT PRIMARY KEY);');
    legacyDb.execute('CREATE TABLE video_impressions (id TEXT PRIMARY KEY);');
    legacyDb.execute('CREATE TABLE daily_video_cache (id TEXT PRIMARY KEY);');
    legacyDb.dispose();

    final db = AppDatabase.forTesting(NativeDatabase(File(dbPath)));
    addTearDown(() async {
      await db.close();
      await tempDir.delete(recursive: true);
    });

    await db.customSelect('select 1').get();

    final planRows = await db.customSelect('SELECT id FROM plans').get();
    final tableRows = await db.customSelect(
      "SELECT name FROM sqlite_master WHERE type = 'table'",
    ).get();

    final tableNames = tableRows
        .map((row) => row.read<String>('name'))
        .whereType<String>()
        .toSet();

    expect(planRows.single.read<String>('id'), 'plan-legacy');
    expect(tableNames, isNot(contains('video_candidates')));
    expect(tableNames, isNot(contains('video_topics')));
    expect(tableNames, isNot(contains('video_candidate_topics')));
    expect(tableNames, isNot(contains('daily_video_selections')));
    expect(tableNames, isNot(contains('video_impressions')));
    expect(tableNames, isNot(contains('daily_video_cache')));
  });
}
