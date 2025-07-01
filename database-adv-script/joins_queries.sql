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

select
  p.*,
  r.*
  -- r.review_id
  -- r.property_id
  -- r.user_id
  -- r.rating
  -- r.comment
  -- r.created_at
  from Property p
  left join Review r on p.property_id = r.property_id

select
  b.*,
  u.*
  from User u
  full outer join Booking b on b.user_id = u.user_id
