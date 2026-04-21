import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:planandact/core/constants/app_constants.dart';

// Planning tables
import 'package:planandact/features/wisdom_engine/data/seed/wisdom_seed_data.dart';
import 'package:planandact/shared/data/local/tables/users_table.dart';
import 'package:planandact/shared/data/local/tables/plan_categories_table.dart';
import 'package:planandact/shared/data/local/tables/plan_tags_table.dart';
import 'package:planandact/shared/data/local/tables/plans_table.dart';
import 'package:planandact/shared/data/local/tables/plan_tag_links_table.dart';
import 'package:planandact/shared/data/local/tables/plan_status_history_table.dart';
import 'package:planandact/shared/data/local/tables/streak_snapshots_table.dart';

// Wisdom tables
import 'package:planandact/shared/data/local/tables/historical_figures_table.dart';
import 'package:planandact/shared/data/local/tables/figure_domains_table.dart';
import 'package:planandact/shared/data/local/tables/quote_sources_table.dart';
import 'package:planandact/shared/data/local/tables/quotes_table.dart';
import 'package:planandact/shared/data/local/tables/quote_tags_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_rule_weights_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_synonyms_table.dart';
import 'package:planandact/shared/data/local/tables/wisdom_keyword_map_table.dart';
import 'package:planandact/shared/data/local/tables/quote_usage_history_table.dart';
import 'package:planandact/shared/data/local/tables/decision_logs_table.dart';

// Video tables
import 'package:planandact/shared/data/local/tables/video_tables.dart';

// Notification & Sync tables
import 'package:planandact/shared/data/local/tables/notifications_table.dart';
import 'package:planandact/shared/data/local/tables/sync_queue_table.dart';

// DAOs
import 'package:planandact/shared/data/local/daos/plans_dao.dart';
import 'package:planandact/shared/data/local/daos/wisdom_dao.dart';
import 'package:planandact/shared/data/local/daos/video_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    // Planning
    Users,
    PlanCategories,
    PlanTags,
    Plans,
    PlanTagLinks,
    PlanStatusHistory,
    StreakSnapshots,
    // Wisdom
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
    // Video
    VideoCandidates,
    VideoTopics,
    VideoCandidateTopics,
    DailyVideoSelections,
    VideoImpressions,
    DailyVideoCache,
    // Notifications & Sync
    Notifications,
    SyncQueue,
  ],
  daos: [PlansDao, WisdomDao, VideoDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// For testing: accepts an in-memory or custom executor.
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedDefaultCategories();
        await WisdomSeedData.seed(this);
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Future migrations go here
      },
    );
  }

  /// Seeds the default plan categories on first database creation.
  Future<void> _seedDefaultCategories() async {
    final now = DateTime.now();
    final categories = [
      PlanCategoriesCompanion.insert(
        id: 'cat_deep_work', slug: 'deep_work', name: 'Deep Work',
        iconKey: const Value('work'), colorKey: const Value('primary'),
        createdAt: now, updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_health', slug: 'health', name: 'Sağlık',
        iconKey: const Value('health'), colorKey: const Value('success'),
        createdAt: now, updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_learning', slug: 'learning', name: 'Öğrenme',
        iconKey: const Value('learning'), colorKey: const Value('info'),
        createdAt: now, updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_personal', slug: 'personal', name: 'Kişisel',
        iconKey: const Value('personal'), colorKey: const Value('warning'),
        createdAt: now, updatedAt: now,
      ),
      PlanCategoriesCompanion.insert(
        id: 'cat_admin', slug: 'admin', name: 'Operasyon',
        iconKey: const Value('admin'), colorKey: const Value('muted'),
        createdAt: now, updatedAt: now,
      ),
    ];

    for (final cat in categories) {
      await into(planCategories).insert(cat);
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
