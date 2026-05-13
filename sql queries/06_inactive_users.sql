-- =========================================================
-- SECTION 6: USERS WITH INACTIVITY GAPS
-- =========================================================

WITH ride_history AS (
    SELECT
        user_id,
        DATE(pickup_dt) AS ride_date
    FROM taxi
),

lagged_rides AS (
    SELECT
        user_id,
        ride_date,
        LAG(ride_date) OVER (
            PARTITION BY user_id
            ORDER BY ride_date
        ) AS previous_ride_date
    FROM ride_history
),

gap_analysis AS (
    SELECT
        user_id,
        DATEDIFF(
            ride_date,
            previous_ride_date
        ) AS gap_days
    FROM lagged_rides
)

SELECT
    user_id,
    MAX(gap_days) AS max_gap_days
FROM gap_analysis
WHERE gap_days > 1
GROUP BY user_id
ORDER BY max_gap_days DESC;