class WisdomService {
  // Planın başlığını ve detayını alıp, içeriğe göre uygun bir söz döndüren fonksiyon
  static String generateWisdom(String title, String description) {
    // Kelimeleri kolay yakalamak için hepsini küçük harfe çevirip birleştiriyoruz
    final text = ('$title $description').toLowerCase();

    if (text.contains('spor') ||
        text.contains('idman') ||
        text.contains('koşu')) {
      return "Sağlam kafa sağlam vücutta bulunur.\n- Mustafa Kemal Atatürk";
    } else if (text.contains('ders') ||
        text.contains('çalış') ||
        text.contains('proje') ||
        text.contains('sınav')) {
      return "Hiçbir şeye ihtiyacımız yok, yalnız bir şeye ihtiyacımız var: Çalışkan olmak!\n- Mustafa Kemal Atatürk";
    } else if (text.contains('zor') ||
        text.contains('problem') ||
        text.contains('stres')) {
      return "Hayatımız, düşüncelerimizin eseridir.\n- Marcus Aurelius";
    } else if (text.contains('kitap') || text.contains('oku')) {
      return "Okumak, zihni beslemektir.\n- Seneca";
    } else {
      // Eğer özel bir kelime yakalayamazsa standart bir motivasyon sözü verelim
      return "Zamanın değerini bil, çünkü hayat ondan ibarettir.\n- Benjamin Franklin";
    }
  }
}
