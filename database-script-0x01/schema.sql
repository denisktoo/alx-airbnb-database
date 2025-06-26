-- AirBnB Database - Complete Schema
-- Database: AirBnB Clone
-- All Tables with Constraints and Indexes

-- Create User table
CREATE TABLE `User` (
    `user_id` CHAR(36) PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(20) NULL,
    `role` ENUM('guest', 'host', 'admin') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Property table
CREATE TABLE `Property` (
    `property_id` CHAR(36) PRIMARY KEY,
    `host_id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `price_per_night` DECIMAL(10, 2) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign key constraint
    CONSTRAINT `fk_property_host` FOREIGN KEY (`host_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
);

-- Create Booking table
CREATE TABLE `Booking` (
    `booking_id` CHAR(36) PRIMARY KEY,
    `property_id` CHAR(36) NOT NULL,
    `user_id` CHAR(36) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    CONSTRAINT `fk_booking_property` FOREIGN KEY (`property_id`) REFERENCES `Property`(`property_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
    
    -- Check constraint for valid date range
    CONSTRAINT `chk_booking_dates` CHECK (`end_date` > `start_date`)
);

-- Create Payment table
CREATE TABLE `Payment` (
    `payment_id` CHAR(36) PRIMARY KEY,
    `booking_id` CHAR(36) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `payment_method` ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    
    -- Foreign key constraint
    CONSTRAINT `fk_payment_booking` FOREIGN KEY (`booking_id`) REFERENCES `Booking`(`booking_id`) ON DELETE CASCADE
);

-- Create Review table
CREATE TABLE `Review` (
    `review_id` CHAR(36) PRIMARY KEY,
    `property_id` CHAR(36) NOT NULL,
    `user_id` CHAR(36) NOT NULL,
    `rating` INTEGER NOT NULL,
    `comment` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    CONSTRAINT `fk_review_property` FOREIGN KEY (`property_id`) REFERENCES `Property`(`property_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
    
    -- Check constraint for rating range
    CONSTRAINT `chk_rating_range` CHECK (`rating` >= 1 AND `rating` <= 5)
);

-- Create Message table
CREATE TABLE `Message` (
    `message_id` CHAR(36) PRIMARY KEY,
    `sender_id` CHAR(36) NOT NULL,
    `recipient_id` CHAR(36) NOT NULL,
    `message_body` TEXT NOT NULL,
    `sent_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_message_recipient` FOREIGN KEY (`recipient_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
    
    -- Check constraint to prevent self-messaging
    CONSTRAINT `chk_different_users` CHECK (`sender_id` != `recipient_id`)
);

-- Create additional indexes for optimal performance
-- User table indexes
CREATE INDEX `idx_user_email` ON `User`(`email`);
CREATE INDEX `idx_user_role` ON `User`(`role`);

-- Property table indexes
CREATE INDEX `idx_property_host` ON `Property`(`host_id`);
CREATE INDEX `idx_property_location` ON `Property`(`location`);
CREATE INDEX `idx_property_price` ON `Property`(`price_per_night`);

-- Booking table indexes
CREATE INDEX `idx_booking_property` ON `Booking`(`property_id`);
CREATE INDEX `idx_booking_user` ON `Booking`(`user_id`);
CREATE INDEX `idx_booking_dates` ON `Booking`(`start_date`, `end_date`);
CREATE INDEX `idx_booking_status` ON `Booking`(`status`);

-- Payment table indexes
CREATE INDEX `idx_payment_booking` ON `Payment`(`booking_id`);
CREATE INDEX `idx_payment_date` ON `Payment`(`payment_date`);
CREATE INDEX `idx_payment_method` ON `Payment`(`payment_method`);

-- Review table indexes
CREATE INDEX `idx_review_property` ON `Review`(`property_id`);
CREATE INDEX `idx_review_user` ON `Review`(`user_id`);
CREATE INDEX `idx_review_rating` ON `Review`(`rating`);

-- Message table indexes
CREATE INDEX `idx_message_sender` ON `Message`(`sender_id`);
CREATE INDEX `idx_message_recipient` ON `Message`(`recipient_id`);
CREATE INDEX `idx_message_sent_at` ON `Message`(`sent_at`);
