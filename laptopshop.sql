-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2019 at 10:16 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptopshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(17, 17, '2019-09-21', 98858000, 'COD', NULL, '2019-09-20 18:20:48', '2019-09-20 18:20:48'),
(18, 18, '2019-09-21', 98858000, 'COD', NULL, '2019-09-20 18:22:20', '2019-09-20 18:22:20'),
(19, 19, '2019-09-21', 55258000, 'ATM', NULL, '2019-09-20 18:24:18', '2019-09-20 18:24:18'),
(20, 20, '2019-09-21', 20159000, 'ATM', NULL, '2019-09-20 18:34:13', '2019-09-20 18:34:13'),
(21, 21, '2019-09-21', 25899000, 'ATM', NULL, '2019-09-20 18:35:55', '2019-09-20 18:35:55'),
(22, 22, '2019-09-21', 14429000, 'ATM', NULL, '2019-09-20 18:37:05', '2019-09-20 18:37:05'),
(23, 23, '2019-09-21', 26400000, 'ATM', NULL, '2019-09-20 18:39:33', '2019-09-20 18:39:33'),
(24, 24, '2019-09-21', 26400000, 'COD', NULL, '2019-09-20 18:40:26', '2019-09-20 18:40:26'),
(25, 25, '2019-09-21', 26400000, 'ATM', NULL, '2019-09-20 22:01:23', '2019-09-20 22:01:23'),
(26, 26, '2019-09-21', 26400000, 'COD', NULL, '2019-09-20 22:02:45', '2019-09-20 22:02:45'),
(27, 29, '2019-09-21', 25899000, 'ATM', NULL, '2019-09-20 22:08:25', '2019-09-20 22:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(19, 18, 7, 1, 20159000, '2019-09-20 18:22:20', '2019-09-20 18:22:20'),
(20, 18, 2, 2, 26400000, '2019-09-20 18:22:20', '2019-09-20 18:22:20'),
(21, 18, 1, 1, 25899000, '2019-09-20 18:22:20', '2019-09-20 18:22:20'),
(22, 19, 2, 1, 26400000, '2019-09-20 18:24:18', '2019-09-20 18:24:18'),
(23, 19, 12, 2, 14429000, '2019-09-20 18:24:18', '2019-09-20 18:24:18'),
(24, 20, 7, 1, 20159000, '2019-09-20 18:34:13', '2019-09-20 18:34:13'),
(25, 21, 1, 1, 25899000, '2019-09-20 18:35:55', '2019-09-20 18:35:55'),
(26, 22, 12, 1, 14429000, '2019-09-20 18:37:05', '2019-09-20 18:37:05'),
(27, 23, 2, 1, 26400000, '2019-09-20 18:39:33', '2019-09-20 18:39:33'),
(28, 24, 2, 1, 26400000, '2019-09-20 18:40:26', '2019-09-20 18:40:26'),
(29, 25, 2, 1, 26400000, '2019-09-20 22:01:23', '2019-09-20 22:01:23'),
(30, 26, 2, 1, 26400000, '2019-09-20 22:02:45', '2019-09-20 22:02:45'),
(31, 27, 1, 1, 25899000, '2019-09-20 22:08:25', '2019-09-20 22:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(18, 'Tran Tu', 'nam', 'eg.attran@gmail.com', 'pham the hien', '0123456789', NULL, '2019-09-20 18:22:20', '2019-09-20 18:22:20'),
(24, 'hoai tien', 'nữ', 'hoaitien@gmail.com', 'sai gon', '0123456789', NULL, '2019-09-20 18:40:26', '2019-09-20 18:40:26'),
(28, 'ngoc huyen', 'nam', 'ngochuyen@gmail.com', 'quan 7', '43124314321', NULL, '2019-09-20 22:04:58', '2019-09-20 22:04:58'),
(29, 'trang', 'nữ', 'trang@gmail.com', 'binh tan', '2343214312', NULL, '2019-09-20 22:08:25', '2019-09-20 22:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Dell Gaming G7 7588 70183902 Core i7-8750H/ GTX1050 Ti 4GB/ Dos (15.6\" FHD IPS)', 7, 'Laptop chính hãng', 25899000, 23899000, 'p1.jpg', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Laptop Macbook ZenBook UX433FN-A6125T Core i5-8265U/Win10 (14\" FHD)', 2, 'Laptop chính hãng', 26400000, 24400000, 'p2.jpg', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Laptop Dell Vivobook S15 S530UA-BQ135T Core i3-8130U/Win 10 (15.6\" FHD)', 1, 'Laptop chính hãng', 12899000, 10899000, 'p3.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Laptop Asus Vivobook A512FA-EJ440T Core i5-8265U/ Win10 (15.6 FHD)', 6, 'Laptop chính hãng', 16269000, 0, 'p4.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Laptop Dell ROG Strix G G531GD-AL034T Core i7-9750H/ GTX 1050 4GB/ Win10 (15.6 FHD IPS 120Hz)', 5, 'Laptop chính hãng', 20469000, 0, 'p5.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Laptop Dell ZenBook UX433FN-A6125T Core i5-8265U/Win10 (14\" FHD)', 1, 'Laptop chính hãng', 22290000, 20290000, 'p6.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Laptop MSI Zenbook UX433FA-A6061T Core i5-8265U/Win10 (14\" FHD IPS)', 1, 'Laptop chính hãng', 20159000, 0, 'p7.jpg', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Laptop MSI Vivobook 14 A412FA-EK224T Core i5-8265U/ Win10 (14 FHD)', 2, 'Laptop chính hãng', 17419000, 15419000, 'p8.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Laptop Asus Vivobook X407MA-BV043T Celeron N4000/Win10 (14 inch)', 1, 'Laptop chính hãng', 8079000, 6079000, 'p9.jpg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(10, 'Laptop Asus Vivobook 14 A412FA-EK155T Core i3-8145U/Win10 (14\" FHD)', 1, 'Laptop chính hãng', 10889000, 0, 'p10.jpg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(11, 'Laptop Asus Vivobook 14 A412FA-EK156T Core i3-8145U/Win10 (14\" FHD)', 1, 'Laptop chính hãng', 12690000, 10690000, 'p11.jpg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Laptop Asus Vivobook S15 S530UA-BQ176T Core i3-8130U/Win10 (15.6 inch FHD IPS)', 6, 'Laptop chính hãng', 14429000, 12429000, 'p12.jpg', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Laptop Asus ROG Strix G G531GD-AL034T Core i7-9750H/ GTX 1050 4GB/ Win10 (15.6 FHD IPS 120Hz)', 1, 'Laptop chính hãng', 28990000, 26990000, 'p13.jpg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Laptop Gaming MSI GF63 Thin 9SC-070VN Core i7-9750H/GTX 1650 4GB/Win10 (15.6 FHD IPS)', 6, 'Laptop chính hãng', 26489000, 25489000, 'p14.jpg', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Microsoft Surface Pro 2018 - Core i5-8250U/8G/128GB', 5, 'Laptop chính hãng', 24690000, 22690000, 'p15.jpg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Laptop Lenovo Vivobook X407MA-BV039T Pentium N5000/Win10 (14.0 inch) (Gold)', 1, 'Laptop chính hãng', 8929000, 6929000, 'p16.jpg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Apple Macbook Pro Touch Bar 2019 - 13 inchs (i5/ 8GB/ 128GB)', 4, 'Laptop chính hãng', 34369000, 0, 'p17.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(18, 'Apple Macbook Pro Touch Bar 2019 - 13 inchs (i5/ 8GB/ 128GB)', 4, 'Laptop chính hãng', 32369000, 0, 'p18.jpg', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Laptop Asus Vivobook Vivobook A512DA-EJ422T AMD R5-3500U/Win10 (15.6 FHD)', 5, 'Laptop chính hãng', 13909000, 0, 'p19.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Laptop Lenovo IdeaPad L340-15IRH 81LK007HVN Core i5-9300H/ GTX 1050 3GB/ Dos (15.6 FHD IPS)', 3, 'Laptop chính hãng', 17989000, 15989000, 'p20.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Laptop Lenovo Legion Y530-15ICH 81FV00STVN Core i5-8300H/Dos (15.6\" FHD)', 3, 'Laptop chính hãng', 20699000, 19699000, 'p21.jpg', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Laptop LG Gram 2018 13ZD980-G AX52A5 Core i5-8250U / Free Dos (13.3 inch) – White', 2, 'Laptop chính hãng', 24990000, 0, 'p22.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Laptop LG Zenbook 13 UX333FA-A4116T Core i7-8565U/Win10/ Numpad (13.3\" FHD)', 1, 'Laptop chính hãng', 25999000, 0, 'p23.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Laptop Asus Zenbook 15 UX533FD-A9091T Core i5-8265U/ Win10 (15.6 FHD)', 7, 'Laptop chính hãng', 27290000, 25290000, 'p24.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Laptop Microsoft TUF Gaming FX505DT-AL003T AMD R7-3750H/ GTX 1650 4GB/ Win10 (15.6\" FHD IPS 120Hz)', 1, 'Laptop chính hãng', 21629000, 0, 'p25.jpg', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `image`) VALUES
(1, 'banner1.jpg'),
(2, 'banner2.jpg'),
(3, 'banner3.jpg'),
(4, 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ASUS', NULL, NULL),
(2, 'LG', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'LENOVO', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'MACBOOK', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'MICROSOFT', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'MSI', '2016-10-25 17:19:00', NULL),
(7, 'DELL', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Admin', 'admin@laptopshop.com', '$2y$10$0.WX/u/uVIBDnV8qrbe7qeaU/uQS5KkEUEsOw0b31XgwWF/9FxAnG', '0812345678', NULL, NULL, '2019-09-20 21:53:05', '2019-09-20 21:53:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
