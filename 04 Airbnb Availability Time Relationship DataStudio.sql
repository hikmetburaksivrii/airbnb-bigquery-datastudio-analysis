-- Relationship Between Date And Availability!
-- To Understand How Listing Availability Changes Over Time!
-- DATA STUDIO!
SELECT
  listing_id,
  date as date_date,
  IF(available = TRUE, 1, 0) AS available_listing,
  IF(available = FALSE, 1, 0) AS unavailable_listing
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`;