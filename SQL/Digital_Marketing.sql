use digitalm;
select * from digital;
alter table digital
rename column MyUnknownColumn to Campaign_name;
-- Top 5 campaign_name by profit
select campaign_name,sum(revenue) as `Total Revenue`,
sum(Amount_spent) as `Total cost`, 
sum(revenue)-sum(Amount_spent) as profit
from digital
group by campaign_name
order by profit DESC
limit 5;
-- Bottom 5 campaign_name by profit
select campaign_name,sum(revenue) as `Total Revenue`,
sum(Amount_spent) as `Total cost`, 
sum(revenue)-sum(Amount_spent) as profit
from digital
group by campaign_name
order by profit 
limit 5;
-- Top traffic source by category
select category,sum(clicks) as `Total clicks`
from digital
group by category
order by `Total clicks` Desc;
-- Clicks and revenue insight
select campaign_name,sum(clicks) as `Total clicks`,sum(revenue) as `Total Revenue`
from digital
group by campaign_name
order by `Total clicks`;
-- Leads,order and revenue by day
select c_date as `campaign date`,
sum( leads) as `daily leads`,
sum(orders) as `daily orders`,
sum(revenue) as `daily revenue`
from digital
group by `campaign date`
order by `campaign date`;

select dayname(str_to_date(c_date,"%d%m%Y")) as `weekday name`,
sum(orders) as `Total orders`
from digital
where c_date >= "2021-02-01" and c_date < "2021-03-01"
group by `weekday name`
order by field(`weekday name`, "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday");
select  c_date from digital;
alter table digital
add column campaign_date date;
update digital
set campaign_date=str_to_date(c_date,"%d/%m/%Y");
select * from digital;

select revenue,amount_spent,
(revenue-amount_spent) as profit
from digital;

