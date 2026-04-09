-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- Question 2: Get booking_id and total billing amount of
--             every booking created in November 2021
-- ============================================================
-- Approach: Filter bookings to Nov 2021, JOIN with
--           booking_commercials and items, compute
--           SUM(item_quantity * item_rate) per booking.
-- ============================================================

SELECT
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_billing_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items               i  ON bc.item_id   = i.item_id
WHERE b.booking_date >= '2021-11-01 00:00:00'
  AND b.booking_date <  '2021-12-01 00:00:00'
GROUP BY b.booking_id
ORDER BY b.booking_id;
