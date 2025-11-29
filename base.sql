CREATE table Salary
(
    salary_id INT PRIMARY KEY identity(1,1),
    amount FLOAT,
    currency VARCHAR(3) not null,
    work_hours INT,
    vacation_days INT
);
CREATE table Card_details
(
    det_id INT PRIMARY KEY identity(1,1),
    bank VARCHAR(30),
    card_type VARCHAR(10),
    country VARCHAR(30),
    currency VARCHAR(3) not null,
    sales_percentage FLOAT
);
CREATE table Systems
(
    system_id INT PRIMARY KEY identity(1,1),
    device_type VARCHAR(15) not null,
    os VARCHAR(15),
    memory INT,
    graphics VARCHAR(30),
    ram INT,
    control_type VARCHAR(20) not null
);
CREATE table Roles
(
    roles_id INT PRIMARY KEY identity(1,1),
    salary_id INT,
    role_title VARCHAR(30) not null,
    responsibilities VARCHAR(50),
    agreements VARCHAR(50),
    qualifications VARCHAR(50),
    privileges VARCHAR(50),
    FOREIGN KEY (salary_id) REFERENCES Salary(salary_id)
);
CREATE table Creator
(
    creator_id INT PRIMARY KEY identity(1,1),
    roles_id INT,
    tools VARCHAR(30),
    projects VARCHAR(30),
    creator_page VARCHAR(20),
    one_many_people BIT,
    FOREIGN KEY (roles_id) REFERENCES Roles(roles_id)
);
CREATE table Games
(
    games_id INT PRIMARY KEY identity(1,1),
    title VARCHAR(20) not null,
    card_id INT,
    creator_id INT,
    system_id INT,
    genre VARCHAR(10),
    dimension VARCHAR(2),
    cost FLOAT,
    FOREIGN KEY (card_id) REFERENCES Card_details(det_id),
    FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
    FOREIGN KEY (system_id) REFERENCES Systems(system_id)
);
CREATE table Inventory
(
    inventory_id INT PRIMARY KEY identity(1,1),
    games_id INT,
    played_hrs INT,
    played_devices VARCHAR(30),
    saved_data VARCHAR(30),
    achievements VARCHAR(30),
    FOREIGN KEY (games_id) REFERENCES Games(games_id)
);
CREATE table Users
(
    user_id INT PRIMARY KEY identity(1,1),
    roles_id INT,
    username VARCHAR(20) not null,
    psswrd VARCHAR(15) not null,
    email VARCHAR(30) not null unique,
    inventory_id INT unique,
    wallet FLOAT,
    country VARCHAR(15),
    birth_date DATE,
    FOREIGN KEY (roles_id) REFERENCES Roles(roles_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);

CREATE table Purchasement(
    purchase_id INT PRIMARY KEY identity(1,1),
    game_id INT,
    user_id INT,
    status VARCHAR(20),
    bought_date DATE,
    final_cost INT,
    card_id INT,
    FOREIGN KEY (game_id) REFERENCES Games(games_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (card_id) REFERENCES Card_details(det_id)
);

INSERT INTO Salary
    (amount, currency, work_hours, vacation_days)
VALUES
    (1000, 'AZN', 160, 15),
    (1200, 'AZN', 160, 15),
    (1500, 'AZN', 160, 20),
    (800, 'AZN', 35, 10),
    (900, 'AZN', 30, 12),
    (1100, 'AZN', 40, 18),
    (1300, 'AZN', 160, 22),
    (1400, 'AZN', 160, 25),
    (2000, 'AZN', 160, 30),
    (500, 'AZN', 20, 5);

INSERT INTO Card_details
    (bank, card_type, country, currency, sales_percentage)
VALUES
    ('Bank of Baku', 'Credit', 'Azerbaijan', 'AZN', 0),
    ('Unibank', 'Debit', 'Azerbaijan', 'AZN', 30),
    ('Rabitabank', 'Credit', 'Azerbaijan', 'AZN', 15),
    ('Kapital Bank', 'Debit', 'Azerbaijan', 'AZN', 60),
    ('AccessBank', 'Credit', 'Azerbaijan', 'AZN', 10),
    ('Bank of Baku', 'Debit', 'Azerbaijan', 'AZN', 25),
    ('Garanti BBVA', 'Credit', 'Turkey', 'TRY', 5),
    ('Isbank', 'Debit', 'Turkey', 'TRY', 50),
    ('Ziraat Bankasi', 'Credit', 'Turkey', 'TRY', 20),
    ('Halkbank', 'Debit', 'Turkey', 'TRY', 40);

INSERT INTO Systems
    (device_type, os, memory, graphics, ram, control_type)
VALUES
    ('PC', 'Windows 10', 512, 'NVIDIA GTX 1660', 16, 'Keyboard and Mouse'),
    ('Console', 'PlayStation OS', 256, 'Custom GPU', 8, 'Gamepad'),
    ('Mobile', 'Android', 128, 'Adreno 640', 6, 'Touchscreen'),
    ('PC', 'Windows 11', 1024, 'NVIDIA RTX 3060', 32, 'Keyboard and Mouse'),
    ('Console', 'Xbox OS', 512, 'Custom GPU', 16, 'Gamepad'),
    ('Mobile', 'iOS', 256, 'Apple GPU', 8, 'Touchscreen'),
    ('PC', 'Linux', 2048, 'AMD Radeon RX 6800', 64, 'Keyboard and Mouse'),
    ('Console', 'Nintendo OS', 128, 'Custom GPU', 4, 'Gamepad'),
    ('Mobile', 'Android', 64, 'Mali-G76', 4, 'Touchscreen'),
    ('PC', 'macOS', 512, 'Apple M1 GPU', 16, 'Keyboard and Mouse');

INSERT INTO Roles
    (salary_id, role_title, responsibilities, agreements, qualifications, privileges)
VALUES
    (3, 'Backend Developer', 'Develop and maintain server-side applications', 'Full-time', 'Bachelor in Computer Science', 'Remote Work'),
    (3, 'Graphic Designer', 'Create visual content for marketing', 'Part-time', 'Bachelor in Design', 'Flexible Hours'),
    (1, 'Moderator', 'Management of community interactions', 'Contract', 'Experience in Moderation', 'Remote Work'),
    (2, 'Support Staff', 'Assistance to users with inquiries', 'Full-time', 'Customer Service Experience', NULL),
    (1, 'QA Tester', 'Ensuring software quality through testing', 'Contract', 'Attention to Detail', 'Remote Work'),
    (2, 'Content Creator', 'Production of engaging content', 'Part-time', 'Creative Writing Skills', 'Flexible Hours'),
    (1, 'Community Manager', 'Management of community interactions', 'Full-time', 'Social Media Experience', 'Remote Work'),
    (2, 'Marketing Specialist', 'Development of marketing strategies', 'Contract', 'Marketing Degree', NULL),
    (3, 'Creator', 'Creation and management of content', 'Full-time', 'Bachelor in Computer Science', 'Remote Work'),
    (1, 'Users', NULL, NULL, NULL, NULL);

INSERT INTO Creator
    (roles_id, tools, projects, creator_page, one_many_people)
VALUES
    (9, 'Python, Django', 'Gametitle1', 'creator1.com', 0),
    (9, 'JavaScript, React', NULL, 'creator2.com', 1),
    (9, 'C++', 'Gametitle3', 'creator3.com', 0),
    (9, 'Unity, C#', 'Gametitle4', 'creator4.com', 1),
    (9, 'Unreal Engine, C++', NULL, 'creator5.com', 0),
    (9, 'Godot, GDScript', 'Gametitle6', 'creator6.com', 1),
    (9, 'Blender, Maya', NULL, 'creator7.com', 0),
    (9, 'Photoshop, Illustrator', 'Gametitle8', 'creator8.com', 1),
    (9, '3ds Max, ZBrush', NULL, 'creator9.com', 0),
    (9, 'SketchUp, AutoCAD', 'Gametitle10', 'creator10.com', 1);

INSERT INTO Games
    (title, card_id, creator_id, system_id, genre, dimension, cost)
VALUES
    ('Gametitle1', 1, 1, 2, 'Action', '3D', 59.99),
    ('Gametitle2', 1, 1, 2, 'Adventure', '3D', 49.99),
    ('Gametitle3', 2, 3, 1, 'Puzzle', '2D', 19.99),
    ('Gametitle4', 3, 2, 3, 'Strategy', '2D', 29.99),
    ('Gametitle5', 2, 2, 1, 'RPG', '3D', 39.99),
    ('Gametitle6', 3, 1, 2, 'Simulation', '3D', 24.99),
    ('Gametitle7', 1, 3, 3, 'Horror', '3D', 44.99),
    ('Gametitle8', 2, 1, 1, 'Strategy', '2D', 34.99),
    ('Gametitle9', 3, 2, 2, 'Racing', '3D', 54.99),
    ('Gametitle10', 1, 3, 1, 'MMORPG', '3D', 69.99),
    ('Gametitle11', 2, 1, 3, 'Action', '3D', 59.99),
    ('Gametitle12', 3, 2, 2, 'Adventure', '3D', 49.99),
    ('Gametitle13', 1, 3, 1, 'Puzzle', '2D', 19.99),
    ('Gametitle14', 2, 1, 2, 'Strategy', '2D', 29.99),
    ('Gametitle15', 3, 2, 3, 'RPG', '3D', 39.99);

INSERT INTO Inventory
    (games_id, played_hrs, played_devices, saved_data, achievements)
VALUES
    (1, 120, 'PC, Console', 'Save1', '1 gold, 2 silver'),
    (2, 85, 'PC', 'Save2', '3 gold, 1 bronze'),
    (3, 4000, 'Mobile', 'Save3', '1 silver, 4 bronze'),
    (4, 60, 'PC, Mobile', 'Save4', '2 gold, 3 silver'),
    (5, 1500, 'Console', 'Save5', '5 gold'),
    (6, 30, 'PC', 'Save6', '2 silver, 2 bronze'),
    (7, 95, 'Console, Mobile', 'Save7', '1 gold, 1 silver, 1 bronze'),
    (8, 7000, 'PC', 'Save8', '4 gold, 2 silver'),
    (9, 110, 'PC, Console', 'Save9', '3 gold'),
    (10, 200, 'PC', 'Save10', '2 gold, 4 bronze');

INSERT INTO Users
    (roles_id, username, psswrd, email, inventory_id, wallet, country, birth_date)
VALUES
    (10, 'user1', 'pass1', 'user1@example.com', 1, 100.00, 'Azerbaijan', '1990-01-01'),
    (10, 'user2', 'pass2', 'user2@example.com', 2, 150.00, 'Azerbaijan', '1992-02-02'),
    (10, 'user3', 'pass3', 'user3@example.com', 3, 200.00, 'Azerbaijan', '1994-03-03'),
    (10, 'user4', 'pass4', 'user4@example.com', 4, 520.00, 'USA', '1996-04-04'),
    (10, 'user5', 'pass5', 'user5@example.com', 5, 300.00, 'Azerbaijan', '1998-05-05'),
    (10, 'user6', 'pass6', 'user6@gmail.com', 6, 666.00, 'USA', '2000-06-06'),
    (10, 'user7', 'pass7', 'user7@example.com', 7, 777.00, 'Azerbaijan', '2001-07-07'),
    (10, 'user8', 'pass8', 'user8@gmail.com', 8, 888.00, 'USA', '2002-08-08'),
    (10, 'user9', 'pass9', 'user9@example.com', 9, 999.00, 'Azerbaijan', '2003-09-09'),
    (10, 'user10', 'pass10', 'user10@example.com', 10, 1000.00, 'USA', '2004-10-10');

INSERT INTO Purchasement
    (game_id, user_id, status, bought_date, final_cost, card_id)
VALUES
    (3, 2, "Success", '2025-12-12', 30.00, 2),
    (4, 1, "Fail", NULL, 45.00, NULL),
    (1, 9, "Success", '2025-12-7', 10.00, 1),
    (2, 7, "In cart", NULL, NULL, NULL),
    (5, 6, "Success", '2025-7-12', 20.00, 3),
    (6, 3, "Success", '2025-7-7', 25.00, 4);
