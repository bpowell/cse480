insert into users (name, password_hash, email, role_id, enabled) values ('Don', 'ayylmao', 'don@don.com', 1, true); 
insert into users (name, password_hash, email, role_id, enabled) values ('Brandon', 'ayylmao', 'brandon@brandon.com', 1, true); 
insert into users (name, password_hash, email, role_id, enabled) values ('Josh', 'ayylmao', 'josh@josh.com', 1, true); 
insert into users (name, password_hash, email, role_id, enabled) values ('Paul', 'ayylmao', 'paul@paul.com', 1, true); 
insert into users (name, password_hash, email, role_id, enabled) values ('Eric', 'ayylmao', 'eric@eric.com', 1, true); 

insert into business (name, info, icon_url) values ('BusinessA', 'This place sucks', 'ayy.lmao.com');
insert into business (name, info, icon_url) values ('BusinessB', 'This place is better', 'ayy.lmao.com');

insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values ('BarA', 1, 1, '123 Street', 'Big City', '32423', 'MI', '3242342123');
insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values ('BarB', 1, 1, '1234 Street', 'Big City', '32423', 'MI', '9785760345');
insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values ('BarC', 2, 2, '12345 Street', 'Big City', '32423', 'MI', '0928374648');

insert into bartenders (user_id, bar_id) values (1, 1);

insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values (1, 'ayy', 'lmao', 'ayy', 'lmao', 'ayy', 'lmao', 'ayy');
insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values (2, 'ayy', 'lmao', 'ayy', 'lmao', 'ayy', 'lmao', 'ayy');

insert into bannedusers (user_id, bar_id) values (1, 1);


