use online_food;
show tables;

# Find number of columns in a table 
describe swiggy;
# set id as a primary key
alter table swiggy
add primary key (ID);

#find total number of rows in a table
select count(ID) from swiggy;

select * from swiggy  
limit 5;

# Fond total number of unique resturants to with order is placed 
select count(distinct(Restaurant)) from swiggy;

# Find total cities in the table
select count(distinct(city)) from swiggy;

# find total rrestaurants from each city
select city, count(distinct(Restaurant)) as tot_hotel
from swiggy
group by city
order by tot_hotel desc;

# Find total orders made by each restaurant from Bangalore 
select restaurant, count(ID) as tot_order
from swiggy
where city = 'Bangalore'
group by restaurant 
order by count(ID) desc;

# find restorent with maximum order
select restaurant, city, count(ID)
from swiggy
group by Restaurant, City
order by count(ID)  desc;

# find first rank 
select restaurant, city, total_orders
from(
select restaurant, city, count(ID) as total_orders,
dense_rank() over (order by count(ID) desc ) as rankk
from swiggy
group by restaurant, city) as ranking
where rankk= 1;

# find first and second rank  
select restaurant, city, total_orders
from(
select restaurant, city, count(ID) as total_orders,
dense_rank() over (order by count(ID) desc ) as rankk
from swiggy
group by restaurant, city) as ranking
where rankk= 1 or rankk=2 ;

# Find restaurant from kormangala from bangalore which serve chinese food
select * from swiggy 
where city = 'Bangalore' and area = 'Koramangala'
and food_type like '%chinese%';

# Find average dieivery time taken by swiggy
select avg(Delivery_time) from swiggy;

# Find average deliveery time in each city
select city, avg(Delivery_time)  as avarage from swiggy
group by city
order by avg(Delivery_time) asc;

# Find average price of food from powai area of mumbai
select city, area,  avg(price)
from swiggy
group by city, area
having area = 'powai' and city= 'Mumbai';
 #   OR
 
 select city , area , avg(price)
 from swiggy
 where area= 'powai'and city ='Mumbai' ;


# Find top three cities with least average dilivery time
select city, avg(Delivery_time)  as avarage from swiggy
group by city
order by avg(Delivery_time) asc
limit 3;

/* Find all restaurants from mumbai , kolkata and surat who serve
 north Indian, Mughalai or south Indian food or fast food */
 select * from swiggy 
 where city in ('Mumbai', 'Kolakata', 'surat') and 
 food_type like '%north indian%' or food_type like '%mughalai%' or food_type like '%south indian%' or food_type like '%fast food%';
 
 # To find chinese restaurant in Bnagalore
 select * from swiggy
 where City='Bangalore'
 and food_type like'%chinese%';
 
 # To find non chinese restorent in all city
 select * from swiggy
  where not food_type like'%chinese%';

# Change city name of ID 211
update swiggy
set city='nashik'
where ID = 211;
 # RESTORE changes
update swiggy
set city='Bangalore'
where id=211;

select * from swiggy;

# Maximum price food in swiggy
select  max(price) from swiggy;
 
#find total number of restaurant in acity  Bangalore 
 select count(*) from swiggy
 where city= 'Bangalore';
 
 #find total number of restaurant in acity  Mumbai
 select count(*) from swiggy
 where city = 'Mumbai';
 
 # find average price of food 
 select avg(price) from swiggy;
 
# Select Restaurant from either in  mumbai or Bangalore
select * from swiggy 
where city in ('Mumbai','Bangalore');

# find restaurent other than mumbai and banglore city
select * from swiggy
where city not in ('Mumbai', 'bangalore')
 