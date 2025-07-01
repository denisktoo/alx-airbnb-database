SELECT
  b.*,
  u.*
  -- u.user_id
  -- u.first_name
  -- u.last_name
  -- u.email
  -- u.password_hash
  -- u.phone_number
  -- u.role
  -- u.created_at
  FROM Booking as b
  INNER JOIN User u on b.user_id = u.user_id

SELECT
  p.*,
  r.*
  -- r.review_id
  -- r.property_id
  -- r.user_id
  -- r.rating
  -- r.comment
  -- r.created_at
  FROM Property p
  LEFT JOIN Review r on p.property_id = r.property_id

SELECT
  b.*,
  u.*
  FROM User u
  FULL OUTER JOIN Booking b on b.user_id = u.user_id
