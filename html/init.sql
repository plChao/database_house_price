create database test_project;

use test_project;

CREATE TABLE IF NOT EXISTS utilizador ( 
userid VARCHAR(255) NOT NULL, 
email VARCHAR(255) NOT NULL, 
password VARCHAR(255) NOT NULL, 
PRIMARY KEY (email), 
UNIQUE INDEX email_UNIQUE (email) 
);
