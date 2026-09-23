--Relationship Between Price And Availability!
--To Compare Unavailability Rates Across Different Price Ranges!
--DATA STUDIO!
SELECT
  listing_id,
  CASE
    WHEN price < 100 THEN '1. <100'
    WHEN price < 200 THEN '2. 100-199'
    WHEN price < 300 THEN '3. 200-299'
    WHEN price < 400 THEN '4. 300-399'
    ELSE '5. 400+'
  END AS price_range,
  IF(available = TRUE, 1, 0) AS available_listing,
  IF(available = FALSE, 1, 0) AS unavailable_listing
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE price IS NOT NULL
AND available IS NOT NULL;