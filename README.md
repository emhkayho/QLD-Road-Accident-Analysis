QLD-Road-Accident-Analysis
---

![dataset-cover](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/bb8d1d76-0c04-4d32-a4c9-92534a3a8564)

## 1.Introduction
This data analysis project aims to provide valuable insights into the information on location and characteristics of road traffic crashes that occurred in Queensland, Australia. The dataset encompasses all reported Road Traffic Crashes from 1st January 2001 to 31st December 2021, covering fatal, hospitalization, medical treatment, and minor injury crashes up to the end of 2021.

## 1.1.Objective:
The primary objective of this analysis is to extract meaningful insights and trends from the comprehensive crash data in Queensland. By utilizing a combination of SQL and Python, we aim to explore the dataset to better understand the factors contributing to road accidents, identify high-risk areas, analyze crash severity patterns, and explore relationships between various variables present in the data.

## 1.2.Dataset Description:
The dataset contains detailed records of road traffic crashes in Queensland, Australia. It includes crucial information such as crash locations, severity of injuries, crash types, restraint use, alcohol or speeding involvement, and other relevant attributes. The data spans over two decades, offering a rich source of information for comprehensive analysis.

## 2.Skills and Concepts Demonstrated:
- Python: Used for data quality check and data cleaning. 
- MySQL Workbench: Employed to extract meaningful information through SQL queries and aggregations.
- Seaborn and Matplotlib: Utilized for data visualizations to present trends and patterns effectively.
- Data Exploration and Analysis: Conducted to gain comprehensive insights and understand data distributions.
- Data Visualization and Storytelling: Applied to communicate analysis findings in an intuitive manner.
- Data Interpretation and Communication: Presented conclusions and insights clearly and effectively.

## 3.Modeling:
In the process of conducting the analysis on Queensland crash data, it was observed that the four tables utilized for the analysis, namely crash locations, road casualties, specific factors and restraint helmet use, did not have any linking or related columns that could be used for direct interaction between the tables. This lack of direct relationships between the tables posed a challenge when attempting to perform complex analyses that required combining information from multiple tables.
Due to the absence of common key columns, it was necessary to rely on other data processing techniques to gain insights from the dataset. The use of View in SQL and Python's Pandas library proved to be invaluable in preprocessing relevant information from the separate tables for a more comprehensive analysis.

## 4.Key Findings:
#### 4.1.The top crash locations in Queensland were identified, with Brisbane standing out as the location with the highest number of crashes, accounting for approximately 29% of all reported incidents among the top five locations.
Table                                                                                                                      | Visual
:-------------------------------------------------------------------------------------------------------------------------:|:-------------------------------:
![Total Crash](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/ff7eb9be-fd0b-4e89-8cf6-24f9d7ddb71b)|![Total crash vis](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/2a6ffade-a298-4742-a548-a971727fa636)

#### 4.2.Over the 21-year period, the number of road casualties showed variations without displaying a clear trend. The distribution of crash severity revealed that the majority of casualties resulted in hospitalization (33%) and medical treatment (31%), with approximately 25% experiencing minor injuries and 11% being fatalities.
Table                                                                                                                       | Visual
:--------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------:
![each_year](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/b0cca2f5-15c0-4116-bcd0-6e28749d0380)   |
![per sev](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/8493a2df-1663-4d70-9f9c-f6667e4e2df1)     | ![severity](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/dc4b7741-b063-4e88-b896-fe238071963c)

#### 4.3.Risk factors significantly contributed to crashes, as approximately 86% of drivers involved were under the influence of alcohol, speeding, fatigued, or had vehicle defects. However, restraint and helmet usage were notably low, with only about 2% of drivers wearing restraints or helmets during crashes.
![risk factors](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/27b0ba84-b0e9-4aa3-84af-b9e1e7a6c432)
![Restrain](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/c8297827-69ca-4dd5-9b89-eaed028cec17)

#### 4.4 .Incidents with the most casualties were associated with "No Roadway Feature" or "Traffic Control," indicating the significance of road infrastructure and traffic management.
![features most incidence](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/c8564c35-b720-4efb-b6d9-e20ac5e65148)


#### 4.5.Young adults were observed to be involved in a considerable number of crashes, emphasizing the importance of targeted road safety education for inexperienced drivers.
![age group](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/bb76eac4-480f-4c2e-afdd-0724ecdfdb62)


#### 4.6.Notable variations in road casualties were observed based on the day of the week, with a steady rise from Monday to Thursday, a spike on Fridays, and a sharp drop over the weekend.
![daily trends](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/c77a5266-7b88-4dcb-b465-106021bec50c)

---

### 5.Conclusion:
The comprehensive analysis of road traffic crashes in Queensland, spanning from 1st January 2001 to 31st December 2021, has provided valuable insights into the location and characteristics of these incidents. By utilizing SQL and Python, we successfully extracted meaningful insights from the dataset, shedding light on crucial factors influencing road safety in the region.

### 6.Recommendations:
- Enhance safety measures by promoting the use of restraints and helmets through targeted awareness campaigns.
- Address driver risk factors through educational programs and strict enforcement to discourage alcohol use, speeding, driving while fatigued, or with vehicle defects.
- Improve road infrastructure and implement effective traffic control measures to reduce the incidence of crashes with higher casualties.
- Develop comprehensive road safety programs targeted at young adults to improve driving skills and awareness.
- Implement focused road safety campaigns and increased law enforcement during high-risk periods, particularly on Fridays, to reduce accidents.
By implementing these recommendations and leveraging the insights gained from this analysis, stakeholders can work towards reducing road traffic crashes, enhancing road safety, and safeguarding the lives of all road users in Queensland. The data-driven findings will play a crucial role in formulating effective strategies for accident prevention and mitigating road safety risks in the region.

     ![tenx](https://github.com/emhkayho/QLD-Road-Accident-Analysis/assets/96947147/fd08eb29-feb5-4a9b-8386-5af1aa3ee9b2)
