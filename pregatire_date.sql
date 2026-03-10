-- Importul datelor din CSV
-- COPY telco_customers 
-- FROM '"D:\dataAnalystPortfolio\proiect-telco-churn\WA_Fn-UseC_-Telco-Customer-Churn.csv"' 
-- WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Creăm tabelul cu tipuri de date potrivite
CREATE TABLE telco_customers (
    customerID        VARCHAR(20),
    gender            VARCHAR(10),
    SeniorCitizen      SMALLINT,
    Partner           VARCHAR(5),
    Dependents        VARCHAR(5),
    tenure            INTEGER,
    PhoneService      VARCHAR(5),
    MultipleLines     VARCHAR(20),
    InternetService   VARCHAR(20),
    OnlineSecurity    VARCHAR(20),
    OnlineBackup      VARCHAR(20),
    DeviceProtection  VARCHAR(20),
    TechSupport       VARCHAR(20),
    StreamingTV       VARCHAR(20),
    StreamingMovies   VARCHAR(20),
    Contract          VARCHAR(20),
    PaperlessBilling  VARCHAR(5),
    PaymentMethod     VARCHAR(30),
    MonthlyCharges    NUMERIC(8,2),
    TotalCharges      VARCHAR(20), -- Îl lăsăm VARCHAR la început pentru a evita erorile de import
    Churn             VARCHAR(5)
);

-- (Aici ar veni comanda COPY rulată anterior)

-- Convertim TotalCharges din Text în Numeric, curățând spațiile goale
ALTER TABLE telco_customers 
    ALTER COLUMN totalcharges TYPE NUMERIC(10,2) 
    USING NULLIF(TRIM(totalcharges), '')::NUMERIC(10,2);

-- Verificăm tipul de date pentru confirmare
SELECT customerid, totalcharges, pg_typeof(totalcharges) 
FROM telco_customers 
LIMIT 5;

-- Analiza Churn-ului general și a veniturilor pierdute
SELECT 
    Churn, 
    COUNT(*) AS nr_clienti, 
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS procentaj_clienti, 
    ROUND(SUM(MonthlyCharges), 2) AS revenue_lunar, 
    ROUND(AVG(tenure), 1) AS medie_vechime_luni
FROM telco_customers
GROUP BY Churn;

-- Impactul serviciilor de suport (TechSupport & OnlineSecurity)
SELECT 'TechSupport' AS serviciu, TechSupport AS status_serviciu, COUNT(*) AS total_clienti,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS churn_rate_pct
FROM telco_customers GROUP BY TechSupport
UNION ALL
SELECT 'OnlineSecurity' AS serviciu, OnlineSecurity AS status_serviciu, COUNT(*) AS total_clienti,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS churn_rate_pct
FROM telco_customers GROUP BY OnlineSecurity;