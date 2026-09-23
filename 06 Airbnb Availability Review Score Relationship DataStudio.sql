-- Relationship Between Review Score And Availability!
-- To Compare Unavailability Rates Across Different Review Score Ranges!
-- DATA STUDIO!
SELECT
  listing_id,
  CASE
    WHEN review_scores_value < 4.5 THEN '< 4.5'
    ELSE '>= 4.5'
  END AS review_score_range,
  IF(available = TRUE, 1, 0) AS available_listing,
  IF(available = FALSE, 1, 0) AS unavailable_listing
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE review_scores_value BETWEEN 1 AND 5
AND available IS NOT NULL;