-- 1. Create the hotels table to store basic hotel information
CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    logo VARCHAR(255) -- Path to the hotel logo image
);

-- 2. Create the rooms table to store details about room types
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_type VARCHAR(100) NOT NULL, -- e.g., 'Deluxe Ocean View', 'Executive Cityscape Room'
    description TEXT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    image VARCHAR(255), -- Path to the room image
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

-- 3. Create the services table to store services offered by the hotel
CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    service_name VARCHAR(255) NOT NULL, -- e.g., '24 Hours Room Service'
    service_icon VARCHAR(255), -- Icon representation of the service
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

-- 4. Create the customers table to store customer information
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create the bookings table to store booking information
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    room_id INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    guests INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE
);

-- 6. Create the explore table to store hotel news or updates
CREATE TABLE explore (
    explore_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    news_title VARCHAR(255) NOT NULL,
    news_date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);
