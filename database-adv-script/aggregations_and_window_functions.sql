-- Find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT
	b.*
FROM
	Booking b
WHERE(
	SELECT COUNT(*)
	FROM User u
	WHERE b.user_id = u.user_id
	GROUP BY user.id
	);

-- Window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT
	p.*
	(SELECT COUNT(*) 
		FROM Booking b 
		WHERE b.property_id = p.property_id) as booking_count,
	ROW_NUMBER() OVER (
		ORDER BY(
			SELECT COUNT(*)
			FROM Booking b
			WHERE b.property_id = p.property_id DESC
			)
		) as row_num
	RANK() OVER (
		ORDER BY (
			SELECT COUNT(*)
			FROM Booking b
			WHERE p.property_id = b.property_id DESC
	) as booking_rank
FROM Property p
ORDER BY booking_count DESC;
