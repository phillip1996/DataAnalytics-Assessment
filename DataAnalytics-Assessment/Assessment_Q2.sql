-- Assessment_Q2.sql
-- Transaction Frequency Analysis
-- Calculate the average number of transactions per customer per month and categorize them.
-- Refined Query:

SELECT
    CASE
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month >= 3 AND avg_transactions_per_month <= 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(DISTINCT u.id) AS customer_count,
    AVG(transaction_count) AS avg_transactions_per_month
FROM
    users_customuser u
JOIN (
    SELECT
        owner_id,
        CAST(COUNT(*) AS DECIMAL(10,2)) / COUNT(DISTINCT strftime('%Y-%m', transaction_date)) AS transaction_count
    FROM
        savings_savingsaccount
    GROUP BY
        owner_id
) AS sub ON u.id = sub.owner_id
GROUP BY
    frequency_category;