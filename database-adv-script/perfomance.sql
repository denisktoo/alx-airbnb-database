-- Initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT
  b.*,
  u.*,
  p.*,
  pay.*
FROM Booking b
INNER JOIN User u on b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Optimized query
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.status,
  u.first_name,
  u.last_name,
  p.name AS property_name,
  p.location,
  pay.amount,
  pay.payment_date
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.created_at >= CURDATE() - INTERVAL 30 DAY;
