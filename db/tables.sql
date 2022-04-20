-- create database
-- drop database if exists pdf_hw_3;
-- create database pdf_hw_3;

drop table if exists customers cascade;
drop table if exists status cascade;
drop table if exists cakes cascade;
drop table if exists ingredients cascade;
drop table if exists contain cascade;
drop table if exists orders cascade;

-- Customers
create table customers (
    custid serial,
    custname varchar(255),
    ccn varchar(20),
    cphoneno varchar(20),
    address varchar(255),
    city varchar(20),
    zip varchar(10),
    primary key (custid)
);

insert into customers (custname, ccn, cphoneno, address, city, zip)
values ('Devarsh', 'asd3se', '123-123-2222', '232 Bay Ridge Ave, Apt 21', 'New York', '11110'),
       ('Puru', 'asdese', '123-321-2321', '232 Day Camp', 'Massachusetts', '02155'),
       ('Anjali', 'sdsass', '324-333-2324', 'A Heaven Road', 'California', '09866');

-- Status
create table status (
    status_id serial,
    status_text varchar(255),
    primary key (status_id)
);

insert into status (status_text)
values ('Available'),
       ('Out of Stock');

-- Cakes
create table cakes (
    cakeid serial,
    cakename varchar(20),
    slices numeric,
    status varchar(20),
    price float,
    primary key (cakeid)
);

insert into cakes (cakename, slices, status, price)
values ('Black Forest', 6, 1, 12.10),
       ('Cherry', 2, 2, 10.00),
       ('Pineapple', 4, 1, 9.99),
       ('Grapes', 5, 1, 3.00),
       ('Cheese Cake', 1, 2, 8.0);

-- Ingredients
create table ingredients (
    ingredid serial,
    iname varchar(255),
    price float,
    available boolean,
    primary key (ingredid)
);

insert into ingredients (iname, price, available)
values ('Cheese', 2, true),
       ('Milk', 1, true),
       ('Potato', 3, false),
       ('Chocolate', 3.99, true),
       ('Grape', 2, true),
       ('Pineapple', 3, false),
       ('Cherry', 4, true),
       ('Yeast', 1, true),
       ('Water', 2, true),
       ('Salt', 0.99, true);


-- Contains
create table contain (
    cakeid int,
    ingredid int,
    qty int,
    foreign key (cakeid) references cakes(cakeid),
    foreign key (ingredid) references ingredients(ingredid)
);

insert into contain (cakeid, ingredid, qty)
values (1, 1, 1),
       (1, 2, 2),
       (1, 3, 1),
       (1, 4, 3),
       (1, 6, 4),
       (1, 7, 2),
       (2, 1, 2),
       (2, 3, 1),
       (2, 4, 4),
       (2, 2, 2),
       (2, 6, 1),
       (3, 1, 1),
       (3, 1, 2),
       (3, 2, 3),
       (3, 3, 4),
       (3, 4, 2),
       (3, 6, 3),
       (3, 7, 5),
       (4, 3, 1),
       (4, 1, 2),
       (4, 2, 3),
       (4, 4, 4),
       (4, 6, 2),
       (4, 5, 3),
       (5, 1, 2),
       (5, 2, 1),
       (5, 3, 3),
       (5, 4, 4),
       (5, 5, 2),
       (5, 7, 1);


-- Orders
create table orders (
    custid int,
    cakeid int,
    ordertime timestamp default current_timestamp,
    pickuptime timestamp default current_timestamp,
    pricepaid float,
    foreign key (custid) references customers(custid),
    foreign key (cakeid) references cakes(cakeid)
);

insert into orders (custid, cakeid, ordertime, pickuptime, pricepaid)
values (1, 1, '2021-04-19 23:31:45.468764', '2021-05-12 23:31:45.468764', 12),
       (1, 2, '2021-05-10 23:31:45.468764', '2021-06-23 23:31:45.468764', 9),
       (1, 3, '2021-06-19 23:31:45.468764', '2021-07-12 23:31:45.468764', 11.0),
       (1, 4, '2021-02-19 23:31:45.468764', '2021-03-21 23:31:45.468764', 9.99),
       (1, 5, '2021-01-19 23:31:45.468764', '2021-02-21 23:31:45.468764', 10.99),
       (2, 1, '2021-01-19 23:31:45.468764', '2021-02-21 23:31:45.468764', 4.99),
       (2, 3, '2021-02-19 23:31:45.468764', '2021-03-20 23:31:45.468764', 4.00),
       (2, 4, '2021-04-19 23:31:45.468764', '2021-05-13 23:31:45.468764', 3.00),
       (2, 5, '2021-02-21 23:31:45.468764', '2021-02-12 23:31:45.468764', 9),
       (3, 2, '2021-02-21 23:31:45.468764', '2021-02-12 23:31:45.468764', 7),
       (3, 3, '2021-03-21 23:31:45.468764', '2021-06-12 23:31:45.468764', 6),
       (3, 4, '2021-04-21 23:31:45.468764', '2021-07-12 23:31:45.468764', 8);


