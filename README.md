# Supermarket Customer Information Project
## Project Background 
The intention behind this project is to explore, answer and provide suggestions for further analysis for 2Market’s business problem: its difficulty in understanding its customers. In particular, the customer demographics, the effectiveness of different advertising channels, its best-selling products and whether these products differ based on demographics. Using the ‘5 Whys’ framework, this business problem results from the neglect of strengthening a data-driven decision-making culture within 2Market. I will also explore what the average spend per country is, and how customer’s education affects social media effectiveness and product popularity. 

## Analytical Approach
The only spelling mistakes of the Excel marketing_data file were the column headings, which I did not change, as they corresponded with the metadata. Furthermore, no blank cells or errors existed in the dataset, which I checked for using the __‘Find & Sort’__ option and ‘Conditional Formatting’. To check the data type of each column, I used the __TYPE function__. The ‘Income’ and ‘Dt_Customer’ columns had the incorrect data type. For ‘Income’, I removed the ‘$’ sign using __‘Find & Replace’__ and then changed the format from __‘General’ to ‘Currency’__. For ‘Dt_Customer’, I used the __‘Text to Columns’__ option twice, as some dates were in mm-dd-yyyy format while others were in dd-mm-yyyy format. I also checked for duplicates using __‘Conditional Formatting’__. Although it seemed like some rows could be duplicates, all ID numbers were unique. Therefore, I did not remove any data. Finally, I merged the marital status ‘Alone’ into ‘Single’ using __‘Find & Replace’__, as they mean the same thing. 

The formula, __=YEAR(NOW())-[@[Year_Birth]]__, generated the customer ages. However, as customer registrations are only between 2012-2014, calculating the age from the current year might be incorrect. Using a __pivot table__ and bar chart, I was able to calculate and present the overall average age (53) and each marital statuses average age. Three customers had an uncommon age of over 120. As these ages did not impact the average age, I did not filter out these customers. However, I filtered out ‘YOLO’ and ‘Absurd’, as these marital statuses do not make sense. Surprisingly, ‘Divorced’, ‘Married’, ‘Single’ and ‘Together’ had average ages within a range of six years (50-56), illustrating that age is not a significant factor for marital status. Creating two __pivot tables__ and scatterplots, I was able to present the relationship between age and income in general, and more specifically for customers earning between $90,000-$100,000. I temporarily filtered out four visible outliers from the first scatterplot, as they made it difficult to analyse the graph. Adding a trendline to both scatterplots showed a slight income increase as age increases. 

As I imported the cleaned marketing_data Excel file, no cleaning of the data was needed in SQL. For the ad_data CSV file, I simply used syntaxes to check for __‘NULL’ values and duplicates__, which did not exist. To combine both files, I used __‘JOIN’__ in my syntaxes. The syntaxes I used to explore the data and answer the questions can be found in the appendix. One thing that I noticed is a correlation between total spend per product per country and the number of successful social media conversions.

