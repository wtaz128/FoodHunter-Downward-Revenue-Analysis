# **FoodHunter Downward Revenue Ananlysis**
### **Business Problem Statement**
FoodHunter is a food delivery app known for its diverse restaurants options with multiple cuisines and quick delivery. They have been facing a consistent downward trend in their monthly revenues in the last quarter.
*The sales team wish to understand the different factors that are negatively impacting their business.*     

### **My Objective**  
As a Business Analyst, I resolve this problem by following steps:  

1. Gather requirements and make assumptions of the potential reasons based on the industry and business knowledge
2. Prepare and construct data modeling on the data sources related to the assumptions
3. Conduct SQL queries to analysis the database and verify each factor's contribution to this problem
4. Make a final statement about the analysis result and visualize a dashboard for stakeholder's discussion

### **Tools and Methodologies**  
MySQL  
Power Bi
Root Cause Analysis(RCA)
### Data Modeling and Preparation
<img width="1217" alt="data model" src="https://github.com/user-attachments/assets/e820f340-7515-48c5-a3ee-c0721138695b" />

Import the sql. script into MySQL workbench and apply the sql.damp file.
<img width="1025" alt="import data" src="https://github.com/user-attachments/assets/70393fae-fbe9-4ce3-b4ce-bd29896a392a" />
Familiar with the dataset by looking through each dataset and checking columns and contents. Understand the definition and data type of each column and how they relate to each other. 
<img width="1030" alt="check data" src="https://github.com/user-attachments/assets/c4b8f2dd-5060-4d48-84e9-ed11b1084c9a" />

Since revenue equals quantity * price, we can vaguely investigate into the quantity and revenue changes by month.
<img width="1024" alt="Q R changes" src="https://github.com/user-attachments/assets/19bcd47c-8707-45b0-ac4a-20e44147a87c" />

After conducted several queries, we confirmed the downward trending in both quantity and revenue.

Now we need to break down into several factors that may negatively impact the revenue.

### Hypothesis Generation and Verification

#### 1.Time-based Problems  
* Day of Week: Impact of weekends and weekdays  
* Time of the day: Orders placed early morning, afternoon, late evening, night and lat night etc  

First I want to find out which period of a week and a day that has more orders and generates more revenues. So I divided the week into weekdays and weekends, days into four time segments and compared the order quantity, total revenue and %change of revenue.  
<img width="938" alt="wdays q" src="https://github.com/user-attachments/assets/a87fe8e8-df46-4404-8b22-866bda698b84" />

From the result we can see that weekends have more orders than weekdays in all months(total quantity of weekdays should be divided by 5, since there is 5 days in weekdays), so weekends is an important indicator for further analysis. Next, I calculated the revenue and %change of revenue in wwekdaysa and weekends.  
<img width="954" alt="wdays total %" src="https://github.com/user-attachments/assets/d515d9a6-7fd3-4f16-a7e2-1bee257a405e" />
We can see that both weekdays and weekends sales dropped, but weekends dropped more. Now, look at the day period.

<img width="1480" alt="day segment rev %" src="https://github.com/user-attachments/assets/29d36e2a-083e-4965-a42d-283ebf589354" />

We can tell that 6AM-12PM and 12AM-6AM are the busiest period during a day and orders are constantly declining over the four months, however, there is a huge drop in orders during 6PM-12PM since June. This is an unexpected fact that we can look into it further.


#### 2.Delivery Partner Problem  
* Delivery Duration: Have delivery time increased over time?  
* Overall Delivery Experience; Partner behaviour, interaction etc  

Delivery efficiency is a crucial aspect of the success in a food delivery app. Delivery time can be an indicator of the delivery efficienvy. I calculated the average delivery tine change in the last four month to see the trend. Also, I set a delivery standard for the drivers by ranking the top 5 performence and worst 5 performence driver's delivery time for the delivery partner to strengthen their driver's performence.  
<img width="793" alt="deliver time month" src="https://github.com/user-attachments/assets/9f3c9da2-4b14-4eb6-bf13-2bde25d8e179" />

