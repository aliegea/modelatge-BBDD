-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 16-06-2021 a les 14:48:26
-- Versió del servidor: 10.4.19-MariaDB
-- Versió de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `culDampolla`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name_customer` varchar(20) NOT NULL,
  `surname_customer` varchar(40) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `zip` varchar(11) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `reg_date` datetime NOT NULL,
  `recomended_cust` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `customers`:
--   `recomended_cust`
--       `customers` -> `customer_id`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `employee`
--

CREATE TABLE `employee` (
  `employee_nif` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `employee`:
--

--
-- Bolcament de dades per a la taula `employee`
--

INSERT INTO `employee` (`employee_nif`, `name`, `surname`) VALUES
('439841235Y', 'Jonathan', 'Llorens'),
('45349823H', 'Sonia', 'Mazos');

-- --------------------------------------------------------

--
-- Estructura de la taula `frames`
--

CREATE TABLE `frames` (
  `id_frame` varchar(20) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `supplier_nif` varchar(10) NOT NULL,
  `type` set('FLOTANTE','PASTA','METAL','') NOT NULL,
  `color` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `frames`:
--   `supplier_nif`
--       `suppliers` -> `nif_supplier`
--

--
-- Bolcament de dades per a la taula `frames`
--

INSERT INTO `frames` (`id_frame`, `brand`, `supplier_nif`, `type`, `color`, `price`) VALUES
('GC349823BG-23', 'GIORGIO ARMANI', '653923923Y', 'PASTA', 'negro', '350.20'),
('YC34980001YG-20', 'LOEWE', '653923923Y', 'METAL', 'SILVER', '1050.00');

-- --------------------------------------------------------

--
-- Estructura de la taula `lens`
--

CREATE TABLE `lens` (
  `len_code` varchar(20) NOT NULL,
  `brand` varchar(40) NOT NULL,
  `supplier_nif` varchar(10) NOT NULL,
  `prescription` varchar(20) NOT NULL,
  `color` set('SUPER GLIDE','SUPER BLUE','WHITE','DARK') NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `lens`:
--   `supplier_nif`
--       `suppliers` -> `nif_supplier`
--

--
-- Bolcament de dades per a la taula `lens`
--

INSERT INTO `lens` (`len_code`, `brand`, `supplier_nif`, `prescription`, `color`, `price`) VALUES
('S820200405DK230', 'Hoya plus', '307981498w', '+2,25', 'SUPER BLUE', '13.00'),
('SG20100405DK125', 'super Gliding Coat', '307981468w', '+1,25', 'SUPER BLUE', '11.20');

-- --------------------------------------------------------

--
-- Estructura de la taula `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `len1` varchar(20) NOT NULL,
  `len2` varchar(20) NOT NULL,
  `frame-id` varchar(20) NOT NULL,
  `employee-id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `orders`:
--   `customer_id`
--       `customers` -> `customer_id`
--   `employee-id`
--       `employee` -> `employee_nif`
--   `frame-id`
--       `frames` -> `id_frame`
--   `len1`
--       `lens` -> `len_code`
--   `len2`
--       `lens` -> `len_code`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `suppliers`
--

CREATE TABLE `suppliers` (
  `nif_supplier` varchar(10) NOT NULL,
  `company_name` varchar(40) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone_pre` smallint(3) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `fax_pre` smallint(3) NOT NULL,
  `fax_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONS PER A LA TAULA `suppliers`:
--

--
-- Bolcament de dades per a la taula `suppliers`
--

INSERT INTO `suppliers` (`nif_supplier`, `company_name`, `street`, `number`, `zip`, `city`, `country`, `phone_pre`, `phone_number`, `fax_pre`, `fax_number`) VALUES
('307981468w', 'Monturas gimeno', 'Teruel', '86', '10987', 'Toledo', 'Spain', 91, '2659812', 91, '321009878'),
('307981498w', 'Japan Lens', 'Marina', '286', '8013', 'Barcelona', 'Spain', 93, '265459812', 93, '321098978'),
('340923923c', 'Hoya Corporation', 'Nittochi Nishishinjuku Building', '10', '1608347', 'Tokio', 'Japan', 81, '543687298', 81, '543982716'),
('653923923Y', 'Monturas Vechio', 'Da Vincu ', '108', '220087', 'Bolognia', 'Italia', 33, '541117298', 33, '54299996');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk-recomended` (`recomended_cust`);

--
-- Índexs per a la taula `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_nif`);

--
-- Índexs per a la taula `frames`
--
ALTER TABLE `frames`
  ADD PRIMARY KEY (`id_frame`),
  ADD KEY `fk-supplier` (`supplier_nif`);

--
-- Índexs per a la taula `lens`
--
ALTER TABLE `lens`
  ADD PRIMARY KEY (`len_code`),
  ADD KEY `supplier_nif` (`supplier_nif`);

--
-- Índexs per a la taula `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk-len1` (`len1`),
  ADD KEY `fk-len2` (`len2`),
  ADD KEY `fk_frame` (`frame-id`),
  ADD KEY `fk-customer` (`customer_id`),
  ADD KEY `employee-id` (`employee-id`);

--
-- Índexs per a la taula `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`nif_supplier`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
