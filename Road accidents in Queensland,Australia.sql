#Note the tables in this datasets do not share any related columns that can help in linking them together.

#creating a table
Create database Road_accidents;
use road_accidents;

create table crash_locations(
Crash_Ref_Number int,Crash_Severity text, Crash_Year year, Crash_Month text, Crash_Day_Of_Week text, Crash_Nature text,
Crash_Type text,Loc_ABS_Remoteness text,Crash_Roadway_Feature text, Crash_Traffic_Control text, 
Crash_Speed_Limit text,Loc_Police_Region text,Crash_Atmospheric_Condition text,Crash_Lighting_Condition text, 
Crash_DCA_Code text, Crash_DCA_Group_Description text, Count_Casualty_Fatality int, Count_Casualty_Hospitalised int, 
Count_Casualty_MedicallyTreated int, Count_Casualty_MinorInjury int, Count_Casualty_Total int, 
Count_Unit_Car int, Count_Unit_Motorcycle_Moped int, Count_Unit_Truck int, Count_Unit_Bus int, 
Count_Unit_Bicycle int, Count_Unit_Pedestrian int, Count_Unit_Other int
);

#Load data on mysql command prompt
LOAD DATA LOCAL INFILE "C:\\Users\\User\\Desktop\\Sql project\\Crash Data-QueensLand,Australia 2022\\crash_locations.csv" INTO TABLE crash_locations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from crash_locations;

#creating table for road casualties:
create table road_casualties(
Crash_Year int,
Crash_Police_Region text,
Casualty_Severity text,
Casualty_AgeGroup text,
Casualty_Gender text,
Casualty_RoadUserType text,
Casualty_Count int
);

LOAD DATA LOCAL INFILE "C:\\Users\\User\\Desktop\\Sql project\\Crash Data-QueensLand,Australia 2022\\road_casualties.csv" INTO TABLE road_casualties
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from road_casualties;

#Creating restraint table
create table restraint(
Crash_Year int,
Crash_PoliceRegion text,
Casualty_Severity text,
Casualty_AgeGroup text,
Casualty_Gender text,
Casualty_Road_User_Type text,
Casualty_Restraint_Helmet_Use text,
Casualty_Count int 
);

LOAD DATA LOCAL INFILE "C:\\Users\\User\\Desktop\\Sql project\\Crash Data-QueensLand,Australia 2022\\restraint.csv" INTO TABLE restraint
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from restraint;

#creating the factors table
create table factors(
Crash_Year int,
Crash_Police_Region text,
Crash_Severity text,
Involving_Drink_Driving text,
Involving_Driver_Speed text,
Involving_Fatigued_Driver text,
Involving_Defective_Vehicle text,
Count_Crashes int,
Count_Fatality int,
Count_Hospitalised int,
Count_Medically_Treated int,
Count_Minor_Injury int,
Count_All_Casualties int
);

LOAD DATA LOCAL INFILE "C:\\Users\\User\\Desktop\\Sql project\\Crash Data-QueensLand,Australia 2022\\factors.csv" INTO TABLE factors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from crash_locations;

#What are the top 5 crash locations in Queensland with the highest number of crashes?
select loc_police_region as "Crash Locations" , format(count(*),0) as Crashes,
Concat(round(((COUNT(*) / (SELECT COUNT(*) FROM crash_locations)) * 100),2), '%') as Percentage
from crash_locations
group by loc_police_region
order by Count(*) desc
limit 5;

#How many road casualties occurred each year in Queensland?
select Crash_Year, format(count(casualty_count),0) as "Road Casualties"
from road_casualties
group by crash_year
order by count(casualty_count) desc;

select Crash_Year as 'Year', format(count(count_casualty_total),0) as "Crash Casualties"
from crash_locations
group by crash_year
order by count(count_casualty_total) desc;

#What is the distribution of crash severity among road casualties?
select Casualty_Severity as Severity, format(count(casualty_count),0) as Casualty,
Concat(round(((COUNT(casualty_count) / (SELECT COUNT(casualty_count) FROM road_casualties)) * 100),2), '%') as Percentage
from road_casualties
group by Severity
order by count(casualty_count) desc;

select * from factors;
#How many drivers involved in crashes were under the influence of alcohol, speeding, fatigued, or had vehicle defects?
select count(count_crashes) as "Under Infulence",
Concat(round(((COUNT(count_crashes) / (SELECT COUNT(count_crashes) FROM factors)) * 100),2), '%') as Percentage
from factors
where involving_drink_driving = "Yes" or involving_driver_speed= "Yes"
or involving_fatigued_driver = "Yes" or involving_defective_vehicle = "Yes"
order by count(count_crashes);

select * from restraint;
#What is the percentage of drivers wearing restraints or helmets during crashes?
select format(count(*),0) as "Drivers on Restrained",
Concat(round(((COUNT(*) / (SELECT COUNT(*) FROM crash_locations)) * 100),2), '%') as Percentage
from restraint
where Casualty_Restraint_Helmet_Use = 'Restrained';

create view useRestraint as select * from restraint where Casualty_Restraint_Helmet_Use = 'Restrained';
select Casualty_Severity as Severity, format(count(*),0) as "Drivers on Restrained",
concat(round(((COUNT(*) / (SELECT count(*) FROM useRestraint)) * 100),2),'%') as Percentage
from useRestraint
group by Casualty_Severity
order by Percentage desc;

select casualty_severity as Severity, format(count(*),0) as "Drivers on Restrained",
Concat(round(((COUNT(*) / (SELECT count(*) FROM crash_locations)) * 100),2), '%') as Percentage
from restraint
where Casualty_Restraint_Helmet_Use = 'Restrained'
group by severity;

select * from crash_locations;
#Are there any specific road conditions or features associated with a higher incidence of crashes?
select crash_roadway_feature as 'Roadway Feature',
Crash_Traffic_Control as 'Traffic control',
format(count(*),0) as Incidence 
from crash_locations
group by crash_roadway_feature
order by count(*) desc
limit 5;

#How does the number of road casualties vary by day of the week?
select crash_Day_of_week as 'Day of Week',
format(count(*),0) as "Days of Casualties",
Concat(round(((COUNT(*) / (SELECT count(*) FROM crash_locations)) * 100),2), '%') as Percentage
from crash_locations
group by crash_day_of_week
order by count(*) desc;

#How does the severity of crashes differ based on the driver's age and gender?
select Casualty_Severity, Casualty_agegroup, casualty_Gender,
format(count(casualty_count),0) as Total,
concat(round(((count(*) / (select count(*) from road_casualties)) *100),0),'%') as Percentage
from road_casualties
group by Casualty_Severity,Casualty_agegroup,Casualty_Gender
order by count(casualty_count) desc;

select * from road_casualties;