-- Assessment_Q3.sql
-- Account Inactivity Alert
-- Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).
-- Refined Query:
SELECT
    p.id AS plan_id,
    p.owner_id,
    CASE
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    CAST((JULIANDAY(CURRENT_TIMESTAMP) - JULIANDAY(MAX(s.transaction_date))) AS INTEGER) AS inactivity_days
FROM
    plans_plan p
LEFT JOIN
    savings_savingsaccount s ON p.id = s.plan_id  -- Join on plan_id
WHERE (p.is_regular_savings = 1 OR p.is_a_fund = 1)
GROUP BY
    p.id, p.owner_id, type
HAVING  MAX(s.transaction_date) IS NULL OR inactivity_days > 365;
