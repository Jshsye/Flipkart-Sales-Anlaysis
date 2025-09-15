# Flipkart-Sales-Anlaysis
Flipkart Sales Analysis Using SQL(Postresql)

🗂️ 1. Data Understanding & Setup 
	• I began by creating a PostgreSQL database called Flipkart.
	• I created a table flipkart_mobile with 16 relevant fields such as:
		○ brand, model, processor, screen_size
		○ ROM, RAM, battery_capacity, ratings, sales_price, discount_percent, and sales
	“These fields were sufficient to perform both product-based and performance-based analysis.”
	• I imported the dataset using the COPY command from a CSV file.

🔍 2. Product Performance Analysis 
	In the first section, I focused on how each brand and model performed in terms of listings, uniqueness, customer ratings, and popularity.
🔹 Unique Models per Brand
	• Samsung had the most unique models (43), followed by Realme and Xiaomi.
	• This suggests Samsung’s strategy is variety-driven, targeting different segments.
🔹 Most Listings
	• Realme had 138 product listings, highest among all.
	• Indicates aggressive market penetration and multiple versions/variants per model.
🔹 Top-Rated Phones
	• Models like iPhone XR, Galaxy S10, and Redmi K20 had ratings above 4.5.
	• Suggests that premium and flagship models generally lead in customer satisfaction.
🔹 Most Reviewed Models
	• C2, Redmi Note 4, and Narzo 20 received hundreds of thousands of ratings.
	• These are typically budget or mid-range models, indicating mass market appeal.

💰 3. Sales and Pricing Insights
	Then I analyzed the revenue side — what drives sales, and how pricing and discounts are used.
🔹 Average Sales Price per Brand
	• Apple had the highest average sales price (~₹57K), consistent with its premium brand image.
	• Poco and Xiaomi had the lowest, around ₹16K–₹17K.
🔹 Top Expensive Phones
	• Samsung’s Fold Series and Note 20 Ultra topped the price chart.
	• Foldable and flagship phones represent the premium market.
🔹 Discount Patterns
	• Poco gave the highest average discount (16%) — likely to boost visibility.
	• Apple offered minimal discounts (6%) — maintaining its exclusivity.
🔹 Popular RAM + ROM in Discounts
	• The combination of 8GB RAM + 128GB ROM was the most discounted — especially for Realme.
	• Indicates high demand in the mid-range performance segment.
🔹 Correlation Between Discount & Sales
	• A small positive correlation (0.15) between discount % and sales.
	• Shows discounts help to some extent, but other factors like brand and features matter more.

⚙️ 4. Feature Analysis 
	This section was all about understanding how product specs affect customer choices.
🔹 Battery Capacity per Brand
	• Poco leads with an average of 5247 mAh — focuses on power users.
	• Apple lowest at 2765 mAh — optimized for performance over battery life.
🔹 Battery vs. Rating
	• Phones with small batteries (<3000 mAh) had highest ratings.
	• Likely due to premium iPhones which perform well despite low battery sizes.
🔹 Processor Distribution
	• Qualcomm and MediaTek are most common.
	• Other processors like Exynos (Samsung), iOS (Apple) appear less frequently but represent high-end models.
🔹 RAM vs. Rating
	• No linear correlation.
	• Phones with 3–4GB RAM scored highest ratings, indicating cost-effective but efficient models.
🔹 Camera Features by Brand
	• Poco and Samsung offered the most rear cameras on average.
	• Apple devices had simpler camera setups but were still highly rated.

📈 5. Sales Trends & Customer Preferences 
	Here I looked at trends over screen sizes, color preferences, and camera setups.
🔹 Screen Size vs. Sales
	• Large (6.3–6.7 inch) phones generated the most revenue.
	• People prefer immersive screens for entertainment and gaming.
🔹 Brand-wise Sales
	• Samsung and Apple lead total sales by a large margin.
	• Indicates brand trust and loyal customer base.
🔹 Screen Size vs. Ratings
	• Very Small and Medium screens had the best ratings.
	• Suggests compact phone lovers are more satisfied (possibly iPhone users).
🔹 Rear Camera Setup vs. Sales
	• Phones with dual cameras outsell single-camera phones.
	• Indicates camera quality is a key purchase factor.
🔹 Color Preference
	• I ranked sales by base color using the RANK() window function.
	• Shows that even aesthetic choices like color impact consumer behavior.

📌 6. Business Impact & Use Cases 
	All these findings can help Flipkart or any similar e-commerce platform make data-backed decisions.
🔹 Practical Applications:
	• Inventory Management: Stock more phones in the 6.5-inch screen range with 6GB/128GB specs.
	• Pricing Strategy: Offer moderate discounts on mid-range phones to boost sales.
	• Customer Segmentation: Identify and target users who prefer compact phones or camera-rich devices.
	• Marketing: Promote top-rated and top-selling models for each price segment.

🧠 7. Learnings and SQL Skills Demonstrated 
	This project helped me strengthen several data analysis concepts and hands-on SQL techniques.
🔹 SQL Concepts Used:
	• Data Type Casting (ALTER TABLE)
	• Aggregations (SUM(), AVG())
	• Grouping and Filtering
	• Correlation Calculation (CORR())
	• Ranking with RANK() window function
	• CASE statements for bucketing (battery categories)


