set hive.exec.compress.output=true; 
set mapreduce.output.fileoutputformat.compress=true; 
set mapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.GzipCodec; 
set mapreduce.output.fileoutputformat.compress.type=BLOCK;


create table categories row format delimited fields terminated by '|' as select * from problem10a.categories;

create table customers row format delimited fields terminated by '|' as select * from problem10a.customers;

create table departments row format delimited fields terminated by '|' as select * from problem10a.departments;

create table order_items row format delimited fields terminated by '|' as select * from problem10a.order_items;

create table orders row format delimited fields terminated by '|' as select * from problem10a.orders;

create table products row format delimited fields terminated by '|' as select * from problem10a.products;
