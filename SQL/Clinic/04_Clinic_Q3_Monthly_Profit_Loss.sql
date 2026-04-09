-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- Question 3: Find month-wise revenue, expense, profit,
--             and status (profitable / not-profitable)
--             for a given year (2021)
-- ============================================================
-- Approach:
--   Step 1 - Aggregate revenue from clinic_sales per month.
--   Step 2 - Aggregate expenses from expenses table per month.
--   Step 3 - LEFT JOIN both results on month.
--   Step 4 - Compute profit = revenue - expense.
--   Step 5 - Derive status using CASE.
-- ============================================================

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(datetime, '%Y-%m') AS yr_month,
        SUM(amount)                    AS total_revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY yr_month
),
monthly_expense AS (
    SELECT
        DATE_FORMAT(datetime, '%Y-%m') AS yr_month,
        SUM(amount)                    AS total_expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY yr_month
)
SELECT
    mr.yr_month,
    mr.total_revenue,
    COALESCE(me.total_expense, 0)                      AS total_expense,
    (mr.total_revenue - COALESCE(me.total_expense, 0)) AS profit,
    CASE
        WHEN (mr.total_revenue - COALESCE(me.total_expense, 0)) > 0
        THEN 'profitable'
        ELSE 'not-profitable'
    END AS status
FROM monthly_revenue mr
LEFT JOIN monthly_expense me ON mr.yr_month = me.yr_month
ORDER BY mr.yr_month;
