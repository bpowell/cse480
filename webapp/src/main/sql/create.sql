-- groups such as: admin, owner, employee, user, mayor, etc.
create table roles (
    id serial primary key,
    role varchar(100) NOT NULL,
    info text NOT NULL
)
;

insert into roles (role, info) values('ROLE_ADMIN', 'Administrator');
insert into roles (role, info) values('ROLE_OWNER', 'Owner');
insert into roles (role, info) values('ROLE_MANAGER', 'Manager');
insert into roles (role, info) values('ROLE_EMPLOYEE', 'Employee');
insert into roles (role, info) values('ROLE_USER', 'Standard User');
insert into roles (role, info) values('ROLE_KIOSK', 'POS Kiosk');
insert into roles (role, info) values('ROLE_DISPLAY', 'Read-only User');

-- users of the system. each has account info and associated role_id
create table users (
    id serial primary key,
    name varchar(100) NOT NULL,
    password_hash varchar(100) NOT NULL,
    email text NOT NULL,
    role_id integer references roles(id)
)
;

-- these are the overlying companies that own the individual bars.
create table business (
    id serial primary key,
    name varchar(100) NOT NULL,
    owner_id integer references users(id),
    contact_info varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL
)
;

-- these are the individual bars. (eg. a local establishment or chain restaurant)
create table bar (
    id serial primary key,
    name varchar(100) NOT NULL,
    business_id integer references business(id)
)
;

-- replaces the special_users column in table bar.
create table special_bar_users (
    id serial primary key,
    bar_id integer references bar(id),
    users_id integer references users(id)
)
;

-- this is to be considered as the receipt. stores drink orders, order and pickup timestamps.
create table drinkorder (
    id serial primary key,
    drink_count integer NOT NULL, -- This field contains the quantity of the ordered drink
    user_id integer references users(id),
    bar_id integer references bar(id)
)
;
-- table of individual drinks tied to each queue. 10oz pour, 20oz pour, pint, martini, rum & coke, $4 shot, $5 shot, etc.
create table drink (
    id serial primary key,
    name varchar(100) NOT NULL,
    info text NOT NULL,
    make_time smallint NOT NULL,
    icon_url text NOT NULL
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
    drink_id integer references drink(id),
    item_id integer references item(id)
)
;
