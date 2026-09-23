-- Create The Final Analysis Table For Dynamic Calculations In Data Studio!
-- DATA STUDIO!
CREATE OR REPLACE TABLE
  `abnb0726-090726-p8.course25.airbnb_final_analysis_datastudio` 
AS SELECT
  listing_id,
  date AS date_date,
  price,
  room_type,
  host_response_time,
  review_scores_value,
  CASE
    WHEN price IS NULL THEN 'Unknown'
    WHEN price < 100 THEN '1. <100'
    WHEN price < 200 THEN '2. 100-199'
    WHEN price < 300 THEN '3. 200-299'
    WHEN price < 400 THEN '4. 300-399'
    ELSE '5. 400+'
  END AS price_range,
  CASE
    WHEN review_scores_value IS NULL THEN 'Unknown'
    WHEN review_scores_value < 4.5 THEN '< 4.5'
    ELSE '>= 4.5'
  END AS review_score_range,
  IF(available = TRUE, 1, 0) AS available_listing,
  IF(available = FALSE, 1, 0) AS unavailable_listing
FROM `abnb0726-090726-p8.course25.airbnb_datastudio_callist_join`;