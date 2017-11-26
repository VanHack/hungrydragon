DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL);

DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    latitude VARCHAR(255),
    longitude VARCHAR(255));

DROP TABLE IF EXISTS menu_items;
CREATE TABLE menu_items(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    price DECIMAL(3,2) NOT NULL,
    restaurant_id INT,
    FOREIGN KEY(restaurant_id) REFERENCES restaurants(id));

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    creation_date TIMESTAMP NOT NULL,
    status VARCHAR(255) NOT NULL,
    user_id INT,
    restaurant_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(restaurant_id) REFERENCES restaurants(id));

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items(
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT DEFAULT 1,
    order_id INT,
    menu_item_id INT,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(menu_item_id) REFERENCES menu_items(id));

DROP TABLE IF EXISTS food_by_week;
CREATE TABLE food_by_week(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    day_of_week VARCHAR (255) NOT NULL);