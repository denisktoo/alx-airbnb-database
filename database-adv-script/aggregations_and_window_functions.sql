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
FROM Property p
RANK() OVER (
	SELECT COUNT(*)
	FROM Booking b
	WHERE p.property_id = b.property_id
	GROUP BY p.property_id
	);
