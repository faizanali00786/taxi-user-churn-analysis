-- =========================================================
-- SECTION 9: LONGEST RIDE STREAK PER USER
-- =========================================================
-- Objective:
-- Identify the maximum continuous engagement streak
-- for each user.

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
),

streaks AS (
    SELECT
        user_id,
        COUNT(*) AS streak_length
    FROM islands
    GROUP BY
        user_id,
        streak_group
)

SELECT
    user_id,
    MAX(streak_length) AS longest_streak
FROM streaks
GROUP BY user_id
ORDER BY longest_streak DESC;