create database patientinfo
use patientinfo

create external table stg_patientdetail (name string, address string, phone string)
row format delimited
fields terminated by '|'

create external table patientdetail (fname string, lname string, address string, mobile string, phone string, zipcode string)
stored as sequencefile
location /user/hive/warehouse/patient

insert into table patientdetail
select concat_ws(' ', fname, lname), concat_ws(' ', address, zipcode), concat(' ', mobile, phone)
from stg_patientdetail
