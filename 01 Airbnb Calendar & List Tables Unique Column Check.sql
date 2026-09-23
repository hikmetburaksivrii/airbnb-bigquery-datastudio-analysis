--Calendar Unique ID Check!
--Listing ID Is Not Unique By İtself!
SELECT listing_id,COUNT(*) AS unique_count
FROM `abnb0726-090726-p8.course25.airbnb_calendar`
GROUP BY listing_id HAVING COUNT(*)>1;

SELECT listing_id,date,COUNT(*) AS unique_count
FROM `abnb0726-090726-p8.course25.airbnb_calendar`
GROUP BY listing_id,date HAVING COUNT(*)>1;

--Listing Unique ID Check!
SELECT id,COUNT(*) AS unique_count 
FROM `abnb0726-090726-p8.course25.airbnb_list`
GROUP BY id HAVING COUNT(*)>1;