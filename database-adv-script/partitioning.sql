-- Create Booking table
CREATE TABLE `Booking` (
    `booking_id` CHAR(36) NOT NULL,
    `property_id` CHAR(36) NOT NULL,
    `user_id` CHAR(36) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`booking_id`, `start_date`)
    
    -- Foreign key constraints
    CONSTRAINT `fk_booking_property` FOREIGN KEY (`property_id`) REFERENCES `Property`(`property_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
    
    -- Check constraint for valid date range
    CONSTRAINT `chk_booking_dates` CHECK (`end_date` > `start_date`)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax  VALUES LESS THAN MAXVALUE
);
