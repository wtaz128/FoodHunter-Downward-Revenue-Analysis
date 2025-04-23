# **FoodHunter Downward Revenue Ananlysis**
### **Business Problem Statement**
FoodHunter is a food delivery app known for its diverse restaurants options with multiple cuisines and quick delivery. They have been facing a consistent downward trend in their monthly revenues in the last quarter.
*They wish to understand the different factors that are negatively impacting their business.*     

### **My Objective**  
As a Business Analyst, I resolve this problem by following steps:  

1. Make assumptions of the potential reasons based on the industry and business knowledge
2. Prepare and construct data modeling on the data sources related to the assumptions
3. Conduct SQL queries to analysis the database and verify each factor's contribution to this problem
4. Make a final statement about the analysis result

### **Tools and Methodologies**  
MySQL  
Root csuse analysis
### Data Modeling  
<img width="1217" alt="data model" src="https://github.com/user-attachments/assets/e820f340-7515-48c5-a3ee-c0721138695b" />

### Step 1  Familiar with the data and make assumptions
Import the sql. script into MySQL workbench and apply the sql.damp file.
<img width="1025" alt="import data" src="https://github.com/user-attachments/assets/70393fae-fbe9-4ce3-b4ce-bd29896a392a" />
Familiar with the dataset by looking through each dataset and checking columns and contents  
<img width="1030" alt="check data" src="https://github.com/user-attachments/assets/c4b8f2dd-5060-4d48-84e9-ed11b1084c9a" />

Since revenue equals quantity * price, we can vaguely investigate into the quantity and revenue changes by month. After conducted several queries, we confirmed the downward trending in both quantity and revenue.

Now we need to break down into several factors that may negatively impact the revenue.

### Hypothesis Generation and Verification
1.Time-based Problems
2.Revenue Related Factors
3.Delivery Partner Problem
4.Food Preferences & Food Quality
5.Marketing Factors
6.Customer Review

testtest