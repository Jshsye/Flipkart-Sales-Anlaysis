CREATE DATABASE Flipkart;

CREATE TABLE flipkart_mobile(
							brand VARCHAR(50),
							model VARCHAR(60),
							base_color VARCHAR(50),
							processor VARCHAR(50),
							screen_size CHAR(20),
							ROM NUMERIC,
							RAM NUMERIC,
							display_size DECIMAL,
							num_rear_camera NUMERIC,
							num_front_camera NUMERIC,
							battery_capacity NUMERIC,
							ratings DECIMAL,
							num_of_ratings NUMERIC,
							sales_price MONEY,
							discount_percent DECIMAL,
							sales DECIMAL
									
									);



-- Importing dataset 

COPY flipkart_mobile(brand,	model,	base_color,	processor,	screen_size,	ROM,	RAM,	display_size,	num_rear_camera,	num_front_camera,	battery_capacity,	ratings,	num_of_ratings,	sales_price,	discount_percent,	sales)
FROM 'E:/flipkart dataset/Flipkart Mobile.csv'
DELIMITER','
CSV HEADER;





--  Product Performance
-- 1] How many unique mobile models are sold per brand?

SELECT brand, COUNT(DISTINCT model) AS unique_models
FROM flipkart_mobile
GROUP BY brand
ORDER BY unique_models DESC;



-- 1] ANS:
			brand		unique_mobile
			"Samsung"	43
			"Realme"	35
			"Xiaomi"	25
			"Poco"		11
			"Apple"		6



-- 2] Which brand has the most product listings?

SELECT brand, COUNT(brand) AS to_count
FROM flipkart_mobile
GROUP BY brand
ORDER BY to_count DESC;

-- 2] ANS:
		BRAND			total_count
		"Realme"		138
		"Samsung"		119
		"Xiaomi"		61
		"Poco"			56
		"Apple"			56

	

-- 3] Which mobile model has the highest average rating?

SELECT model, ROUND(AVG(RATINGS),2)AS T_rating
FROM flipkart_mobile
GROUP BY model
ORDER BY T_rating DESC LIMIT 10;


-- 3] ANS:

			"iPhone XR"			4.60
			"iPhone 12"			4.60
			"Galaxy S10"		4.60
			"F1"				4.55
			"Redmi K20"			4.50
			"8s 5G"				4.50
			"Redmi Note 7"		4.50
			"Redmi Note 5 Pro"	4.50
			"iPhone 8"			4.50
			"Narzo 10A"			4.50			



-- 4] Top 5 models with the highest number of ratings?

SELECT model, SUM(num_of_ratings) AS Total_rating
FROM flipkart_mobile
GROUP BY model
ORDER BY Total_rating DESC LIMIT 5;

-- 4 ANS:
				model				total_ratings
				"C2"				716942
				"Redmi Note 4"		642373
				"Narzo 20"			496400
				"Redmi Note 7 Pro"	494406
				"Mi A1"				470905


ALTER TABLE flipkart_mobile
ALTER COLUMN sales_price TYPE DECIMAL;

-- 5] Average sales per brand?

SELECT brand, ROUND(AVG(sales_price),2) AS avg_sales
FROM flipkart_mobile
GROUP BY brand
ORDER BY avg_sales;

-- 5 ANS:	brand			avg_sales
			"Poco"			15936.50
			"Xiaomi"		16711.31
			"Realme"		17105.52
			"Samsung"		28823.54
			"Apple"			57748.11


--   Pricing & Discounts
-- 6] Which models are the most expensive (top 5 by sales_price)?

SELECT model, MAX(sales_price) AS highest_value
FROM flipkart_mobile
GROUP BY model
ORDER BY highest_value DESC LIMIT 5;

-- 6 ANS:
			"model"						"highest_value"
			"Galaxy Z Fold3 5G"				157999.00
			"Galaxy Fold 2"					149999.00
			"Galaxy Note 20 Ultra 5G"		91999.00
			"Galaxy Z Flip3 5G"				88999.00
			"iPhone 12"						79149.00


-- 7] What is the average discount per brand?

SELECT brand, ROUND(AVG(discount_percent), 2)AS disc_per
FROM flipkart_mobile
GROUP BY brand;

-- 7 ANS:

			"Poco"			0.16
			"Xiaomi"		0.10
			"Realme"		0.08
			"Samsung"		0.13
			"Apple"			0.06




alter table flipkart_mobile
alter column screen_size type varchar(20)


-- 8] What is the average sales price by screen size category?


SELECT screen_size, ROUND(AVG(sales_price),2) AS Avg_sales
FROM flipkart_mobile
GROUP BY screen_size
ORDER BY Avg_sales;


-- 8 ANS:
				"screen_size"		"avg_sales"
				"Large"				20192.91
				"Medium"			27777.22
				"Very Small"		34499.00
				"Small"				36710.00
				"Very Large"		151999.00


--9] Which RAM + ROM combinations are most common among discounted models?

SELECT brand, ram, rom, COUNT(*)AS discount_percent
FROM flipkart_mobile
WHERE discount_percent > 0
GROUP BY ram, rom, brand
ORDER BY COUNT(discount_percent) DESC LIMIT 3;

-- 9 ANS:
			brand		ram		rom		discount_count
			"Realme"	8		128		33
			"Realme"	4		64		27
			"Samsung"	6		128		27
	


