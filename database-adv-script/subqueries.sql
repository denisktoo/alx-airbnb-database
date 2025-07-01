-- Find all properties where the average rating is greater than 4.0 using a subquery.
SELECT 
    p.*
FROM 
    property b
WHERE 
    (
        SELECT AVG(rating) 
        FROM Review r
        WHERE p.property_id = r.property_id
    ) > 4.0;

-- Correlated subquery to find users who have made more than 3 bookings
SELECT 
    u.*
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*) 
        FROM Booking b 
        WHERE b.user_id = u.user_id
    ) > 3;
