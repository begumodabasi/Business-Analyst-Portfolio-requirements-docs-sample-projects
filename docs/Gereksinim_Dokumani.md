# Gereksinim Dökümanı

## Proje Adı: Odoo Demo Mini Case Study — ABC Mobile Ticaret
Amaç: Cep telefonu ticareti yapan bir işletmenin Odoo demo ortamında temel ihtiyaçlarını karşılayacak şekilde konfigüre edilmesi.
Kapsam: Bu çalışma bir “konfigürasyon prototipi”dir. Amaç tam kapsamlı bir e-ticaret sitesi tasarlamak değil, verilen gereksinimleri Odoo üzerinde doğru şekilde kurgulamak ve kısa testlerle doğrulamaktır.
________________________________________
### 1. Paydaşlar ve Roller
-	Admin / Sistem Yöneticisi: Odoo ayarlarını yapar, modülleri yönetir, para birimi ve fiyat listesi kurallarını tanımlar.
- Satış Kullanıcısı: Ürün ve fiyat listeleriyle satış teklif/sipariş süreçlerini kullanır (demo kapsamında sınırlı).
-	Stok Kullanıcısı: Seri numarası (lot/serial) takibini ve stok hareketlerini yönetir.
-	Website Ziyaretçisi (Misafir): Web sitesine giriş yapmadan ürünleri görüntüler.
-	Website Üyesi (Giriş Yapan): Web sitesine giriş yaparak ürünleri görüntüler; üye fiyat listesi uygulanır.
________________________________________
### 2. Varsayımlar ve Kısıtlar
-	Çalışma Odoo demo (SaaS) ortamında yürütülmüştür.
-	Demo ortam kısıtları nedeniyle bazı doğrulamalar (özellikle web tarafı fiyat farkının net gösterimi) tarayıcı önbelleği/oturum gibi sebeplerle sınırlı kalabilir.
-	Erişim bilgileri (URL, kullanıcı adı, şifre) ve üçüncü taraf marka/kurum bilgileri dokümana dahil edilmez.
-	Görsel tasarım/tema düzeni kapsam dışıdır; odak iş kurallarıdır.
________________________________________
### 3. Kullanılan Modüller
-	Website / eCommerce (Mağaza)
-	Sales (Satış)
-	Inventory (Stok)
-	Accounting/Invoicing (Muhasebe/Faturalama) — para birimleri için
-	CRM / Contacts (CRM/Kişiler) — portal/üye kurgusu için
________________________________________
### 4. İş Hedefleri
-	Telefonların seri numarası ile izlenebilir şekilde yönetilmesi
-	Çoklu para birimi altyapısının (TRY, USD, GBP) aktif edilmesi
-	Ürün çeşitlerinin (standart + varyantlı özel ürün) doğru modellenmesi
-	Website’de misafir/üye kullanıcı için farklı fiyat listesi kurgusunun yapılması
________________________________________
### 5. Gereksinimler
## R1 — Cep telefonu e-ticaret sitesi
Tanım: Odoo üzerinde web sitesi/mağaza kanalı aktif olmalı ve ürünler webde listelenebilmelidir.
Kabul Kriterleri:
-	Website modülü aktif.
-	En az 1 ürün “webde yayınlandı” olarak listelenebilir.
-	Webde ürün listeleme sayfası erişilebilir.
Kapsam Dışı:
-	Tema tasarımı, ödeme altyapısı detayları.
________________________________________
## R2 — Ürünlerin seri numarasıyla takip edilmesi
Tanım: Telefon ürünleri stokta benzersiz seri numarası ile izlenecek şekilde yapılandırılmalıdır.
İş Kuralları:
-	Telefon ürünleri “Seri No’ya göre izleme” ile takip edilir.
-	Stok giriş/transfer işlemlerinde seri numarası girilmeden doğrulama yapılamaz.
Kabul Kriterleri:
-	Stok ayarlarında Lot/Seri Numaraları aktif.
-	Ürün kartında “İzleme: Seri No’lara göre” seçili.
-	Bir alım/transfer hareketinde (miktar > 0) seri numarası girilmeden “Doğrula” denendiğinde sistem uyarı verir.
-	Seri numaraları girildikten sonra hareket başarıyla tamamlanır (Done).
________________________________________
## R3 — Sistemde TRY, USD, GBP para birimlerinin olması
Tanım: Sistem çoklu para birimi desteklemeli ve TRY, USD, GBP kullanılabilir olmalıdır.
İş Kuralları:
-	Şirket ana para birimi TRY’dir.
-	USD ve GBP aktif edilmelidir.
-	USD/GBP arşivli/pasif ise arşivden çıkarılarak aktive edilir.
Kabul Kriterleri:
-	Para birimleri listesinde TRY, USD, GBP görünür ve aktif durumdadır.
-	Kur oranları görüntülenebilir/dolu.
________________________________________
## R4 — Standart ürünlerin olması
Tanım: Varyantsız/standart ürün kartları sistemde yer almalıdır.
Kabul Kriterleri:
-	En az 2 adet standart ürün kartı oluşturulmuştur.
-	Ürünler listesinde görülebilir.
-	Webde yayınlanarak listelenebilir.
________________________________________
## R5 — Özel ürün + varyant sistemi (kısıtlarla)
Tanım: Standart ürünlerin yanında 1 adet özel ürün tanımlanmalı ve varyant sistemi kullanılmalıdır.
Varyant Nitelikleri:
-	Renk: Yeşil, Mavi, Beyaz
-	Model: 15, 16, 17
Kısıtlar (İş Kuralı):
-	Model 15’te Mavi seçeneği bulunmaz.
-	Model 17’de Beyaz seçeneği bulunmaz.
Kabul Kriterleri:
-	Özel ürün üzerinde renk/model nitelikleri tanımlıdır.
-	Varyantlar oluşturulmuştur.
-	Geçersiz kombinasyonlar (15-Mavi, 17-Beyaz) sistemde oluşmuyor veya aktif listede görünmüyor (demo ortamda arşivleme/pasifleştirme yöntemiyle yönetilebilir).
- Geçerli kombinasyonlar listede bulunur (toplam 7 varyant beklenir).
________________________________________
## R6 — Üye ve misafir kullanıcı için farklı TL fiyat listesi
Tanım: Web sitesinde giriş yapan üyeler ile misafir kullanıcılar aynı üründe farklı TL fiyatı görmelidir.
İş Kuralları:
-	Misafir kullanıcıya “Public/Misafir” fiyat listesi uygulanır.
-	Üye kullanıcıya “Member/Üye” fiyat listesi uygulanır.
-	Fiyat listeleri TL bazındadır.
Kabul Kriterleri:
-	İki ayrı TL fiyat listesi oluşturulmuştur (Misafir ve Üye).
-	Üye kullanıcıya/portaI kontağa Üye fiyat listesi atanmıştır.
-	Webde misafir ve üye oturumunda aynı üründe farklı fiyat görülebilir.
-	Demo kısıtları nedeniyle webde birebir kıyas kanıtı alınamayabilir, bu nedenle fiyat listesi kural ekranı + üye kullanıcı kartındaki pricelist ataması birlikte kabul kriteri olarak uygundur.
________________________________________
### 6. Çıktılar / Teslimatlar
-	Konfigürasyon tamamlanmış demo ortamı
-	Ekran görüntüsü arşivi
-	BPMN diyagram
-	Test case dokümanı
________________________________________
### 7. Başarı Kriteri
Gereksinimlerin her biri için kabul kriterleri sağlanmış olmalı; mümkün olduğunca ekran görüntüsüyle desteklenmelidir.

