# Business-Analyst-Portfolio-requirements-docs-sample-projects
İş Analisti Portföyü – Gereksinim dokümanı, süreç akışı, veri analizi örnekleri, örnek projeler içermektedir.
Her proje, **Gereksinim Dokümanı (BR/FR/NFR)**, **Süreç Akış Diyagramı (BPMN)** ve ilgili ekler ile birlikte sunulmuştur. 

## 📂 Projeler     



## 📌 Proje 1: Kredi Değerlendirme Modülü – Dijital Dönüşüm

**Amaç:**  
Ticari müşterilerin kredi değerlendirmelerinde kullanılan manuel süreçlerin dijital dönüşümünü sağlamak.  
Bu modül, mali tabloların OCR ile sisteme alınması, finansal rasyoların otomatik hesaplanması, risk puanı üretilmesi (1–10),  
ve kredi politikaları üzerinden karar verilmesi adımlarını kapsamaktadır. Ayrıca Tapu & TSG entegrasyonlarını içerir.  

**Kapsam:**  
- Onaylı mali tabloların taranarak yüklenmesi ve OCR ile okunması  
- Finansal rasyoların otomatik hesaplanması (Borç/Özsermaye, Cari Oran, Likidite Oranı, Kârlılık, Net İşletme Sermayesi)  
- Risk puanı hesaplama ve politika motoru üzerinden karar süreci  
- Tapu ve Ticaret Sicil Gazetesi entegrasyonları  
- Raporlama ve loglama mekanizmaları  
- Yetkili revizyon süreci (maker-checker prensibi)  

📄 **Dokümanlar:**  
- [Gereksinim Dokümanı (BR/FR/NFR)](./Kredi_Degerlendirme_Modulu.docx)
- [Gereksinim Dokümanı (BR/FR/NFR)](./Kredi_Degerlendirme_Modulu.pdf)
- [BPMN Süreç Akışı](./BPMN.png)  
- [ERD / Veri Modeli](./ERD.png)  

👤 **Rolüm:** İş Analisti (dokümanları tek başıma hazırladım)

---

## 📌 Proje 2: Kredi Başvuruları Veri Analizi ve Raporlama

**Proje Özeti**: Ticari kredi başvurularının durumunu analiz etmek ve raporlamak amacıyla hazırladığım mini proje.  
SQL Server üzerinde Customers, Applications ve Payments tablolarını oluşturdum, test verileri ile sorgular çalıştırdım.  
Onay/Ret oranları, bölgelere göre başvuru dağılımları ve aylık trendler analiz edilerek Excel/Power BI üzerinde görselleştirildi.  
Proje, iş analizi bakış açısıyla veri modelleme, gereksinim belirleme ve raporlama becerilerimi göstermektedir.

## İçerikler
- [Gereksinim Özeti](Kredi_Basvurulari_Analizi_Gereksinim_Ozeti.pdf)

### 📝 SQL Analiz Sorguları
[SQL Analiz Sorguları](analysis_queries.sql)  
Kredi başvurularının:
- Onay/Ret oranları
- Bölgelere göre dağılımı
- Geciken ödeme detayları  

**Not:** Bu SQL sorguları demo bir şemaya göre hazırlanmıştır. Portföy amacıyla paylaşıldığından, birebir çalıştırılabilir olmayabilir.  
Amaç, veri analizi ve iş kurallarını kontrol etme yaklaşımını göstermektir.

### ✅ Test Senaryoları
[Test Senaryolarını Görüntüle](test_cases/test_cases.md)  
SQL kullanılarak iş kurallarının doğrulanması.  
**Not:** Bu test senaryoları demo şemaya göre hazırlanmıştır. Portföy amacıyla paylaşıldığından birebir çalıştırılabilir olmayabilir.  

### 📊 Raporlar
SQL çıktılarının Excel/Power BI ile görselleştirilmesi.  
👉 [reports klasörüne göz atın](reports/)

## Kullanılan Teknolojiler
- SQL (MSSQL/PostgreSQL uyumlu sorgular)
- Excel / Power BI (raporlama için)

👤 **Rolüm:** İş Analisti (dokümanları tek başıma hazırladım)

