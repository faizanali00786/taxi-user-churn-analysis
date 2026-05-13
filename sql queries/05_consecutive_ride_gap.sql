-- =========================================================
-- SECTION 5: GAP BETWEEN CONSECUTIVE RIDES
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
)

SELECT
    user_id,
    ride_date,
    previous_ride_date,
    DATEDIFF(
        ride_date,
        previous_ride_date
    ) AS gap_days
FROM lagged_rides;