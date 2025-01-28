Create table games (
	game_id Int Primary Key,
    name Varchar(100),
    price decimal(10,2),
    publisher Varchar(100),
    multiplayer bit
);

Create Table consoles (
	console_id Int Primary Key,
    name Varchar(100),
    manufacturer Varchar(100)
);
Create Table game_console (
	game_id Int,
    console_id Int,
    foreign key (game_id) references games(game_id),
    foreign key (console_id) references consoles(console_id)
);

Create Table stores (
	store_id Int Primary Key,
    name Varchar(100),
    addr Varchar(100)
);

Create Table staff (
	staff_id Int Primary Key,
    name Varchar(100),
    store_id Int,
    foreign key (store_id) references stores(store_id)
);

Create Table inventory (
	inventory_id Int Primary Key,
	store_id Int,
    game_id Int,
    foreign key (store_id) references stores(store_id),
    foreign key (game_id) references games(game_id)
);

Create Table login (
	username Varchar(100) Primary Key,
    password Varchar(100)
);

Create Table login_staff (
	username Varchar(100),
    staff_id Int,
    foreign key (username) references login(username),
    foreign key (staff_id) references staff(staff_id)
);


    



    
