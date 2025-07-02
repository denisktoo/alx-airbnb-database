-- Write SQL CREATE INDEX commands to create appropriate indexes for high-usage columns in your User, Booking, and Property tables
-- User table indexes
CREATE INDEX `idx_user_id` ON `User`(`user_id`);

-- Property table indexes
CREATE INDEX `idx_property_id` ON `Property`(`property_id`);

-- Booking table indexes
CREATE INDEX `idx_booking_property` ON `Booking`(`property_id`);
