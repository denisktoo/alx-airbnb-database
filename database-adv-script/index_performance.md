# 3. Indexes for Optimization

## High-Usage Columns
- **User**: `user_id` (JOINs, subqueries)
- **Property**: `property_id` (JOINs, ranking queries)
- **Booking**: `user_id`, `property_id` (foreign keys, COUNT operations)

## Performance Results

### EXPLAIN ANALYZE Query Used:
```sql
EXPLAIN ANALYZE SELECT
  p.*,
  r.*
  FROM Property p
  LEFT JOIN Review r on p.property_id = r.property_id
  ORDER BY p.property_id, r.created_at DESC;
```

**Before**: 3.33ms execution time, cost 2.2
**After**: 0.0464ms execution time, cost 1.45

**Improvements**: 72x faster execution, 34% cost reduction, 68% better table scan efficiency
