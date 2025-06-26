-- AirBnB Database Sample Data
-- Insert sample data into all tables

-- Insert sample users (guests, hosts, and admin)
INSERT INTO `User` (`user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'Johannes', 'Oula', 'johannes@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254722518641', 'host', '2024-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Nicholas', 'Osoro', 'nicholas@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254726998256', 'guest', '2024-01-20 14:45:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Winny', 'Cherotich', 'wcherotich@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254724683523', 'host', '2024-02-01 09:15:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Thomas', 'Odeny', 'todeny@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254706894619', 'guest', '2024-02-10 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'James', 'Mburu', 'jmburu@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254799842747', 'host', '2024-02-15 11:30:00'),
('550e8400-e29b-41d4-a716-446655440006', 'MaryAnne', 'Kimani', 'mkimani@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '254756748394', 'admin', '2024-01-01 08:00:00');

-- Insert sample properties
INSERT INTO `Property` (`property_id`, `host_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`) VALUES
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Apartment', 'Beautiful 2-bedroom apartment in the heart of Nairobi with modern amenities and great city views.', 'Nairobi CBD, Kenya', 75.00, '2024-01-16 10:00:00', '2024-01-16 10:00:00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440003', 'Luxury Villa with Pool', 'Stunning 4-bedroom villa with private pool, garden, and mountain views perfect for families.', 'Karen, Nairobi, Kenya', 150.00, '2024-02-02 14:30:00', '2024-02-02 14:30:00'),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', 'Modern Studio near Airport', 'Convenient studio apartment close to JKIA, ideal for business travelers and short stays.', 'Embakasi, Nairobi, Kenya', 45.00, '2024-02-16 09:45:00', '2024-02-16 09:45:00'),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', 'Spacious Family House', 'Large 3-bedroom house with garden, perfect for families visiting Nairobi for extended stays.', 'Westlands, Nairobi, Kenya', 90.00, '2024-01-20 12:15:00', '2024-01-20 12:15:00'),
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Serene Garden Cottage', 'Peaceful 1-bedroom cottage surrounded by lush gardens, perfect for a quiet getaway.', 'Kiambu, Kenya', 60.00, '2024-02-05 16:00:00', '2024-02-05 16:00:00'),
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440005', 'Executive Penthouse', 'Luxury penthouse with panoramic city views, high-end furnishings, and premium location.', 'Kilimani, Nairobi, Kenya', 200.00, '2024-02-18 11:20:00', '2024-02-18 11:20:00');

-- Insert sample bookings
INSERT INTO `Booking` (`booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`) VALUES
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '2024-03-15', '2024-03-18', 225.00, 'confirmed', '2024-03-01 10:30:00'),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '2024-04-10', '2024-04-15', 750.00, 'confirmed', '2024-03-25 14:20:00'),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', '2024-03-20', '2024-03-22', 90.00, 'pending', '2024-03-18 09:15:00'),
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', '2024-05-01', '2024-05-07', 540.00, 'confirmed', '2024-04-15 16:45:00'),
('750e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', '2024-03-25', '2024-03-27', 120.00, 'canceled', '2024-03-20 11:00:00'),
('750e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440004', '2024-06-15', '2024-06-18', 600.00, 'pending', '2024-06-01 13:30:00');

-- Insert sample payments
INSERT INTO `Payment` (`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`) VALUES
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 225.00, '2024-03-01 10:45:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', 750.00, '2024-03-25 14:35:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440004', 540.00, '2024-04-15 17:00:00', 'paypal'),
('850e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440001', 225.00, '2024-03-01 10:45:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440002', 375.00, '2024-03-25 14:35:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440004', 270.00, '2024-04-15 17:00:00', 'credit_card');

-- Insert sample reviews
INSERT INTO `Review` (`review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
('950e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 5, 'Amazing apartment with great location! The host was very responsive and the place was exactly as described. Highly recommend!', '2024-03-19 15:30:00'),
('950e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 4, 'Beautiful villa with excellent amenities. The pool was perfect for relaxation. Only minor issue was the WiFi speed.', '2024-04-16 10:15:00'),
('950e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', 5, 'Perfect for our family stay! Spacious, clean, and in a great neighborhood. Kids loved the garden. Will definitely book again.', '2024-05-08 12:45:00'),
('950e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', 4, 'Good location and comfortable stay. The apartment was clean and well-maintained. Host provided excellent local recommendations.', '2024-03-20 09:20:00'),
('950e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', 5, 'Absolutely stunning property! Every detail was perfect. The mountain views were breathtaking. Worth every penny!', '2024-04-17 14:30:00'),
('950e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 3, 'Decent place but had some maintenance issues. The location was good but the property needs some updates. Host was helpful though.', '2024-05-09 16:00:00');

-- Insert sample messages
INSERT INTO `Message` (`message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`) VALUES
('a50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Hi! I am interested in booking your downtown apartment for next month. Is it available from March 15-18?', '2024-02-28 14:30:00'),
('a50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Hello! Yes, the apartment is available for those dates. I would be happy to host you. The total would be $225 for 3 nights.', '2024-02-28 15:15:00'),
('a50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Hello Winny, I saw your beautiful villa listing. Do you allow pets? We have a small dog and would love to bring him along.', '2024-03-20 10:00:00'),
('a50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'Hi Thomas! Yes, we do allow well-behaved pets with a small additional cleaning fee. Your dog is welcome!', '2024-03-20 11:30:00'),
('a50e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440005', 'Hi James, I need to arrive a bit early for check-in. Would 2 PM work instead of 3 PM?', '2024-04-30 09:45:00'),
('a50e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', 'Hi Nicholas! Absolutely, 2 PM works perfectly. I will make sure everything is ready for your early arrival.', '2024-04-30 10:15:00');
