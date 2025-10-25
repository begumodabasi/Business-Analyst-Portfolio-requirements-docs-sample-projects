-- Genel Onay Oranı

SELECT 
  CAST(100.0 * SUM(
  CASE WHEN status='APPROVED' 
  THEN 1
  ELSE 0 END) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS approval_rate_pct
FROM dbo.applications;

-- Segment bazlı onay oranı (%)
SELECT 
  c.segment,
  CAST(100.0 * SUM(CASE WHEN a.status='APPROVED' THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS approval_rate_pct
FROM dbo.applications a
JOIN dbo.customers  c ON c.id = a.customer_id
GROUP BY c.segment;

-- Kanal bazlı onay oranı (%)
SELECT 
  a.channel,
  CAST(100.0 * SUM(CASE WHEN a.status='APPROVED' THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS approval_rate_pct
FROM dbo.applications a
GROUP BY a.channel;

-- Ortalama karar süresi (saat)
SELECT 
  AVG(DATEDIFF(SECOND, submitted_at, decided_at))/3600.0 AS avg_decision_hours
FROM dbo.applications
WHERE decided_at IS NOT NULL;

-- SLA uyum oranı (%) – kapatılan ticket’lar içinde zamanında kapananların oranı
SELECT 
  CAST(100.0 * SUM(CASE WHEN closed_at IS NOT NULL AND closed_at <= sla_due_at THEN 1 ELSE 0 END)
      / NULLIF(SUM(CASE WHEN closed_at IS NOT NULL THEN 1 ELSE 0 END),0) AS DECIMAL(5,2)) AS sla_compliance_pct
FROM dbo.tickets;

-- Ticket ortalama kapanış süresi (saat)
SELECT 
  AVG(DATEDIFF(SECOND, opened_at, closed_at))/3600.0 AS avg_close_hours
FROM dbo.tickets
WHERE closed_at IS NOT NULL;