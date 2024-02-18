---(1).Read Cars Data
create database cars;
use cars;
select* from car_dekho;

---(2).Total Cars.To get a count of total records

select count(*) from car_dekho;

---(3). The Client asked me to show, how many cars will be available in 2023

select count(*) from car_dekho
where year = 2023;

---(4). The Client asked me to show, how many cars is available in 2020, 2021, 2022

select count(*) from car_dekho
where year in (2020,2021,2022)
group by year;

---(5). The Client asked me to print the total of all cars by year. I don't see all the details

select year, count(*) from car_dekho
group by year;

---(6). The Client asked me to print car dealer agents, how many diesel cars will be there in 2020?

select count(*) from car_dekho
where year = 2020 AND fuel = 'Diesel';

---(7). How many petrol cars will be there in 2020?

select count(*) from car_dekho
where year = 2020 AND fuel = 'Petrol';

---(8). Give a print of all the fuel cars(petrol, diesel and CNG) come by all years?

select year, count(*) from car_dekho
where fuel = 'Diesel'
group by year;

select year, count(*) from car_dekho
where fuel = 'Petrol'
group by year;


select year, count(*) from car_dekho
where fuel = 'CNG'
group by year;

---(9). Where more than 100 cars in a given year, which year had more than 100 cars?

select year, count(*) from car_dekho
group by year having count(*)>100;

---(10). Count all cars details between 2015 and 2023 need a complete list?

select count(*) from car_dekho
where year between 2015 and 2023;

---(11). All cars details between 2015 to 2023, need a complete list?

select* from car_dekho 
where year between 2015 and 2023;