---
## 📌 Proje 3: Kredi Yaşam Döngüsü Mini CRM Projesi - CreditFlow CRM Demo Project

**Proje Özeti**: Bu proje, müşteri başvurularının, finansal inceleme ve destek taleplerinin uçtan uca yönetimini sağlayan mini bir CRM sistemidir.
-Proje kapsamında:  
- **Müşteri başvuruları (Applications)**  
- **Finansal incelemeler (Reviews)**  
- **Müşteri destek talepleri (Tickets)**  
- **Müşteri bilgileri (Customers)**  
yönetilmekte ve aynı zamanda SQL tabanlı veri analizi yapılmaktadır.  

Proje, **SQL** ve **CRM (HubSpot)** arasında köprü görevi görür:  
Veritabanındaki başvuru ve müşteri kayıtları, HubSpot üzerinde satış (Sales) ve destek (Service) süreçleri olarak modellenmiştir.  

Gerçek bir iş analisti veya veri analisti projesi gibi kurgulanmış olup,  
**iş süreçleri – veri modeli – KPI raporlaması – CRM pipeline entegrasyonu** bileşenlerini içermektedir.

## ⚙️ **Kullanılan Teknolojiler**

| Teknoloji | Amaç |
|------------|------|
| **MS SQL Server (T-SQL)** | Veri tabanı, KPI hesaplamaları | (docs/Kpi_queries_report.sql) (docs/T-sql_schema.sql)
| **HubSpot CRM (Free Demo)** | Satış ve müşteri destek süreçleri | (docs/hubspot_pipeline_stages.png) (docs/hubspot_credit_pipeline_filled) (docs/hubspot_tickets_demo)
| **Draw.io (ERD)** | Veri modeli diyagramı | (docs/crm_erd_diagram.drawio.png)
| **GitHub** | Portföy ve versiyon takibi |


## 🧩 **Entity Relationship Diagram (ERD)**![CRM ERD Diagram](docs/crm_erd_diagram.drawio.png)
Bu diyagram, mini CRM sistemindeki veri modelini ve tablolar arası ilişkileri gösterir.  
Toplamda 4 ana tablo vardır: **Customers, Applications, Reviews, Tickets**

📊 **İlişkiler:**
- 1 Customer → N Applications  
- 1 Application → N Reviews  
- 1 Customer → N Tickets  
- 1 Application → N Tickets  


## 🗃️ **Veritabanı (T-SQL) Yapısı**

**1️⃣ Ana tablolar:**
- `customers`
- `applications`
- `reviews`
- `tickets`

**2️⃣ KPI Raporlama

KPI sorguları `sql/03_kpi_queries_reporting.sql` dosyasında yer almaktadır.  
Aşağıda örnek bir sorgu gösterilmiştir:

```sql
-- Onay Oranı (Approval Rate)
SELECT 
  CAST(100.0 * SUM(CASE
WHEN status='APPROVED' THEN 1
ELSE 0
END) /
  NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS approval_rate_pct
FROM dbo.applications;

Diğer KPI senaryoları:
-Ortalama değerlendirme süresi (gün)
-Ret oranı (%)
-SLA içinde kapanan ticket oranı (%)


## 🌟 Hakkımda  
Bilgisayar Mühendisliği mezunuyum ve 10+ yıl süren bankacılık/finans deneyimimin ardından  
teknoloji odaklı analist rollerine (Business Analyst & Data Analyst) geçiş yapıyorum.  

- Bankacılıkta süreç analizi, finansal raporlama ve kredi risk değerlendirme alanlarında deneyimliyim.  
- Şu anda CRM/ERP sistemleri, SQL, Python ve Power BI üzerine uygulamalı projeler geliştiriyorum.  
- Uluslararası İş Analizi Metodolojisi, Agile Proje Yönetimi, Yazılım Test Uzmanlığı ve SQL sertifikalarına sahibim.  
- SAP ERP, UiPath ve veri analitiği eğitimlerim devam etmektedir.   
---

🔗 Contact

LinkedIn: https://www.linkedin.com/in/begum-aslihan-odabasi

Email: begumasli.ozyalcin@gmail.com

📌 Not: Buradaki dokümanlar eğitim amaçlıdır, gizli kurumsal bilgi içermez.  
