import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(localizations != null, 'No AppLocalizations found in context');
    return localizations!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const supportedLocales = [Locale('tr'), Locale('en')];

  static const Map<String, Map<String, String>> _localizedValues = {
    'tr': {
      'appTitle': 'Plan and Act',
      'newPlan': 'Yeni Plan',
      'heroDescription': 'Bugün için hedeflerini belirle, harekete geç ve motivasyonunu yüksek tut.',
      'totalPlan': 'Toplam Plan',
      'today': 'Bugün',
      'loadingPlans': 'Planlar yükleniyor',
      'emptyStateTitle': 'Harika bir başlangıç için ilk planını ekle ✨',
      'emptyStateDescription': '“Yeni Plan” butonuna dokun ve bugününü organize etmeye başla.',
      'sheetTitle': 'Yeni Plan Oluştur',
      'sheetSubtitle': 'Hedefini yaz, saatini belirle ve motivasyon mesajını kap.',
      'planTitleLabel': 'Plan başlığı',
      'planTitleHint': 'Örn: Sabah yürüyüşü',
      'planDetailsLabel': 'Detaylar (opsiyonel)',
      'planDetailsHint': 'Örn: 30 dakika tempolu yürüyüş',
      'pickTimeRequired': 'Saat seç (zorunlu)',
      'savePlan': 'Planı Kaydet',
      'validationTitleTime': 'Lütfen başlık ve saat girin.',
      'fabSemantics': 'Yeni plan ekle',
      'timePickerSemantics': 'Plan saati seç',
      'timePickerHint': 'Plan için bir saat seçmek için çift dokun',
      'wisdomSport': 'Sağlam kafa sağlam vücutta bulunur.\n- Mustafa Kemal Atatürk',
      'wisdomStudy':
          'Hiçbir şeye ihtiyacımız yok, yalnız bir şeye ihtiyacımız var: Çalışkan olmak!\n- Mustafa Kemal Atatürk',
      'wisdomStress': 'Hayatımız, düşüncelerimizin eseridir.\n- Marcus Aurelius',
      'wisdomReading': 'Okumak, zihni beslemektir.\n- Seneca',
      'wisdomDefault': 'Zamanın değerini bil, çünkü hayat ondan ibarettir.\n- Benjamin Franklin',
    },
    'en': {
      'appTitle': 'Plan and Act',
      'newPlan': 'New Plan',
      'heroDescription': 'Set your goals for today, take action, and keep your motivation high.',
      'totalPlan': 'Total Plans',
      'today': 'Today',
      'loadingPlans': 'Loading plans',
      'emptyStateTitle': 'Add your first plan for a great start ✨',
      'emptyStateDescription': 'Tap the “New Plan” button and start organizing your day.',
      'sheetTitle': 'Create New Plan',
      'sheetSubtitle': 'Write your goal, set the time, and get a motivational quote.',
      'planTitleLabel': 'Plan title',
      'planTitleHint': 'e.g. Morning walk',
      'planDetailsLabel': 'Details (optional)',
      'planDetailsHint': 'e.g. 30 minutes brisk walk',
      'pickTimeRequired': 'Select time (required)',
      'savePlan': 'Save Plan',
      'validationTitleTime': 'Please enter a title and time.',
      'fabSemantics': 'Add new plan',
      'timePickerSemantics': 'Select plan time',
      'timePickerHint': 'Double tap to choose a time for your plan',
      'wisdomSport': 'A sound mind resides in a sound body.\n- Mustafa Kemal Atatürk',
      'wisdomStudy':
          'We need nothing else, only one thing: to be hardworking!\n- Mustafa Kemal Atatürk',
      'wisdomStress': 'Our life is what our thoughts make it.\n- Marcus Aurelius',
      'wisdomReading': 'Reading nourishes the mind.\n- Seneca',
      'wisdomDefault': 'Know the value of time, because life is made of it.\n- Benjamin Franklin',
    },
  };

  String _t(String key) => _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']![key]!;

  String get appTitle => _t('appTitle');
  String get newPlan => _t('newPlan');
  String get heroDescription => _t('heroDescription');
  String get totalPlan => _t('totalPlan');
  String get today => _t('today');
  String get loadingPlans => _t('loadingPlans');
  String get emptyStateTitle => _t('emptyStateTitle');
  String get emptyStateDescription => _t('emptyStateDescription');
  String get sheetTitle => _t('sheetTitle');
  String get sheetSubtitle => _t('sheetSubtitle');
  String get planTitleLabel => _t('planTitleLabel');
  String get planTitleHint => _t('planTitleHint');
  String get planDetailsLabel => _t('planDetailsLabel');
  String get planDetailsHint => _t('planDetailsHint');
  String get pickTimeRequired => _t('pickTimeRequired');
  String get savePlan => _t('savePlan');
  String get validationTitleTime => _t('validationTitleTime');
  String get fabSemantics => _t('fabSemantics');
  String get timePickerSemantics => _t('timePickerSemantics');
  String get timePickerHint => _t('timePickerHint');
  String get wisdomSport => _t('wisdomSport');
  String get wisdomStudy => _t('wisdomStudy');
  String get wisdomStress => _t('wisdomStress');
  String get wisdomReading => _t('wisdomReading');
  String get wisdomDefault => _t('wisdomDefault');

  String selectedTime(String time) => locale.languageCode == 'tr' ? 'Seçilen saat: $time' : 'Selected time: $time';

  String planCardSemantics(int index) =>
      locale.languageCode == 'tr' ? '$index. plan kartı' : 'Plan card $index';

  String planOrderSemantics(int index) =>
      locale.languageCode == 'tr' ? 'Plan sırası $index' : 'Plan order $index';

  String timeSemantics(String time) =>
      locale.languageCode == 'tr' ? 'Plan saati $time' : 'Plan time $time';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
