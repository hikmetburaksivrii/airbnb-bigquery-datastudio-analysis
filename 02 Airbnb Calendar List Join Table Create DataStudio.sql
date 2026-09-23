--Airbnb Calendar & List Left Join Table Create!
--DATA STUDIO!
SELECT c.listing_id,c.date,c.available,c.price
,l.room_type,l.host_response_time,l.review_scores_value
FROM `abnb0726-090726-p8.course25.airbnb_calendar` AS c
LEFT JOIN `abnb0726-090726-p8.course25.airbnb_list` AS l
ON c.listing_id = l.id ORDER BY c.date,c.listing_id;