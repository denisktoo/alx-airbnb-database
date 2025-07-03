# Performance Monitoring

## 🎯 Objective

Improve query performance by analyzing execution and applying schema changes.

## 👀 Issue

Query on `Booking` used full table scan:

```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
```

## 🔧 Fixes

* Added partitioning by `start_date`
* Created index on `start_date`

## ⚡ Result

* Reduced scanned data
* Query became significantly faster

## ✅ Conclusion

Partitioning and indexing resolved the bottleneck and improved performance.