## Dashboard Design and Development
[__VIEW DASHBOARD ON TABLEAU PUBLIC__](https://public.tableau.com/app/profile/mattia.bieler/viz/SupermarketProjectDashboard/2MarketDashboard)
![Dashboard](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/efc4d162-9919-4a06-9ca3-fd6c3a5bb028)

The base colour chosen for the dashboard visualisations is blue, as demonstrated by barplot, scatterplot, and table. The other three visualisations, which are not blue, have legends to indicate each component of the graph. Of these, two have the same colour scheme, as they present the same product types.

The rationale behind the visualisations was to maintain a simplistic design with graph types that are easily recognisable. The bar chart conveys the average age and income per marital status (‘YOLO’ and ‘Absurd’ filtered out) in a straightforward manner. The income outlier, identified from the scatterplot, was removed because it impacted the average income of ‘Single’ by over $1000, which is a large amount, considering how close the average income for each marital status is. The scatterplot has an income filter to allow insight into customers earning between $90,000-$100,000. The income filter, as well as an age filter, also allows for the outliers to be filtered out. Furthermore, the table’s colour gradient gives more depth and illustrates the main point of focus. The rationale behind the stacked bar charts is their ability to provide a lot of information, while still being clear to read. Furthermore, the ‘Product Popularity’ and ‘Social Media Effectiveness’ visualisations have parameters that change the y-axis between ‘Country’, ‘Education’ and ‘Marital Status’.

Due to these parameters, I added dynamic titles, indicating which parameter option has been chosen. The third stacked bar chart and the scatterplot also have dynamic titles, linked to their filters. The stacked bar chart’s country filter was implemented due to the visualisation being overcrowded. I decided to keep all countries, as I wanted to present the data in its entirety. For example, Montenegro is hardly visible on the visualisation. However, by filtering out the other countries, the full details for Montenegro become visible. Contrastingly, for the ‘Social Media Effectiveness’ visualisation, I did remove ‘Montenegro’ and ‘Basic’ because they had no values present.

## Patterns, Trends, and Insights
![Table](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/cb7ce358-3900-41cf-aa0b-f51885ea9e7f)

![Social Media All](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/15c1e78d-b4a0-41ab-8675-d5955eead6c0)

An interesting insight is that although Spain has the highest total spend by over three times the next country, Saudi Arabia, five countries have a higher average spend per customer than Spain. Another important insight is that the effectiveness of each social media platform is similar within each country, education type and marital status. This illustrates that 2Market should focus advert campaigns across Facebook, Instagram, and Twitter. However, Instagram and Twitter are generally more successful, which is especially the case for ‘Marial Status’, where Facebook is the least successful for each marital status. For ‘Education’, Facebook is the least successful for ‘Master’ and ‘PhD’, as well as joint bottom with Twitter for ‘Graduation’. Furthermore, as mentioned above, countries with a high spend per product also had more successful social media conversions. However, this does not factor in the number of customers per country. Calculating the success rate is something for further exploration. This can be done by using ‘Count_success’ in the marketing_data file. 

![Total Spend All](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/fb58a19c-d768-4bcf-b931-25d4d8cf73b7)

![Popularity All](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/dab9ec3f-5373-48d8-ac21-644167ff80d0)

All countries spent the most on alcohol and then meat. This was also true when looking at product popularity (average spend) per country or marital status and largely true for education. Only customers with a basic education spent more on commodities than alcohol and meat, likely due to having lower salaries, as demonstrated by their low average spend per product in comparison to other education types.

[__CLICK HERE TO WATCH PRESENTATION__](https://drive.google.com/file/d/1D41i6ak81_ej1YqA8iErMMBCjQp-wvr3/view?usp=sharing)
![SPP](https://github.com/Mattia-Bieler/Supermarket_Customer_Information_Project/assets/132078605/8bc2ee95-cc95-44a4-8962-3cf4888aed8d)

## Appendix
__[TO FIND NULL (EXAMPLE)]__ <br>
SELECT "ID", "Bulkmail_ad", "Twitter_ad", "Instagram_ad", "Facebook_ad", “Brochure_ad”<br>
FROM ad_data<br>
WHERE "Twitter_ad" IS NULL;

__[TO FIND DUPLICATES (EXAMPLE)]__ <br>
SELECT "ID", COUNT(*) AS "Row Count"<br>
FROM public.marketing_data<br>
GROUP BY "ID"<br>
ORDER BY "Row Count" DESC;

__[TOTAL SPEND PER COUNTRY]__ <br>
SELECT "Country", SUM("AmtLiq" + "AmtVege" + "AmtNonVeg" + "AmtPes" + "AmtChocolates" + "AmtComm") AS "Total Spend"<br>
FROM marketing_data<br>
GROUP BY "Country"<br>
ORDER BY SUM("AmtLiq" + "AmtVege" + "AmtNonVeg" + "AmtPes" + "AmtChocolates" + "AmtComm") DESC;

__[TOTAL SPEND PER PRODUCT PER COUNTRY]__ <br>
SELECT "Country", SUM("AmtLiq") AS "Total AmtLiq Spend", SUM("AmtVege") AS "Total AmtVege Spend",<br> 
SUM ("AmtNonVeg") AS "Total AmtNonVeg Spend", SUM("AmtPes") AS "Total AmtPes Spend",<br> 
SUM("AmtChocolates") AS "Total AmtChocolates Spend", SUM("AmtComm") AS "Total AmtComm Spend"<br>
FROM marketing_data<br>
GROUP BY "Country"<br>
ORDER BY "Country" ASC;

__[SOCIAL MEDIA EFFECTIVENESS PER COUNTRY]__ <br>
SELECT md."Country", SUM(ad."Twitter_ad") AS "Twitter Effectiveness",<br>
SUM(ad."Instagram_ad") AS "Instagram Effectiveness",<br>
SUM(ad."Facebook_ad") AS "Facebook Effectiveness"<br>
FROM public."marketing_data" md<br>
JOIN Public."ad_data" ad<br>
ON md."ID" = ad."ID"<br>
GROUP BY md."Country"<br>
ORDER BY md."Country" ASC;

__[SOCIAL MEDIA EFFECTIVENESS BY MARITAL STATUS]__ <br>
SELECT md."Marital_Status", SUM(ad."Twitter_ad") AS "Twitter Effectiveness",<br> 
SUM(ad."Instagram_ad") AS "Instagram Effectiveness",<br> 
SUM(ad."Facebook_ad") AS "Facebook Effectiveness"<br>
FROM public."marketing_data" md<br>
JOIN Public."ad_data" ad<br>
ON md."ID" = ad."ID"<br>
GROUP BY md."Marital_Status"<br>
ORDER BY md."Marital_Status" ASC;

__[TOTAL SPEND PER PRODUCT PER COUNTRY WITH SOCIAL MEDIA EFFECTIVENESS]__ <br>
SELECT md."Country", SUM(md."AmtLiq") AS "Total AmtLiq Spend",<br> 
SUM(md."AmtVege") AS "Total AmtVege Spend", SUM (md."AmtNonVeg") AS "Total AmtNonVeg Spend",<br> 
SUM(md."AmtPes") AS "Total AmtPes Spend", SUM(md."AmtChocolates") AS "Total AmtChocolates Spend",<br> 
SUM(md."AmtComm") AS "Total AmtComm Spend", SUM(ad."Twitter_ad") AS "Twitter Effectiveness",<br> 
SUM(ad."Instagram_ad") AS "Instagram Effectiveness", SUM(ad."Facebook_ad") AS "Facebook Effectiveness"<br>
FROM public."marketing_data" md<br>
JOIN Public."ad_data" ad<br>
ON md."ID" = ad."ID"<br>
GROUP BY md."Country"<br>
ORDER BY md."Country" ASC;
