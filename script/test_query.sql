use test_project;

-- trade query

-- 1
SELECT distinct city, district
from trade
;
-- 2
select count(*) as cnt
from trade
where   city = "臺中市" AND
        district = "東區" AND
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
;

-- 2.1
select count(*) as cnt
from trade
where   city = "臺中市" AND
        district = "東區" AND
        yearmonth = "10601" AND 
        price BETWEEN 100 AND 100000000
;

-- 3

select address, price
from trade
where   city = "臺中市" AND
        district = "東區" AND
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
limit 10
;

-- 3.1
select address, price
from trade
where   city = "臺中市" AND
        district = "東區" AND
        yearmonth = "10601" AND 
        price BETWEEN 100 AND 100000000
limit 10
;
-- 4
select district, avg(price) as price
from (
        select district, price
        from trade
        where   city = "臺中市" AND
                trade_date LIKE "10601%" AND 
                price BETWEEN 100 AND 100000000) as sub
group by district
;
