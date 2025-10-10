CREATE table Games
(    games_id INT PRIMARY KEY,
    purchase_id INT,
    creator_id INT,
    system_id INT,
    genre VARCHAR,
    dimension VARCHAR,
    cost FLOAT,
    FOREIGN KEY (purchase_id) REFERENCES Purchasement(purchase_id),
    FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
    FOREIGN KEY (system_id) REFERENCES Systems(system_id)
);
CREATE table Purchasement
(
    purchase_id INT PRIMARY KEY,
    bank VARCHAR,
    card_type VARCHAR,
    country VARCHAR,
    currency VARCHAR not null,
    sales FLOAT,
);
CREATE table Creator
(
    creator_id INT PRIMARY KEY,
    roles_id INT,
    tools VARCHAR,
    projects VARCHAR,
    creator_page VARCHAR,
    one_many_people BOOLEAN,
    FOREIGN KEY (roles_id) REFERENCES Roles(roles_id)
);
CREATE table Roles
(
    roles_id INT PRIMARY KEY,
    payment_id INT,
    responsibilities VARCHAR,
    agreements VARCHAR,
    qualifications VARCHAR,
    privileges VARCHAR,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);
CREATE table Payment
(
    payment_id INT PRIMARY KEY,
    amount FLOAT,
    currency VARCHAR not null,
    work_hours INT,
    vacation_days INT,
);
CREATE table Systems
(
    system_id INT PRIMARY KEY,
    device_type VARCHAR not null,
    os VARCHAR,
    memory INT,
    graphics VARCHAR,
    ram INT,
    control_type VARCHAR not null,
);
CREATE table Users
(
    user_id INT PRIMARY KEY,
    roles_id INT,
    username VARCHAR not null,
    psswrd VARCHAR not null,
    email VARCHAR not null unique,
    inventory_id INT unique,
    wallet FLOAT,
    country VARCHAR,
    birth_date DATE,
    FOREIGN KEY (roles_id) REFERENCES Roles(roles_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);
CREATE table Inventory
(
    inventory_id INT PRIMARY KEY,
    games_id INT,
    played_hrs INT,
    played_devices VARCHAR,
    saved_data VARCHAR,
    achievements VARCHAR,
    FOREIGN KEY (games_id) REFERENCES Games(games_id)
);