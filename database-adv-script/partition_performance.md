# Partitioning Performance Report

## ✅ Objective

Optimize slow queries on a large `Booking` table using partitioning.

## 🧱 Implementation

* Partitioned by `YEAR(start_date)`.
* Query used:

```sql
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
```

## 📈 Observations

* Non-partitioned: Full table scan, slower.
* Partitioned: Scanned only relevant partitions, faster.

## ✅ Conclusion

Partitioning improved performance by reducing scanned data. Recommended for large time-based datasets with date-range filters.
