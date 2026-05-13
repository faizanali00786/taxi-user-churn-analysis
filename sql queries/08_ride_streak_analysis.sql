-- =========================================================
-- SECTION 8: CONTINUOUS RIDE STREAKS
-- =========================================================
-- Objective:
-- Identify continuous ride streaks for each user
-- using Gaps & Islands analysis.

WITH ride_history AS (
    SELECT
        user_id,
        DATE(pickup_dt) AS ride_date
    FROM taxi
),

ranked_rides AS (
    SELECT
        user_id,
        ride_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY ride_date
        ) AS ride_rank
    FROM ride_history
),

islands AS (
    SELECT
        user_id,
        ride_date,
        DATE_SUB(
            ride_date,
            INTERVAL ride_rank DAY
        ) AS streak_group
    FROM ranked_rides
)

SELECT
    user_id,
    streak_group,
    COUNT(*) AS streak_length
FROM islands
GROUP BY
    user_id,
    streak_group
ORDER BY streak_length DESC;