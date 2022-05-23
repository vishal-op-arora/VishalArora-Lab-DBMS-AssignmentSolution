-- create Database
create database ecommerce;
use ecommerce;

-- Create supplier Tables
create table if not exists supplier (
	SUPP_ID int primary key auto_increment, 
	SUPP_NAME varchar(50) not null, 
	SUPP_CITY varchar(50) not null, 
	SUPP_PHONE varchar(10) not null
    );

-- Create customer table
create table if not exists customer (
	CUS_ID int primary key auto_increment, 
	CUS_NAME varchar(20) not null, 
	CUS_PHONE varchar(10) not null, 
	CUS_CITY varchar(30) not null, 
	CUS_GENDER enum('M','F')
    );

-- Create category Table
create table if not exists category (
	CAT_ID int unsigned not null primary key auto_increment, 
	CAT_NAME varchar(20) not null
    );

-- Crete product Table
create table if not exists product(
	PRO_ID int primary key auto_increment, 
	PRO_NAME varchar(20) not null default('dummy'), 
	PRO_DESC varchar(60), 
	CAT_ID int unsigned not null, 
	constraint FK_CAT_ID foreign key (CAT_ID) references category(CAT_ID)
    );

-- Create supplier_pricing Table
create table if not exists supplier_pricing(
	PRICING_ID int primary key auto_increment, 
	PRO_ID int, 
	SUPP_ID int, 
	SUPP_PRICE int default(0), 
	constraint FK_PRO_ID foreign key (PRO_ID) references product(PRO_ID), 
	constraint FK_SUPP_ID foreign key (SUPP_ID) references supplier(SUPP_ID)
    );

-- Create order Table
create table if not exists `order` (
	ORD_ID int primary key, 
	ORD_AMOUNT int not null, 
	ORD_DATE date not null, 
	CUS_ID int, 
	PRICING_ID int, constraint FK_CUS_ID foreign key (CUS_ID) 
	references customer(CUS_ID), 
	constraint FK_PRICING_ID foreign key (PRICING_ID) 
	references supplier_pricing(PRICING_ID)
    ) auto_increment=101;

-- alter table `order` auto_increment=101;
create table if not exists rating (
	RAT_ID int primary key auto_increment, 
	ORD_ID int, 
	RAT_RATSTARS int not null, constraint FK_ORD_ID foreign key (ORD_ID) 
	references `order`(ORD_ID)
    );