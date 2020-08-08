
CREATE TABLE post_offices (
    id INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    postal_code INT NOT NULL,
    building_number INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    f_name VARCHAR(100) NOT NULL,
    l_name VARCHAR(100) NOT NULL,
    office_id INT NOT NULL,
    FOREIGN KEY (office_id) REFERENCES post_offices(id),
    PRIMARY KEY(id)
);



CREATE TABLE address (
    id INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    postal_code INT NOT NULL,
    house_number INT NOT NULL,
    door_number INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE parcels ( 
    id INT NOT NULL AUTO_INCREMENT, 
    description VARCHAR(250) NOT NULL,
    employee_id INT NOT NULL,
    sender_name VARCHAR(100) NOT NULL,
    sender_address_id INT NOT NULL,
    deposit_date DATETIME NOT NULL,
    pickup_location_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id), 
    FOREIGN KEY (sender_address_id) REFERENCES address(id), 
    FOREIGN KEY (pickup_location_id) REFERENCES post_offices(id),
    PRIMARY KEY(id) 
);

CREATE TABLE delivery_processes (
    id INT NOT NULL AUTO_INCREMENT,
    parcel_id INT NOT NULL,
    receiver_name VARCHAR(100) NOT NULL,
    receiver_address_id INT NOT NULL,
    received_date DATETIME,
    delivery_status BIT(1),
    FOREIGN KEY (parcel_id) REFERENCES parcels(id),
    FOREIGN KEY (receiver_address_id) REFERENCES address(id),
    PRIMARY KEY (id)


);


###################################### dummy data ##########################


INSERT INTO post_offices (country, city, street, postal_code, building_number)
 VALUES 
    ("Austria", "Vienna", "zz-platz", 1030, 10),
    ("Austria", "Linz", "Traum Strasse", 1050, 23),
    ("Austria", "Salzburg", "Rest Ave.", 2378, 34);



INSERT INTO employees (f_name, l_name, office_id)
    VALUES 
    ("Clint", "EastBush", 2),
    ("Tom",  "Softy", 1),
    ("Aa", "Bb", 3),
    ("Bob", "Marly", 2),
    ("Tim", "Coke", 1);






INSERT INTO address (country, city, street, postal_code, house_number, door_number) 
    VALUES 
    ("Austria", "Graz", "Java-Gasse", 22334 ,12, 21),
    ("Austria", "Vienna", "NotStrasse", 1050, 33, 56),
    ("Austria", "Salzburt", "Sixth Ave.", 889890, 21, 44),
    ("Austria", "Vienna","Sesemi-Tur", 1120, 12, 12),
    ("Austria", "Salzburg", "SQL-Platz", 3879897, 4, 90),
    ("Austria", "Linz", "Meiner-Gasse", 4455, 1, 23); 



INSERT INTO parcels 
    (description, employee_id, sender_name, 
    sender_address_id, deposit_date, pickup_location_id) 
    
    VALUES 
    ("Fragile", 1, "Joe Pesci", 1, "2020-07-21 12:12:12", 1),
    ("IMP", 3, "Robert De Niro", 2, "2019-02-12 08:02:30", 3),
    ("EXP", 5, "Rick Dalton", 3, "2012-01-17 21:20:42", 2);


INSERT INTO delivery_processes (parcel_id, receiver_name, receiver_address_id, 
    received_date, delivery_status) 

    VALUES
    (1, "Jose Salsa", 4, "2020-07-29 17:03:11", 1),
    (2, "Jim Jam", 5, "2019-02-17 05:16:12", 1);

INSERT INTO delivery_processes (parcel_id, receiver_name, receiver_address_id) 

    VALUES
    (3, "Sam Mendez", 6);

