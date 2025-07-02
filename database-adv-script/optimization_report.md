# Query Optimization Report

## ✅ Original Query
```sql
SELECT
  b.*,
  u.*,
  p.*,
  pay.*
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id;
```

## 🚫 Identified Issues
- SELECT * fetches all columns — increases data load unnecessarily.
- Execution plan began with a table scan on Payment, which may slow down performance.
- Missing index on Payment.booking_id affecting join efficiency.
- No filtering — returns all rows, even if not needed.

-- Optimized query
```
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
```
## 🔧 Improvements Made
### 1. Targeted Column Selection
Replaced SELECT * with only needed columns to reduce memory usage and improve query speed.

### 2. Filtered Results
Added a WHERE clause to return only recent and confirmed bookings.

### 2. Join Efficiency
All joins use primary keys or indexed foreign keys for optimal performance.

### 3. Index
Creating an index to support the join on Payment.booking_id:

```sql
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```
