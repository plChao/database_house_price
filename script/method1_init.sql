drop database hp_method_1;
create database hp_method_1;
ALTER DATABASE hp_method_1 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use hp_method_1;
create table trade(
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
