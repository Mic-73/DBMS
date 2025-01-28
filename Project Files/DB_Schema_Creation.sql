-- -------------------------------
-- Author: Deston Willis
-- Course Title: CSC 351 Database Management Systems Fall 2023
-- Submission Data: 12/11/2023
-- Assignment: Final Project
-- Purpose of Program: Create Schema for data
-- -------------------------------
-- Create games table
Create table games (
	game_id Int Primary Key not null auto_increment,
    gname Varchar(255),
    price decimal(10,2),
    publisher Varchar(255),
    player_type int
);

-- -------------------------------
-- Create platforms table (never used)
Create Table platforms (
	platform_id Int Primary Key not null,
    pname Varchar(255) check(pname in ('Windows', 'Mac', 'Xbox', 'Playstation', 'Nintendo Switch', 'Android', 'iOS')) not null,
    manufacturer Varchar(255)
);

-- -------------------------------
-- Create staff table
Create Table staff (
	staff_id Int Primary Key not null auto_increment,
    staff_name Varchar(255) not null,
    foreign key (store_id) references stores(store_id)
);

-- -------------------------------
-- Create inventory table
Create Table inventory (
	inventory_id Int Primary Key auto_increment,
    game_id Int,
    platform_id Int,
    foreign key (platform_id) references stores(platform_id),
    foreign key (game_id) references games(game_id)
);

-- -------------------------------
-- Create login table
Create Table login (
	username Varchar(255) Primary Key not null,
    password Varchar(255) not null
);

-- -------------------------------
-- Create login_staff table
Create Table login_staff (
	username Varchar(255) not null,
    staff_id Int,
    foreign key (username) references login(username),
    foreign key (staff_id) references staff(staff_id)
);