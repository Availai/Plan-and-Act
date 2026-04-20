# Plan and Act

Plan and Act, kullanıcıların gün içindeki hedeflerini hızlıca planlayıp uygulama içinde takip etmesini sağlayan bir Flutter mobil uygulamasıdır. Uygulama, plan içeriğine göre kısa motivasyon/alıntı üretimiyle (Wisdom Engine) kullanıcıyı harekete geçirmeyi amaçlar.

## Ürün Amacı
- Günlük plan oluşturmayı birkaç adımda tamamlanabilir hale getirmek.
- Planları zaman bazlı olarak tek ekranda görünür kılmak.
- Plan içeriğine göre bağlama uygun motivasyon mesajı sunarak uygulama içi etkileşimi artırmak.

## Özellikler (Mevcut)
1. **Plan oluşturma**: Başlık, açıklama ve saat bilgisiyle yeni plan ekleme.
2. **Listeleme ve sıralama**: Planların ana ekranda zamana göre sıralı gösterimi.
3. **Yerel kalıcılık**: Planların cihazda `SharedPreferences` ile saklanması.
4. **Wisdom Engine (kural tabanlı)**: Plan metnine göre anahtar kelime eşleşmesiyle motivasyon cümlesi üretimi.
5. **Modern arayüz**: Material 3 teması, alt sayfa (bottom sheet) ile plan ekleme akışı.

## Mimari
Uygulama şu anda basit ve feature odaklı bir yapıda ilerlemektedir:

- `lib/main.dart`
  - Uygulama başlatma, tema ve `HomeScreen` yönlendirmesi.
- `lib/features/plan_management/`
  - `home_screen.dart`: Planların listelendiği ana ekran.
  - `add_plan_sheet.dart`: Plan oluşturma formu.
  - `plan_model.dart`: Plan veri modeli.
- `lib/features/wisdom_engine/`
  - `wisdom_service.dart`: Kural tabanlı motivasyon üretimi.
- `lib/core/`
  - `storage_service.dart`: Planların yerel depolamaya yazılması/okunması.

## Technology Stack

### Mevcut Durum (Current)
- **Frontend**: Flutter (Dart)
- **State management**: StatefulWidget + `setState`
- **Local storage**: `shared_preferences`
- **Notification dependency**: `flutter_local_notifications` ve `timezone` paketleri eklendi, ancak uçtan uca bildirim akışı henüz aktif değil
- **Hedef platformlar**: Android, iOS, Web, Desktop (Flutter proje iskeleti mevcut)

### Hedef Mimari (Target)
- **Katmanlı yapı**: Presentation / Application / Data ayrımının netleştirilmesi
- **State management dönüşümü**: `setState` yaklaşımından daha ölçeklenebilir bir yapıya (örn. Riverpod/Bloc) geçiş
- **Bildirim altyapısı**: Zamanlanmış yerel bildirimlerin plan yaşam döngüsüne bağlı tam entegrasyonu
- **Senkronizasyon**: İhtiyaca göre bulut backend (örn. Firebase) ile cihazlar arası veri eşitleme
- **Gelişmiş Wisdom Engine**: Kural tabanlı eşleştirmeden daha esnek/öğrenebilir öneri sistemine geçiş

## Kurulum Adımları
1. Flutter SDK kurulu olduğundan emin olun.
2. Depoyu klonlayın:
   ```bash
   git clone <repo-url>
   cd Plan-and-Act
   ```
3. Paketleri yükleyin:
   ```bash
   flutter pub get
   ```
4. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```
5. (Opsiyonel) Kod kalitesi ve test:
   ```bash
   flutter analyze
   flutter test
   ```

## Roadmap
- [x] Temel plan oluşturma ve listeleme
- [x] Yerel depolama ile planların kalıcılığı
- [x] Kural tabanlı Wisdom Engine
- [ ] Plan düzenleme / silme akışları
- [ ] Zamanlanmış yerel bildirimlerin uçtan uca aktif edilmesi
- [ ] State management katmanının ölçeklenebilir mimariye taşınması
- [ ] Birden fazla gün/tarih için planlama ve filtreleme
- [ ] Bulut senkronizasyonu ve kullanıcı hesabı altyapısı

## Known limitations
- Bildirim paketleri projede bulunmasına rağmen, plan oluşturma anında bildirim planlama/iptal etme akışı henüz uygulanmamıştır.
- Veri modeli ve UI katmanı arasında doğrudan bağlar mevcut; ölçek büyüdükçe bakım maliyeti artabilir.
- State yönetimi `setState` tabanlı olduğu için modül sayısı arttıkça test edilebilirlik ve öngörülebilirlik düşebilir.
- Planlar yalnızca yerel depolamada tutulduğu için cihazlar arası senkronizasyon yoktur.

## Next milestones
1. **Bildirim altyapısı (öncelikli)**
   - `flutter_local_notifications` + `timezone` ile plan bazlı zamanlanmış bildirimleri devreye almak.
   - Plan güncelleme/silme durumunda bildirim yeniden planlama ve iptal stratejisini eklemek.
2. **State management dönüşümü (öncelikli)**
   - Feature bazlı state katmanını Riverpod/Bloc gibi bir yaklaşıma taşımak.
   - UI, domain ve data sorumluluklarını ayrıştırarak test kapsamını genişletmek.
3. **Plan yaşam döngüsü geliştirmeleri**
   - Düzenleme, silme, tamamlandı/ertelendi durumlarının eklenmesi.
4. **Senkronizasyon hazırlığı**
   - Backend entegrasyonu için repository arayüzlerinin tanımlanması ve veri erişim soyutlamasının tamamlanması.
