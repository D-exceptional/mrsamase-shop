--
-- Database: chroayol_store
--
CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

-- --------------------------------------------------------

--
-- Table structure for table  users
--
CREATE TABLE users (
  user_id BIGINT NOT NULL AUTO_INCREMENT,
  avatar VARCHAR(1000) NOT NULL,
  fullname VARCHAR(1000) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  contact VARCHAR(100) NOT NULL,
  country VARCHAR(1000) NOT NULL,
  user_password VARCHAR(255) NOT NULL,
  user_role ENUM('Admin', 'Affiliate', 'Customer', 'Merchant', 'Worker') DEFAULT 'Customer',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table users
--
INSERT INTO users (user_id, avatar, fullname, email, contact, country, user_password, user_role, created_at, updated_at) VALUES
(1, 'None', 'Smart Wisdom', 'mrwisdom8086@gmail.com', '+234234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'Admin', '2023-05-15 00:00:00', NULL),
(2, 'None', 'Okeke Chukwuebuka', 'chukwuebukaokeke09@gmail.com', '+2349026928911', 'Nigeria', '$2y$10$XLHKnVjgofU8tcc//kahJuQKRTkBDPun5W/lgoJBPqIkGbk890j0i', 'Admin', '2023-05-15 00:00:00', NULL),
(3, 'None', 'Test User', 'testuser@gmail.com', '+234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'User', '2024-09-16 03:34:00', NULL),
(4, 'None', 'Test Merchant', 'testmerchant@gmail.com', '+234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'Merchant', '2024-09-16 03:34:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table user_socials
--
CREATE TABLE user_socials (
  social_id BIGINT NOT NULL AUTO_INCREMENT,
  facebook VARCHAR(2000) NOT NULL,
  instagram VARCHAR(2000) NOT NULL,
  tiktok VARCHAR(2000) NOT NULL,
  twitter VARCHAR(2000) NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (social_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table bank_details
--
CREATE TABLE bank_details (
  detail_id BIGINT NOT NULL AUTO_INCREMENT,
  account_number VARCHAR(10) NOT NULL,
  bank_name VARCHAR(2000) NOT NULL,
  bank_code VARCHAR(100) NOT NULL,
  currency_code VARCHAR(100) NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (detail_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table stores
--
CREATE TABLE stores (
  store_id BIGINT NOT NULL AUTO_INCREMENT,
  store_name VARCHAR(2000) NOT NULL UNIQUE,
  store_avatar VARCHAR(2000) NOT NULL,
  store_description VARCHAR(2000) NOT NULL,
  store_status ENUM('Pending', 'Active', 'Deactivated') DEFAULT 'Pending',
  user_id BIGINT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (store_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table store_documents
--
CREATE TABLE store_documents (
  document_id BIGINT NOT NULL AUTO_INCREMENT,
  identity_file VARCHAR(2000) NOT NULL,
  business_file VARCHAR(2000) NOT NULL,
  store_id BIGINT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (document_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table store_socials
--
CREATE TABLE store_socials (
  social_id BIGINT NOT NULL AUTO_INCREMENT,
  facebook VARCHAR(2000) NOT NULL,
  instagram VARCHAR(2000) NOT NULL,
  tiktok VARCHAR(2000) NOT NULL,
  twitter VARCHAR(2000) NOT NULL,
  store_id BIGINT NOT NULL,
  PRIMARY KEY (social_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table store_coupons
--
CREATE TABLE store_coupons (
  coupon_id BIGINT NOT NULL AUTO_INCREMENT,
  coupon_code VARCHAR(100) NOT NULL,
  coupon_discount INT NOT NULL,
  coupon_status ENUM('Active', 'Deactivated') DEFAULT 'Active',
  store_id BIGINT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (coupon_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table product_categories
--
CREATE TABLE product_categories (
  category_id BIGINT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table product_categories
--
INSERT INTO product_categories (category_id, category_name) VALUES
(1, 'Appliances'),
(2, 'Phones & Tablets'),
(3, 'Health & Beauty'),
(4, 'Home & Office'),
(5, 'Electronics'),
(6, 'Fashion'),
(7, 'Fashion'),
(8, 'Health & Fitness'),
(9, 'Love & Relationship'),
(10, 'Lifestyle'),
(11, 'Marketing & Sales'),
(12, 'Personal & Professional Development'),
(13, 'Science'),
(14, 'Software & Tech'),
(15, 'Travels'),
(16, 'Wealth & Finance');

-- --------------------------------------------------------

--
-- Table structure for table products
--
CREATE TABLE products (
  product_id BIGINT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(1000) NOT NULL,
  product_description TEXT,
  category VARCHAR(1000) NOT NULL,
  sub_category VARCHAR(1000) NOT NULL,
  product_price DECIMAL(10, 2) NOT NULL,
  slash_price DECIMAL(10, 2) NOT NULL,
  stock BIGINT DEFAULT 0,
  store_id BIGINT NOT NULL,
  affiliate_enabled BOOLEAN NOT NULL,
  affiliate_commission INT DEFAULT 0 NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (product_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table products
--
CREATE TABLE product_media (
  media_id BIGINT NOT NULL AUTO_INCREMENT,
  media_url VARCHAR(1000) NOT NULL,
  product_id BIGINT NOT NULL,
  PRIMARY KEY (media_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table product_links
--

CREATE TABLE product_links (
  link_id BIGINT NOT NULL AUTO_INCREMENT,
  product_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  short_link VARCHAR(100) NOT NULL,
  long_link VARCHAR(1000) NOT NULL,
  short_code VARCHAR(100) NOT NULL,
  link_status ENUM('Active', 'Deactivated') DEFAULT 'Active',
  PRIMARY KEY (link_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table carts
--
CREATE TABLE carts (
  cart_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table cart_items
--
CREATE TABLE cart_items (
  item_id BIGINT NOT NULL AUTO_INCREMENT,
  cart_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity BIGINT DEFAULT 1,
  PRIMARY KEY (item_id),
  FOREIGN KEY (cart_id) REFERENCES carts (cart_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table orders
--
CREATE TABLE orders (
  order_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  total_amount DECIMAL(10, 2) NOT NULL,
  order_status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Completed') DEFAULT 'Pending',
  payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
  is_finalized BOOLEAN NOT NULL,
  shipping_address TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table order_items
--
CREATE TABLE order_items (
  item_id BIGINT NOT NULL AUTO_INCREMENT,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity BIGINT NOT NULL,
  price DECIMAL(10, 2),
  PRIMARY KEY (item_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table payments
--
CREATE TABLE payments (
  payment_id BIGINT NOT NULL AUTO_INCREMENT,
  order_id BIGINT NOT NULL,
  paid_amount DECIMAL(10, 2),
  payment_ref VARCHAR(100) NOT NULL,
  payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
  payment_source BIGINT NOT NULL,
  paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (payment_source) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table wishlist
--

CREATE TABLE wishlist (
  wishlist_id BIGINT NOT NULL AUTO_INCREMENT,
  product_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (wishlist_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table reviews
--
CREATE TABLE reviews (
  review_id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  rating BIGINT CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (review_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table general_notifications
--

CREATE TABLE general_notifications (
  notification_id BIGINT NOT NULL AUTO_INCREMENT,
  notification_details VARCHAR(1000) NOT NULL,
  notification_type VARCHAR(255) NOT NULL,
  notification_receiver BIGINT NOT NULL,
  notification_date VARCHAR(50) NOT NULL,
  notification_status VARCHAR(50) NOT NULL,
  PRIMARY KEY (notification_id),
  FOREIGN KEY (notification_receiver) REFERENCES users (user_id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table general_notifications
--

INSERT INTO general_notifications (notification_id, notification_details, notification_type, notification_receiver, notification_date, notification_status) VALUES
(1, 'The main course with the title <b>P.R.O.F.I.T  Blueprints</b> was uploaded', 'course_upload', 1, '2024-02-26 15:47:30', 'Seen'),
(2, 'The main course with the title <b>P.R.O.F.I.T  Blueprints</b> was uploaded', 'course_upload', 2, '2024-02-26 15:47:30', 'Seen');

-- --------------------------------------------------------

--
-- Table structure for table mailbox
--

CREATE TABLE mailbox (
  mail_id BIGINT NOT NULL AUTO_INCREMENT,
  mail_type VARCHAR(100) NOT NULL,
  mail_subject VARCHAR(1000) NOT NULL,
  mail_sender VARCHAR(2000) NOT NULL,
  mail_receiver VARCHAR(2000) NOT NULL,
  mail_date VARCHAR(100) NOT NULL,
  mail_time VARCHAR(100) NOT NULL,
  mail_message VARCHAR(5000) NOT NULL,
  mail_filename VARCHAR(255) NOT NULL,
  mail_extension VARCHAR(20) NOT NULL,
  PRIMARY KEY (mail_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table mailbox
--

INSERT INTO mailbox (mail_id, mail_type, mail_subject, mail_sender, mail_receiver, mail_date, mail_time, mail_message, mail_filename, mail_extension) VALUES
(59, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'izuchukwuokuzu@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg'),
(60, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'jidelwl@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg'),
(61, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'emmanuelokereke321@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg');

-- --------------------------------------------------------

--
-- Table structure for table star_rating
--

CREATE TABLE star_rating (
  rate_id BIGINT NOT NULL AUTO_INCREMENT,
  rate_count INT NOT NULL,
  product_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (rate_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table wallet_coin
--

CREATE TABLE wallet_coin (
  wallet_id BIGINT NOT NULL AUTO_INCREMENT,
  wallet_amount DECIMAL(11,2) NOT NULL,
  wallet_user BIGINT NOT NULL,
  PRIMARY KEY (wallet_id),
  FOREIGN KEY (wallet_user) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table wallet_coin
--

INSERT INTO wallet_coin (wallet_id, wallet_amount, wallet_user) VALUES
(1, 0.00, 1),
(2, 450.00, 2),
(3, 0.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table wallet_earnings
--

CREATE TABLE wallet_earnings (
  wallet_id BIGINT NOT NULL AUTO_INCREMENT,
  wallet_amount DECIMAL(11,2) NOT NULL,
  wallet_user BIGINT NOT NULL,
  PRIMARY KEY (wallet_id),
  FOREIGN KEY (wallet_user) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table wallet_earnings
--

INSERT INTO wallet_earnings (wallet_id, wallet_amount, wallet_user) VALUES
(1, 0.00, 1),
(2, 450.00, 2),
(3, 0.00, 3);

--
-- Table structure for table wallet_earnings
--

CREATE TABLE wallet_earnings_backup (
  wallet_id BIGINT NOT NULL AUTO_INCREMENT,
  wallet_amount DECIMAL(11,2) NOT NULL,
  wallet_user BIGINT NOT NULL,
  PRIMARY KEY (wallet_id),
  FOREIGN KEY (wallet_user) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table withdrawals
--

CREATE TABLE withdrawals (
  withdrawal_id BIGINT NOT NULL AUTO_INCREMENT,
  withdrawal_amount DECIMAL(15,2) NOT NULL,
  withdrawal_bank VARCHAR(1000) NOT NULL,
  withdrawal_date VARCHAR(255) NOT NULL,
  withdrawal_status VARCHAR(255) NOT NULL,
  withdrawal_narration VARCHAR(1000) NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (withdrawal_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table withdrawals
--

INSERT INTO withdrawals (withdrawal_id, withdrawal_amount, withdrawal_bank, withdrawal_date, withdrawal_status, withdrawal_narration, user_id) VALUES
(131, 14.00, 'OPay Digital Services Limited (OPay)', '2025-03-13', 'Pending', 'Withdrawal request of $14.00 for Thursday, March 13, 2025', 1),
(132, 12.20, 'OPay Digital Services Limited (OPay)', '2025-03-13 22:04', 'Pending', 'Withdrawal request of $12.20 for Thursday, March 13, 2025', 2),
(133, 4.00, 'OPay Digital Services Limited (OPay)', '2025-04-10', 'Completed', 'Withdrawal request of $4.00 for Thursday, April 10, 2025', 3);

-- --------------------------------------------------------

--
-- Table structure for table chat_contents
--

CREATE TABLE chat_contents (
  contentID BIGINT NOT NULL AUTO_INCREMENT,
  content_type VARCHAR(100) NOT NULL,
  content_sender VARCHAR(2000) NOT NULL,
  content_date VARCHAR(100) NOT NULL,
  content_time VARCHAR(100) NOT NULL,
  content_message VARCHAR(5000) NOT NULL,
  content_filename VARCHAR(255) NOT NULL,
  content_extension VARCHAR(20) NOT NULL,
  chatID BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

