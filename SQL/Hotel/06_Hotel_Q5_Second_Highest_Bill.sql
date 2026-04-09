-- ============================================================
-- PlatinumRx Assignment | Phase 1 - Part A
-- Question 5: Find the customers with the second highest
--             bill value of each month of year 2021
-- ============================================================
-- Approach: Compute total bill per customer per month,
--           rank using DENSE_RANK() (handles ties correctly),
--           then filter for rank = 2.
-- ============================================================

WITH customer_monthly_bills AS (
    SELECT
        DATE_FORMAT(bc.bill_date, '%Y-%m')  AS year_month,
        u.user_id,
        u.name                              AS customer_name,
        SUM(bc.item_quantity * i.item_rate) AS total_bill
    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN users    u ON b.user_id     = u.user_id
    JOIN items    i ON bc.item_id    = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY year_month, u.user_id, u.name
),
ranked_bills AS (
    SELECT
        year_month,
        user_id,
        customer_name,
        total_bill,
        DENSE_RANK() OVER (
            PARTITION BY year_month
            ORDER BY total_bill DESC
        ) AS bill_rank
    FROM customer_monthly_bills
)
SELECT
    year_month,
    user_id,
    customer_name,
    total_bill AS second_highest_bill
FROM ranked_bills
WHERE bill_rank = 2
ORDER BY year_month;
