--Perform A General Health Check On The Raw Data!
SELECT
  COUNT(*) AS total_rows,                           -- Total Number of Rows (Listing × Day)
  COUNT(DISTINCT listing_id) AS total_listings,     -- Number of Unique Listings!
  MIN(date) AS min_date,                            -- Start Date of the Data!
  MAX(date) AS max_date,                            -- End Date of the Data!
  COUNT(DISTINCT date) AS unique_dates,             -- Number of Unique Dates!
  DATE_DIFF(MAX(date), MIN(date), DAY) + 1 AS date_range_days, --Date DIFF Range!
  COUNTIF(available IS NULL) AS null_available_count, --Number of Rows Missing Availability!
  COUNTIF(price IS NULL) AS null_price_count,       -- Number of Rows With Missing Prices!
  MAX(review_scores_value) AS max_review_scores_value, --Maximum of Review Score!
  MIN(review_scores_value) AS min_review_scores_value, --Minimum of Review Score!
  COUNTIF(review_scores_value IS NULL) AS null_review_count, -- Number of Rows With Missing Review Scores!
  COUNTIF(host_response_time IS NULL) AS null_response_time_count -- Number of Rows With Missing Response Times!
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`;