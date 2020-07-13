use test_project;

-- trade query
SELECT distinct city, district
from trade
;

select count(*) as cnt
from trade
where   address LIKE "臺中市東區%" AND 
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
;

select count(*) as cnt
from trade
where   city = "臺中市" AND
        district = "東區" AND
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
;

select address, price
from trade
where   address LIKE "臺中市東區%" AND 
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
limit 10
;

select address, price
from trade
where   city = "臺中市" AND
        district = "東區" AND
        trade_date LIKE "10601%" AND 
        price BETWEEN 100 AND 100000000
limit 10
;