-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- Question 4: Determine the most ordered and least ordered
--             item of each month of year 2021
-- ============================================================
-- Approach: Compute total quantity per month per item using
--           CTE, then use RANK() window function (DESC for
--           most ordered, ASC for least ordered) within each
--           month, then filter for rank = 1 in both.
-- ============================================================

WITH monthly_item_totals AS (
    SELECT
        DATE_FORMAT(bc.bill_date, '%Y-%m') AS year_month,
        i.item_name,
        SUM(bc.item_quantity)              AS total_quantity
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY year_month, i.item_name
),
ranked AS (
    SELECT
        year_month,
        item_name,
        total_quantity,
        RANK() OVER (PARTITION BY year_month ORDER BY total_quantity DESC) AS rank_most,
        RANK() OVER (PARTITION BY year_month ORDER BY total_quantity ASC)  AS rank_least
    FROM monthly_item_totals
)
SELECT
    year_month,
    MAX(CASE WHEN rank_most  = 1 THEN item_name       END) AS most_ordered_item,
    MAX(CASE WHEN rank_most  = 1 THEN total_quantity  END) AS most_ordered_qty,
    MAX(CASE WHEN rank_least = 1 THEN item_name       END) AS least_ordered_item,
    MAX(CASE WHEN rank_least = 1 THEN total_quantity  END) AS least_ordered_qty
FROM ranked
WHERE rank_most = 1 OR rank_least = 1
GROUP BY year_month
ORDER BY year_month;
