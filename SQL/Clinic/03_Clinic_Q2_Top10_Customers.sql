-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part B
-- Question 2: Find the top 10 most valuable customers
--             for a given year (2021)
-- ============================================================
-- Approach: JOIN clinic_sales with customer, filter by year,
--           SUM revenue per customer, ORDER DESC, LIMIT 10.
-- ============================================================

SELECT
    c.uid,
    c.name                                   AS customer_name,
    c.mobile,
    SUM(cs.amount)                           AS total_spent,
    COUNT(cs.oid)                            AS total_orders,
    ROUND(SUM(cs.amount) / COUNT(cs.oid), 2) AS avg_order_value
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE YEAR(cs.datetime) = 2021
GROUP BY c.uid, c.name, c.mobile
ORDER BY total_spent DESC
LIMIT 10;
