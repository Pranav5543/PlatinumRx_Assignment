-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- Question 1: For every user in the system, get the
--             user_id and last booked room_no
-- ============================================================
-- Approach: LEFT JOIN users with bookings so ALL users appear
--           even if they have zero bookings.
--           Use MAX(booking_date) subquery to find the most
--           recent booking per user, then get that room_no.
-- ============================================================

SELECT
    u.user_id,
    u.name,
    b.room_no AS last_booked_room
FROM users u
LEFT JOIN bookings b
    ON u.user_id = b.user_id
LEFT JOIN (
    SELECT user_id, MAX(booking_date) AS latest_booking
    FROM   bookings
    GROUP  BY user_id
) latest
    ON  b.user_id      = latest.user_id
    AND b.booking_date = latest.latest_booking
ORDER BY u.user_id;
