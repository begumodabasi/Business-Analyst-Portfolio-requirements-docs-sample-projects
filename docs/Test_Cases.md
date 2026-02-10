# Test Cases

## 1. Amaç
Bu doküman, Odoo demo ortamında kurgulanan cep telefonu e-ticaret senaryosunun temel gereksinimlerinin doğrulanması için hazırlanmış test senaryolarını içerir.

## 2. Kapsam
Testler aşağıdaki başlıkları kapsar:
- Çoklu para birimi (TRY ana para birimi, USD/GBP aktif ve kur tanımlı)
- Seri numarası (lot/serial) ile izlenebilirlik (alım/teslim alma sırasında seri no zorunluluğu)
- Ürün varyantları (renk + model) ve varyant yönetimi (arşivleme dahil)
- Website müşteri tipi (misafir vs üye/portal) ve üye fiyat listesinin uygulanması

## 3. Varsayımlar / Kısıtlar
- Çalışma Odoo demo (SaaS) ortamında yapılmıştır.
- Demo ortam kısıtları sebebiyle bazı ekran doğrulamaları sınırlı kalabilir.
- Kanıtlar ekran görüntüsü olarak “screenshots” altında tutulur ve her testte referans verilir.

---

# Test Senaryoları

> Format:
> - Test ID
> - Başlık
> - Ön Koşullar
> - Adımlar
> - Beklenen Sonuç
> - Kanıt / Ek

---

## TC-001 — Çoklu Para Birimi Aktifliği (TRY ana, USD/GBP aktif)
**Ön Koşullar**
- Muhasebe modülüne erişim var.
- Sistem yönetici yetkisi mevcut.

**Adımlar**
1. Muhasebe / Ayarlar menüsüne gir.
2. Para birimleri listesini aç.
3. TRY ana para birimini kontrol et.
4. USD ve GBP para birimlerinin aktif olduğunu doğrula.
5. Kur oranlarının tanımlı/erişilebilir olduğunu kontrol et.

**Beklenen Sonuç**
- TRY ana para birimi olarak ayarlı görünür.
- USD ve GBP aktif durumdadır.
- Kur oranları görüntülenebilir veya sistemde tanımlı olduğu doğrulanır.

**Kanıt / Ek**
- Çoklu para birimi süreç akışı [BPMN Diagram](screenshots/BPMN_Diagram.png)
- Ekran görüntüsü: Para birimleri listesi / kur doğrulama ekranı[Para birimleri ekranı](screenshots/01_para_birimleri.png)

---

## TC-002 — Ürün Nitelikleri ile Varyant Oluşturma (renk + model)
**Ön Koşullar**
- Ürün kartına erişim var.
- “Renk” ve “Model” nitelikleri tanımlı (veya tanımlanabilir).

**Adımlar**
1. Stok/Ürünler’den ilgili ürün kartını aç (Özel ürün).
2. “Nitelik & Varyantlar” sekmesine gir.
3. “Renk” niteliğini ekle ve değerleri seç (Yeşil/Mavi/Beyaz).
4. “Model” niteliğini ekle ve değerleri seç (15/16/17).
5. Varyantların oluştuğunu doğrula.

**Beklenen Sonuç**
- Ürün için renk ve model kombinasyonlarından varyantlar sistem tarafından oluşturulur.
- Varyant listesinde her kombinasyon ayrı satır olarak görünür.

**Kanıt / Ek**
- Ekran görüntüsü: [Ürün Varyantları Ekranı](screenshots/02_urun_varyant.png)

- Ekran görüntüsü: [Ürün Varyantları Ekranı](screenshots/02_urun_varyant2.png)

---

## TC-003 — Varyant Arşivleme (seçili varyantları devre dışı bırakma)
**Ön Koşullar**
- TC-002 tamamlanmış olmalı (varyantlar oluşmuş olmalı).

**Adımlar**
1. Stok > Ürün Varyantları ekranına gir.
2. Arşivlemek istediğin varyantları seç (ör. “Model 15 - Mavi”, “Model 17 - Beyaz”).
3. Aksiyonlar > Arşivle seçeneğini uygula.
4. Listede ilgili varyantların artık görünmediğini veya arşiv filtrelerinde göründüğünü doğrula.

**Beklenen Sonuç**
- Seçili varyantlar arşivlenir ve aktif listeden çıkar.
- Arşiv filtresi ile erişilebilir olur.


---

## TC-004 — Seri No ile Takip: Alım/Depoya Girişte Seri Numarası Zorunluluğu
**Ön Koşullar**
- Seri numarası ile takip (lot/serial) ilgili ürün için aktifleştirilmiş olmalı.
- Alım/depoya giriş işlemi başlatılabilir olmalı.

**Adımlar**
1. Stok > Operasyonlar > Alımlar ekranına gir.
2. İlgili alım kaydını aç.
3. Ürün satırında “Lot/Seri Numarası” alanına geç.
4. 2 adet ürün için seri numarası girişi yapmayı dene.
5. Seri no girmeden doğrulama/bitirme yapılabiliyor mu kontrol et.
6. Seri no girerek işlemi tamamla.

**Beklenen Sonuç**
- Sistem seri numarası girilmeden işlemi tamamlamaya izin vermez.
- Seri numarası girildiğinde işlem tamamlanır ve her bir adet ayrı seri no ile izlenir.

**Kanıt / Ek**
- Ekran görüntüleri:

---

## TC-005 — Portal Üye: Üye Fiyat Listesinin Uygulanması
**Ön Koşullar**
- Bir fiyat listesi “Üye (giriş yapan)” için tanımlanmış olmalı.
- Test kullanıcıya portal erişimi verilmiş olmalı.

**Adımlar**
1. CRM/Kontaklar’dan “Test Member” kaydını aç.
2. Portal erişimi verildiğini doğrula.
3. Kontak üzerindeki fiyat listesi alanında “Üye (giriş yapan)” seçili mi kontrol et.
4. Website tarafında test kullanıcı ile giriş yap.
5. Ürün liste/ürün detay sayfasında fiyatın üye fiyat listesine göre geldiğini doğrula.

**Beklenen Sonuç**
- Portal erişimi verilen kullanıcı “Üye” olarak tanımlanır.
- Website’de giriş yapınca fiyat listesi “Üye (giriş yapan)” olur ve fiyatlar buna göre görünür.

**Kanıt / Ek**
- Ekran görüntüsü: Kontak kartı + Portal erişimi
- Ekran görüntüsü: Fiyat listesi kuralı ekranı
- Ekran görüntüsü: Website ürün listeleme sayfası (üye fiyatı görünen)

---

## 4. Test Sonuç Özeti (Opsiyonel)
- Başarılı: TC-001, TC-002, ...
- Kısmi/Limitli: (demo kısıtı nedeniyle)
- Başarısız: ...
