# Taxi User Churn & Engagement Analysis

## Project Overview
This project analyzes taxi user behavior, customer engagement, inactivity patterns, and churn indicators using SQL.

The objective was to identify:
- user ride frequency behavior
- customer inactivity and churn risk
- revenue contribution by user segments
- high-value customer groups
- ride engagement consistency
- retention and re-engagement opportunities

The analysis focuses on behavioral analytics and customer retention diagnostics for a taxi platform.

---

## Tools & Technologies
- SQL
- Excel

---

## Dataset Information
The dataset contains taxi ride transaction records for a 3-day period:

- Date Range: **2020-01-02 to 2020-01-04**
- Data includes:
  - pickup timestamps
  - ride fares
  - vendor information
  - pickup locations
  - ride activity behavior

### Data Preparation
To perform customer-level behavioral analysis, the following proxy identifiers were created:
- `user_id` proxy
- `vendor_id`
- `pickup_location`

These generated identifiers were used to simulate customer activity, engagement behavior, retention patterns, and ride frequency analysis.

---

## Business Questions Solved

### User Segmentation
- How are users distributed based on ride frequency?
- Which customer groups generate the most revenue?

### Revenue Contribution Analysis
- How much revenue is contributed by top users?
- Do a small percentage of users drive platform revenue?

### Ride Engagement Analysis
- What is the inactivity gap between consecutive rides?
- Which users show inconsistent engagement behavior?

### Churn & Retention Analysis
- Which users are Active, At-Risk, or Churned?
- How can inactivity patterns indicate churn risk?

### Ride Streak Analysis
- Which users demonstrate continuous engagement?
- What is the longest ride streak achieved by users?

---

## SQL Concepts Used
- Common Table Expressions (CTEs)
- Window Functions
- LAG()
- ROW_NUMBER()
- NTILE()
- CASE WHEN
- Aggregations
- Gaps & Islands Analysis
- Customer Segmentation Logic

---

## Key Insights
- A small group of high-frequency users contributed disproportionately to revenue
- Several users displayed significant inactivity gaps between rides
- Retention segmentation identified Active, At-Risk, and Churned users
- Ride streak analysis highlighted differences in continuous engagement behavior
- Revenue concentration patterns suggested dependency on high-value riders

---

## Business Impact
This analysis helps identify customer retention risks, high-value users, engagement consistency, and inactivity trends to support retention-focused business decisions and platform growth strategies.

---

## Project Structure

```text
taxi-user-churn-analysis
│
├── README.md
│
└── sql
    ├── 01_platform_overview.sql
    ├── 02_user_ride_distribution.sql
    ├── 03_revenue_contribution.sql
    ├── 04_top_10_percent_users.sql
    ├── 05_consecutive_ride_gap.sql
    ├── 06_inactive_users.sql
    ├── 07_user_retention_status.sql
    ├── 08_ride_streak_analysis.sql
    └── 09_longest_ride_streak.sql
```

---

## Files Included
- SQL analysis scripts
- Customer retention analysis
- Churn diagnostics
- User engagement analysis

---

## Author
**MD FAIZAN ALI**

LinkedIn: https://www.linkedin.com/in/md-faizan-ali-31032001business

GitHub: https://github.com/faizanali00786