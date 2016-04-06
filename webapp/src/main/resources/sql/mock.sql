insert into users (name, password_hash, email, role_id, enabled) values ('Don', 'ayylmao', 'don@don.com', 1, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Brandon', 'ayylmao', 'brandon@brandon.com', 2, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Josh', 'ayylmao', 'josh@josh.com', 2, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Paul', 'ayylmao', 'paul@paul.com', 4, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Eric', 'ayylmao', 'eric@eric.com', 4, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Customer1', 'ayylmao', '1@1.com', 5, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Customer2', 'ayylmao', '2@2.com', 5, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Customer3', 'ayylmao', '3@3.com', 5, true);
insert into users (name, password_hash, email, role_id, enabled) values ('Customer4', 'ayylmao', '4@4.com', 5, true);


insert into business (name, info, icon_url) values ('BusinessA', 'This place sucks', 'ayy.lmao.com');
insert into business (name, info, icon_url) values ('BusinessB', 'This place is better', 'ayy.lmao.com');


insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values ('BarA', 1, 1, '123 Street', 'Big City', '32423', 'MI', '3242342123');
insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values ('BarB', 2, 2, '1234 Street', 'Big City', '32423', 'MI', '9785760345');


insert into bartenders (user_id, bar_id) values ((select id from users where email='paul@paul.com'), 1);
insert into bartenders (user_id, bar_id) values ((select id from users where email='eric@eric.com'), 1);


insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values (1, 'ayy', 'lmao', 'ayy', 'lmao', 'ayy', 'lmao', 'ayy');
insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values (2, 'ayy', 'lmao', 'ayy', 'lmao', 'ayy', 'lmao', 'ayy');


insert into bannedusers (user_id, bar_id) values (9, 1);


insert into drink (name, info, make_time, icon_url) values ('beer1', 'info', 100, 'ayyLmao');
insert into drink (name, info, make_time, icon_url) values ('beer2', 'info', 100, 'ayyLmao');
insert into drink (name, info, make_time, icon_url) values ('beer3', 'info', 100, 'ayyLmao');
insert into drink (name, info, make_time, icon_url) values ('scotch', 'info', 200, 'ayyLmao');


insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values (1, 1, 1, '2015-12-16 12:21:13', '2015-12-16 12:22:13', '1');
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values (2, 1, 2, '2015-12-16 12:22:13','2015-12-16 12:23:13', '2');
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values (1, 1, 3, '2015-12-16 12:24:13', '2015-12-16 12:25:13', '2');
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values (1, 1, 4, '2015-12-16 12:25:13', '2015-12-16 12:26:13', '2');
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values (2, 1, 5, '2015-12-17 12:22:15', '2015-12-17 12:23:15', '2');

insert into availabledrinks (drink_id, bar_id) values (1, 1);
insert into availabledrinks (drink_id, bar_id) values (2, 2);
insert into availabledrinks (drink_id, bar_id) values (3, 2);
insert into availabledrinks (drink_id, bar_id) values (4, 2);


insert into ingredient (name, description, icon_url, category_id) values ('sugar', 'ayy', 'lmao', 1);
insert into ingredient (name, description, icon_url, category_id) values ('spice', 'ayy', 'lmao', 1);
insert into ingredient (name, description, icon_url, category_id) values ('everything nice', 'ayy', 'lmao', 1);


insert into drink_ingredients (drink_id, ingredient_id) values (1, 1);
insert into drink_ingredients (drink_id, ingredient_id) values (1, 2);
insert into drink_ingredients (drink_id, ingredient_id) values (1, 3);
insert into drink_ingredients (drink_id, ingredient_id) values (2, 1);
insert into drink_ingredients (drink_id, ingredient_id) values (2, 2);
