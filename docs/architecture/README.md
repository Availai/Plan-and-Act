# Plan and Act Architecture Docs

Bu klasor, `PHASE 1` ciktisini tek bir dev dokumana yigmak yerine moduller halinde ayirir.

Okuma sirasi:

1. [01-system-overview.md](./01-system-overview.md)
2. [02-tech-stack.md](./02-tech-stack.md)
3. [modules/planning.md](./modules/planning.md)
4. [modules/wisdom-engine.md](./modules/wisdom-engine.md)
5. [modules/video-of-the-day.md](./modules/video-of-the-day.md)
6. [modules/notifications.md](./modules/notifications.md)
7. [data/schema-and-sync.md](./data/schema-and-sync.md)
8. [implementation/target-file-map.md](./implementation/target-file-map.md)

Bu setin amaci:

- urun vizyonunu uygulanabilir modullere bolmek
- domain sinirlarini netlestirmek
- local-first veri modelini kalici hale getirmek
- Wisdom Engine'i bagimsiz bir sistem olarak tanimlamak
- kod yazmadan once hedef dosya yapisini netlestirmek

Bu dokumanlar bilerek tek dosya degil. Cunku bu projede asiri uzun, tek parcali bir mimari notu zamanla hem okunmaz hem de bakimsiz hale gelir.

Kod asamasina gecmeden once okunmasi gereken minimum dosyalar:

- `01-system-overview.md`
- `modules/planning.md`
- `modules/wisdom-engine.md`
- `data/schema-and-sync.md`
- `implementation/target-file-map.md`

Not:

- Bu klasor karar dokumani olarak isler.
- Kod yazimi bunun ustune gelecek Phase 2 calismasidir.
- Kod uretimi bu asamada bilerek baslatilmamistir.
