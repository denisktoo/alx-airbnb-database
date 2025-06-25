# AirBnB Clone - Database Design Requirements

### Overview
This Entity-Relationship diagram represents the database schema for the AirBnB Clone project, illustrating the relationships between core entities that support user management, property listings, booking operations, payment processing, reviews, and messaging functionality.

### ER Diagram
![AirBnB Clone ER Diagram](https://drive.google.com/uc?export=view&id=15EV1bcN9-Ly5kmMBQzDNTe_NpzqXC5dB)

### Entities Identified

#### **User**
- **user_id** (PK, UUID, Indexed)
- first_name (VARCHAR, NOT NULL)
- last_name (VARCHAR, NOT NULL)
- email (VARCHAR, UNIQUE, NOT NULL)
- password_hash (VARCHAR, NOT NULL)
- phone_number (VARCHAR, NULL)
- role (ENUM: guest, host, admin, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

#### **Property**
- **property_id** (PK, UUID, Indexed)
- **host_id** (FK → User.user_id)
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- price_per_night (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

#### **Booking**
- **booking_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (ENUM: pending, confirmed, canceled, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

#### **Payment**
- **payment_id** (PK, UUID, Indexed)
- **booking_id** (FK → Booking.booking_id)
- amount (DECIMAL, NOT NULL)
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

#### **Review**
- **review_id** (PK, UUID, Indexed)
- **property_id** (FK → Property.property_id)
- **user_id** (FK → User.user_id)
- rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

#### **Message**
- **message_id** (PK, UUID, Indexed)
- **sender_id** (FK → User.user_id)
- **recipient_id** (FK → User.user_id)
- message_body (TEXT, NOT NULL)
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Relationships Defined

#### **One-to-Many Relationships**
- **User → Property** (1:M) - A user can host multiple properties
- **User → Booking** (1:M) - A user can make multiple bookings
- **User → Review** (1:M) - A user can write multiple reviews
- **User → Message (Sender)** (1:M) - A user can send multiple messages
- **User → Message (Recipient)** (1:M) - A user can receive multiple messages
- **Property → Booking** (1:M) - A property can have multiple bookings
- **Property → Review** (1:M) - A property can have multiple reviews

#### **One-to-One Relationships**
- **Booking → Payment** (1:1) - Each booking has exactly one payment

### Key Constraints
- **User**: Unique email, non-null required fields
- **Property**: Foreign key constraint on host_id
- **Booking**: Foreign key constraints on property_id and user_id
- **Payment**: Foreign key constraint on booking_id
- **Review**: Rating constraint (1-5), foreign key constraints
- **Message**: Foreign key constraints on sender_id and recipient_id

### Indexing Strategy
- **Primary Keys**: Automatically indexed (user_id, property_id, booking_id, payment_id, review_id, message_id)
- **Additional Indexes**: email (User), property_id (Property, Booking), booking_id (Payment)
