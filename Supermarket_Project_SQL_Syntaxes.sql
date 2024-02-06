-- To find NULL (example).
SELECT "ID", "Bulkmail_ad", "Twitter_ad", "Instagram_ad", "Facebook_ad", “Brochure_ad”
FROM ad_data
WHERE "Twitter_ad" IS NULL;

-- To find duplicates (example).
SELECT "ID", COUNT(*) AS "Row Count"
FROM public.marketing_data
GROUP BY "ID"
ORDER BY "Row Count" DESC;

-- Total spend per country.
SELECT "Country", SUM("AmtLiq" + "AmtVege" + "AmtNonVeg" + "AmtPes" + "AmtChocolates" + "AmtComm") AS "Total Spend"
FROM marketing_data
GROUP BY "Country"
ORDER BY SUM("AmtLiq" + "AmtVege" + "AmtNonVeg" + "AmtPes" + "AmtChocolates" + "AmtComm") DESC;

-- Total spend per product per country.         
SELECT "Country", SUM("AmtLiq") AS "Total AmtLiq Spend", SUM("AmtVege") AS "Total AmtVege Spend", 
SUM ("AmtNonVeg") AS "Total AmtNonVeg Spend", SUM("AmtPes") AS "Total AmtPes Spend", 
SUM("AmtChocolates") AS "Total AmtChocolates Spend", SUM("AmtComm") AS "Total AmtComm Spend"
FROM marketing_data
GROUP BY "Country"
ORDER BY "Country" ASC;

-- Social media effectiveness per country.
SELECT md."Country", SUM(ad."Twitter_ad") AS "Twitter Effectiveness", 
SUM(ad."Instagram_ad") AS "Instagram Effectiveness", 
SUM(ad."Facebook_ad") AS "Facebook Effectiveness"
FROM public."marketing_data" md
JOIN Public."ad_data" ad
ON md."ID" = ad."ID"
GROUP BY md."Country"
ORDER BY md."Country" ASC;

-- Social media effectiveness by marital status.
SELECT md."Marital_Status", SUM(ad."Twitter_ad") AS "Twitter Effectiveness", 
SUM(ad."Instagram_ad") AS "Instagram Effectiveness", 
SUM(ad."Facebook_ad") AS "Facebook Effectiveness"
FROM public."marketing_data" md
JOIN Public."ad_data" ad
ON md."ID" = ad."ID"
GROUP BY md."Marital_Status"
ORDER BY md."Marital_Status" ASC;

-- Total spend per product per country with social media effectiveness.
SELECT md."Country", SUM(md."AmtLiq") AS "Total AmtLiq Spend", 
SUM(md."AmtVege") AS "Total AmtVege Spend", SUM (md."AmtNonVeg") AS "Total AmtNonVeg Spend", 
SUM(md."AmtPes") AS "Total AmtPes Spend", SUM(md."AmtChocolates") AS "Total AmtChocolates Spend", 
SUM(md."AmtComm") AS "Total AmtComm Spend", SUM(ad."Twitter_ad") AS "Twitter Effectiveness", 
SUM(ad."Instagram_ad") AS "Instagram Effectiveness", SUM(ad."Facebook_ad") AS "Facebook Effectiveness"
FROM public."marketing_data" md
JOIN Public."ad_data" ad
ON md."ID" = ad."ID"
GROUP BY md."Country"
ORDER BY md."Country" ASC;