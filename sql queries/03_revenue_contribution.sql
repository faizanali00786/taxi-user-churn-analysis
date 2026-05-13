-- =========================================================
-- SECTION 3: REVENUE CONTRIBUTION BY USER SEGMENT
-- =========================================================

WITH user_metrics AS (
    SELECT
        user_id,
        COUNT(*) AS total_rides,
        SUM(total) AS revenue
    FROM taxi
    GROUP BY user_id
),

classified_users AS (
    SELECT
        user_id,
        revenue,
        CASE
            WHEN total_rides <= 2 THEN 'Low'
            WHEN total_rides BETWEEN 3 AND 5 THEN 'Medium'
            ELSE 'High'
        END AS user_segment
    FROM user_metrics
)

SELECT
    user_segment,
    COUNT(*) AS user_count,
    SUM(revenue) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        SUM(SUM(revenue)) OVER (),
        2
    ) AS revenue_contribution_pct
FROM classified_users
GROUP BY user_segment
ORDER BY total_revenue DESC;