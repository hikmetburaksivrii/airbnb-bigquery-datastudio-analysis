-- Relationship Between Date And Availability!
-- To Understand How Listing Availability Changes Over Time!
SELECT
  date AS date_date,
  COUNT(*) AS total_listings,
  COUNTIF(available = TRUE) AS available_listings,
  COUNTIF(available = FALSE) AS unavailable_listings,
  ROUND(SAFE_DIVIDE(COUNTIF(available = FALSE),COUNTIF(available IS NOT NULL)) * 100,2) AS unavailability_rate
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
GROUP BY date 
ORDER BY date;