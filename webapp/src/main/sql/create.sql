create table user_role (
    id serial primary key,
    role varchar(100) NOT NULL,
    description text NOT NULL
)
;

insert into user_role (role, description) values('ROLE_USER', 'Customer');
insert into user_role (role, description) values('ROLE_OWNER', 'Bar Owner');
insert into user_role (role, description) values('ROLE_ADMIN', 'Admin');
insert into user_role (role, description) values('ROLE_STAFF', 'Bartender');
insert into user_role (role, description) values('ROLE_VIEW', 'Read Only View');
    
create table users (
    id serial primary key,
    username varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    role_id integer references user_role(id)
)
;
