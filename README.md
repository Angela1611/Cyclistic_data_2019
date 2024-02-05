
# "Cyclistic_data_2019"
## "Angela Escobar"
### "2024-02-01"


This project served as the capstone project for the Google Data Analytics Professional Certificate. The task involved analyzing data from a company named "Cyclisctic" which provides rental services for various types of public bicycles in the city of Chicago, during a specific period (2019) with a clear objective: gaining insights to increase the conversion rate from casual customers to annual subscribers. 


### The Scenario

In 2016, **Cyclistic launched a successful bike-share offering**. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations
across Chicago. The bikes can be unlocked from one station and returned to any other station
in the system anytime. 


Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members. 


Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
Moreno believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, Moreno believes
there is a solid opportunity to convert casual riders into members. She notes that casual riders
are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 


**Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into
annual members**. In order to do that, however, the team needs to better understand how
annual members and casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.

## Analysis steps:

### **1. Ask**
In this step of the process, I aimed to define the specific needs of the stakeholder to determine the main objective of the analysis, towards which all actions in the analysis should be directed.

After analyzing and understanding the current context of the company, I arrived at the following ideas to have a clear purpose for the entire analysis process and to guide all actions accordingly:





**Stakeholders**: 
Cyclistic executive team, Lily Moreno (Director of Marketing at Cyclistic)

**Stakeholder's Specific Needs**: 
Maximize the number of subscribers, convert casual riders (customers) into members (subscribers).


**Main purpose of the analysis**: 
Design marketing strategies aimed at converting casual riders into
annual members

### **2. Prepare**

In this stage of the process, I carefully **defined** and **downloaded** the datasets I'll need, and I **organized** them on my computer in an orderly manner. Additionally, I **established a Git repository**, implementing a version control strategy to track various versions of my project. This not only simplifies teamwork but also ensures I can effortlessly monitor and document the evolution of the project.Finally, I **imported the data sets** into to the R project.

### **3. Process**


During this phase, I undertook some steps to ensure the optimal presentation and organization of the dataset prior to initiating the analysis. 

"The integral tasks within this process included **merging diverse datasets into a cohesive format, rigorously validating and correcting data types for each column, inspecting columns for inaccuracies, and incorporating three new columns that would be necessary for subsequent analysis based on the provided information."**. However, this is an itemized account of the particular actions I executed. The precise details of each step are documented in the project code

* Import datasets

* Install packages

* Load packages

* Check column names to bind all datasets into one

* Fix column names to match

* Check column names match in all the dataframes

* bind all dataframes into one

* View the new dataframe with all information combined

* Hide previous dataframes

* Clean names and remove empty rows

* Review and correct the data type of each column.

* The 'tripduration' column has many N/A values, so I'll assign a formula to it to confirm that all values are accurate.

* Specify in the column name "tripduration" that the unit is seconds

* Check that all values in "tripduration_seconds" are > 0

* Assign a minimum value of 0 to negative values in 'tripduration_seconds'

* Check that all values in "tripduration_seconds" are > 0

* Check that there are only 2 user types to avoid type errors

* Create new columns necessary for the analysis

### **4. Analyze**
Always keeping the overarching goal in mind: "Design marketing strategies aimed at converting casual riders into
annual members" I started this phase by delineating the specific aspects I intended to analyze, which I identified as


* Average trip duration by user type.

* Percentage of trips made by user type.

* Most popular arrival and departure stations.

* Behavioral differences between customers and subscribers throughout the day.

* Behavioral differences between customers and subscribers throughout the week.

* Behavioral differences between customers and subscribers throughout the year.

After conducting the necessary operations for this analysis, the following results were obtained:

### **5. Share**

* Subscribers use the service more than triple the number of times compared to customers.Here we can see that most of the trips are done by subscribers

![02  Percentage of trips made by usertype](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/40d044f8-0699-44e4-8742-f4da8405757a)




* However, the average trip duration for customers is more than triple that of subscribers.

