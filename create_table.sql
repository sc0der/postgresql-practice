-- creating
CREATE TABLE users(
    id int primary key,
    first_name varchar not null,
    last_name varchar(20) not null,
    date_of_birth date not null)
);

CREATE TABLE IF NOT EXISTS vendors(
    id serial primary key,
    name varchar not null
);


CREATE TABLE IF NOT EXISTS products(
    id serial primary key,
    name varchar not null,
    expiration date not null,
    vendor_id integer, 
    foreign key(vendor_id) references vendors(id)
);


CREATE table if not EXISTS stores(
    id serial primary key,
    name varchar not null
);


create table if not EXISTS stores_products(
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    FOREIGN KEY(store_id) REFERENCES stores(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);


-- inserts

INSERT INTO vendors (name) VALUES
('one'),
('two'),
('three');


insert into products(name, expiration, vendor_id) values
('first', '2021-09-09', 1 ),
('second', '2021-09-09', 2 ),
('third', '2021-09-09', 3 );


SELECT * from vendors where id = '1';

-- functions
CREATE OR REPLACE FUNCTION totalVendors ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT count(*) into total FROM vendors;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;


-- view FUNCTIONS
select totalVendors();


-- limit
SELECT name, id
FROM vendors
LIMIT 12;


SELECT * FROM vendors LIMIT 3 OFFSET 2;


-- distinct
SELECT DISTINCT *
FROM vendors WHERE name = "one";


-- having
SELECT NAME FROM vendors GROUP BY name HAVING count(name) < 2;