From the table, we can see that the average time of delivery is increasing. To find out why this happens, we need more data. But, we can be sure the delivery efficiency need to be improved.  
<img width="975" alt="driver rank" src="https://github.com/user-attachments/assets/34bfd10d-27b5-42c2-b722-53d2da41c317" />

Based on the ranking of the driver's perforemce, we can see that there is a about 10-min gap by comparing the top and the worst performence drivers that can be trained to be made up.  

#### 3.Food Preferences & Food Quality  
* Food Preference: Do our customers have a preference on a specific type of food?
* Food Quality: How does the food quality change recently? why it is reduced over time?

There is a lot food categories but since the dataset only offers the food type of veg and non-veg. So I conducted queries on it to find the customers prefered food type. As for the food quality, I used the restaurnats popularity as one indicator, which can be measured by the total orders in the last four months.  
<img width="878" alt="veg:non-veg" src="https://github.com/user-attachments/assets/c1ea81d0-fe2f-4694-a369-7a1d5861d07b" />

Since the food type in the dataset is inconsistant, I need to identify them first. The results show that non-veg is more popular than veg, which aligns with my expects and common sense. Next, I filtered out the least popular restaurants and the food type they offer trying to find some patterns.  

<img width="1052" alt="restaurant pop" src="https://github.com/user-attachments/assets/0cffea16-145c-455c-87b9-a9c5d65ca9f5" />
The table shows that there are 8 restaurants that has no orders at all in the last four month, and there are 5 Italian restaurants among them. To find out why, we nned more info about the restaurants. But I can assume that may be Italian food is not popular in the area or some Italian restaurants offer the bad service. But we need more data to go deeper.  

#### 4.Marketing Factors  
* Marketing Expense: Have we reduced marketing expenses for digital, offline on ad campaigns or promotion discounts?  

Since the dataset only offer the discounts info that relates to the marketing factors, I would analysis the discount change and its impact to the revenue as the indicator.  
<img width="952" alt="discount" src="https://github.com/user-attachments/assets/dee4b2b1-2ee9-4ffd-b374-9387c0ab7c98" />

Fron the discount change I can see that it seems to have a positive relationship with revenue, because they both dropped in the rencent months. But does the change of the discounts has an impact on the revenue? It needs more calculation, so I added an discount-sales ratio to see whether the change of ratio caused the revenue decrease. From the result, we can see that the ratio stays constantly at 13%. So discount doesn't have a significant impact on the revenue.  


#### 5.Customer Review/Feedback  
* Rating: To understand overall rating of the orders as well as the ratinga of individual restaurants  

First, I categorized the rating into Good, Medium and Bad for the convinient to measure the quality of the targets.   
<img width="1008" alt="rating overall" src="https://github.com/user-attachments/assets/8a67a851-916b-4dd3-96f2-bb597e208f03" />

From above we can see that the Bad rating orders accountds for nearly 30% of the total orders overall. That is a surprising fact indicates the overall service our app privide(food, delivery, service and so on) is unsatisfying to customers. To find out why it happended, I compared each rating level by month trying to find the when did it happen.  
<img width="967" alt="rating month" src="https://github.com/user-attachments/assets/3d2cee7b-3ef4-49ab-ace7-7bb8494ee50a" />

The time-series rating level shows that the Bad rating suddenly jumped in June from 1541 to 4051, increased nearly 4 times. That is the serious and emergent problem we nned to deal with. To deep investigate, we need more data and context in June to find out what happened/changed during that period.  

### Final Statement  
Based on the analysis above, I can conclude that there are 4 significant indicators that negatively impacting the revenue. And the most emergent factor should be the Customer Bad Reviews.
1. Weekends sales drop  
2. Delibery Partner Inefficiency  
3. Food & Restaurants Quality  
4. Customers Bad Reviews  

For a thorough and deeper understanding into these problems in the future, we need more data provided from other departments to analyse and make final actionable decisions. For example, we need more data about Customer Bad Reviews to find out which part of our app's service makes bad feeling to customers. Bad food taste? Poor restaurants selection? Unsatisfying delivery service? and so on.
