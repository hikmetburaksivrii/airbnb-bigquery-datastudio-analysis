-- Relationship Between Host Response Time And Availability!
-- To Compare Unavailability Rates Across Different Response Time Groups!
SELECT
  host_response_time,
  COUNT(DISTINCT listing_id) AS total_listings,
  ROUND(SAFE_DIVIDE(COUNTIF(available = FALSE),COUNTIF(available IS NOT NULL)) * 100,2) AS unavailability_percentage
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE host_response_time IS NOT NULL 
  AND available IS NOT NULL
GROUP BY host_response_time
ORDER BY unavailability_percentage DESC;