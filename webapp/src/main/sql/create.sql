-- groups such as: admin, owner, employee, user, mayor, etc.
create table roles (
    id serial primary key,
    name varchar(100) NOT NULL,
    info text NOT NULL
)
;

insert into roles (name, info) values('ROLE_ADMIN', 'Administrator');
insert into roles (name, info) values('ROLE_OWNER', 'Owner');
insert into roles (name, info) values('ROLE_MANAGER', 'Manager');
insert into roles (name, info) values('ROLE_EMPLOYEE', 'Employee');
insert into roles (name, info) values('ROLE_USER', 'Standard User');
insert into roles (name, info) values('ROLE_KIOSK', 'POS Kiosk');
insert into roles (name, info) values('ROLE_DISPLAY', 'Read-only User');

-- users of the system. each has account info and associated role_id
create table users (
    id serial primary key,
    name varchar(100) NOT NULL,
    password_hash varchar(100) NOT NULL,
    password_salt varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    zip text NOT NULL,
    role_id integer references roles(id)
)
;

-- these are the overlying companies that own the individual bars.
create table business (
    id serial primary key,
    name varchar(100) NOT NULL,
    owner_id references users(id),
    contact_info varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL
)
;

-- these are the individual bars. (eg. a local establishment or chain restaurant)
create table bar (
    id serial primary key,
    name varchar(100) NOT NULL,
    business_id references business(id),
    location varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL,
)
;

-- replaces the special_users column in table bar.
create table special_bar_users (
    id serial primary key,
    bar_id references bar(id) NOT NULL,
    users_id references users(id) NOT NULL
)
;

-- this is an individual pickup location at a bar.
create table queue (
    id serial primary key,
    name varchar(100) NOT NULL,
    bar_id references bar(id)
)
;

-- this is to be considered as the receipt. stores drink orders, order and pickup timestamps.
create table drinkorder (
    id serial primary key,
    info json NOT NULL, -- This field will contain the session information about drinks that were ordered. 
    queue_id references queue(id),
    user_id references users(id),
    bar_id references bar(id)
    order_time timestamp NOT NULL, -- This should be updated once the order is verified complete.
    pickup_time timestamp NOT NULL  -- This to be updated once the pickup is verified
)
;
-- table of individual drinks tied to each queue. 10oz pour, 20oz pour, pint, martini, rum & coke, $4 shot, $5 shot, etc.
create table drink (
    id serial primary key,
    name varchar(100) NOT NULL,
    info text NOT NULL,
    make_time smallint NOT NULL,
    icon_url text NOT NULL,	
    queue_id references queue(id)
)
;

-- contains each individual items. individual beers, liquors, fruits, garnishes, etc.
create table item (
    id serial primary key,
    name varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL,
    make_time smallint NOT NULL
)
;

-- replaces the items column in table drink.
create table drink_items (
    id serial primary key,
    drink_id references drink(id),
    item_id references item(id)
)
;
