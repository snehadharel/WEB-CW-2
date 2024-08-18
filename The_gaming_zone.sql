CREATE TABLE Session_Type (
    Session_type_id INT PRIMARY KEY,
    Session_Type_name VARCHAR(50) NOT NULL
);


CREATE TABLE Sessions_Fees (
    Session_Number INT PRIMARY KEY,
    Session_Day VARCHAR(20),
    Session_Start_Time TIME,
    Session_End_Time TIME,
    Session_type_id INT,
    Floor INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Session_type_id) REFERENCES Session_Type(Session_type_id)
);


CREATE TABLE Staff (
    Staff_id VARCHAR(10) PRIMARY KEY,
    Staff_First_Name VARCHAR(50),
    Staff_Last_Name VARCHAR(50),
    Role VARCHAR(50)
);


CREATE TABLE Session_Staff_Duty (
    Staff_id VARCHAR(10),
    Session_Number INT,
    PRIMARY KEY (Staff_id, Session_Number),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
    FOREIGN KEY (Session_Number) REFERENCES Sessions_Fees(Session_Number)
);


CREATE TABLE Machine_Info (
    Machine_id VARCHAR(10) PRIMARY KEY,
    Machine_Number INT,
    Game VARCHAR(100),
    Year INT,
    Floor INT
);


CREATE TABLE Consoles (
    Console_id INT PRIMARY KEY,
    Console VARCHAR(50),
    Console_Qty INT
);


CREATE TABLE Games (
    Games_id VARCHAR(10),
    Name VARCHAR(100),
    PEGI VARCHAR(10),
    Console_id INT,
    FOREIGN KEY (Console_id) REFERENCES Consoles(Console_id)
);


CREATE TABLE Session_Consoles (
    Session_Number INT,
    Date DATE,
    Console_id INT,
    Qty INT,
    PRIMARY KEY (Session_Number, Console_id),
    FOREIGN KEY (Session_Number) REFERENCES Sessions_Fees(Session_Number),
    FOREIGN KEY (Console_id) REFERENCES Consoles(Console_id)
);


CREATE TABLE City (
    City_id INT PRIMARY KEY,
    City VARCHAR(50)
);


CREATE TABLE Address (
    Address_id VARCHAR(10) PRIMARY KEY,
    Address VARCHAR(100),
    City_id INT,
    FOREIGN KEY (City_id) REFERENCES City(City_id)
);


CREATE TABLE Member_Type (
    Member_type_id INT PRIMARY KEY,
    Member_Type VARCHAR(50),
    Membership_Fee DECIMAL(10, 2)
);


CREATE TABLE Customers (
    Customer_id VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50),
    Surname VARCHAR(50),
    Join_Date DATE,
    Date_of_Birth DATE,
    Member_type_id INT,
    Address_id VARCHAR(10),
    FOREIGN KEY (Member_type_id) REFERENCES Member_Type(Member_type_id),
    FOREIGN KEY (Address_id) REFERENCES Address(Address_id)
);


CREATE TABLE Booking_List (
    Booking_id VARCHAR(10) PRIMARY KEY,
    Session_Number INT,
    Customer_id VARCHAR(10),
    Date DATE,
    Member_YN CHAR(1),
    Fee DECIMAL(10, 2),
    Pre_paid_YN CHAR(1),
    FOREIGN KEY (Session_Number) REFERENCES Sessions_Fees(Session_Number),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);





INSERT INTO Session_Type (Session_type_id, Session_Type_name) VALUES
(1, 'Free'),
(2, 'Special');


INSERT INTO Sessions_Fees (Session_Number, Session_Day, Session_Start_Time, Session_End_Time, Session_type_id, Floor, Price) VALUES
(1, 'Sunday', '11:00:00', '19:00:00', 1, 1, 1000.00),
(2, 'Sunday', '11:00:00', '19:00:00', 2, 1, 500.00),
(3, 'Saturday', '11:00:00', '19:00:00', 1, 1, 1000.00),
(4, 'Friday', '19:00:00', '22:00:00', 2, 2, 500.00);


INSERT INTO Staff (Staff_id, Staff_First_Name, Staff_Last_Name, Role) VALUES
('S1', 'Sujal', 'Bohara', 'Cafe'),
('S2', 'Rajesh', 'Hamal', 'Maintenance'),
('S3', 'Rooz', 'Ojha', 'Counter'),
('S4', 'Rashi', 'Timsina', 'Counter'),
('S5', 'Jack', 'Jones', 'Maintenance');


INSERT INTO Session_Staff_Duty (Staff_id, Session_Number) VALUES
('S1', 1),
('S2', 1),
('S3', 1),
('S4', 2),
('S5', 2);


