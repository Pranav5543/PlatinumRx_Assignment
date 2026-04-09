-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- Question 3: Get bill_id and bill amount of all bills
--             raised in October 2021 having bill amount > 1000
-- ============================================================
-- Approach: Filter booking_commercials to Oct 2021,
--           JOIN items to get rates, SUM per bill_id,
--           use HAVING to keep only bills > 1000.
-- ============================================================

SELECT
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-10-01 00:00:00'
  AND bc.bill_date <  '2021-11-01 00:00:00'
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000
ORDER BY bill_amount DESC;