![01 AverageTripDurationByUser Type](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/ad3f68c2-2ee7-43eb-a773-5bc1ec18802c)




* Subscribers move more during peak hours (7-9am, 4-6pm). Customers move more towards the second half of the day (11-7pm)


![05  Trips by hour and usertype](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/72b6110b-af77-47fa-b940-5025158a259f)

* This suggests that most subscribers use the service primarily for commuting, while customers use it more for recreational purposes.


* Subscribers use the service more during weekdays, while customers use it more during weekends

![03  Trips by usertypes during the week](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/5bda9108-7771-4733-9558-b09710c5cd63)


* Customer trips decrease greatly during the months of November to February, and some subscribers keep being active but not as much as the rest of the year. Summer is the season with more activity, followed by autumn and spring, during the winter 

![04  Trips by usertypes during the year](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/8f801fd9-0d0b-426b-bb78-7b71775df298)



* These are the most popular stations both departing from and arriving to

![06  Top Stations](https://github.com/Angela1611/Cyclistic_data_2019/assets/158333155/cc3dab3f-ef82-4b3f-b8f5-d701cc13273d)



### **6. Act** 

#### **Conclusions**



* Subscribers use the service more than triple the number of times compared to customers.


* However, the average trip duration for customers is more than triple that of subscribers.



* Subscribers move more during peak hours (7-9am, 4-6pm). Customers move more towards the second half of the day (11-7pm)


* This suggests that most subscribers use the service primarily for commuting, while customers use it more for recreational purposes.



* Subscribers use the service more during weekdays, while customers use it more during weekends

* Customer trips decrease greatly during the months of November to February, and some subscribers keep being active but not as much as the rest of the year. Summer is the season with more activity, followed by autumn and spring, during the winter



* Eight stations overlap between the top 10 departing and arriving stations, making them pivotal for strategic planning and effective information dissemination, given their high popularity. 

#### **Recommendations to convert casual riders into members:**

##### **1. Mileage Rewards**

Create a rewards program based on distance traveled, offering additional discounts to customers who make longer trips, turning frequency into tangible benefits.

##### **2. Rewards for number of trips.**
Implement a system of progressive discounts, where customers who exceed a certain number of trips obtain reduced rates, encouraging them to use the service more frequently.

#####  **3. Special rates for intermediate times**


Implement subscription plans with special rates during peak usage hours, offering attractive discounts for customers who use the service between 11 a.m. and 7 p.m. 


##### **4. Additional benefits during intermediate hours**
Create a benefits program, such as points or rewards when using the service between 11 and 7pm

##### **5. Partnerships with entertainment and leisure plans**
Offer travel routes with tours of local events, recreational plans, restaurants, or tourist sites, attractions of interest, and other recreational activities during afternoon hours during the week, and throughout the day on weekends.

##### **6. Subscription for groups:**

Since the vast majority of leisure and recreation activities are done with friends or family, a plan could be created with reduced rates for groups of several people.

##### **7. Quarterly plans**

Offer quarterly plans with preferential rates, giving users the flexibility to customize their experience by choosing specific stations that suit their needs.

Customer trips decrease greatly during the months of November to February,


##### **8. Unforgettable Experiences Plan:**

Present a proposal for winter tourism plans. This itinerary would include Illuminated Scenic Routes and Stops at Emblematic Points of the city, offering enchanting views in a snowy environment. Hot Drinks and Christmas Treats could be included to add a cozy touch to the tour.
With the right support, this project has the potential to become a tradition and a distinctive tourist attraction in the city.

##### **9. Exclusive Rates and Personalized Station Selections**

Provide exclusive rates for the most popular stations, as well as the possibility of customizing the stations selected by the user according to their needs.


##### **10. Prime Station Updates for Optimal User Experience.**
Present the new measures, plans and information at the busiest stations for users to guarantee a higher percentage of information coverage so that they can make the most of all our services.



**____________________________ END OF STUDY CASE___________________________________________**

## Conclusions

