-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- Question 4: For each city, find the most profitable clinic
--             for a given month (example: November 2021)
-- ============================================================
-- Approach:
--   Step 1 - Compute per-clinic revenue for the target month.
--   Step 2 - Compute per-clinic expenses for the target month.
--   Step 3 - Calculate profit per clinic.
--   Step 4 - JOIN with clinics to get city info.
--   Step 5 - Use RANK() partitioned by city, ORDER BY profit DESC.
--   Step 6 - Filter rank = 1 (most profitable per city).
-- Note: Change MONTH(datetime) = 11 to your target month.
-- ============================================================

WITH clinic_revenue AS (
    SELECT
        cid,
        SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021 AND MONTH(datetime) = 11
    GROUP BY cid
),
clinic_expense AS (
    SELECT
        cid,
        SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021 AND MONTH(datetime) = 11
    GROUP BY cid
),
clinic_profit AS (
    SELECT
        cl.cid,
        cl.clinic_name,
        cl.city,
        cl.state,
        COALESCE(cr.revenue, 0)                              AS revenue,
        COALESCE(ce.expense, 0)                              AS expense,
        (COALESCE(cr.revenue, 0) - COALESCE(ce.expense, 0)) AS profit
    FROM clinics cl
    LEFT JOIN clinic_revenue cr ON cl.cid = cr.cid
    LEFT JOIN clinic_expense  ce ON cl.cid = ce.cid
),
ranked AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS profit_rank
    FROM clinic_profit
)
SELECT
    city,
    cid,
    clinic_name,
    state,
    revenue,
    expense,
    profit
FROM ranked
WHERE profit_rank = 1
ORDER BY city;
