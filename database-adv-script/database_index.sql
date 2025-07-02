-- Write SQL CREATE INDEX commands to create appropriate indexes for high-usage columns in your User, Booking, and Property tables
-- User table indexes
CREATE INDEX `idx_user_id` ON `User`(`user_id`);
EXPLAIN ANALYZE SELECT
  b.*,
  u.*
  FROM User u
  FULL OUTER JOIN Booking b on b.user_id = u.user_id;

-- Property table indexes
CREATE INDEX `idx_property_id` ON `Property`(`property_id`);
EXPLAIN ANALYZE SELECT
  p.*,
  r.*
  FROM Property p
  LEFT JOIN Review r on p.property_id = r.property_id
  ORDER BY p.property_id, r.created_at DESC;

-- Booking table indexes
CREATE INDEX `idx_booking_property` ON `Booking`(`property_id`);
CREATE INDEX `idx_booking_user` ON `Booking`(`user_id`);
EXPLAIN ANALYZE SELECT
  b.*,
  u.*
  FROM Booking b
  INNER JOIN User u on b.user_id = u.user_id;
