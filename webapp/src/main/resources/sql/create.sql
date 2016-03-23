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
    role_id integer references roles(id),
    enabled boolean
)
;

insert into users(name, password_hash, email, role_id, enabled) values('admin', '$2a$10$2d2XUELuLvWTszNH7YViN.Gw.4CcX/3nn.WuUUlOtSjGp8OQnJ8Mu', 'admin@admin', 1, true);

-- these are the overlying companies that own the individual bars.
create table business (
    id serial primary key,
    name varchar(100) NOT NULL,
    info text NOT NULL,
    icon_url text NOT NULL
)
;

-- these are the individual bars. (eg. a local establishment or chain restaurant)
create table bar (
    id serial primary key,
    name varchar(100) NOT NULL,
    business_id integer references business(id),
    owner_id integer references users(id),
    address varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    zipcode varchar(5) NOT NULL,
    state varchar(2) NOT NULL,
    phonenumber varchar(10) NOT NULL
)
;

create table bartenders (
    id serial primary key,
    user_id integer references users(id),
    bar_id integer references bar(id)
)
;

create table barhours (
    id serial primary key,
    bar_id integer references bar(id),
    monday text,
    tuesday text,
    wednesday text,
    thursday text,
    friday text,
    saturday text,
    sunday text
)
;

-- users that are not allowed to order drinks at a specific bar.
create table bannedusers (
    id serial primary key,
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
    icon_url text NOT NULL -- this is staying not null because every drink should have an icon for what glass it is served in..  Beer bottle for beers, wine glass for wine, cocktail glass for mixed drinks, shot glass for liquors, etc. It doesn't have to be a picture of the drink (i.e. marguerita), but a generic icon of the glass.
)
;

-- this is to be considered as the receipt. stores drink orders, order and pickup timestamps.
create table drinkorder (
    id serial primary key,
    drink_id integer references drink(id),
    drink_count integer NOT NULL, -- This field contains the quantity of the ordered drink
    user_id integer references users(id),
    time_placed timestamp with time zone NOT NULL,
    time_complete timestamp with time zone,
    bar_id integer references bar(id),
    comments text
)
;

-- table that connects a bar to a list of drinks
create table availabledrinks (
    id serial primary key,
    drink_id integer references drink(id),
    bar_id integer references bar(id)
)
;

-- gives ingredients a category
create table categories (
    id serial primary key,
    name text NOT NULL,
    description text NOT NULL
)
;

insert into categories (name, description) values('Beer', 'Beer');
insert into categories (name, description) values('Wine', 'Wine');
insert into categories (name, description) values('Liquor', 'Liquor');
insert into categories (name, description) values('Mixers', 'Pop, club soda, etc');
insert into categories (name, description) values('Garnish', 'Things to put in your drink!');

-- contains each individual items. individual beers, liquors, fruits, garnishes, etc.
create table ingredient (
    id serial primary key,
    name varchar(100) NOT NULL,
    description text NOT NULL,
    icon_url text NOT NULL,
    category_id integer references categories(id)
)
;

-- replaces the items column in table drink.
create table drink_ingredients (
    id serial primary key,
    drink_id integer references drink(id),
    ingredient_id integer references ingredient(id)
)
;
