insert into users (name, password_hash, email, role_id, enabled) values('testuser', '$2a$10$vb4dD/Y8ylQ2JkkgclTiBeDiSeqc9Ahgkz8DN1SfP95sUMJcNIc6O', 'test@test.com', 1, true);
insert into users (name, password_hash, email, role_id, enabled) values('testuser2', '$2a$10$.5Qj8krAco1au59JidiEOOJvd0ZNsPvW4D4Q6.hL712BV3pGbQa56', 'test2@test.com', 4, true);
insert into users (name, password_hash, email, role_id, enabled) values('testuser3', '$2a$10$KpwpPVkItm5cF4HLk2vsKOuN63riDtaAv4nMtlQX7/.8daUA100AW', 'test3@test.com', 2, true);
insert into users (name, password_hash, email, role_id, enabled) values('testuser4', '$2a$10$1IJOUmjkRAs9T79cQJyQPeiKCADDBIf3yn6NuTIFnKWv9z.uoMAhW', 'test4@test.com', 5, true);
insert into users (name, password_hash, email, role_id, enabled) values('testuser5', '$2a$10$7w6stXkwBQj9U7nFfNo0J.qUsnoa.oJ7gwQO1I1zYU522erBnfyIm', 'test5@test.com', 7, true);
insert into users (name, password_hash, email, role_id, enabled) values('testuser6', '$2a$10$3n9GCciraVImEK.si6RK4uJtybZynuwx0eLpWj7Yws.e5l5HJ1IQu', 'test6@test.com', 5, true);
 

insert into categories (name, description) values('Beer', 'Beer me.');
insert into categories (name, description) values('Wine', 'Wine, please!');
insert into categories (name, description) values('Liquor', 'I need a shot.');
insert into categories (name, description) values('Mixer', 'Add in some of this.'); /* Add me */
insert into categories (name, description) values('Garnish', 'Top it off.'); /* Add me */


insert into business (name, info, icon_url) values('Business 1', 'First Business', '/img/businesses/business1.png');


insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values('Bar 1', 1, 1, '123 Easy St.', 'Rochester', '48309', 'MI', '8005551234');
insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values('Bar 2', 1, 1, '123 Easy St.', 'Rochester', '48309', 'MI', '8005551234');


insert into bannedusers (id, user_id, bar_id) values(1, 4, 1);


insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values(1, '12pm-2am', '12pm-2am', '12pm-2am', '12pm-2am', '12pm-2am', '12pm-2am', '12pm-2am');
insert into barhours (bar_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday) values(2, '10am-12am', '10am-12am', '10am-12am', '10am-12am', '10am-12am', '10am-2am', '10am-2am');


