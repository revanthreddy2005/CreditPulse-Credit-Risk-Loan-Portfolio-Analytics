CREATE DATABASE credit_risk_management;
USE credit_risk_management;
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    annual_income DECIMAL(12,2),
    credit_score INT,
    interest_rate DECIMAL(5,2),
    loan_term_months INT,
    loan_status VARCHAR(30),
    delinquency_days INT,
    default_flag INT,
    application_date DATE
);

INSERT INTO loans
(
    loan_id,
    customer_id,
    loan_amount,
    annual_income,
    credit_score,
    interest_rate,
    loan_term_months,
    loan_status,
    delinquency_days,
    default_flag,
    application_date
)
WITH RECURSIVE seq AS
(
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM seq
    WHERE n < 500
)
SELECT
    n AS loan_id,

    10000 + n AS customer_id,

    ROUND(
        5000 + (MOD(n * 7919, 45000)),
        2
    ) AS loan_amount,

    ROUND(
        30000 + MOD(n * 6151, 120000),
        2
    ) AS annual_income,

    550 + MOD(n * 37, 300) AS credit_score,

    ROUND(
        7.5 +
        CASE
            WHEN (550 + MOD(n * 37, 300)) < 600 THEN 7.0
            WHEN (550 + MOD(n * 37, 300)) < 650 THEN 5.0
            WHEN (550 + MOD(n * 37, 300)) < 700 THEN 3.5
            WHEN (550 + MOD(n * 37, 300)) < 750 THEN 2.0
            ELSE 0.5
        END,
        2
    ) AS interest_rate,

    CASE MOD(n,5)
        WHEN 0 THEN 12
        WHEN 1 THEN 24
        WHEN 2 THEN 36
        WHEN 3 THEN 48
        ELSE 60
    END AS loan_term_months,

    CASE
        WHEN
            (
                CASE
                    WHEN (550 + MOD(n * 37, 300)) < 600
                        THEN 30 + MOD(n * 17, 121)
                    WHEN (550 + MOD(n * 37, 300)) < 680
                        THEN MOD(n * 13, 61)
                    ELSE MOD(n * 11, 16)
                END
            ) >= 90
            OR (550 + MOD(n * 37, 300)) < 580
        THEN 'Default'

        WHEN
            (
                CASE
                    WHEN (550 + MOD(n * 37, 300)) < 600
                        THEN 30 + MOD(n * 17, 121)
                    WHEN (550 + MOD(n * 37, 300)) < 680
                        THEN MOD(n * 13, 61)
                    ELSE MOD(n * 11, 16)
                END
            ) > 30
        THEN 'Delinquent'

        WHEN MOD(n,4) = 0
        THEN 'Closed'

        ELSE 'Active'
    END AS loan_status,

    CASE
        WHEN (550 + MOD(n * 37, 300)) < 600
            THEN 30 + MOD(n * 17, 121)

        WHEN (550 + MOD(n * 37, 300)) < 680
            THEN MOD(n * 13, 61)

        ELSE MOD(n * 11, 16)
    END AS delinquency_days,

    CASE
        WHEN
            (
                CASE
                    WHEN (550 + MOD(n * 37, 300)) < 600
                        THEN 30 + MOD(n * 17, 121)
                    WHEN (550 + MOD(n * 37, 300)) < 680
                        THEN MOD(n * 13, 61)
                    ELSE MOD(n * 11, 16)
                END
            ) >= 90
            OR (550 + MOD(n * 37, 300)) < 580
        THEN 1
        ELSE 0
    END AS default_flag,

    DATE_ADD(
        '2024-01-01',
        INTERVAL MOD(n * 29, 730) DAY
    ) AS application_date

FROM seq;

SELECT COUNT(*) AS total_loans
FROM loans;

SELECT
    COUNT(*) AS total_loans,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(loan_amount), 2) AS total_loan_value,
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount,
    ROUND(AVG(credit_score), 0) AS avg_credit_score,
    SUM(default_flag) AS total_defaults,
    ROUND(AVG(delinquency_days), 1) AS avg_delinquency_days
FROM loans;