-- 10] Find the correlation between discount_percent and sales.

SELECT CORR(discount_percent, sales) AS correlation
FROM flipkart_mobile
WHERE discount_percent IS NOT NULL AND sales IS NOT NULL;

-- 10 ANS:
			correlation			
			0.15493802038473084


--  Feature Analysis
--11] What is the average battery capacity per brand?

SELECT brand, ROUND(AVG(battery_capacity),2)AS avg_battery
FROM flipkart_mobile
GROUP BY brand;

-- 11 ANS:
			brand			avg_battery
			"Poco"			5247.32
			"Xiaomi"		4265.74
			"Realme"		4797.32
			"Samsung"		4846.22
			"Apple"			2765.20


-- 12] How does battery capacity affect average rating?

SELECT 
  CASE 
    WHEN battery_capacity <= 3000 THEN 'Very Low (<=3000)'
    WHEN battery_capacity > 3000 AND battery_capacity <= 4000 THEN 'Low (3001-4000)'
    WHEN battery_capacity > 4000 AND battery_capacity <= 5000 THEN 'Medium (4001-5000)'
    WHEN battery_capacity > 5000 AND battery_capacity <= 6000 THEN 'High (5001-6000)'
    ELSE 'Very High (>6000)'
  END AS battery_range,
  ROUND(AVG(ratings), 2) AS avg_rating
FROM flipkart_mobile
GROUP BY battery_range
ORDER BY avg_rating DESC;


-- 12 ANS:
			battery range			avg_rating
			"Very Low (<=3000)"		4.54
			"Low (3001-4000)"		4.38
			"High (5001-6000)"		4.31
			"Medium (4001-5000)"	4.29
			"Very High (>6000)"		4.25



-- 13] Which processor type is most common across models?

SELECT processor, COUNT(model)AS total_count
FROM flipkart_mobile
GROUP BY processor

-- 13 ANS:

			"Qualcomm"		168
			"MediaTek"		144
			"Water"			11
			"Exynos"		53
			"iOS"			12
			"Ceramic"		33
			"Others"		9


-- 14] Do higher RAM models get better ratings on average?

SELECT ram, ROUND(AVG(ratings),2)AS Avg_rating
FROM flipkart_mobile
GROUP BY ram
ORDER BY Avg_rating;


-- 4 ANS:
			ram		avg_rating
			1		4.10
			12		4.23
			8		4.30
			6		4.31
			2		4.35
			3		4.38
			4		4.38



-- 15] Average number of cameras (front + rear) by brand.

SELECT brand, ROUND(AVG(num_front_camera),2)AS avg_front_camera, ROUND(AVG(num_rear_camera),2) AS avg_rear_camera
FROM flipkart_mobile
GROUP BY brand

-- 15 ANS:
			brand		av_front_c		av_rear_c		
			"Poco"		1.02			3.46
			"Xiaomi"	1.08			2.41
			"Realme"	1.07			3.17
			"Samsung"	1.03			3.20
			"Apple"		1.00			1.61


--  Sales & Trends

-- 16] Which screen size group (Very Small, Small, Medium, etc.) leads in total sales?

SELECT screen_size, SUM(sales_price)AS total_sales
FROM flipkart_mobile
GROUP BY screen_size


-- 16 ANS:
			"screen_size"		"total_sales"
			"Very Small"		137996.00
			"Very Large"		607996.00
			"Medium"			4055474.00
			"Large"				4886685.00
			"Small"				1248140.00


--17]  Which brand generated the highest total sales (revenue)?

SELECT brand, SUM(sales_price)AS total_sales
FROM flipkart_mobile
GROUP BY brand
ORDER BY total_sales DESC;

-- 17 ANS:
			"brand"			"total_sales"
			"Samsung"		3430001.00
			"Apple"			3233894.00
			"Realme"		2360562.00
			"Xiaomi"		1019390.00
			"Poco"			892444.00			

-- 18] What is the average rating per screen size group?

SELECT screen_size, ROUND(AVG(ratings),2)AS avg_rating
FROM flipkart_mobile
GROUP BY screen_size;

-- 18 ANS:

			"screen_size"	"avg_rating"
			"Very Small"	4.50
			"Very Large"	4.05
			"Medium"		4.42
			"Large"			4.29
			"Small"			4.39			



-- 19] Is there a trend between display size and sales performance?

SELECT screen_size, SUM(sales_price) AS total_sales
FROM flipkart_mobile
GROUP BY screen_size;

-- 19 ANS:
			"screen_size"		"total_sales"
			"Very Small"		137996.00
			"Very Large"		607996.00
			"Medium"			4055474.00
			"Large"				4886685.00
			"Small"				1248140.00


-- 20] Compare total sales between phones with dual rear cameras vs. single rear camera.

SELECT num_rear_camera, SUM(sales_price)AS total_sales
FROM flipkart_mobile
WHERE num_rear_camera = 1 OR num_rear_camera = 2
GROUP BY num_rear_camera;

-- 20 ANS:
			
			"num_rear_camera"	"total_sales"
				1				1137429.00
				2				3319037.00




-- 21] Ranking Sales by Base_color:

SELECT base_color, sum(sales_price)as Total_sales,
rank() over( order by sum(sales_price) Desc)
FROM flipkart_mobile
GROUP BY base_color;