insert into drink (name, info, make_time, icon_url) values('Fat Tire', 'New Belgium Amber Ale', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Cupcake Prosecco', 'Nose of Peach and Nectarine. Soft, creamy Citris accents.', 60, '/img/drink_icon/wine.png');
insert into drink (name, info, make_time, icon_url) values('long island', 'Tequila, Vodka, Light Rum, Gin, Triple Sec, and a splash of Cola.', 120, '/img/drink_icon/mixed.png');
insert into drink (name, info, make_time, icon_url) values('Michelob Ultra', 'Superior Light Beer', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Coors Light', 'Cold as the Rockies', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Moscow Mule', 'Vodka, Ginger Beer, Lime Juice. Garnished with Lime.', 120, '/img/drink_icon/mixed.png');
insert into drink (name, info, make_time, icon_url) values('Rebel Grapefruit IPA', 'Samuel Adams Ale brewed with Grapefruit Juice and Hops', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Rum and Cola', 'Dark Rum and Cola', 45, '/img/drink_icon/mixed.png');
insert into drink (name, info, make_time, icon_url) values('Gin and Tonic', 'Gin with a splash of Tonic Water', 45, '/img/drink_icon/mixed.png');
insert into drink (name, info, make_time, icon_url) values('Guinness Draught', 'Mild Stout brewed by St. James''s Gate Brewery', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Coors Banquet', 'For when you''re fine with consuming a few extra calories', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Petit Saison', 'Nice saison by Rockmill Brewery, with a 5.6% ABV.', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Pliny The Elder', 'Double Imperial IPA not meant to be saved for special occasions.', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Blueberry Pancake Milkshake Stout', 'The Supreme Emperor of breakfast beers. Brewed by Rochester Mills Beer Company', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Organic Wit', 'Organic Wit Beer. Brewed by Rochester Mills Beer Company', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Labatt Blue Light', 'If it ain''t Labatt, it ain''t Labatt.', 30, '/img/drink_icon/beer.png');
insert into drink (name, info, make_time, icon_url) values('Labatt Blue', 'Full bodied Pilsener, full of Canadian goodness.', 30, '/img/drink_icon/beer.png');


insert into ingredient (name, description, icon_url, category_id) values('Blue Nectar', 'Mid Shelf Tequila', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Tito''s', 'Mid Shelf Vodka', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Bacardi Superior', 'Mid Shelf Rum', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Seagrams Extra Dry', 'Mid Shelf Gin', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Patron Citronge', 'Mid Shelf Triple Sec', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Cola', 'Favorite store brand of Cola.', '/img/drink_icon/mixer.png', 4);
insert into ingredient (name, description, icon_url, category_id) values('Fat Tire', 'Toasty, biscuit-like malt flavors coasting in equilibrium with hoppy freshness.', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Cupcake Prosecco', 'What else is there to say about it?', '/img/drink_icon/wine.png', 2);
insert into ingredient (name, description, icon_url, category_id) values('Michelob Ultra', 'I need an another Ultra! My buzz is starting to wear off.', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Coors Light', 'It''s almost like drinking an avalanche!', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Crabbies Ginger Beer', 'Mildly alcoholic at 4.9%.', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Lime Juice', 'A splash of Lime juice.', '/img/drink_icon/mixer.png', 4);
insert into ingredient (name, description, icon_url, category_id) values('Lime', 'Slice of Lime', '/img/drink_icon/garnish.png', 5);
insert into ingredient (name, description, icon_url, category_id) values('Rebel Grapefruit IPA', 'Samuel Adams Ale brewed with Grapefruit Juice and Hops', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Jack Daniels Rum', 'Mid Shelf Dark Rum', '/img/drink_icon/liquor.png', 3);
insert into ingredient (name, description, icon_url, category_id) values('Tonic Water', 'Plain ol'' Tonic Water', '/img/drink_icon/mixer.png', 4);
insert into ingredient (name, description, icon_url, category_id) values('Guinness Draught', 'Mild Stout brewed by St. James''s Gate Brewery', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Coors Banquet', 'Pilsner brewed by the Coors Brewing Company', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Petite Saison', 'Saison brewed by the Rockmill Brewery', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Pliny The Elder', 'Double Imperial IPA brewed by Russian River Brewing Company', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Blueberry Pancake Milkshake Stout', 'Flavored Milk Stout brewed by Rochester Mills Beer Company', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Organic Wit', 'Organic Wit beer brewed by Rochester Mills Beer Company', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Labatt Blue Light', 'Light Pilsener brewed by Labatt Brewing Company', '/img/drink_icon/beer.png', 1);
insert into ingredient (name, description, icon_url, category_id) values('Labatt Blue', 'Pilsener brewed by Labatt Brewing Company', '/img/drink_icon/beer.png', 1);


insert into drink_ingredients (drink_id, ingredient_id) values(1, 7);
insert into drink_ingredients (drink_id, ingredient_id) values(2, 8);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 1);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 2);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 3);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 4);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 5);
insert into drink_ingredients (drink_id, ingredient_id) values(3, 6);
insert into drink_ingredients (drink_id, ingredient_id) values(4, 9);
insert into drink_ingredients (drink_id, ingredient_id) values(5, 10);
insert into drink_ingredients (drink_id, ingredient_id) values(6, 2);
insert into drink_ingredients (drink_id, ingredient_id) values(6, 11);
insert into drink_ingredients (drink_id, ingredient_id) values(6, 12);
insert into drink_ingredients (drink_id, ingredient_id) values(6, 13);
insert into drink_ingredients (drink_id, ingredient_id) values(7, 14);
insert into drink_ingredients (drink_id, ingredient_id) values(8, 15);
insert into drink_ingredients (drink_id, ingredient_id) values(8, 6);
insert into drink_ingredients (drink_id, ingredient_id) values(9, 4);
insert into drink_ingredients (drink_id, ingredient_id) values(9, 16);
insert into drink_ingredients (drink_id, ingredient_id) values(10,17);
insert into drink_ingredients (drink_id, ingredient_id) values(11,18);
insert into drink_ingredients (drink_id, ingredient_id) values(12,19);
insert into drink_ingredients (drink_id, ingredient_id) values(13,20);
insert into drink_ingredients (drink_id, ingredient_id) values(14,21);
insert into drink_ingredients (drink_id, ingredient_id) values(15,22);
insert into drink_ingredients (drink_id, ingredient_id) values(16,23);
insert into drink_ingredients (drink_id, ingredient_id) values(17,24);


insert into availabledrinks (drink_id, bar_id) values(1, 1);
insert into availabledrinks (drink_id, bar_id) values(2, 1);
insert into availabledrinks (drink_id, bar_id) values(3, 1);
insert into availabledrinks (drink_id, bar_id) values(5, 1);
insert into availabledrinks (drink_id, bar_id) values(1, 2);
insert into availabledrinks (drink_id, bar_id) values(3, 2);
insert into availabledrinks (drink_id, bar_id) values(4, 2);
insert into availabledrinks (drink_id, bar_id) values(5, 2);
insert into availabledrinks (drink_id, bar_id) values(6, 2);
insert into availabledrinks (drink_id, bar_id) values(7, 2);
insert into availabledrinks (drink_id, bar_id) values(8, 2);
insert into availabledrinks (drink_id, bar_id) values(9, 2);
insert into availabledrinks (drink_id, bar_id) values(10, 2);
insert into availabledrinks (drink_id, bar_id) values(11, 2);
insert into availabledrinks (drink_id, bar_id) values(12, 2);
insert into availabledrinks (drink_id, bar_id) values(13, 2);
insert into availabledrinks (drink_id, bar_id) values(14, 2);
insert into availabledrinks (drink_id, bar_id) values(15, 2);
insert into availabledrinks (drink_id, bar_id) values(16, 2);
insert into availabledrinks (drink_id, bar_id) values(17, 2);


insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(1, 2, 2, now(), null, 1);
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(4, 1, 1, now(), null, 1);
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(3, 1, 3, now(), null, 1);
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(1, 2, 2, now(), null, 2);
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(4, 1, 1, now(), null, 2);
insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(3, 1, 3, now(), null, 2);
