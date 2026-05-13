-- =========================================================
-- SECTION 4: TOP 10% USERS CONTRIBUTING TO REVENUE
-- =========================================================

WITH customer_spend AS (
    SELECT
        user_id,
        SUM(total) AS total_spend
    FROM taxi
    GROUP BY user_id
),

ranked_users AS (
    SELECT
        user_id,
        total_spend,
        NTILE(10) OVER (
            ORDER BY total_spend DESC
        ) AS decile
    FROM customer_spend
),

segmented_users AS (
    SELECT
        user_id,
        total_spend,
        CASE
            WHEN decile = 1 THEN 'Top 10%'
            ELSE 'Others'
        END AS segment
    FROM ranked_users
)

SELECT
    segment,
    COUNT(*) AS user_count,
    SUM(total_spend) AS total_revenue,
    ROUND(
        SUM(total_spend) * 100.0 /
        SUM(SUM(total_spend)) OVER (),
        2
    ) AS revenue_contribution_pct
FROM segmented_users
GROUP BY segment;