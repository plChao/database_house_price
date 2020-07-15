drop database if exists test_project;
create database test_project;
ALTER DATABASE test_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use test_project;

CREATE TABLE IF NOT EXISTS user (
    userid VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (email),
    UNIQUE INDEX email_UNIQUE (email)
);

create table trade_one(
    trade_target char(12),
    area_use char(3),
    compartment char(2),
    manage char(2),
    num int,
    PRIMARY KEY (num)
);

create table trade_two(
    nonmetro_d char(6),
    nonmetro_u char(8),
    state char(15),
    purpose char(7),
    materials char(12),
    hall int,
    berth_type char(4),
    num int,
    PRIMARY KEY (num)
);

create table trade_three(
    city char(4),
    district char(6),
    total_floor char(7),
    room int,
    health int,
    num int,
    PRIMARY KEY (num)
);

create table trade(
    address char(71),
    land_area float,
    trade_date int,
    target_detail char(13),
    trade_floor char(65),
    building_date char(9),
    building_area float,
    price bigint,
    unit_price int,
    berth_area float,
    berth_price int,
    note varchar(340),
    trade_id char(20),
    num1 int,
    num2 int,
    num3 int,
    PRIMARY KEY (trade_id)
);

load data local infile '../data/merge/3_merge.csv'
into table trade
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/3_merge_1.csv'
into table trade_one
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/3_merge_2.csv'
into table trade_two
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/3_merge_3.csv'
into table trade_three
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

-- create INDEX city_idx on trade (city, district, yearmonth);

-- store the sql below to forselect table
-- SELECT distinct city, distinct
-- from trade;

CREATE TABLE IF NOT EXISTS forselect (
city VARCHAR(4) NOT NULL,
region VARCHAR(6) NOT NULL,
PRIMARY KEY (city, region)
);

INSERT INTO forselect
SELECT distinct city, district
from trade_three;

-- for history

CREATE TABLE IF NOT EXISTS history (
userid VARCHAR(255) NOT NULL,
city VARCHAR(4) NOT NULL,
district VARCHAR(6) NOT NULL,
trade_date int NOT NULL,
highest_price bigint NOT NULL,
lowest_price bigint NOT NULL,
PRIMARY KEY (userid, city, district, trade_date, highest_price, lowest_price)
);
