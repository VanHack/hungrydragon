--DROP SCHEMA IF EXISTS hungrydragon;
create schema IF NOT EXISTS hungrydragon;

--DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL);

CREATE TABLE IF NOT EXISTS restaurants(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    latitude VARCHAR(255) NOT NULL,
    longitude VARCHAR(255) NOT NULL,
    menu_id REFERENCES menus(id));

CREATE TABLE IF NOT EXISTS orders(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id REFERENCES users(id)
    restaurant_id REFERENCES restaurants(id),
    order_menu_items_id REFERENCES order_menu_items(id),
    food_id);

CREATE TABLE IF NOT EXISTS menus(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    menu_item_id  REFERENCES menu_items(id),
    restaurant_id REFERENCES restaurants(id));

CREATE TABLE IF NOT EXISTS order_menu_items(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_id  REFERENCES orders(id),
    menu_item_id  REFERENCES menu_items(id));

CREATE TABLE IF NOT EXISTS menu_item(
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    price DECIMAL NOT NULL,
    menu_id REFERENCES menus(id));

CREATE TABLE IF NOT EXISTS food(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    day_of_week VARCHAR (255) NOT NULL);