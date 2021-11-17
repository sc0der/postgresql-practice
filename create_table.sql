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

