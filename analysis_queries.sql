/* ======================================================
   Analysis Queries — Credit Applications Mini Project
   ====================================================== */

/* 1) Onay/Red/Beklemede oranları */
SELECT status, COUNT(*) AS total
FROM dbo.Applications
GROUP BY status;

/* 2) Bölgelere göre başvuru sayısı */
SELECT c.region, COUNT(*) AS app_count
FROM dbo.Applications a
JOIN dbo.Customers c ON a.customer_id = c.customer_id
GROUP BY c.region
ORDER BY app_count DESC;

/* 3) Kredi türüne göre ortalama tutar */
SELECT type, AVG(amount) AS avg_amount
FROM dbo.Applications
GROUP BY type
ORDER BY avg_amount DESC;

/* 4) Müşteri Bazında Geciken Ödeme Sayısı */
SELECT c.name, 
	COUNT(*) AS delayed_payment_count
FROM dbo.Payments p
	JOIN dbo.Applications a ON p.application_id = a.application_id
	JOIN dbo.Customers c ON c.customer_id = a.customer_id
WHERE p.status = 'Delayed'
GROUP BY c.name
ORDER BY delayed_payment_count DESC;

/* 5) Müşteri bazında geciken ödeme detayı */

SELECT 
    c.name AS customer_name,
    c.customer_id,
    p.due_date,
    p.payment_date,
    p.status
FROM dbo.Payments p
JOIN dbo.Applications a 
    ON a.application_id = p.application_id
JOIN dbo.Customers c 
    ON c.customer_id = a.customer_id
WHERE p.status = 'Delayed';

