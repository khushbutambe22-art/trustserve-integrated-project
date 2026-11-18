CREATE DATABASE IF NOT EXISTS trustserve;
USE trustserve;

CREATE TABLE users (
  user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE,
  phone VARCHAR(20),
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('CUSTOMER','PROFESSIONAL','ADMIN') NOT NULL DEFAULT 'CUSTOMER',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE professionals (
  professional_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  skill_category VARCHAR(80) NOT NULL,
  experience_years INT DEFAULT 0,
  verified BOOLEAN DEFAULT FALSE,
  rating DECIMAL(2,1) DEFAULT 0.0,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE service_bookings (
  booking_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  customer_id BIGINT NOT NULL,
  professional_id BIGINT NULL,
  service_name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  scheduled_at DATETIME NOT NULL,
  estimated_amount DECIMAL(10,2) NOT NULL,
  booking_status VARCHAR(30) DEFAULT 'CONFIRMED',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES users(user_id),
  FOREIGN KEY (professional_id) REFERENCES professionals(professional_id)
);

CREATE TABLE reviews (
  review_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  booking_id BIGINT NOT NULL,
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comments VARCHAR(1000),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES service_bookings(booking_id)
);
