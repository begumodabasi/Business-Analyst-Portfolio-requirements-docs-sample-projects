# ✅ Test Senaryoları — Kredi Başvuruları Analizi

Bu dosyada, projede kullanılan SQL sorgularına karşılık gelen iş kurallarını doğrulayan test senaryoları listelenmektedir.  
Amaç, SQL sorgularının iş kurallarına uygunluğunu kontrol etmek ve beklenen çıktıları doğrulamaktır.  

--

## 1. Onay / Red Oranı
| ID   | Senaryo Açıklaması | Girdi | Beklenen Çıktı |
|------|--------------------|-------|----------------|
| TC01 | Başvuruların durumlarının doğru işlendiğini kontrol et | Applications tablosu (`status`: Approved, Pending, Rejected) | Her başvuru doğru kategoriye atanmalı |
| TC02 | Oranların %100’e tamamlandığını doğrula | Tüm başvuruların sayısı | Approved + Pending + Rejected = 100% |

---

## 2. Bölgelere Göre Başvuru Dağılımı
| ID   | Senaryo Açıklaması | Girdi | Beklenen Çıktı |
|------|--------------------|-------|----------------|
| TC03 | Başvuruların doğru bölgelere dağıldığını kontrol et | Customers tablosundaki `region` sütunu | Her müşteri başvurusu doğru bölgeye atanmalı |
| TC04 | Bölge toplamları ile genel toplamın tutarlı olduğunu doğrula | Tüm başvuruların sayısı | Sum(region başvuru sayıları) = Genel toplam |

---

## 3. Kredi Türüne Göre Ortalama Tutar
| ID   | Senaryo Açıklaması | Girdi | Beklenen Çıktı |
|------|--------------------|-------|----------------|
| TC05 | Ortalama kredi tutarı doğru hesaplanıyor mu? | Applications tablosu (`type`, `amount`) | Her kredi türü için ortalama tutar doğru hesaplanmalı |
| TC06 | Ortalama yalnızca ilgili kredi türünden alınmalı | type = Konut / Ticari / İhtiyaç | Tür bazında ortalama tutarlar beklenen şekilde çıkmalı |

---

## 4. Müşteri Bazında Geciken Ödemeler
| ID   | Senaryo Açıklaması | Girdi | Beklenen Çıktı |
|------|--------------------|-------|----------------|
| TC07 | Gecikme hesaplaması doğru mu? | Payments tablosu (`payment_date`, `due_date`) | payment_date > due_date olduğunda “Delayed” işaretlenmeli |
| TC08 | Müşteri bazında toplam gecikme sayısı doğru mu? | Customers + Payments | Her müşteri için gecikme sayısı doğru hesaplanmalı |

---

## 🎯 Özet
- Test senaryoları, SQL çıktılarının **iş kurallarına uygunluğunu** kontrol etmek için tasarlandı.  
- Amaç, raporlarda görünen verilerin güvenilirliğini sağlamaktır.  

