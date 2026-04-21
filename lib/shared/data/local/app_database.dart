import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:planandact/core/constants/app_constants.dart';
import 'package:planandact/features/wisdom_engine/data/seed/wisdom_seed_data.dart';
import 'package:planandact/shared/data/local/daos/plans_dao.dart';
import 'package:planandact/shared/data/local/daos/wisdom_dao.dart';
import 'package:planandact/shared/data/local/tables/decision_logs_table.dart';
import 'package:planandact/shared/data/local/tables/figure_domains_table.dart';
import 'package:planandact/shared/data/local/tables/historical_figures_table.dart';
import 'package:planandact/shared/data/local/tables/notifications_table.dart';
import 'package:planandact/shared/data/local/tables/plan_categories_table.dart';
import 'package:planandact/shared/data/local/tables/plan_status_history_table.dart';
import 'package:planandact/shared/data/local/tables/plan_tag_links_table.dart';
import 'package:planandact/shared/data/local/tables/plan_tags_table.dart';
import 'package:planandact/shared/data/local/tables/plans_table.dart';
import 'package:planandact/shared/data/local/tables/quote_sources_table.dart';
import 'package:planandact/shared/data/local/tables/quote_tags_table.dart';
import 'package:planandact/shared/data/local/tables/quote_usage_history_table.dart';
import 'package:planandact/shared/data/local/tables/quotes_table.dart';
import 'package:planandact/shared/data/local/tables/streak_snapshots_table.dart';
import 'package:planandact/shared/data/local/tables/sync_queue_table.dart';
import 'package:planandact/shared/data/local/tables/users_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_keyword_map_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_rule_weights_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_synonyms_table.dart';

part 'app_database.g.dart';

const _droppedVideoTablesV2 = <String>[
  'daily_video_cache',
  'video_impressions',
  'daily_video_selections',
  'video_candidate_topics',
  'video_topics',
  'video_candidates',
];

@DriftDatabase(
  tables: [
    Users,
    PlanCategories,
    PlanTags,
    Plans,
    PlanTagLinks,
    PlanStatusHistory,
    StreakSnapshots,
    HistoricalFigures,
    FigureDomains,
    HistoricalFigureDomains,
    QuoteSources,
    Quotes,
    QuoteTags,
    QuoteTagLinks,
    WisdomRuleWeights,
    WisdomSynonyms,
    WisdomKeywordMap,
    QuoteUsageHistory,
    DecisionLogs,
    DecisionLogCandidates,
    Notifications,
    SyncQueue,
  ],
  daos: [PlansDao, WisdomDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedDefaultCategories();
        await WisdomSeedData.seed(this);
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          for (final tableName in _droppedVideoTablesV2) {
            await customStatement('DROP TABLE IF EXISTS $tableName;');
          }
        }
      },
    );
  }

  Future<void> _seedDefaultCategories() async {
    final now = DateTime.now();
    final categories = [
      PlanCategoriesCompanion.insert(
        id: 'cat_deep_work',
        slug: 'deep_work',
        name: 'Deep Work',
        iconKey: const Value('work'),
        colorKey: const Value('primary'),
        createdAt: now,
        updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_health',
        slug: 'health',
        name: 'Saglik',
        iconKey: const Value('health'),
        colorKey: const Value('success'),
        createdAt: now,
        updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_learning',
        slug: 'learning',
        name: 'Ogrenme',
        iconKey: const Value('learning'),
        colorKey: const Value('info'),
        createdAt: now,
        updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_personal',
        slug: 'personal',
        name: 'Kisisel',
        iconKey: const Value('personal'),
        colorKey: const Value('warning'),
        createdAt: now,
        updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_admin',
        slug: 'admin',
        name: 'Operasyon',
        iconKey: const Value('admin'),
        colorKey: const Value('muted'),
        createdAt: now,
        updatedAt: now,
      ),
    ];

    for (final category in categories) {
      await into(planCategories).insert(category);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstants.databaseName));
    return NativeDatabase.createInBackground(file);
  });
}
