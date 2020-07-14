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

create table trade_land_info(
    nonmetro_d char(6),
    nonmetro_u char(8),
    trade_id char(20),
    PRIMARY KEY (trade_id)
);

create table trade_struct_info(
    trade_floor char(65),
    total_floor char(7),
    purpose char(7),
    materials char(12),
    building_date char(9),
    trade_id char(20),
    PRIMARY KEY (trade_id)
);

create table trade_others_info(
    berth_type char(4),
    note varchar(340),
    trade_id char(20),
    PRIMARY KEY (trade_id)
);

create table trade(
    city char(4),
    district char(6),
    trade_target char(12),
    address char(71),
    land_area float,
    area_use char(3),
    trade_date int,
    target_detail char(13),
    state char(15),
    building_area float,
    room int,
    hall int,
    health int,
    compartment char(2),
    manage char(2),
    price bigint,
    unit_price int,
    berth_area float,
    berth_price int,
    trade_id char(20),
    yearmonth int,
    PRIMARY KEY (trade_id)
);

load data local infile '../data/merge/2_merge.csv'
into table trade
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/2_merge_land_info.csv'
into table trade_land_info
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/2_merge_struct_info.csv'
into table trade_struct_info
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile '../data/merge/2_merge_others_info.csv'
into table trade_others_info
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
from trade;

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
