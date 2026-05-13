-- =========================================================
-- SECTION 1: PLATFORM OVERVIEW
-- =========================================================
-- Objective:
-- Understand overall platform activity and scale.

SELECT
    COUNT(*) AS total_rides,
    COUNT(DISTINCT user_id) AS total_users,
    MIN(DATE(pickup_dt)) AS first_ride_date,
    MAX(DATE(pickup_dt)) AS last_ride_date,
    SUM(total) AS total_revenue
FROM taxi;