-- -------------------------------
-- Authors: Michael Wood, Chris Hinckley
-- Course Title: CSC 351 Database Management Systems Fall 2023
-- Submission Data: 12/11/2023
-- Assignment: Final Project
-- Purpose of Program: Insert initial data into schema for testing
-- -------------------------------
-- SET foreign key checks and sql safe updates to 0
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

-- -------------------------------
-- Insert into games table
INSERT INTO games(game_id, gname, price, publisher, player_type) values (1, 'Spiderman 2', 69.99, 'Sony Interactive Entertainment', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (2, 'Fortnite', 0.00, 'Epic Games, Inc.', 3);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (3, 'The Legend of Zelda: Tears of the Kingdom', 69.99, 'Nintendo', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (4, 'Minecraft', 29.99, 'Mojang Studios', 3);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (5, 'Call of Duty: Modern Warfare', 59.99, 'Activision', 3);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (6, 'God of War Ragnarök', 59.99, 'Sony Interactive Entertainment', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (7, 'Night in the Woods', 19.99, 'Finji', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (8, 'Outer Wilds', 24.99, 'Annapurna Interactive', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (9, 'Fallout 4', 19.99, 'Bethesda Softworks', 1);
INSERT INTO games(game_id, gname, price, publisher, player_type) values (10, 'Fallout 76', 39.99, 'Bethesda Softworks', 2);

-- -------------------------------
-- Insert into platforms table
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (1, 'Windows', 'Microsoft Corporation');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (2, 'Xbox', 'Microsoft Corporation');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (3, 'Playstation', 'Sony Interactive Entertainment');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (4, 'Nintendo Switch', 'Nintendo');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (5, 'Android', 'Samsung');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (6, 'iOS', 'Apple Inc.');
INSERT INTO platforms(platform_id, pname, manufacturer) VALUES (7, 'Mac', 'Apple Inc.');

-- -------------------------------
-- Insert into staff table
INSERT INTO staff(staff_name, store_id) VALUES ('Ben Fei', '1');
INSERT INTO staff(staff_name, store_id) VALUES ('Henry Humphrydink', '1');
INSERT INTO staff(staff_name, store_id) VALUES ('Jack Gallahand', '2');
INSERT INTO staff(staff_name, store_id) VALUES ('Ryan Halland', '2');
INSERT INTO staff(staff_name, store_id) VALUES ('Karen Depovnervich', '3');
INSERT INTO staff(staff_name, store_id) VALUES ('Westly Northerman', '3');

-- -------------------------------
-- Insert into inventory table
INSERT INTO inventory(store_id, game_id) VALUES ('1', '1');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '2');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '3');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '4');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '5');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '6');
INSERT INTO inventory(store_id, game_id) VALUES ('1', '7');
INSERT INTO inventory(store_id, game_id) VALUES ('2', '8');
INSERT INTO inventory(store_id, game_id) VALUES ('2', '9');
INSERT INTO inventory(store_id, game_id) VALUES ('2', '10');
INSERT INTO inventory(store_id, game_id) VALUES ('3', '1');
INSERT INTO inventory(store_id, game_id) VALUES ('3', '5');
INSERT INTO inventory(store_id, game_id) VALUES ('3', '7');
INSERT INTO inventory(store_id, game_id) VALUES ('3', '8');
INSERT INTO inventory(store_id, game_id) VALUES ('3', '9');

-- -------------------------------
-- Insert into login table
INSERT INTO login(username, password) VALUES ('BenF', 'password123');
INSERT INTO login(username, password) VALUES ('HenryH', 'password123');
INSERT INTO login(username, password) VALUES ('JackG', 'Whatpasswrd$%');
INSERT INTO login(username, password) VALUES ('RyanH', 'jgow8dg7vo872g3we');
INSERT INTO login(username, password) VALUES ('KarenD', '777777Karen');
INSERT INTO login(username, password) VALUES ('WestlyN', '####');

-- -------------------------------
-- Insert into login_staff table
INSERT INTO login_staff(username, staff_id) VALUES ('BenF', 1);
INSERT INTO login_staff(username, staff_id) VALUES ('HenryH', 2);
INSERT INTO login_staff(username, staff_id) VALUES ('JackG', 3);
INSERT INTO login_staff(username, staff_id) VALUES ('RyanH', 4);
INSERT INTO login_staff(username, staff_id) VALUES ('KarenD', 5);
INSERT INTO login_staff(username, staff_id) VALUES ('WestlyN', 6);


