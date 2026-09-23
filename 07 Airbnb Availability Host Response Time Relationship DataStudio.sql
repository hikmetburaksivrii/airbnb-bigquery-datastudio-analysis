-- Relationship Between Host Response Time And Availability!
-- To Compare Unavailability Rates Across Different Response Time Groups!
SELECT
  listing_id,
  host_response_time,
  IF(available = TRUE, 1, 0) AS available_listing,
  IF(available = FALSE, 1, 0) AS unavailable_listing
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE host_response_time IS NOT NULL
  AND available IS NOT NULL;