INSERT INTO Machine_Info (Machine_id, Machine_Number, Game, Year, Floor) VALUES
('M1', 123, 'Mario', 2005, 1),
('M2', 78, 'Grand Theft Auto', 2013, 1),
('M3', 12, 'Pokemon', 2016, 2),
('M4', 45, 'PUBG Battlegrounds', 2004, 1);


INSERT INTO Consoles (Console_id, Console, Console_Qty) VALUES
(1, 'PS1', 3),
(2, 'PS2', 4),
(3, 'PS4', 3),
(4, 'Nintendo Switch', 2),
(5, 'Xbox 360', 4);


INSERT INTO Games (Games_id, Name, PEGI, Console_id) VALUES
('G1', 'FIFA 18', 'PG', 1),
('G1', 'FIFA 18', 'PG', 2),
('G2', 'Horizon Zero Dawn', 'PG', 3),
('G2', 'Horizon Zero Dawn', 'PG', 2),
('G3', 'Legend of Zelda', 'PG', 4),
('G4', 'Halo 3', '15', 5);


INSERT INTO Session_Consoles (Session_Number, Date, Console_id, Qty) VALUES
(1, '2023-10-21', 1, 2),
(2, '2023-10-21', 2, 2);


INSERT INTO City (City_id, City) VALUES
(1, 'Kathmandu');


INSERT INTO Address (Address_id, Address, City_id) VALUES
('A1', 'Dillibazar', 1),
('A2', 'Putalisadak', 1),
('A3', 'Baneshwor', 1),
('A4', 'Gaushala', 1),
('A5', 'Maitidevi', 1),
('A6', 'Ghattekulo', 1);


INSERT INTO Member_Type (Member_type_id, Member_Type, Membership_Fee) VALUES
(1, 'Standard', 1000.00),
(2, 'Premium', 14000.00);


INSERT INTO Customers (Customer_id, First_Name, Surname, Join_Date, Date_of_Birth, Member_type_id, Address_id) VALUES
('C1', 'Saroj', 'Upadhyay', '2023-09-01', '1998-02-01', 1, 'A1'),
('C2', 'Neha', 'Kakkar', '2023-06-05', '2000-10-15', 2, 'A2'),
('C3', 'Himani', 'Puri', '2023-02-29', '2001-07-20', 2, 'A3'),
('C4', 'Ritesh', 'Gurung', '2023-04-05', '1983-05-03', 1, 'A4'),
('C5', 'Rohan', 'Jha', '2023-09-02', '1992-05-03', 2, 'A5'),
('C6', 'Ghanshyam', 'Bhat', '2023-09-03', '1998-02-04', 1, 'A6');


INSERT INTO Booking_List (Booking_id, Session_Number, Customer_id, Date, Member_YN, Fee, Pre_paid_YN) VALUES
('B1', 1, 'C1', '2023-10-21', 'Y', NULL, 'N'),
('B2', 1, 'C2', '2023-10-21', 'N', 1000.00, 'N'),
('B3', 1, 'C3', '2023-10-21', 'Y', 900.00, 'Y'),
('B4', 1, 'C4', '2023-10-25', 'N', 1000.00, 'N'),
('B5', 2, 'C5', '2023-10-21', 'Y', 450.00, 'N'),
('B6', 4, 'C6', '2023-10-06', 'Y', 450.00, 'Y');

DELETE FROM Machine_Info
WHERE Game = 'Mario';

-- iii. Query to Select All Customers Booked on Session 1 Who Have Not Paid Yet

SELECT c.Customer_id, c.First_Name, c.Surname
FROM Customers c
JOIN Booking_List b ON c.Customer_id = b.Customer_id
WHERE b.Session_Number = 1 AND b.Pre_paid_YN = 'N';

-- iv. Query to Select All Machines on Floor 2 by Year in Descending Order

SELECT m.Machine_id, m.Machine_Number, m.Game, m.Year
FROM Machine_Info m
WHERE m.Floor = 2
ORDER BY m.Year DESC;

-- v. Query That Counts All the Console Games for the PS2
-- To count all the games that are associated with the PS2 console, you first need to find the Console_id for PS2 and then count the games linked to it:

SELECT COUNT(g.Games_id) AS PS2_Game_Count
FROM Games g
JOIN Consoles c ON g.Console_id = c.Console_id
WHERE c.Console = 'PS2';

-- vi. Query to Select All Staff Working on Session 1 on the Counter
SELECT s.Staff_First_Name, s.Staff_Last_Name
FROM Staff s
JOIN Session_Staff_Duty ss ON s.Staff_id = ss.Staff_id
WHERE ss.Session_Number = 1 AND s.Role = 'Counter';

-- vii. Update the Floor for Grand Theft Auto from Floor 1 to Floor 2
UPDATE Machine_Info
SET Floor = 2
WHERE Game = 'Grand Theft Auto';