create external table categories (
category_id int,
category_department_id int,
category_name string 
)
stored as avro
location '/user/cert/problem4/categories';
