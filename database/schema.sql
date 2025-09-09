--
-- Database: `chroayol_store`
--
CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

-- --------------------------------------------------------

--
-- Table structure for table ` users`
--
CREATE TABLE `users` (
  `userID` BIGINT NOT NULL AUTO_INCREMENT,
  `avatar` VARCHAR(1000) NOT NULL,
  `fullname` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `contact` VARCHAR(100) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `user_type` VARCHAR(255) NOT NULL,
  `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--
INSERT INTO `users` (`userID`, `avatar`, `fullname`, `email`, `contact`, `country`, `user_password`, `user_type`, `created_on`, `updated_on`) VALUES
(1, 'None', 'Smart Wisdom', 'mrwisdom8086@gmail.com', '+234234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'Admin', '2023-05-15 00:00:00', NULL),
(2, 'None', 'Okeke Chukwuebuka', 'chukwuebukaokeke09@gmail.com', '+2349026928911', 'Nigeria', '$2y$10$XLHKnVjgofU8tcc//kahJuQKRTkBDPun5W/lgoJBPqIkGbk890j0i', 'Admin', '2023-05-15 00:00:00', NULL),
(3, 'None', 'Test User', 'testuser@gmail.com', '+234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'User', '2024-09-16 03:34:00', NULL),
(4, 'None', 'Test Merchant', 'testmerchant@gmail.com', '+234567890', 'Nigeria', '$2y$10$/n1C8bZNxXB2efE4JMc40.xYeF5XlSP9fqGyDQpINO25Yp2gl3KFK', 'Merchant', '2024-09-16 03:34:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--
CREATE TABLE `bank_details` (
  `detailsID` BIGINT NOT NULL AUTO_INCREMENT,
  `account_number` VARCHAR(10) NOT NULL,
  `bank_name` VARCHAR(2000) NOT NULL,
  `bank_code` VARCHAR(100) NOT NULL,
  `currency_code` VARCHAR(100) NOT NULL,
  `userID` BIGINT NOT NULL,
  PRIMARY KEY (`detailsID`),
  FOREIGN KEY (`userID`) REFERENCES `users`(`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `linkID` BIGINT NOT NULL,
  `facebook_link` VARCHAR(2000) NOT NULL,
  `instagram_link` VARCHAR(2000) NOT NULL,
  `tiktok_link` VARCHAR(2000) NOT NULL,
  `twitter_link` VARCHAR(2000) NOT NULL,
  `userID` BIGINT NOT NULL,
  PRIMARY KEY (`linkID`),
  FOREIGN KEY (`userID`) REFERENCES `users`(`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `affiliateID` BIGINT NOT NULL,
  `affiliate_profile` VARCHAR(1000) NOT NULL,
  `fullname` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `account_password` VARCHAR(255) NOT NULL,
  `created_on` VARCHAR(255) NOT NULL,
  `affiliate_status` VARCHAR(255) NOT NULL,
  `instagram_link` VARCHAR(2000) NOT NULL,
  `tiktok_link` VARCHAR(2000) NOT NULL,
  `twitter_link` VARCHAR(2000) NOT NULL,
  `facebook_link` VARCHAR(2000) NOT NULL,
  `account_number` VARCHAR(10) NOT NULL,
  `bank` VARCHAR(2000) NOT NULL,
  `bank_code` VARCHAR(100) NOT NULL,
  `recipient_code` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `affiliate_course_sales`
--

CREATE TABLE `affiliate_course_sales` (
  `salesID` BIGINT NOT NULL,
  `sales_email` VARCHAR(100) NOT NULL,
  `sales_contact` VARCHAR(255) NOT NULL,
  `sales_amount` BIGINT NOT NULL,
  `sales_date` VARCHAR(255) NOT NULL,
  `sales_time` VARCHAR(255) NOT NULL,
  `sales_status` VARCHAR(255) NOT NULL,
  `sales_txref` VARCHAR(255) NOT NULL,
  `sales_type` VARCHAR(255) NOT NULL,
  `sales_narration` VARCHAR(255) NOT NULL,
  `sellerID` BIGINT NOT NULL,
  `courseID` BIGINT NOT NULL,
  `trackingID` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affiliate_course_sales`
--

INSERT INTO `affiliate_course_sales` (`salesID`, `sales_email`, `sales_contact`, `sales_amount`, `sales_date`, `sales_time`, `sales_status`, `sales_txref`, `sales_type`, `sales_narration`, `sellerID`, `courseID`, `trackingID`) VALUES
(354, 'ogunyemitemitope190@gmail.com', '+2347062309859', 13500, '2025-03-09', '17:10', 'Completed', '250309020100618511113733', 'Affiliate', 'Contest', 260, 1, 'Order-1741536655'),
(355, 'blessingalabi1203@gmail.com', '+2348163402601', 13500, '2025-03-09', '17:13', 'Completed', '250309020100618642084518', 'Affiliate', 'Contest', 260, 1, 'Order-1741536834');
-- --------------------------------------------------------

--
-- Table structure for table `affiliate_course_sales_backup`
--

CREATE TABLE `affiliate_course_sales_backup` (
  `salesID` BIGINT NOT NULL,
  `sales_email` VARCHAR(100) NOT NULL,
  `sales_contact` VARCHAR(255) NOT NULL,
  `sales_amount` BIGINT NOT NULL,
  `sales_date` VARCHAR(255) NOT NULL,
  `sales_time` VARCHAR(255) NOT NULL,
  `sales_status` VARCHAR(255) NOT NULL,
  `sales_txref` VARCHAR(255) NOT NULL,
  `sales_type` VARCHAR(255) NOT NULL,
  `sales_narration` VARCHAR(255) NOT NULL,
  `sellerID` BIGINT NOT NULL,
  `courseID` BIGINT NOT NULL,
  `affiliate_commission` VARCHAR(10) NOT NULL,
  `trackingID` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affiliate_course_sales_backup`
--

INSERT INTO `affiliate_course_sales_backup` (`salesID`, `sales_email`, `sales_contact`, `sales_amount`, `sales_date`, `sales_time`, `sales_status`, `sales_txref`, `sales_type`, `sales_narration`, `sellerID`, `courseID`, `affiliate_commission`, `trackingID`) VALUES
(1, 'wonderful2like@gmail.com', '+23499 Atu Street, Calabar ', 10000, '2024-05-08', '20:56', 'Pending', 'txn1715198175', 'Admin', 'Regular', 1, 1, '5000', 'Order-1715198175'),
(2, 'wonderful2like@gmail.com', '+2349 Atu Street Calabar ', 10000, '2024-05-12', '21:53', 'Pending', 'txn1715547234', 'Admin', 'Regular', 1, 1, '5000', 'Order-1715547234'),
(3, 'ogbonnaaugustine03@gmail.com', '+2348144957429', 10000, '2024-05-28', '22:41', 'Pending', 'txn1716932499', 'Admin', 'Regular', 1, 1, '5000', 'Order-1716932499'),
(4, 'hhhhh@gmail.com', '+2348166677333', 10000, '2024-05-31', '03:44', 'Pending', 'txn1717123452', 'Admin', 'Regular', 1, 1, '5000', 'Order-1717123452');
-- --------------------------------------------------------

--
-- Table structure for table `affiliate_program_course`
--

CREATE TABLE `affiliate_program_course` (
  `courseID` BIGINT NOT NULL,
  `course_title` VARCHAR(255) NOT NULL,
  `course_description` VARCHAR(10000) NOT NULL,
  `course_cover_page` VARCHAR(255) NOT NULL,
  `course_type` VARCHAR(255) NOT NULL,
  `course_status` VARCHAR(255) NOT NULL,
  `course_authors` VARCHAR(255) NOT NULL,
  `course_amount` VARCHAR(255) NOT NULL,
  `sales_page` VARCHAR(1000) NOT NULL,
  `course_category` VARCHAR(1000) NOT NULL,
  `course_narration` VARCHAR(1000) NOT NULL,
  `admin_percentage` VARCHAR(255) NOT NULL,
  `affiliate_percentage` VARCHAR(255) NOT NULL,
  `uploaded_on` VARCHAR(100) NOT NULL,
  `folder_path` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affiliate_program_course`
--

INSERT INTO `affiliate_program_course` (`courseID`, `course_title`, `course_description`, `course_cover_page`, `course_type`, `course_status`, `course_authors`, `course_amount`, `sales_page`, `course_category`, `course_narration`, `admin_percentage`, `affiliate_percentage`, `uploaded_on`, `folder_path`) VALUES
(1, 'Whatsapp Monetization Course', 'If you want to learn how to make money by promoting products online as an affiliate marketer, then the Chromstack (WMC) course is perfect for you! It is suitable for both beginners and experts and covers everything you need to know to succeed as an affiliate marketer and make massive money online.In this course, you will learn about the best practices and tools for affiliate marketing, from picking the right products to\npromoting them effectively with innovative technology tools. By buying this course, you will discover how to become a successful digital affiliate marketer and start making money on Chromstack.', 'cover-page.jpeg', 'Affiliate', 'Approved', 'Chromstack', '13500', 'null', 'Marketing & Sales', 'Digital Course', '50%', '50%', '2024-02-26 15:47:30', 'Whatsapp-monetization-course');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chatID` BIGINT NOT NULL,
  `receiver_name` VARCHAR(1000) NOT NULL,
  `sender_name` VARCHAR(300) NOT NULL,
  `sender_type` VARCHAR(500) NOT NULL,
  `receiver_type` VARCHAR(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_contents`
--

CREATE TABLE `chat_contents` (
  `contentID` BIGINT NOT NULL,
  `content_type` VARCHAR(100) NOT NULL,
  `content_sender` VARCHAR(2000) NOT NULL,
  `content_date` VARCHAR(100) NOT NULL,
  `content_time` VARCHAR(100) NOT NULL,
  `content_message` VARCHAR(5000) NOT NULL,
  `content_filename` VARCHAR(255) NOT NULL,
  `content_extension` VARCHAR(20) NOT NULL,
  `chatID` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_notifications`
--

CREATE TABLE `chat_notifications` (
  `notificationID` BIGINT NOT NULL,
  `action` VARCHAR(2000) NOT NULL,
  `chatID` BIGINT NOT NULL,
  `created` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contest`
--

CREATE TABLE `contest` (
  `contestID` BIGINT NOT NULL,
  `contest_title` VARCHAR(2000) NOT NULL,
  `contest_description` VARCHAR(5000) NOT NULL,
  `contest_start_date` VARCHAR(100) NOT NULL,
  `contest_end_date` VARCHAR(100) NOT NULL,
  `contest_status` VARCHAR(255) NOT NULL,
  `courseID` BIGINT NOT NULL,
  `course_type` VARCHAR(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contest`
--

INSERT INTO `contest` (`contestID`, `contest_title`, `contest_description`, `contest_start_date`, `contest_end_date`, `contest_status`, `courseID`, `course_type`) VALUES
(1, 'WhatsApp Monetization Sales Contest 1.0', '<p>Chromstack launches her second sales challenge, <b>WhatsApp Monetization Sales Contest 1.0. </b>Here are the rules guiding the sales challenge:</p><ul><li>From the period of 21st September to 21st December 2024, every participant in the challenge is required to copy their unique sales link from the active contest page of their dashboard.</li><li>Every sales challenge package is independent of one another, for example, if you win 400 sales, you will be rewarded for making 400 sales and not every other rewards.</li><li>Every winner of any package will be rewarded accordingly.</li><li>Every participant should strive to hit high sales targets so as to be able to get high rewards.</li></ul>', '2024-09-21', '2024-12-21', 'Completed', 1, 'Affiliate'),

-- --------------------------------------------------------

--
-- Table structure for table `contest_short_links`
--

CREATE TABLE `contest_short_links` (
  `linkID` BIGINT NOT NULL,
  `contest_name` VARCHAR(1000) NOT NULL,
  `course_id` BIGINT NOT NULL,
  `course_type` VARCHAR(100) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `user_type` VARCHAR(20) NOT NULL,
  `short_link` VARCHAR(100) NOT NULL,
  `long_link` VARCHAR(1000) NOT NULL,
  `short_code` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contest_short_links`
--

INSERT INTO `contest_short_links` (`linkID`, `contest_name`, `course_id`, `course_type`, `user_id`, `user_type`, `short_link`, `long_link`, `short_code`) VALUES
(1, 'WhatsApp Monetization Sales Contest 1.0', 1, 'Affiliate', 1, 'Affiliate', 'https://chromstack.com/c?f78aa2f2f82d', 'https://chromstack.com/main-course-purchase.php?ref=1&id=1&type=Affiliate&sales=Affiliate&narration=Contest', 'f78aa2f2f82d'),
(2, 'WhatsApp Monetization Sales Contest 1.0', 1, 'Affiliate', 2, 'Affiliate', 'https://chromstack.com/c?f77f5e410611', 'https://chromstack.com/main-course-purchase.php?ref=2&id=1&type=Affiliate&sales=Affiliate&narration=Contest', 'f77f5e410611');

--
-- Table structure for table `course_category`
--

CREATE TABLE `course_category` (
  `categoryID` BIGINT NOT NULL,
  `category_name` VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_category`
--

INSERT INTO `course_category` (`categoryID`, `category_name`) VALUES
(1, 'Arts & Crafts'),
(2, 'Business'),
(3, 'Content & Media'),
(4, 'Discoveries'),
(5, 'Education'),
(6, 'Faith'),
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
-- Table structure for table `general_notifications`
--

CREATE TABLE `general_notifications` (
  `notificationID` BIGINT NOT NULL,
  `notification_title` VARCHAR(1000) NOT NULL,
  `notification_details` VARCHAR(1000) NOT NULL,
  `notification_type` VARCHAR(255) NOT NULL,
  `notification_name` VARCHAR(255) NOT NULL,
  `notification_receiver_email` VARCHAR(255) NOT NULL,
  `notification_date` VARCHAR(50) NOT NULL,
  `notification_status` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_notifications`
--

INSERT INTO `general_notifications` (`notificationID`, `notification_title`, `notification_details`, `notification_type`, `notification_name`, `notification_receiver_email`, `notification_date`, `notification_status`) VALUES
(1, 'uploaded affiliate main course', 'The main course with the title <b>P.R.O.F.I.T  Blueprints</b> was uploaded', 'course_upload', 'Admin', 'izuchukwuokuzu@gmail.com', '2024-02-26 15:47:30', 'Seen'),
(2, 'uploaded affiliate main course', 'The main course with the title <b>P.R.O.F.I.T  Blueprints</b> was uploaded', 'course_upload', 'Admin', 'chukwuebukaokeke09@gmail.com', '2024-02-26 15:47:30', 'Seen');

-- --------------------------------------------------------

--
-- Table structure for table `mailbox`
--

CREATE TABLE `mailbox` (
  `mailID` BIGINT NOT NULL,
  `mail_type` VARCHAR(100) NOT NULL,
  `mail_subject` VARCHAR(1000) NOT NULL,
  `mail_sender` VARCHAR(2000) NOT NULL,
  `mail_receiver` VARCHAR(2000) NOT NULL,
  `mail_date` VARCHAR(100) NOT NULL,
  `mail_time` VARCHAR(100) NOT NULL,
  `mail_message` VARCHAR(5000) NOT NULL,
  `mail_filename` VARCHAR(255) NOT NULL,
  `mail_extension` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mailbox`
--

INSERT INTO `mailbox` (`mailID`, `mail_type`, `mail_subject`, `mail_sender`, `mail_receiver`, `mail_date`, `mail_time`, `mail_message`, `mail_filename`, `mail_extension`) VALUES
(59, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'izuchukwuokuzu@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg'),
(60, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'jidelwl@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg'),
(61, 'Multimedia', 'Email marketing', 'Okeke Chukwuebuka Augustine', 'emmanuelokereke321@gmail.com', '2024-03-09', '13:33', '<p>Email marketing is the act of sending a commercial message, typically to a group of people, using email.</p><p>&nbsp;In its broadest sense, every email sent to a potential or current customer could be considered email marketing.&nbsp;</p><p>&nbsp;It involves using email to send advertisements, request business, or solicit sales or donations.</p>', 'cat.jpeg', 'jpeg');
-- --------------------------------------------------------

--
-- Table structure for table `membership_payment`
--

CREATE TABLE `membership_payment` (
  `paymentID` BIGINT NOT NULL,
  `payment_email` VARCHAR(1000) NOT NULL,
  `payment_type` VARCHAR(1000) NOT NULL,
  `paid_amount` BIGINT NOT NULL,
  `payment_date` VARCHAR(500) NOT NULL,
  `payment_status` VARCHAR(500) NOT NULL,
  `payment_ref` VARCHAR(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_courses`
--

CREATE TABLE `purchased_courses` (
  `purchaseID` BIGINT NOT NULL,
  `purchase_date` VARCHAR(100) NOT NULL,
  `purchase_status` VARCHAR(100) NOT NULL,
  `buyer_email` VARCHAR(100) NOT NULL,
  `course_amount` BIGINT NOT NULL,
  `courseID` BIGINT NOT NULL,
  `course_type` VARCHAR(300) NOT NULL,
  `trackingID` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchased_courses`
--

INSERT INTO `purchased_courses` (`purchaseID`, `purchase_date`, `purchase_status`, `buyer_email`, `course_amount`, `courseID`, `course_type`, `trackingID`) VALUES
(1, '2024-05-08', 'Pending', 'wonderful2like@gmail.com', 10000, 1, 'Student', 'Order-1715198175'),
(2, '2024-05-12', 'Pending', 'wonderful2like@gmail.com', 10000, 1, 'Student', 'Order-1715547234'),
(3, '2024-05-28', 'Pending', 'ogbonnaaugustine03@gmail.com', 10000, 1, 'Affiliate', 'Order-1716932499');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewID` BIGINT NOT NULL,
  `fullname` VARCHAR(300) NOT NULL,
  `profile` VARCHAR(100) NOT NULL,
  `review_comment` VARCHAR(5000) NOT NULL,
  `review_time` VARCHAR(100) NOT NULL,
  `courseID` BIGINT NOT NULL,
  `course_type` VARCHAR(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewID`, `fullname`, `profile`, `review_comment`, `review_time`, `courseID`, `course_type`) VALUES
(1, 'Jonathan Rowland Obinna', 'Screenshot_20240305-1527201710890298.webp', 'This platform is a great place to find quality courses on a variety of topics. The courses are well-organized, easy to follow, and packed with useful information. Whether you\'re looking to brush up on your skills or learn something new, this platform has something for everyone. Plus, the prices are very reasonable, making it easy to find the perfect course without breaking the bank. So if you\'re looking to expand your knowledge, this is the platform for you!', '4/4/2024, 8:03:10 PM', 1, 'Affiliate'),
(2, 'Boamah Yankah Priscilla', 'null', 'Very help.... cleared most of my doubts about Affiliate Marketing ', '18/06/2024, 18:05:21', 1, 'Affiliate'),
(4, 'Igweshi Dominic', '65DCF02F-B2D6-4234-B4E8-A6E775BDE3751726672140.webp', 'This is so interesting and more understandable ', '10/07/2024, 09:46:00', 1, 'Affiliate');

-- --------------------------------------------------------

--
-- Table structure for table `sales_short_links`
--

CREATE TABLE `sales_short_links` (
  `linkID` BIGINT NOT NULL,
  `course_id` BIGINT NOT NULL,
  `course_type` VARCHAR(100) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `user_type` VARCHAR(20) NOT NULL,
  `short_link` VARCHAR(100) NOT NULL,
  `long_link` VARCHAR(1000) NOT NULL,
  `short_code` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_short_links`
--

INSERT INTO `sales_short_links` (`linkID`, `course_id`, `course_type`, `user_id`, `user_type`, `short_link`, `long_link`, `short_code`) VALUES
(1, 1, 'Affiliate', 1, 'Admin', 'https://chromstack.com/r?007ddb', 'https://chromstack.com/main-course-purchase.php?ref=1&id=1&type=Affiliate&sales=Admin&narration=Regular', '007ddb'),
(2, 1, 'Affiliate', 2, 'Admin', 'https://chromstack.com/r?ef2e91', 'https://chromstack.com/main-course-purchase.php?ref=2&id=1&type=Affiliate&sales=Admin&narration=Regular', 'ef2e91'),
(3, 1, 'Affiliate', 3, 'Admin', 'https://chromstack.com/r?55c4f1', 'https://chromstack.com/main-course-purchase.php?ref=3&id=1&type=Affiliate&sales=Admin&narration=Regular', '55c4f1');

-- --------------------------------------------------------

--
-- Table structure for table `star_rating`
--

CREATE TABLE `star_rating` (
  `rateID` BIGINT NOT NULL,
  `rate_value` BIGINT NOT NULL,
  `course_id` BIGINT NOT NULL,
  `course_type` VARCHAR(100) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `user_type` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticketID` BIGINT NOT NULL,
  `banner` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `event_description` VARCHAR(6000) NOT NULL,
  `created_on` VARCHAR(100) NOT NULL,
  `ticket_status` VARCHAR(100) NOT NULL,
  `ownerID` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_owners`
--

CREATE TABLE `ticket_owners` (
  `ownerID` BIGINT NOT NULL,
  `fullname` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `created_on` VARCHAR(255) NOT NULL,
  `business_name` VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket_owners`
--

INSERT INTO `ticket_owners` (`ownerID`, `fullname`, `email`, `contact`, `country`, `created_on`, `business_name`) VALUES
(1, 'Promise obase', 'promiseobase3@gmail.com', '+234237672434064', 'Nigeria', '2024-10-28 09:04', 'Afiliate marketing'),
(2, 'Yahaya Saidu', 'saiduy075@gmail.com', '+2348026650232', 'Nigeria', '2024-11-20 20:07', 'Trading ');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_sales`
--

CREATE TABLE `ticket_sales` (
  `salesID` BIGINT NOT NULL,
  `name` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NOT NULL,
  `amount` BIGINT NOT NULL,
  `reference` VARCHAR(255) NOT NULL,
  `sales_status` VARCHAR(255) NOT NULL,
  `created` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `ticketID` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `paymentID` BIGINT NOT NULL,
  `payment_email` VARCHAR(100) NOT NULL,
  `payment_amount` BIGINT NOT NULL,
  `payment_account` VARCHAR(255) NOT NULL,
  `payment_bank` VARCHAR(255) NOT NULL,
  `payment_date` VARCHAR(255) NOT NULL,
  `payment_status` VARCHAR(255) NOT NULL,
  `payment_txref` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`paymentID`, `payment_email`, `payment_amount`, `payment_account`, `payment_bank`, `payment_date`, `payment_status`, `payment_txref`) VALUES
(193, 'newaffiliatesalessystem@gmail.com', 19000, '9025816071', 'OPay Digital Services Limited (OPay)', '2025-02-21 14:51:28', 'Completed', 'trfZikcDC9GH5e0TjZhU8Ws'),
(194, 'nnennamarycynthia09@gmail.com', 6000, '8167082367', 'OPay Digital Services Limited (OPay)', '2025-02-28 08:27:40', 'Completed', 'trfwEK6v2LFQcwryvIjqKAl'),
(195, 'ibukunesther07@gmail.com', 4000, '8063036947', 'OPay Digital Services Limited (OPay)', '2025-05-09 08:39:23', 'Completed', 'trfBA2c3x8CXHq5fkay8bz9'),
(196, 'prettykatherineanderson@gmail.com', 13000, '8133096392', 'OPay Digital Services Limited (OPay)', '2025-05-09 08:40:45', 'Completed', 'trfVKvH45Wq6kTMtMxYWFVg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments_backup`
--

CREATE TABLE `transaction_payments_backup` (
  `paymentID` BIGINT NOT NULL,
  `payment_email` VARCHAR(100) NOT NULL,
  `payment_amount` BIGINT NOT NULL,
  `payment_account` VARCHAR(255) NOT NULL,
  `payment_bank` VARCHAR(255) NOT NULL,
  `payment_date` VARCHAR(255) NOT NULL,
  `payment_status` VARCHAR(255) NOT NULL,
  `payment_txref` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_payments_backup`
--

INSERT INTO `transaction_payments_backup` (`paymentID`, `payment_email`, `payment_amount`, `payment_account`, `payment_bank`, `payment_date`, `payment_status`, `payment_txref`) VALUES
(1, 'igweshidominic66@gmail.com', 10000, '8100597786', 'OPay Digital Services Limited (OPay)', '2024-07-19 23:48:23', 'Completed', 'BzpAxh2kKolyPHgNpdwN'),
(2, 'okekeebuka928@gmail.com', 2800, '9026928911', 'OPay Digital Services Limited (OPay)', '2024-07-19 23:49:11', 'Completed', 'jKn7tfdklKTVeVz28HZy'),
(3, 'izuchukwuokuzu@gmail.com', 2800, '2241317701', 'United Bank For Africa', '2024-07-19 23:49:26', 'Completed', '0QnrkmVHDdMkZossdsdC');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_courses`
--

CREATE TABLE `uploaded_courses` (
  `courseID` BIGINT NOT NULL,
  `course_title` VARCHAR(255) NOT NULL,
  `course_description` VARCHAR(5000) NOT NULL,
  `course_cover_page` VARCHAR(255) NOT NULL,
  `course_type` VARCHAR(255) NOT NULL,
  `course_status` VARCHAR(255) NOT NULL,
  `course_authors` VARCHAR(255) NOT NULL,
  `course_amount` VARCHAR(255) NOT NULL,
  `sales_page` VARCHAR(1000) NOT NULL,
  `course_category` VARCHAR(1000) NOT NULL,
  `course_narration` VARCHAR(1000) NOT NULL,
  `admin_percentage` VARCHAR(255) NOT NULL,
  `affiliate_percentage` VARCHAR(255) NOT NULL,
  `vendor_percentage` VARCHAR(255) NOT NULL,
  `uploaded_on` VARCHAR(100) NOT NULL,
  `folder_path` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_courses`
--

INSERT INTO `uploaded_courses` (`courseID`, `course_title`, `course_description`, `course_cover_page`, `course_type`, `course_status`, `course_authors`, `course_amount`, `sales_page`, `course_category`, `course_narration`, `admin_percentage`, `affiliate_percentage`, `vendor_percentage`, `uploaded_on`, `folder_path`) VALUES
(3, 'Fantasies Of The Teenage Child', 'Fantasies of the Teenage Child is an insightful e-book that delves into the intricate dynamics of teenage friendships and relationships. \nAuthored with a blend of empathy and expertise, this book offers a comprehensive exploration of the emotional landscapes traversed by adolescents as they navigate the complexities of social interactions.\nDrawing from developmental psychology, personal anecdotes, and contemporary research, this book provides readers with a deep understanding of the challenges and triumphs experienced during this transformative stage of life. \nFrom the exhilarating highs of forming new friendships to the heart-wrenching lows of romantic entanglements, each chapter offers valuable insights and practical advice for both teenagers and those who support them.\nReaders will uncover the nuances of peer pressure, the impact of social media on self-esteem, and the significance of boundaries in healthy relationships. \nThrough relatable narratives and thought-provoking exercises, this book empowers teenagers to cultivate self-awareness, empathy, and resilience in their interactions with others.\nWhether you\'re a teenager seeking guidance in navigating the complexities of friendship and romance, a parent hoping to better understand your adolescent\'s experiences, or an educator aiming to support students through their social development, \"Fantasies of the Teenage Child\" is an essential resource for fostering meaningful connections and fostering emotional well-being during this pivotal stage of life.', 'cover-page.jpg', 'Admin', 'Approved', 'Okeke Chukwuebuka Augustine', '3000', 'null', 'Love & Relationship', 'e-Book', '10%', '50%', '40%', '2024-04-30 03:12:28', 'Fantasies-of-the-teenge-child'),
(4, 'Stellar Publishing Guide ', 'Learn step-by-step how anyone can add an extra $1,000 to their income monthly from Amazon without leaving their room. Stellar Publishing Guide teaches you how to successfully start and run a publishing business on Amazon with proven strategies', 'stellar-publishing.jpg', 'External', 'Approved', 'Abraham  Aiyejinna ', '25000', 'https://digitalofa.com', 'Business', 'Digital Course', '10%', '50%', '40%', '2024-04-30 04:04:41', 'null'),
(5, 'Ghostwriting Income Generator ', 'A course that will teach you how to write and how to earn from writing.', 'ghost-writing.jpeg', 'External', 'Approved', 'Daniel Sampson', '30000', 'https://Gigcourse.com', 'Education', 'Digital Course', '10%', '50%', '40%', '2024-05-05 11:56:00', 'null');
-- --------------------------------------------------------

--
-- Table structure for table `uploaded_course_sales`
--

CREATE TABLE `uploaded_course_sales` (
  `salesID` BIGINT NOT NULL,
  `sales_email` VARCHAR(100) NOT NULL,
  `sales_contact` VARCHAR(255) NOT NULL,
  `sales_amount` BIGINT NOT NULL,
  `sales_date` VARCHAR(255) NOT NULL,
  `sales_time` VARCHAR(255) NOT NULL,
  `sales_status` VARCHAR(255) NOT NULL,
  `sales_txref` VARCHAR(255) NOT NULL,
  `sales_type` VARCHAR(255) NOT NULL,
  `buyer_type` VARCHAR(100) NOT NULL,
  `sales_narration` VARCHAR(255) NOT NULL,
  `sellerID` BIGINT NOT NULL,
  `courseID` BIGINT NOT NULL,
  `trackingID` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_course_sales`
--

INSERT INTO `uploaded_course_sales` (`salesID`, `sales_email`, `sales_contact`, `sales_amount`, `sales_date`, `sales_time`, `sales_status`, `sales_txref`, `sales_type`, `buyer_type`, `sales_narration`, `sellerID`, `courseID`, `trackingID`) VALUES
(34, 'amadisammy32@gmail.com', '+2347061630032', 7000, '2025-03-04', '13:17', 'Pending', 'opay ', 'Affiliate', 'User', 'Regular', 432, 8, 'Order-1741090653'),
(35, 'Esthertega39@gmail.com', '+2349119200403', 7000, '2025-03-20', '23:44', 'Pending', '12', 'Affiliate', 'Affiliate', 'Regular', 602, 8, 'Order-1742510694'),
(36, 'elishadanielabeh@gamil.com', '', 7000, '2025-07-01', '14:17', 'Completed', '250701020100557103079452', 'Affiliate', 'Affiliate', 'Regular', 370, 8, 'Order-1751375875');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_course_sales_backup`
--

CREATE TABLE `uploaded_course_sales_backup` (
  `salesID` BIGINT NOT NULL,
  `sales_email` VARCHAR(100) NOT NULL,
  `sales_contact` VARCHAR(255) NOT NULL,
  `sales_amount` BIGINT NOT NULL,
  `sales_date` VARCHAR(255) NOT NULL,
  `sales_time` VARCHAR(255) NOT NULL,
  `sales_status` VARCHAR(255) NOT NULL,
  `sales_txref` VARCHAR(255) NOT NULL,
  `sales_type` VARCHAR(255) NOT NULL,
  `buyer_type` VARCHAR(100) NOT NULL,
  `sales_narration` VARCHAR(255) NOT NULL,
  `sellerID` BIGINT NOT NULL,
  `courseID` BIGINT NOT NULL,
  `affiliate_commission` VARCHAR(10) NOT NULL,
  `trackingID` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded_course_sales_backup`
--

INSERT INTO `uploaded_course_sales_backup` (`salesID`, `sales_email`, `sales_contact`, `sales_amount`, `sales_date`, `sales_time`, `sales_status`, `sales_txref`, `sales_type`, `buyer_type`, `sales_narration`, `sellerID`, `courseID`, `affiliate_commission`, `trackingID`) VALUES
(1, 'chineyeossai1@gmail.com', '+2349058968495', 3000, '2024-08-06', '13:53', 'Completed', 'txn1722948817', 'Affiliate', '', 'Regular', 230, 3, '1.5', 'Order-1722948817'),
(4, 'nwangannamdi69@gmail.com', '+2347042257644', 3000, '2024-08-20', '23:17', 'Completed ', '240820022872431632', 'Affiliate', 'User', 'Regular', 230, 3, '1500', 'Order-1724192221'),
(5, 'Sunshinedav181@gmail.com', '+2349136808414', 7000, '2024-11-18', '02:04', 'Completed', '100004241117150630122276794291', 'Affiliate', 'User', 'Regular', 365, 8, '4900', 'Order-1731891887');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` BIGINT NOT NULL,
  `user_profile` VARCHAR(1000) NOT NULL,
  `fullname` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `account_password` VARCHAR(255) NOT NULL,
  `created_on` VARCHAR(255) NOT NULL,
  `user_status` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `user_profile`, `fullname`, `email`, `contact`, `country`, `account_password`, `created_on`, `user_status`) VALUES
(1, 'null', 'Ossai Chineye Miracle', 'chineyeossai1@gmail.com', '+2349058968495', 'Nigeria', '$2y$10$W46wKhxaZvAy4vEHgGlgTeEHvXYt0JXMVpHSAvjJC4dc9ItpKI9s6', '2024-08-06 13:53', 'Active'),
(4, 'IMG-20240816-WA0008.jpg', 'Nwanga Nnamdi Chima', 'nwangannamdi69@gmail.com', '+2347042257644', 'Nigeria', '$2y$10$IJ2jEzNL9vWU2Pq1hpZp3OyqTEuNhGCTbooEtikaEUJSAS/seBHPK', '2024-08-20 23:17', 'Active '),
(5, 'null', 'Ebiale Sunday Ogar', 'Sunshinedav181@gmail.com', '+2349136808414', 'Nigeria', '$2y$10$h1iET3l9.MD3fqlWOv9iueImgDrh45HYoWUlmKbA0kYpHabdTsPgK', '2024-11-18 02:04', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendorID` BIGINT NOT NULL,
  `vendor_profile` VARCHAR(1000) NOT NULL,
  `fullname` VARCHAR(1000) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact` VARCHAR(100) NOT NULL,
  `country` VARCHAR(1000) NOT NULL,
  `account_password` VARCHAR(255) NOT NULL,
  `created_on` VARCHAR(255) NOT NULL,
  `vendor_status` VARCHAR(255) NOT NULL,
  `instagram_link` VARCHAR(2000) NOT NULL,
  `tiktok_link` VARCHAR(2000) NOT NULL,
  `twitter_link` VARCHAR(2000) NOT NULL,
  `facebook_link` VARCHAR(2000) NOT NULL,
  `account_number` VARCHAR(10) NOT NULL,
  `bank` VARCHAR(2000) NOT NULL,
  `bank_code` VARCHAR(100) NOT NULL,
  `recipient_code` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendorID`, `vendor_profile`, `fullname`, `email`, `contact`, `country`, `account_password`, `created_on`, `vendor_status`, `instagram_link`, `tiktok_link`, `twitter_link`, `facebook_link`, `account_number`, `bank`, `bank_code`, `recipient_code`) VALUES
(1, 'images (7)1735384868.webp', 'Jerry Doe', 'jerry@gmail.com', '+2348142978481', 'Nigeria', '$2y$10$VH/uNWwK6PjB4Ixr.NJQ7.nLlVCqteq.36qstAsDWDvGUQoyrG9WC', 'Jun 03, 2023', 'Active', '@jerry', '@jerry02', '@jerry_d', '@jerry_doe', '2370404934', 'Zenith Bank', '057', 'Not available'),
(9, 'IMG_30421713694947.webp', 'Wisdom Smart', 'mrwisdom8086@gmail.com', '+35679466310', 'Nigeria', '$2y$10$rZnByL8w1E6DYC4NJw/ZzONHx8jkcCZS.JcmBqBVce2fvp4lJ4zmu', '2024-04-18 02:12:00', 'Active', 'null', 'null', 'null', 'null', '2192893882', 'United Bank For Africa', '033', 'RCP_cz4gahf7rd1uylq'),
(12, 'null', 'Abraham  Aiyejinna ', 'aiyejinnakdp@gmail.com', '+2348169283775', 'Nigeria', '$2y$10$jMVFeDyKOrEUDa5oHMmCUeHrEnSYYpNZfEOa42Ft5dqJcpBUR1uEm', '2024-04-30 03:20:55', 'Active', 'null', 'null', 'null', 'null', '8169283775', 'OPay Digital Services Limited (OPay)', '999992', 'RCP_mhw1avm7zu8rz3i');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `walletID` BIGINT NOT NULL,
  `wallet_email` VARCHAR(100) NOT NULL,
  `wallet_amount` decimal(11,2) NOT NULL,
  `wallet_user` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`walletID`, `wallet_email`, `wallet_amount`, `wallet_user`) VALUES
(1, 'igweshidominic66@gmail.com', 0.00, 'Affiliate'),
(2, 'newaffiliatesalessystem@gmail.com', 450.00, 'Affiliate'),
(3, 'Smartwisdom8086@gmail.com', 0.00, 'Affiliate');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_downline`
--

CREATE TABLE `wallet_downline` (
  `walletID` BIGINT NOT NULL,
  `wallet_email` VARCHAR(100) NOT NULL,
  `wallet_amount` decimal(11,2) NOT NULL,
  `wallet_user` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallet_downline`
--

INSERT INTO `wallet_downline` (`walletID`, `wallet_email`, `wallet_amount`, `wallet_user`) VALUES
(1, 'igweshidominic66@gmail.com', 0.00, 'Affiliate'),
(2, 'newaffiliatesalessystem@gmail.com', 0.00, 'Affiliate'),
(3, 'Smartwisdom8086@gmail.com', 0.00, 'Affiliate');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` BIGINT NOT NULL,
  `course_title` VARCHAR(1000) NOT NULL,
  `course_status` VARCHAR(100) NOT NULL,
  `course_progress` int(100) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `user_type` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlistID`, `course_title`, `course_status`, `course_progress`, `user_id`, `user_type`) VALUES
(1, 'P.R.O.F.I.T  Blueprint', 'Pending', 0, 185, 'Affiliate'),
(2, 'P.R.O.F.I.T  Blueprint', 'Pending', 0, 186, 'Affiliate'),
(3, 'P.R.O.F.I.T  Blueprint', 'Pending', 0, 190, 'Affiliate');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_tracking`
--

CREATE TABLE `wishlist_tracking` (
  `trackID` BIGINT NOT NULL,
  `track_filename` VARCHAR(1000) NOT NULL,
  `track_status` VARCHAR(100) NOT NULL,
  `wishlistID` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist_tracking`
--

INSERT INTO `wishlist_tracking` (`trackID`, `track_filename`, `track_status`, `wishlistID`) VALUES
(1, 'PREFACE', 'Pending', 1),
(2, '1. THE BUSINESS AND AFFILIATE MINDSET', 'Pending', 1),
(3, '2. INTRODUCTION TO AFFILIATE MARKETING', 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `withdrawalID` BIGINT NOT NULL,
  `withdrawal_email` VARCHAR(100) NOT NULL,
  `withdrawal_amount` decimal(15,2) NOT NULL,
  `withdrawal_bank` VARCHAR(1000) NOT NULL,
  `withdrawal_date` VARCHAR(255) NOT NULL,
  `withdrawal_status` VARCHAR(255) NOT NULL,
  `withdrawal_narration` VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`withdrawalID`, `withdrawal_email`, `withdrawal_amount`, `withdrawal_bank`, `withdrawal_date`, `withdrawal_status`, `withdrawal_narration`) VALUES
(131, 'newaffiliatesalessystem@gmail.com', 14.00, 'OPay Digital Services Limited (OPay)', '2025-03-13', 'Pending', 'Withdrawal request of $14.00 for Thursday, March 13, 2025'),
(132, 'chukwuebukaokeke09@gmail.com', 12.20, 'OPay Digital Services Limited (OPay)', '2025-03-13 22:04', 'Pending', 'Withdrawal request of $12.20 for Thursday, March 13, 2025'),
(133, 'ibukunesther07@gmail.com', 4.00, 'OPay Digital Services Limited (OPay)', '2025-04-10', 'Completed', 'Withdrawal request of $4.00 for Thursday, April 10, 2025');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_history`
--

CREATE TABLE `withdrawal_history` (
  `withdrawalID` BIGINT NOT NULL,
  `withdrawal_email` VARCHAR(100) NOT NULL,
  `withdrawal_amount` decimal(11,2) NOT NULL,
  `withdrawal_bank` VARCHAR(1000) NOT NULL,
  `withdrawal_date` VARCHAR(255) NOT NULL,
  `withdrawal_status` VARCHAR(255) NOT NULL,
  `withdrawal_narration` VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `withdrawal_history`
--

INSERT INTO `withdrawal_history` (`withdrawalID`, `withdrawal_email`, `withdrawal_amount`, `withdrawal_bank`, `withdrawal_date`, `withdrawal_status`, `withdrawal_narration`) VALUES
(3, 'newaffiliatesalessystem@gmail.com', 5.00, 'OPay Digital Services Limited (OPay)', '2024-10-10', 'Completed', 'Withdrawal request of $5.00 for Thursday, October 10, 2024'),
(4, 'ezenniasopuru97@gmail.com', 5.00, 'OPay Digital Services Limited (OPay)', '2024-10-17', 'Completed ', 'Withdrawal request of $5.00 for Thursday, October 17, 2024'),
(5, 'ezenniasopuru97@gmail.com', 5.00, 'OPay Digital Services Limited (OPay)', '2024-10-17', 'Completed ', 'Withdrawal request of $5.00 for Thursday, October 17, 2024');
--
-- Indexes for dumped tables
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
