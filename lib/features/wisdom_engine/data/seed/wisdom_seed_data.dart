import 'package:drift/drift.dart';
import 'package:planandact/shared/data/local/app_database.dart';

/// Seed data payload for the Wisdom Engine database initialization.
class WisdomSeedData {
  WisdomSeedData._();

  /// Populates initial wisdom reference data.
  static Future<void> seed(AppDatabase db) async {
    final now = DateTime.now();

    final baseFigures = [
      _FigureSeed(id: 'fig_m_aurelius', name: 'Marcus Aurelius', era: 'Antik Roma', bio: 'Roma Imparatoru ve Stoaci Filozof'),
      _FigureSeed(id: 'fig_ataturk', name: 'Mustafa Kemal Ataturk', era: '20. Yuzyil', bio: 'Turkiye Cumhuriyeti Kurucusu'),
      _FigureSeed(id: 'fig_seneca', name: 'Seneca', era: 'Antik Roma', bio: 'Stoaci Filozof ve Yazar'),
    ];

    for (final f in baseFigures) {
      await db.into(db.historicalFigures).insert(
            HistoricalFiguresCompanion.insert(
              id: f.id,
              name: f.name,
              era: Value(f.era),
              shortBio: Value(f.bio),
              createdAt: now,
              updatedAt: now,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }

    final tags = [
      QuoteTagsCompanion.insert(id: 'tag_discipline', slug: 'discipline', name: 'Disiplin', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_resilience', slug: 'resilience', name: 'Dayaniklilik', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_execution', slug: 'execution', name: 'Uygulama', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_deepFocus', slug: 'deepFocus', name: 'Derin Odak', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_type_sport', slug: 'sport', name: 'SPOR', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_type_programming', slug: 'programming', name: 'PROGRAMMING', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_type_sosyallesme', slug: 'sosyallesme', name: 'SOSYALLESME', createdAt: now),
      QuoteTagsCompanion.insert(id: 'tag_type_arastirma', slug: 'arastirma', name: 'ARASTIRMA', createdAt: now),
    ];

    for (final t in tags) {
      await db.into(db.quoteTags).insert(t, mode: InsertMode.insertOrIgnore);
    }

    final baseQuotes = [
      QuotesCompanion.insert(
        id: 'q_aurelius_1',
        quoteText: 'Safagin ilk isiklarinda, yataktan cikmakta zorlandiginda kendine sunu hatirlat: Bir insan olarak gorevimi yapmak icin uyaniyorum.',
        figureId: 'fig_m_aurelius',
        tone: const Value('direct'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_ataturk_1',
        quoteText: 'Dinlenmemek uzere yurumeye karar verenler, asla ve asla yorulmazlar.',
        figureId: 'fig_ataturk',
        tone: const Value('intense'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_seneca_1',
        quoteText: 'Hayat kisa degil, biz onun cogunu bosa harciyoruz.',
        figureId: 'fig_seneca',
        tone: const Value('strategic'),
        attributionConfidence: const Value(1.0),
        createdAt: now,
        updatedAt: now,
      ),
      QuotesCompanion.insert(
        id: 'q_aurelius_2',
        quoteText: 'Senin elinde olmayan seyler icin endiselenmeyi birak. Odaklanman gereken tek sey kendi davranislarindir.',
        figureId: 'fig_m_aurelius',
        tone: const Value('calm'),
        attributionConfidence: const Value(0.9),
        createdAt: now,
        updatedAt: now,
      ),
    ];

    for (final q in baseQuotes) {
      await db.into(db.quotes).insert(q, mode: InsertMode.insertOrIgnore);
    }

    final baseLinks = [
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_1', tagId: 'tag_execution'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_1', tagId: 'tag_discipline'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_ataturk_1', tagId: 'tag_resilience'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_ataturk_1', tagId: 'tag_execution'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_seneca_1', tagId: 'tag_deepFocus'),
      QuoteTagLinksCompanion.insert(quoteId: 'q_aurelius_2', tagId: 'tag_deepFocus'),
    ];

    for (final l in baseLinks) {
      await db.into(db.quoteTagLinks).insert(l, mode: InsertMode.insertOrIgnore);
    }

    final typeTagIds = {
      'sport': 'tag_type_sport',
      'programming': 'tag_type_programming',
      'sosyallesme': 'tag_type_sosyallesme',
      'arastirma': 'tag_type_arastirma',
    };

    final figuresByName = <String, String>{
      for (final f in baseFigures) f.name: f.id,
    };

    final uniqueFigureNames = _eliteCorpus.map((e) => e.figureName).toSet();
    for (final figureName in uniqueFigureNames) {
      if (figuresByName.containsKey(figureName)) continue;
      final id = 'fig_auto_${_slug(figureName)}';
      figuresByName[figureName] = id;
      await db.into(db.historicalFigures).insert(
            HistoricalFiguresCompanion.insert(
              id: id,
              name: figureName,
              era: const Value('Modern Donem'),
              shortBio: const Value('Alaninda ust duzey performans sahibi lider'),
              createdAt: now,
              updatedAt: now,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }

    for (final entry in _eliteCorpus) {
      final figureId = figuresByName[entry.figureName]!;
      final quoteId = 'q_type_${entry.type}_${entry.index.toString().padLeft(2, '0')}';

      await db.into(db.quotes).insert(
            QuotesCompanion.insert(
              id: quoteId,
              quoteText: entry.quote,
              figureId: figureId,
              tone: const Value('direct'),
              attributionConfidence: const Value(0.85),
              createdAt: now,
              updatedAt: now,
            ),
            mode: InsertMode.insertOrIgnore,
          );

      final typeTagId = typeTagIds[entry.type]!;
      await db.into(db.quoteTagLinks).insert(
            QuoteTagLinksCompanion.insert(quoteId: quoteId, tagId: typeTagId),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }
}

String _slug(String value) {
  return value
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .replaceAll(RegExp(r'^_|_$'), '');
}

class _FigureSeed {
  const _FigureSeed({
    required this.id,
    required this.name,
    required this.era,
    required this.bio,
  });

  final String id;
  final String name;
  final String era;
  final String bio;
}

class _EliteQuoteSeed {
  const _EliteQuoteSeed({
    required this.type,
    required this.index,
    required this.figureName,
    required this.quote,
  });

  final String type;
  final int index;
  final String figureName;
  final String quote;
}

const _eliteCorpus = <_EliteQuoteSeed>[
  // SPOR (25)
  _EliteQuoteSeed(type: 'sport', index: 1, figureName: 'Muhammad Ali', quote: 'Sampiyonlar spor salonunda degil, iclerindeki derin istekten dogar.'),
  _EliteQuoteSeed(type: 'sport', index: 2, figureName: 'Michael Jordan', quote: 'Basarisizligi kabul edebilirim, denememeyi asla.'),
  _EliteQuoteSeed(type: 'sport', index: 3, figureName: 'Serena Williams', quote: 'Her kadin gucludur; fark, o gucu ne kadar kullandigindadir.'),
  _EliteQuoteSeed(type: 'sport', index: 4, figureName: 'Usain Bolt', quote: 'Calismadan sadece yetenek seni bir yere kadar goturur.'),
  _EliteQuoteSeed(type: 'sport', index: 5, figureName: 'Kobe Bryant', quote: 'Buyukluk, her gun bir oncekinden daha iyi olmaktir.'),
  _EliteQuoteSeed(type: 'sport', index: 6, figureName: 'Cristiano Ronaldo', quote: 'Yetenegin varsa guzel; ama disiplin yoksa yetmez.'),
  _EliteQuoteSeed(type: 'sport', index: 7, figureName: 'Lionel Messi', quote: 'Hedefe ulasmak icin calisma biciminizi surekli gelistirin.'),
  _EliteQuoteSeed(type: 'sport', index: 8, figureName: 'Nadia Comaneci', quote: 'Mukemmellik bir anda degil, tekrar tekrar yapilarak gelir.'),
  _EliteQuoteSeed(type: 'sport', index: 9, figureName: 'Michael Phelps', quote: 'Hayaller, net bir planla birlesince gercege donusur.'),
  _EliteQuoteSeed(type: 'sport', index: 10, figureName: 'Roger Federer', quote: 'Sakin kalmak da performansin bir parcasidir.'),
  _EliteQuoteSeed(type: 'sport', index: 11, figureName: 'Rafael Nadal', quote: 'Sahada saygi, her topa son topmus gibi davranmaktir.'),
  _EliteQuoteSeed(type: 'sport', index: 12, figureName: 'Novak Djokovic', quote: 'Basinci yonetmeyi ogrenen, oyunu yonetir.'),
  _EliteQuoteSeed(type: 'sport', index: 13, figureName: 'Diego Simeone', quote: 'Adim adim ilerlemek, en guvenli hizlanma yoludur.'),
  _EliteQuoteSeed(type: 'sport', index: 14, figureName: 'Phil Jackson', quote: 'Takim oyunu, egoyu sisteme hizmet ettirmektir.'),
  _EliteQuoteSeed(type: 'sport', index: 15, figureName: 'Carlo Ancelotti', quote: 'Buyuk takimlar panik degil, denge uretir.'),
  _EliteQuoteSeed(type: 'sport', index: 16, figureName: 'Alex Ferguson', quote: 'Standartlar bir kez dusunce, sonuclar da duser.'),
  _EliteQuoteSeed(type: 'sport', index: 17, figureName: 'Pep Guardiola', quote: 'Ayrintilar oyunu degil, sezonu kazandirir.'),
  _EliteQuoteSeed(type: 'sport', index: 18, figureName: 'Bill Belichick', quote: 'Isini yap; sonuc cogu zaman kendiliginden gelir.'),
  _EliteQuoteSeed(type: 'sport', index: 19, figureName: 'Tom Brady', quote: 'Uzun vadeli ustunluk, kisa vadeli konfordan vazgecmektir.'),
  _EliteQuoteSeed(type: 'sport', index: 20, figureName: 'LeBron James', quote: 'Liderlik once davranista gorunur, sonra sozde.'),
  _EliteQuoteSeed(type: 'sport', index: 21, figureName: 'Iga Swiatek', quote: 'Ritmini koruyan sporcu, baskiyi azaltir.'),
  _EliteQuoteSeed(type: 'sport', index: 22, figureName: 'Simone Biles', quote: 'Kendi zihnini yonetmek de performanstir.'),
  _EliteQuoteSeed(type: 'sport', index: 23, figureName: 'Mikaela Shiffrin', quote: 'Tek bir hata degil, genel sistem seni belirler.'),
  _EliteQuoteSeed(type: 'sport', index: 24, figureName: 'Eliud Kipchoge', quote: 'Insan zihni sinirsizdir; siniri once biz koyariz.'),
  _EliteQuoteSeed(type: 'sport', index: 25, figureName: 'Mustafa Kemal Ataturk', quote: 'Ben sporcunun zeki, cevik ve ayni zamanda ahlaklisini severim.'),

  // PROGRAMMING (25)
  _EliteQuoteSeed(type: 'programming', index: 1, figureName: 'Donald Knuth', quote: 'Erken optimizasyon, cogu problemin kaynagidir.'),
  _EliteQuoteSeed(type: 'programming', index: 2, figureName: 'Linus Torvalds', quote: 'Konusmak ucuzdur; bana kodu goster.'),
  _EliteQuoteSeed(type: 'programming', index: 3, figureName: 'Grace Hopper', quote: 'Bir seyin daha once yapilmamasi, yapilamayacagi anlamina gelmez.'),
  _EliteQuoteSeed(type: 'programming', index: 4, figureName: 'Martin Fowler', quote: 'Any fool can write code that a computer can understand; good programmers write code humans can understand.'),
  _EliteQuoteSeed(type: 'programming', index: 5, figureName: 'Robert C. Martin', quote: 'Temiz kod, bugunun degil yarinin da maliyetini dusurur.'),
  _EliteQuoteSeed(type: 'programming', index: 6, figureName: 'Edsger Dijkstra', quote: 'Basitlik, dogru tasarimin en guvenilir isaretidir.'),
  _EliteQuoteSeed(type: 'programming', index: 7, figureName: 'Ken Thompson', quote: 'Bir seyi cok iyi biliyorsan, onu degistirmekten korkmazsin.'),
  _EliteQuoteSeed(type: 'programming', index: 8, figureName: 'Bjarne Stroustrup', quote: 'Dili degil, dusunce sistemini iyi secmek gerekir.'),
  _EliteQuoteSeed(type: 'programming', index: 9, figureName: 'Brian Kernighan', quote: 'Hata ayiklamak, yazmaktan zordur; kodu olabildigince net yaz.'),
  _EliteQuoteSeed(type: 'programming', index: 10, figureName: 'Guido van Rossum', quote: 'Okunabilirlik, ekip hizini dogrudan belirler.'),
  _EliteQuoteSeed(type: 'programming', index: 11, figureName: 'Margaret Hamilton', quote: 'Yuksek guvenilirlik, sistematik dusunmenin sonucudur.'),
  _EliteQuoteSeed(type: 'programming', index: 12, figureName: 'James Gosling', quote: 'Saglam mimari, teknolojiden daha uzun omurludur.'),
  _EliteQuoteSeed(type: 'programming', index: 13, figureName: 'Anders Hejlsberg', quote: 'Gelismis araclar, iyi muhendisligi ikame etmez; hizlandirir.'),
  _EliteQuoteSeed(type: 'programming', index: 14, figureName: 'John Carmack', quote: 'Olcmek bilmekten daha degerlidir; tahmin degil veri kullan.'),
  _EliteQuoteSeed(type: 'programming', index: 15, figureName: 'Jeff Dean', quote: 'Sistemler buyudukce ayrintilar stratejiye donusur.'),
  _EliteQuoteSeed(type: 'programming', index: 16, figureName: 'Barbara Liskov', quote: 'Soyutlama, karmasikligi yonetmenin anahtaridir.'),
  _EliteQuoteSeed(type: 'programming', index: 17, figureName: 'David Heinemeier Hansson', quote: 'Urun teslim etmeyen kod, sadece varsayimdir.'),
  _EliteQuoteSeed(type: 'programming', index: 18, figureName: 'Rich Hickey', quote: 'Basitlik bir ozelliktir; tesadufen olusmaz.'),
  _EliteQuoteSeed(type: 'programming', index: 19, figureName: 'Kent Beck', quote: 'Kucuk adimlar, buyuk degisimleri guvenli hale getirir.'),
  _EliteQuoteSeed(type: 'programming', index: 20, figureName: 'Ward Cunningham', quote: 'Teknik borc, fark edilmediginde en hizli buyuyen borctur.'),
  _EliteQuoteSeed(type: 'programming', index: 21, figureName: 'Sandi Metz', quote: 'Degisim maliyeti dusukse, gelisim hizi yuksek kalir.'),
  _EliteQuoteSeed(type: 'programming', index: 22, figureName: 'Niklaus Wirth', quote: 'Programlar, once insanlar sonra makineler icindir.'),
  _EliteQuoteSeed(type: 'programming', index: 23, figureName: 'Alan Kay', quote: 'Gelecegi ongormenin en iyi yolu, onu insa etmektir.'),
  _EliteQuoteSeed(type: 'programming', index: 24, figureName: 'Tim Berners-Lee', quote: 'Acik standartlar, buyuk olcekli ilerlemenin temelidir.'),
  _EliteQuoteSeed(type: 'programming', index: 25, figureName: 'Frances Allen', quote: 'Performans, disiplinli analiz ve dogru modelleme ile gelir.'),

  // SOSYALLESME (25)
  _EliteQuoteSeed(type: 'sosyallesme', index: 1, figureName: 'Dale Carnegie', quote: 'Insanlarla bag kurmanin en hizli yolu, onlari dikkatle dinlemektir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 2, figureName: 'Maya Angelou', quote: 'Insanlar ne soyledigini unutabilir; onlara ne hissettirdigini unutmaz.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 3, figureName: 'Simon Sinek', quote: 'Guven once iliskiyi, sonra performansi buyutur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 4, figureName: 'Brene Brown', quote: 'Kirilganlik gostermek, bag kurmanin kapisini acar.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 5, figureName: 'Stephen Covey', quote: 'Once anlamaya calis, sonra anlasilmayi bekle.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 6, figureName: 'Nelson Mandela', quote: 'Insanlarla calisiyorsan, saygi en guclu ortak dildir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 7, figureName: 'Oprah Winfrey', quote: 'Gercek liderlik, insanlari gorulmus hissettirmektir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 8, figureName: 'Satya Nadella', quote: 'Empati, inovasyonun da kulturun de yakitidir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 9, figureName: 'Sheryl Sandberg', quote: 'Buyuk ekipler guven ortami oldugunda hizlanir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 10, figureName: 'Reid Hoffman', quote: 'Agini buyutmek, sansini buyutmenin sistematik yoludur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 11, figureName: 'Keith Ferrazzi', quote: 'Network, ihtiyac aninda degil rutin ilgide kurulur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 12, figureName: 'Barack Obama', quote: 'Insanlari bir araya getiren sey, ortak amacin netligidir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 13, figureName: 'Jacinda Ardern', quote: 'Nazik olmak zayiflik degil, olgun guctur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 14, figureName: 'Michelle Obama', quote: 'Dinlemek, iyi bir etkilesimin en kritik becerisidir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 15, figureName: 'Richard Branson', quote: 'Insanlara deger verdiginde, marka kendiliginden buyur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 16, figureName: 'Howard Schultz', quote: 'Kultur once insanlari, sonra sonuclari birlestirir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 17, figureName: 'Tony Hsieh', quote: 'Mutlu ekipler, daha guclu musteri deneyimi uretir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 18, figureName: 'Peter Drucker', quote: 'Iletisimde en buyuk sorun, dinledigimizi sanmaktir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 19, figureName: 'Susan Cain', quote: 'Sessiz insanlar da derin baglarin guclu kurucularidir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 20, figureName: 'Adam Grant', quote: 'Yardim etmeye hazir insanlar, daha dayanikli aglar kurar.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 21, figureName: 'Amy Edmondson', quote: 'Psikolojik guvenlik olmadan ekip ogrenmesi yavaslar.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 22, figureName: 'Patrick Lencioni', quote: 'Guven yoksa ekip, sadece unvanlar toplulugudur.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 23, figureName: 'John Maxwell', quote: 'Liderlik etkidir; etki de iliskiyle baslar.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 24, figureName: 'Naval Ravikant', quote: 'Uzun vadeli oyunlar, uzun vadeli insanlarla kazanilir.'),
  _EliteQuoteSeed(type: 'sosyallesme', index: 25, figureName: 'Ataturk', quote: 'Fikirlerin catismasindan hakikat dogar; medeni tartisma gelistirir.'),

  // ARASTIRMA (25)
  _EliteQuoteSeed(type: 'arastirma', index: 1, figureName: 'Albert Einstein', quote: 'Onemli olan sorgulamayi birakmamaktir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 2, figureName: 'Marie Curie', quote: 'Hayatta hicbir sey korkulacak degildir; yalnizca anlasilmalidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 3, figureName: 'Isaac Newton', quote: 'Daha ileriyi gorduysem, devlerin omzunda durdugum icindir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 4, figureName: 'Richard Feynman', quote: 'Bir seyi aciklayamiyorsan, yeterince anlamamis olabilirsin.'),
  _EliteQuoteSeed(type: 'arastirma', index: 5, figureName: 'Carl Sagan', quote: 'Olaganustu iddialar, olaganustu kanit gerektirir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 6, figureName: 'Rosalind Franklin', quote: 'Bilim, dikkatli gozlem ve sabirli dogrulamadir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 7, figureName: 'Niels Bohr', quote: 'Uzman, cok dar bir alanda tum hatalari yapmis kisidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 8, figureName: 'Charles Darwin', quote: 'Hayatta kalan, degisime en iyi uyum saglayandir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 9, figureName: 'Jane Goodall', quote: 'Kucuk adimlarin birikimi, buyuk bilimsel etki uretir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 10, figureName: 'Katherine Johnson', quote: 'Dogru sonuca giden yol, titiz hesaplamadan gecir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 11, figureName: 'Francis Bacon', quote: 'Bilgi guctur; ancak test edilmis bilgi kalici guctur.'),
  _EliteQuoteSeed(type: 'arastirma', index: 12, figureName: 'Louis Pasteur', quote: 'Sans, hazir zihinlerden yanadir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 13, figureName: 'Max Planck', quote: 'Bilim adim adim, bazen nesil nesil ilerler.'),
  _EliteQuoteSeed(type: 'arastirma', index: 14, figureName: 'Alan Turing', quote: 'Yeni sorular, yeni yontemlerin kapisini acar.'),
  _EliteQuoteSeed(type: 'arastirma', index: 15, figureName: 'Ada Lovelace', quote: 'Analitik dusunce, olasiliklarin ufkunu genisletir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 16, figureName: 'Tu Youyou', quote: 'Kesif, sabirli denemelerin toplamidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 17, figureName: 'Jennifer Doudna', quote: 'Bilimsel ilerleme, etik sorumlulukla birlikte anlam kazanir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 18, figureName: 'Tim Berners-Lee', quote: 'Acik bilgi paylasimi, hizli ogrenmenin katalizorudur.'),
  _EliteQuoteSeed(type: 'arastirma', index: 19, figureName: 'Peter Higgs', quote: 'Derin sorular, hizli degil kalici cevaplar ister.'),
  _EliteQuoteSeed(type: 'arastirma', index: 20, figureName: 'Aziz Sancar', quote: 'Basari, uzun soluklu ve disiplinli laboratuvar emegidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 21, figureName: 'Canan Dagdeviren', quote: 'Soruna yakin duran arastirmaci, cozum uretebilir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 22, figureName: 'Stephen Hawking', quote: 'Merak, insan zihninin en guclu itici kuvvetidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 23, figureName: 'Vera Rubin', quote: 'Veri, varsayimlarimizi degistirmemizi talep edebilir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 24, figureName: 'Sally Ride', quote: 'Bilim, cesaret ve disiplinin ortak dilidir.'),
  _EliteQuoteSeed(type: 'arastirma', index: 25, figureName: 'Ibn Sina', quote: 'Bilgi, soru soran zihnin sabirli emegiyle olgunlasir.'),
];
