drop database test_project;
create database test_project;
ALTER DATABASE test_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use test_project;

CREATE TABLE IF NOT EXISTS utilizador ( 
userid VARCHAR(255) NOT NULL, 
email VARCHAR(255) NOT NULL, 
password VARCHAR(255) NOT NULL, 
PRIMARY KEY (email), 
UNIQUE INDEX email_UNIQUE (email) 
);

create table trade(
    city char(4),
    district char(6),
    trade_target char(12),
    address char(55),
    land_area float,
    area_use char(3),
    nonmetro_d char(6),
    nonmetro_u char(8),
    trade_date int,
    target_detail char(12),
    trade_floor char(50),
    total_floor char(4),
    state char(15),
    purpose char(7),
    materials char(12),
    building_date int,
    building_area float,
    room int,
    hall int,
    health int,
    compartment char(2),
    manage char(2),
    price bigint,
    unit_price int,
    berth_type char(4),
    berth_area float,
    berth_price int,
    note char(160),
    trade_id char(20)
);


load data local infile '../data/merge/merge.csv'
into table trade
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

-- store the sql below to forselect table
-- SELECT distinct city, distinct
-- from trade;

CREATE TABLE IF NOT EXISTS forselect ( 
city VARCHAR(255) NOT NULL,
region VARCHAR(255) NOT NULL,
PRIMARY KEY (city, region)
);
INSERT INTO forselect
SELECT distinct city, district
from trade;

-- for history
CREATE TABLE IF NOT EXISTS history ( 
userid VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
district VARCHAR(255) NOT NULL,
trade_date VARCHAR(255) NOT NULL,
highest_price VARCHAR(255) NOT NULL,
lowest_price VARCHAR(255) NOT NULL,
PRIMARY KEY (userid, city, district, trade_date, highest_price, lowest_price)
);

