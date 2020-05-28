drop database house_project;
create database house_project;
ALTER DATABASE house_project CHARACTER SET utf8 COLLATE utf8_general_ci;
use house_project;
create table test(
    district char(4),
    trade_target char(13),
    address char(40),
    land_area float,
    area_use char(2),
    nonmetro_d char(10),
    nonmetro_u char(10),
    trade_date int,
    target_detail char(10),
    trade_floor char(18),
    total_floor char(4),
    state char(20),
    purpose char(10),
    materials char(10),
    building_date int,
    building_area float,
    room int,
    hall int,
    health int,
    compartment char(2),
    manage char(2),
    price int,
    unit_price int,
    berth_type char(4),
    berth_area float,
    berth_price int,
    note char(50),
    trade_id char(19)
);


load data local infile '../data/107_1/A_lvr_land_A.csv'
into table test
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines;
