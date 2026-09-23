--Relationship Between Price And Availability!
--To Compare Unavailability Rates Across Different Price Ranges!
SELECT
  CASE
    WHEN price < 100 THEN '1. <100'
    WHEN price < 200 THEN '2. 100-199'
    WHEN price < 300 THEN '3. 200-299'
    WHEN price < 400 THEN '4. 300-399'
    ELSE '5. 400+'
  END AS price_range,
  COUNT(*) AS total_listing_days,
  ROUND(SAFE_DIVIDE(COUNTIF(available = FALSE),COUNTIF(available IS NOT NULL)) * 100,2) AS unavailability_percentage
FROM `abnb0726-090726-p8.course25.airbnb_calendar_list_join`
WHERE price IS NOT NULL
AND available IS NOT NULL
GROUP BY price_range
ORDER BY price_range;