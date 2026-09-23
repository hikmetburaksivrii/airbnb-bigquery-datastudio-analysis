-- Relationship Between Review Score And Availability!
-- To Compare Unavailability Rates Across Different Review Score Ranges!
SELECT
    CASE
    WHEN review_scores_value < 4.5 THEN '< 4.5'
    ELSE '>= 4.5'
  END AS review_score_range,
  COUNT(DISTINCT listing_id) AS total_listings,
  ROUND(SAFE_DIVIDE(COUNTIF(available = FALSE),COUNTIF(available IS NOT NULL)) * 100,2) AS unavailability_percentage
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE review_scores_value BETWEEN 1 AND 10
  AND available IS NOT NULL
GROUP BY review_score_range
ORDER BY review_score_range;

-- Examine The Distribution Of Review Scores 
-- To Create Meaningful Score Ranges.
SELECT
  ROUND(review_scores_value, 1) AS review_score,
  COUNT(DISTINCT listing_id) AS total_listings
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE review_scores_value IS NOT NULL
GROUP BY review_score
ORDER BY review_score;