create external table staging_ad (id string, url string, dt string, pubid string, adid string) 
row format delimited fields terminated by ',';

load data local inpath '/home/cloudera/Desktop/ad' into table staging_ad;

create external table ad (id string, dt string, pubid string, adid string, keyword string) 
partitioned by (host string, country string) row format delimited fields terminated by ',';

select url
, parse_url(url, 'QUERY', 'keyword')  
, parse_url(url, 'QUERY', 'country')
, parse_url(url, 'HOST')
, parse_url(url, 'REF')
, parse_url(url, 'QUERY')
from staging_ad where id = "1";

select url, split(split(parse_url(url, 'QUERY'), '&amp\\;')[1], '=')[1]
from staging_ad where id = "1";

insert overwrite table ad 
partition (host, country)
select id,dt,pubid,adid, parse_url(url, 'QUERY', 'keyword') keyword, parse_url(url, 'HOST') as host, split(split(parse_url(url, 'QUERY'), '&amp\\;')[1], '=')[1] as country from staging_ad 

