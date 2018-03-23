USE problem3;

CREATE EXTERNAL TABLE solution (
id int,
fname string,
lname string,
adddress string,
city string,
state string,
zip string
)
row format delimited
fields terminated by '\t'
stored as textfile
location '/user/cert/problem3/data/customer/';
