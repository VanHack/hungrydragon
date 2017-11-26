--
-- Users
--
INSERT INTO users (id, first_name, last_name, username, password, email, address) VALUES (1, 'Fahad', 'Ahmed', 'sfahadahmed', 'hungry1', 'sfahadahmed@gmail.com', 'Granville St., Vancouver, BC, Canada');
INSERT INTO users (id, first_name, last_name, username, password, email, address) VALUES (2, 'Marcio', 'Melo', 'marciosmelo', 'hungry2', 'marciomelo@gmail.com', 'Robson St., Vancouver, BC, Canada');
INSERT INTO users (id, first_name, last_name, username, password, email, address) VALUES (3, 'James', 'Ma', 'jamesma', 'hungry3', 'vanhack@linuxbuddhist.net', 'Davie St., Vancouver, BC, Canada');

--
-- Restaurants
--
INSERT INTO restaurants (id, name, address) VALUES (1, 'Harveys', 'Granville St, Vancouver, BC, Canada');
INSERT INTO restaurants (id, name, address) VALUES (2, 'Harveys', 'Granville St, Vancouver, BC, Canada');
INSERT INTO restaurants (id, name, address) VALUES (3, 'FreshSlice Pizza', 'Robson St, Vancouver, BC, Canada');
INSERT INTO restaurants (id, name, address) VALUES (4, 'FreshSlice Pizza', 'Davie St, Vancouver, BC, Canada');
INSERT INTO restaurants (id, name, address) VALUES (5, 'Donair Dude', 'Davie St, Vancouver, BC, Canada');

--
-- Menu items
--

-- Menu Items: Restaurant ID 1
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (1, 'Original Burger', 'Burger', 4.99, 1);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (2, 'Grilled Chicken Sandwich', 'Sandwich', 5.89, 1);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (3, 'Fries', 'Fries', 2.19, 1);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (4, 'Classic Shake', 'Beverage', 2.99, 1);

-- Menu Items: Restaurant ID 2
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (5, 'Original Burger', 'Burger', 4.99, 2);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (6, 'Grilled Chicken Sandwich', 'Sandwich', 5.89, 2);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (7, 'Fries', 'Fries', 2.19, 2);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (8, 'Classic Shake', 'Beverage', 2.99, 2);

-- Menu Items: Restaurant ID 3
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (9, '16" Extra Large Pan Pepperoni Feast Pizza', 'Pizza', 15.99, 3);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (10, 'Backed Cheesy Bread', 'Bread', 5.00, 3);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (11, 'Chicken Wings', 'Fried', 9.00, 3);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (12, 'X-Large Feast Pizza and 2l Pop', 'Pizza', 15.99, 3);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (13, 'Canned pop (355 ml)', 'Beverage', 1.49, 3);

-- Menu Items: Restaurant ID 4
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (14, '16" Extra Large Pan Pepperoni Feast Pizza', 'Pizza', 15.99, 4);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (15, 'Backed Cheesy Bread', 'Bread', 5.00, 4);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (16, 'Chicken Wings', 'Fried', 9.00, 4);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (17, 'X-Large Feast Pizza and 2l Pop', 'Pizza', 15.99, 4);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (18, 'Canned pop (355 ml)', 'Beverage', 1.49, 4);

--  Menu Items: Restaurant ID 1
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (19, 'Chicken, Beef, or Lamb Tortilla Donair', 'Tortilla', 12.49, 5);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (20, 'Choban Salad', 'Salad', 6.99, 5);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (21, 'Fries', 'Fries', 4.29, 5);
INSERT INTO menu_items (id, name, type, price, restaurant_id) VALUES (22, 'Juice', 'Beverage', 2.99, 5);

--
-- Orders
--
INSERT INTO orders (id, creation_date, status, user_id, restaurant_id) VALUES(1, NOW(), 'PREPARING_FOOD', 1, 1);
INSERT INTO orders (id, creation_date, status, user_id, restaurant_id) VALUES(2, NOW(), 'DISPATCHED_VIA_COURIER', 2, 3);
INSERT INTO orders (id, creation_date, status, user_id, restaurant_id) VALUES(3, NOW(), 'DISPATCHED_VIA_COURIER', 3, 4);

--
-- Order items
--

INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(1,2,1,1);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(2,2,1,3);

INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(3,3,3,9);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(4,2,3,10);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(5,1,3,11);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(6,3,3,13);

INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(7,3,3,14);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(8,2,3,15);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(9,1,3,16);
INSERT INTO order_items (id, quantity, order_id, menu_item_id) VALUES(10,3,3,18);

--
-- Food suggestions
--
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 1.0, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 0.3, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 0.3, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 0.3, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 0.3, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 0.3, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Pizza', 1.0, 7);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Burger', 0.8, 7);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.3, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.6, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.7, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.6, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.7, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.6, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Sandwich', 0.3, 7);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.2, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.3, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.3, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.3, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.3, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.5, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Fries', 0.5, 7);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Salads', 0.8, 7);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 1.0, 1);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 0.8, 2);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 0.6, 3);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 0.5, 4);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 0.7, 5);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 0.7, 6);
INSERT INTO food_suggestions (type, weight, day_of_week) VALUES ('Beverage', 1.0, 7);