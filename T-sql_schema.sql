-- Veritabanı
IF DB_ID('MiniCRM') IS NULL
    CREATE DATABASE MiniCRM;
GO
USE MiniCRM;
GO

IF OBJECT_ID('dbo.tickets') IS NOT NULL DROP TABLE dbo.tickets;
IF OBJECT_ID('dbo.reviews') IS NOT NULL DROP TABLE dbo.reviews;
IF OBJECT_ID('dbo.applications') IS NOT NULL DROP TABLE dbo.applications;
IF OBJECT_ID('dbo.customers') IS NOT NULL DROP TABLE dbo.customers;
GO

CREATE TABLE dbo.customers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(120) NOT NULL,
    national_id VARCHAR(11) NULL,                 -- maskeli/veri değil, demo
    segment VARCHAR(20) NOT NULL
        CHECK (segment IN ('BIREYSEL','KOBI')),
    created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.applications (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL
        FOREIGN KEY REFERENCES dbo.customers(id),
    product VARCHAR(40) NOT NULL,                 -- IHTIYAC, TICARI vb.
    amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
    channel VARCHAR(20) NOT NULL
        CHECK (channel IN ('SUBE','WEB')),
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('SUBMITTED','IN_REVIEW','APPROVED','REJECTED','ON_HOLD')),
    submitted_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    decided_at DATETIME2 NULL,
    decision_reason NVARCHAR(MAX) NULL
);
CREATE INDEX IX_applications_customer ON dbo.applications(customer_id);

CREATE TABLE dbo.reviews (
    id INT IDENTITY(1,1) PRIMARY KEY,
    application_id INT NOT NULL
        FOREIGN KEY REFERENCES dbo.applications(id),
    analyst_note NVARCHAR(MAX) NULL,
    score INT NULL CHECK (score BETWEEN 0 AND 100),
    income DECIMAL(12,2) NULL,
    risk_note VARCHAR(10) NULL
        CHECK (risk_note IN ('DUSUK','ORTA','YUKSEK')),
    reviewed_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
CREATE INDEX IX_reviews_app ON dbo.reviews(application_id);

CREATE TABLE dbo.tickets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL
        FOREIGN KEY REFERENCES dbo.customers(id),
    application_id INT NULL
        FOREIGN KEY REFERENCES dbo.applications(id),
    subject NVARCHAR(120) NOT NULL,
    priority VARCHAR(10) NOT NULL
        CHECK (priority IN ('LOW','MEDIUM','HIGH')),
    status VARCHAR(10) NOT NULL
        CHECK (status IN ('ACIK','COZULDU')),
    opened_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    sla_due_at DATETIME2 NULL,
    closed_at DATETIME2 NULL,
    csat INT NULL CHECK (csat BETWEEN 1 AND 5)
);
CREATE INDEX IX_tickets_customer ON dbo.tickets(customer_id);
CREATE INDEX IX_tickets_application ON dbo.tickets(application_id);
GO

-- Customers
INSERT INTO dbo.customers (full_name, national_id, segment, created_at) VALUES
(N'Aylin Demir', '*******123', 'BIREYSEL', '2025-01-10T09:00:00'),
(N'Kerem Yılmaz', '*******456', 'KOBI',     '2025-01-11T10:30:00'),
(N'Begüm A. (örnek)', '*******789', 'BIREYSEL', '2025-01-12T14:15:00');

-- Applications
INSERT INTO dbo.applications (customer_id, product, amount, channel, status, submitted_at, decided_at, decision_reason) VALUES
(1, 'IHTIYAC',  75000, 'WEB',  'APPROVED',  '2025-01-15T10:00:00', '2025-01-16T11:30:00', N'Skor uygun'),
(2, 'TICARI',  250000, 'SUBE', 'REJECTED',  '2025-01-18T09:10:00', '2025-01-20T16:00:00', N'Gelir yetersiz'),
(3, 'IHTIYAC',  45000, 'WEB',  'IN_REVIEW', '2025-01-22T13:00:00', NULL,                   NULL),
(2, 'TICARI',  120000, 'SUBE', 'SUBMITTED', '2025-01-25T09:45:00', NULL,                   NULL);

-- Reviews
INSERT INTO dbo.reviews (application_id, analyst_note, score, income, risk_note, reviewed_at) VALUES
(1, N'Skor yüksek, borçluluk normal', 82, 45000, 'DUSUK', '2025-01-15T16:00:00'),
(2, N'Nakit akışı zayıf',             48, 38000, 'YUKSEK','2025-01-19T14:20:00'),
(3, N'Ek belge bekleniyor',           61, 42000, 'ORTA',  '2025-01-22T17:40:00');

-- Tickets (SLA mantığı: HIGH=24h, MEDIUM=48h, LOW=72h)
INSERT INTO dbo.tickets (customer_id, application_id, subject, priority, status, opened_at, sla_due_at, closed_at, csat) VALUES
(1, 1, N'Evrak teslim sorusu', 'LOW',    'COZULDU', '2025-01-15T12:00:00', DATEADD(HOUR,72,'2025-01-15T12:00:00'), '2025-01-16T09:00:00', 5),
(2, 2, N'Ret gerekçesi itirazı','HIGH',  'ACIK',    '2025-01-20T10:00:00', DATEADD(HOUR,24,'2025-01-20T10:00:00'), NULL,                   NULL);