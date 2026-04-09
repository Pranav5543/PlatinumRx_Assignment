-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- Question 5: For each state, find the second least profitable
--             clinic for a given month (example: November 2021)
-- ============================================================
-- Approach: Same pipeline as Q4 but rank by profit ASC
--           (lowest profit = rank 1).
--           Use DENSE_RANK() so rank 2 always exists even
--           when multiple clinics tie for last place.
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
        DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS profit_rank
    FROM clinic_profit
)
SELECT
    state,
    cid,
    clinic_name,
    city,
    revenue,
    expense,
    profit
FROM ranked
WHERE profit_rank = 2
ORDER BY state;
