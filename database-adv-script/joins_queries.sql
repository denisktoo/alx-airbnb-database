-- Using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
  b.*,
  u.*
  FROM Booking b
  INNER JOIN User u on b.user_id = u.user_id;

-- Using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
  p.*,
  r.*
  FROM Property p
  LEFT JOIN Review r on p.property_id = r.property_id
  ORDER BY p.property_id, r.created_at DESC;

-- Using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
  b.*,
  u.*
  FROM User u
  FULL OUTER JOIN Booking b on b.user_id = u.user_id;
