create external table stocks (
dt string
, ticker string
, open double
, high double
, low double
, close double
, vol int
) 
row format delimited fields terminated by ',';

load data local inpath '/home/cloudera/Desktop/stocks.csv' into table stocks;
