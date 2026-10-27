CREATE DATABASE CurrencyAnalytics;
GO

USE CurrencyAnalytics;
GO

CREATE TABLE DimCurrency (
    CurrencyCode VARCHAR(3) PRIMARY KEY,
    CurrencyName VARCHAR(50)
);
GO

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    YearMonth VARCHAR(7)
);
GO



CREATE TABLE FactExchangeRate (
    DateKey INT NOT NULL,
    BaseCurrency VARCHAR(3) NOT NULL,
    TargetCurrency VARCHAR(3) NOT NULL,
    ExchangeRate DECIMAL(18,8) NOT NULL,
    ExtractedAt DATETIME2 NOT NULL,

    CONSTRAINT PK_FactExchangeRate
        PRIMARY KEY (DateKey, BaseCurrency, TargetCurrency),

    CONSTRAINT FK_FactExchangeRate_Date
        FOREIGN KEY (DateKey)
        REFERENCES DimDate(DateKey),

    CONSTRAINT FK_FactExchangeRate_BaseCurrency
        FOREIGN KEY (BaseCurrency)
        REFERENCES DimCurrency(CurrencyCode),

    CONSTRAINT FK_FactExchangeRate_TargetCurrency
        FOREIGN KEY (TargetCurrency)
        REFERENCES DimCurrency(CurrencyCode)
);
GO


INSERT INTO DimCurrency (CurrencyCode, CurrencyName)
VALUES
    ('USD', 'US Dollar'),
    ('EUR', 'Euro'),
    ('GBP', 'British Pound');



    INSERT INTO DimDate (
    DateKey,
    FullDate,
    Year,
    Month,
    MonthName,
    YearMonth
)
SELECT DISTINCT
    CONVERT(INT, CONVERT(CHAR(8), Date, 112)),
    CAST(Date AS DATE),
    YEAR(Date),
    MONTH(Date),
    DATENAME(MONTH, Date),
    FORMAT(Date, 'yyyy-MM')
FROM (
    SELECT CAST('2025-12-31' AS DATE) AS Date
    UNION ALL SELECT CAST('2026-01-02' AS DATE)
    UNION ALL SELECT CAST('2026-01-05' AS DATE)
) AS SampleDates;



USE CurrencyAnalytics;
GO

SELECT COUNT(*) AS TotalRecords
FROM FactExchangeRate;

SELECT TOP 5 *
FROM FactExchangeRate
ORDER BY DateKey;