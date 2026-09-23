--DATA TYPES CONTROL!
SELECT column_name,data_type,is_nullable
FROM `abnb0726-090726-p8.course25.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'airbnb_list'
ORDER BY ordinal_position;
--Ordinal Position: Lists All This Information 
--According To The Original Order Of The Columns In The Table!

SELECT column_name,data_type,is_nullable
FROM `abnb0726-090726-p8.course25.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'airbnb_calendar'
ORDER BY ordinal_position;

--MISSING & NULL VALUES CONTROL!
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(id IS NULL) AS id_null,
  COUNTIF(room_type IS NULL) AS room_type_null,
  COUNTIF(host_response_time IS NULL) AS host_response_time_null,
  COUNTIF(review_scores_value IS NULL) AS review_scores_value_null
FROM `abnb0726-090726-p8.course25.airbnb_list`;

SELECT
  COUNT(*) AS total_rows,
  COUNTIF(listing_id IS NULL) AS listing_id_null,
  COUNTIF(date IS NULL) AS date_null,
  COUNTIF(available IS NULL) AS available_null,
  COUNTIF(price IS NULL) AS price_null
FROM `abnb0726-090726-p8.course25.airbnb_calendar`;

--LETTER STANDARDIZATION!
SELECT room_type,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
GROUP BY room_type
ORDER BY record_count DESC;

SELECT host_response_time,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
GROUP BY host_response_time
ORDER BY record_count DESC;

--UNNECESSARY SPACES AND SPECIAL CHARACTERS CHECK!
SELECT host_response_time,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
WHERE REGEXP_CONTAINS(host_response_time, r'[^a-zA-Z0-9ğüşıöçĞÜŞİÖÇ\s]')
GROUP BY host_response_time
ORDER BY record_count DESC;

SELECT room_type,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
WHERE REGEXP_CONTAINS(room_type, r'[^a-zA-Z0-9ğüşıöçĞÜŞİÖÇ\s]')
GROUP BY room_type
ORDER BY record_count DESC;

SELECT
  COUNTIF(room_type != TRIM(room_type)) AS room_type_with_spaces,
  COUNTIF(host_response_time != TRIM(host_response_time)) AS host_response_time_with_spaces
FROM `abnb0726-090726-p8.course25.airbnb_list`;

SELECT room_type,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
WHERE REGEXP_CONTAINS(room_type, r'\s{2,}')
GROUP BY room_type
ORDER BY record_count DESC;

SELECT host_response_time,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_list`
WHERE REGEXP_CONTAINS(host_response_time, r'\s{2,}')
GROUP BY host_response_time
ORDER BY record_count DESC;

--OUTLIER VALUE CHECK!
SELECT
  MIN(price) AS min_price,
  MAX(price) AS max_price,
  COUNTIF(price < 0) AS negative_price_count,
  COUNTIF(price = 0) AS zero_price_count
FROM `abnb0726-090726-p8.course25.airbnb_calendar`;

SELECT
  MIN(date) AS min_date,
  MAX(date) AS max_date
FROM `abnb0726-090726-p8.course25.airbnb_calendar`;

SELECT
  MIN(review_scores_value) AS min_score,
  MAX(review_scores_value) AS max_score
FROM `abnb0726-090726-p8.course25.airbnb_list`;

--DATA CONSISTENCY AND DATA INTEGRITY CONTROL!
--Checking Whether Each ID Value In The Airbnb List Table 
--Has A Corresponding Match In The Airbnb Calendar Table!
SELECT l.id FROM `abnb0726-090726-p8.course25.airbnb_list` AS l
LEFT JOIN `abnb0726-090726-p8.course25.airbnb_calendar` AS c
ON l.id = c.listing_id
WHERE c.listing_id IS NULL;

SELECT listing_id,COUNT(*) AS record_count
FROM `abnb0726-090726-p8.course25.airbnb_calendar`
GROUP BY listing_id
HAVING COUNT(*)>=1
ORDER BY listing_id;