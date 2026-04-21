/// Semantic buckets for plan text classification.
///
/// These are the categories the normalization pipeline maps plan text into.
enum SemanticBucket {
  study,
  work,
  deepFocus,
  discipline,
  exercise,
  health,
  resilience,
  leadership,
  creativity,
  recovery,
  consistency,
  courage,
  planning,
  execution,
  procrastination,
  failure,
  restart,
  longTermEffort;

  /// Human-readable label for display.
  String get label => switch (this) {
        study => 'Çalışma',
        work => 'İş',
        deepFocus => 'Derin Odak',
        discipline => 'Disiplin',
        exercise => 'Egzersiz',
        health => 'Sağlık',
        resilience => 'Dayanıklılık',
        leadership => 'Liderlik',
        creativity => 'Yaratıcılık',
        recovery => 'Toparlanma',
        consistency => 'Tutarlılık',
        courage => 'Cesaret',
        planning => 'Planlama',
        execution => 'Uygulama',
        procrastination => 'Erteleme',
        failure => 'Başarısızlık',
        restart => 'Yeniden Başlama',
        longTermEffort => 'Uzun Vadeli Çaba',
      };
}
