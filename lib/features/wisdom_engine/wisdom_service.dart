import 'package:planandact/l10n/app_localizations.dart';

class WisdomService {
  static String generateWisdom(
    String title,
    String description,
    AppLocalizations l10n,
  ) {
    final text = ('$title $description').toLowerCase();

    if (text.contains('spor') || text.contains('idman') || text.contains('koşu')) {
      return l10n.wisdomSport;
    } else if (text.contains('ders') ||
        text.contains('çalış') ||
        text.contains('proje') ||
        text.contains('sınav')) {
      return l10n.wisdomStudy;
    } else if (text.contains('zor') || text.contains('problem') || text.contains('stres')) {
      return l10n.wisdomStress;
    } else if (text.contains('kitap') || text.contains('oku')) {
      return l10n.wisdomReading;
    } else {
      return l10n.wisdomDefault;
    }
  }
}
