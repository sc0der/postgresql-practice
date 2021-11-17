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

