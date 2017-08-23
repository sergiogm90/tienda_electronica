-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2017 a las 18:06:50
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `color`) VALUES
(1, 'Moviles', 'Moviles', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, perferendis!', '#440022'),
(2, 'Camaras', 'Camaras', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, perferendis!', '#440022'),
(3, 'Consolas', 'Consolas', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, perferendis!', '#440022'),
(4, 'Ordenadores', 'Ordenadores', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore, perferendis!', '#445500'),
(5, 'Videojuegos', 'videojuegos', 'Videjuegos de la tienda TecnoShop', '#000000'),
(6, 'Tablets', 'tablets', 'Tablets de la tienda TecnoShop', '#000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_07_01_095505_create_categories_table', 1),
('2015_07_01_095519_create_products_table', 1),
('2015_08_23_202538_create_orders_table', 1),
('2015_08_23_202546_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping` decimal(10,2) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `subtotal`, `shipping`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '345.00', '10.00', 2, '2017-06-13 11:03:32', '2017-06-13 11:03:32'),
(2, '1535.00', '10.00', 2, '2017-06-13 16:09:20', '2017-06-13 16:09:20'),
(3, '580.00', '10.00', 2, '2017-06-18 13:47:06', '2017-06-18 13:47:06'),
(4, '1245.00', '10.00', 1, '2017-07-18 21:25:18', '2017-07-18 21:25:18'),
(5, '849.00', '10.00', 1, '2017-07-23 13:44:38', '2017-07-23 13:44:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id`, `quantity`, `price`, `product_id`, `order_id`) VALUES
(1, 1, '345.00', 2, 1),
(2, 3, '345.00', 2, 2),
(3, 1, '500.00', 5, 2),
(4, 1, '280.00', 8, 3),
(5, 1, '300.00', 3, 3),
(6, 1, '345.00', 2, 4),
(7, 1, '900.00', 10, 4),
(8, 2, '80.00', 1, 5),
(9, 1, '689.00', 6, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extract` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `image` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `extract`, `price`, `image`, `visible`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Canon', 'Camara-1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '80.00', '/img/camara1.jpg', 1, 2, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(2, 'Pentax', 'Camara-3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '345.00', '/img/camara3.jpg', 1, 2, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(3, 'nintendo switch 3', 'Consola-3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '300.00', '/img/consola3.jpg', 1, 3, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(4, 'PS4', 'Consola-2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '355.99', '/img/consola2.png', 1, 3, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(5, 'Samsum s7', 'Movil-1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '500.00', '/img/movil1.jpg', 1, 1, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(6, 'Iphone 7', 'Movil-2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '689.00', '/img/movil4.jpg', 1, 1, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(7, 'Packarbel', 'Ordenador-3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '575.00', '/img/pc3.jpg', 1, 4, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(8, 'Portatil HP', 'Ordenador-5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '280.00', '/img/pc5.jpg', 1, 4, '2017-05-30 18:59:05', '2017-05-30 18:59:05'),
(9, 'Tablet lonovo', 'tablet-lonovo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '500.00', '/img/tablet1.jpg', 1, 6, '2017-06-21 10:16:38', '2017-06-21 10:16:38'),
(10, 'Tablet Samsung', 'tablet-samsung', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '900.00', '/img/tablet3.jpg', 1, 6, '2017-06-21 10:18:03', '2017-06-21 10:18:03'),
(11, 'Mafia III', 'mafia-iii', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Delectus repellendus doloribus molestias odio nisi! Aspernatur eos saepe veniam quibusdam totam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', '50.00', '/img/juego1.jpg', 1, 5, '2017-06-21 10:19:00', '2017-06-21 10:19:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('user','admin') COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `user`, `password`, `type`, `active`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Frank', 'Pereira', 'franper88@hotmail.com', 'franper', '$2y$10$/..31XSDk2XYGIHAHq/vr.nfRRL1A/qygoD3LN2HLUYrVZ61lI1Nm', 'admin', 1, 'San Cosme 290, Cuauhtemoc, D.F.', '4myJni9OGxlqFRYopHW2aY4iuALbF639EaG9jvIe6LLWrp3W5P0oBmjAfGlY', '2017-05-30 18:59:05', '2017-07-18 21:26:58'),
(2, 'Daniel', 'Martin', 'daniel@hotmail.com', 'daniel', '$2y$10$OX.3EzDOKC12Cy/EylcCy.adLHApgOo80oM7P2/QSFL.LDT0t4AV.', 'user', 1, 'Tonala 321, Jalisco', '4yF2rTGKfmKtSs37Tm1i6lt9oylWBVDfW2p6UXActAZ2vRpHYybY2XOMDigh', '2017-05-30 18:59:05', '2017-06-18 13:47:26'),
(3, 'Mari Carmen', 'Alelú', 'carmen@hotmail.com', 'Carmen', '$2y$10$rxIxk.miMtLK4zPNSeZr.OoA/IoCX9RciqX6LA64dVWM7VWnUThC2', 'user', 1, 'Calle avutarda', 'zIJW87BtMwIhg69F5p4BXVk1qnJuxGGN3CAE0FWff9jKB6GIeItN16cFyUrD', '2017-06-13 16:10:47', '2017-06-13 16:11:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_user_unique` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
