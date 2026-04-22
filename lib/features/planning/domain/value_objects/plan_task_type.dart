enum PlanTaskType {
  spor,
  programming,
  sosyallesme,
  arastirma,
}

extension PlanTaskTypeX on PlanTaskType {
  String get key => switch (this) {
        PlanTaskType.spor => 'spor',
        PlanTaskType.programming => 'programming',
        PlanTaskType.sosyallesme => 'sosyallesme',
        PlanTaskType.arastirma => 'arastirma',
      };

  String get tagSlug => switch (this) {
        PlanTaskType.spor => 'sport',
        PlanTaskType.programming => 'programming',
        PlanTaskType.sosyallesme => 'sosyallesme',
        PlanTaskType.arastirma => 'arastirma',
      };

  String get label => switch (this) {
        PlanTaskType.spor => 'SPOR',
        PlanTaskType.programming => 'PROGRAMMING',
        PlanTaskType.sosyallesme => 'SOSYALLESME',
        PlanTaskType.arastirma => 'ARASTIRMA',
      };

  static PlanTaskType fromKey(String raw) {
    return PlanTaskType.values.firstWhere(
      (type) => type.key == raw,
      orElse: () => PlanTaskType.programming,
    );
  }
}
