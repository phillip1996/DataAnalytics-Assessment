-- Assessment_Q4.sql  
-- Customer Lifetime Value (CLV) Estimation
-- Calculate CLV based on account tenure and transaction volume. 

SELECT          
    u.id AS customer_id,
    u.name,  
    CAST(ROUND((JULIANDAY(CURRENT_TIMESTAMP) - JULIANDAY(u.created_on)) / 30.44) AS INTEGER) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    CAST( (COUNT(s.id) / (CAST(ROUND((JULIANDAY(CURRENT_TIMESTAMP) - JULIANDAY(u.created_on)) / 30.44) AS REAL))) * 12 * (AVG(s.confirmed_amount) * 0.001) AS REAL) AS estimated_clv
FROM
    users_customuser u
LEFT JOIN
    savings_savingsaccount s ON u.id = s.owner_id
GROUP BY
    u.id, u.name, u.created_on
ORDER BY
    estimated_clv DESC;
