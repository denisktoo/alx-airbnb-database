# Database Normalization

## Normalization Analysis

### Issue Identified
The original Property table had a **3NF violation** due to:
- Potential **transitive dependency** through location data redundancy
- Multiple properties with same location (e.g., "New York, NY, USA") create redundant data
- `property_id` → `location` → implicit location hierarchy (city, state, country concepts)
- `pricepernight` naming inconsistency with standard conventions

### Solution Applied
Decomposed location into normalized hierarchical structure: **Country** → **State** → **City** → **Address** → **Property**
Rename `pricepernight` to `price_per_night` for consistent naming conventions

## Normalized Database Design

### Entities and Attributes

**User**
   * **user_id**: Primary Key, UUID, Indexed
   * **first_name**: VARCHAR, NOT NULL
   * **last_name**: VARCHAR, NOT NULL
   * **email**: VARCHAR, UNIQUE, NOT NULL
   * **password_hash**: VARCHAR, NOT NULL
   * **phone_number**: VARCHAR, NULL
   * **role**: ENUM (`guest`, `host`, `admin`), NOT NULL
   * **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Country**
   * **country_id**: Primary Key, UUID, Indexed
   * **country_name**: VARCHAR, UNIQUE, NOT NULL
   * **country_code**: CHAR(2), UNIQUE, NOT NULL

**State**
   * **state_id**: Primary Key, UUID, Indexed
   * **country_id**: Foreign Key → Country(country_id)
   * **state_name**: VARCHAR, NOT NULL
   * **state_code**: VARCHAR, NULL

**City**
   * **city_id**: Primary Key, UUID, Indexed
   * **state_id**: Foreign Key → State(state_id)
   * **city_name**: VARCHAR, NOT NULL

**Address**
   * **address_id**: Primary Key, UUID, Indexed
   * **city_id**: Foreign Key → City(city_id)
   * **street_address**: VARCHAR, NOT NULL
   * **postal_code**: VARCHAR, NULL
   * **latitude**: DECIMAL(10,8), NULL
   * **longitude**: DECIMAL(11,8), NULL

**Property**
   * **property_id**: Primary Key, UUID, Indexed
   * **host_id**: Foreign Key → User(user_id)
   * **address_id**: Foreign Key → Address(address_id)
   * **name**: VARCHAR, NOT NULL
   * **description**: TEXT, NOT NULL
   * **price_per_night**: DECIMAL, NOT NULL *(standardized from pricepernight)*
   * **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   * **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

**Booking**
   * **booking_id**: Primary Key, UUID, Indexed
   * **property_id**: Foreign Key → Property(property_id)
   * **user_id**: Foreign Key → User(user_id)
   * **start_date**: DATE, NOT NULL
   * **end_date**: DATE, NOT NULL
   * **total_price**: DECIMAL, NOT NULL
   * **status**: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
   * **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Payment**
   * **payment_id**: Primary Key, UUID, Indexed
   * **booking_id**: Foreign Key → Booking(booking_id)
   * **amount**: DECIMAL, NOT NULL
   * **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   * **payment_method**: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

**Review**
   * **review_id**: Primary Key, UUID, Indexed
   * **property_id**: Foreign Key → Property(property_id)
   * **user_id**: Foreign Key → User(user_id)
   * **rating**: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
   * **comment**: TEXT, NOT NULL
   * **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Message**
   * **message_id**: Primary Key, UUID, Indexed
   * **sender_id**: Foreign Key → User(user_id)
   * **recipient_id**: Foreign Key → User(user_id)
   * **message_body**: TEXT, NOT NULL
   * **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Key Constraints

* **Unique Constraints**: email (User), country_name/country_code (Country), (country_id, state_name) (State), (state_id, city_name) (City), (user_id, property_id) (Review)
<!---* **Check Constraints**: CHECK: rating >= 1 AND rating <= 5, end_date > start_date (Booking), sender_id ≠ recipient_id (Message)-->
* **Foreign Key Cascades**: ON DELETE CASCADE for all relationships

## Normalization Verification

### 1NF ✅
All attributes contain atomic values, no repeating groups

### 2NF ✅  
No partial dependencies (single-column primary keys throughout)

### 3NF ✅
No transitive dependencies - each non-key attribute depends directly on its table's primary key only

<!---
## Benefits Achieved

* **Data Integrity**: Eliminates location redundancy and inconsistencies
* **Scalability**: Easy addition of new geographical locations
* **Performance**: Optimized location-based queries and searches
* **Maintainability**: Single source of truth for location data
* **Standards**: Consistent naming conventions (`price_per_night`) -->

## Conclusion

The database now meets 3NF requirements through proper decomposition of composite location data into a normalized hierarchical structure, eliminating transitive dependencies while maintaining referential integrity and improving overall data organization.
