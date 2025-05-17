# Data Analytics SQL Assessment

## Overview
This repository contains my solutions to the SQL assessment involving query writing across multiple business scenarios. The data was provided in the form of a relational schema with user, savings, plans, and withdrawal tables.

---

## Question Explanations

### Q1: High-Value Customers
**Approach**: I identified customers who had at least one savings plan (is_regular_savings = 1) with confirmed deposits and one investment plan (is_a_fund = 1) with confirmed deposits. I used subqueries to count the number of such plans and aggregated total deposits.

### Q2: Transaction Frequency Analysis
**Approach**: I grouped by customer and computed transaction counts per month. I categorized customers into High, Medium, and Low frequency using a CASE statement.

### Q3: Account Inactivity Alert
**Approach**: I joined savings accounts with plans and checked the last transaction date using MAX. I filtered for accounts that have been inactive for over 365 days using DATEDIFF.

### Q4: Customer Lifetime Value (CLV)
**Approach**: I computed tenure in months, total transactions, and estimated CLV using the formula provided. Profit per transaction was assumed as 0.1% of value.

---

## Challenges

- Data volume slowed MySQL when importing `.sql` file; resolved by optimizing system memory and importing via CLI instead of GUI.
- Some tables lacked sample `withdrawals`, but weren’t directly needed for queries.
- Ensured monetary values were correctly converted from **kobo** to **naira** where applicable.
  
    ## Major Precautions i took in the course of the project
     - **Date functions**: I Ensured compatibility between DATEDIFF and different SQL dialects.
     - **Transaction frequency categorization**: I Ensured correct grouping by month.
     - **Handling NULLs**: I Used COALESCE to avoid NULLs in aggregation.


---

## Assumptions and Notes

### 1. Missing Table: `plans_currency`

The `plans_plan` table references a foreign key to a table `plans_currency` using the field `currency_id`. However, the definition of `plans_currency` was **not included** in the provided schema or assessment materials.

**To maintain database integrity**, I created a minimal mock version of the `plans_currency` table as shown below:

```sql
CREATE TABLE plans_currency (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);
```

---
## Author
OGBE PHILLIP OSEMUDIAME || https://www.linkedin.com/in/phillip-ogbe-3a9023173