SELECT
    loan_status,
    COUNT(*) AS loan_count,
    ROUND(SUM(loan_amount), 2) AS total_exposure,
    ROUND(AVG(credit_score), 0) AS avg_credit_score,
    ROUND(AVG(delinquency_days), 1) AS avg_delinquency_days,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY loan_status
ORDER BY default_rate_pct DESC;

SELECT
    CASE
        WHEN credit_score < 600 THEN 'Below 600'
        WHEN credit_score < 650 THEN '600-649'
        WHEN credit_score < 700 THEN '650-699'
        WHEN credit_score < 750 THEN '700-749'
        ELSE '750+'
    END AS credit_score_band,

    COUNT(*) AS loan_count,

    ROUND(SUM(loan_amount), 2) AS total_exposure,

    ROUND(AVG(delinquency_days), 1) AS avg_delinquency_days,

    SUM(default_flag) AS total_defaults,

    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct

FROM loans

GROUP BY
    CASE
        WHEN credit_score < 600 THEN 'Below 600'
        WHEN credit_score < 650 THEN '600-649'
        WHEN credit_score < 700 THEN '650-699'
        WHEN credit_score < 750 THEN '700-749'
        ELSE '750+'
    END

ORDER BY default_rate_pct DESC;

SELECT
    CASE
        WHEN credit_score < 600 THEN 'High Risk'
        WHEN credit_score < 700 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category,

    COUNT(*) AS loan_count,

    ROUND(SUM(loan_amount), 2) AS total_exposure,

    ROUND(AVG(loan_amount), 2) AS avg_loan_amount,

    ROUND(AVG(delinquency_days), 1) AS avg_delinquency_days,

    SUM(default_flag) AS total_defaults,

    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct

FROM loans

GROUP BY
    CASE
        WHEN credit_score < 600 THEN 'High Risk'
        WHEN credit_score < 700 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END

ORDER BY total_exposure DESC;



SELECT
    COUNT(*) AS total_loans,
    SUM(CASE WHEN credit_score < 650 THEN 1 ELSE 0 END) AS loans_affected,
    ROUND(
        SUM(CASE WHEN credit_score < 650 THEN loan_amount ELSE 0 END),
        2
    ) AS exposure_affected,
    SUM(
        CASE
            WHEN credit_score < 650 AND default_flag = 1 THEN 1
            ELSE 0
        END
    ) AS defaults_avoided,
    ROUND(
        100 * SUM(
            CASE
                WHEN credit_score < 650 AND default_flag = 1 THEN 1
                ELSE 0
            END
        ) / NULLIF(SUM(default_flag), 0),
        2
    ) AS pct_defaults_affected
FROM loans;


SELECT
    delinquency_bucket,
    loan_count,
    total_exposure,
    avg_credit_score,
    total_defaults,
    default_rate_pct
FROM (
    SELECT
        CASE
            WHEN delinquency_days = 0 THEN 'Current'
            WHEN delinquency_days BETWEEN 1 AND 30 THEN '1-30 Days'
            WHEN delinquency_days BETWEEN 31 AND 60 THEN '31-60 Days'
            WHEN delinquency_days BETWEEN 61 AND 90 THEN '61-90 Days'
            ELSE '90+ Days'
        END AS delinquency_bucket,

        COUNT(*) AS loan_count,
        ROUND(SUM(loan_amount), 2) AS total_exposure,
        ROUND(AVG(credit_score), 0) AS avg_credit_score,
        SUM(default_flag) AS total_defaults,
        ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct

    FROM loans

    GROUP BY
        CASE
            WHEN delinquency_days = 0 THEN 'Current'
            WHEN delinquency_days BETWEEN 1 AND 30 THEN '1-30 Days'
            WHEN delinquency_days BETWEEN 31 AND 60 THEN '31-60 Days'
            WHEN delinquency_days BETWEEN 61 AND 90 THEN '61-90 Days'
            ELSE '90+ Days'
        END
) AS analysis
ORDER BY
    CASE delinquency_bucket
        WHEN 'Current' THEN 1
        WHEN '1-30 Days' THEN 2
        WHEN '31-60 Days' THEN 3
        WHEN '61-90 Days' THEN 4
        WHEN '90+ Days' THEN 5
    END;