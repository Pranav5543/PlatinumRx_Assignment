-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- Question 1: Find the revenue from each sales channel
--             in a given year (2021)
-- ============================================================
-- Approach: Filter clinic_sales to the target year,
--           GROUP BY sales_channel and SUM the amounts.
-- ============================================================

SELECT
    sales_channel,
    SUM(amount)                        AS total_revenue,
    COUNT(oid)                         AS total_orders,
    ROUND(SUM(amount) / COUNT(oid), 2) AS avg_order_value
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel
ORDER BY total_revenue DESC;
