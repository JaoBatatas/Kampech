-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/06/2023 às 02:25
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kampech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_address`
--

CREATE TABLE `kp_address` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(9) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kp_address`
--

INSERT INTO `kp_address` (`id_address`, `id_user`, `address`, `zip_code`, `city`, `state`) VALUES
(1, 1, 'Coronel Camacho', '89227-501', 'Joinville', 'SC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_order`
--

CREATE TABLE `kp_order` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_order_items`
--

CREATE TABLE `kp_order_items` (
  `id_order_items` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_products`
--

CREATE TABLE `kp_products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `layout` varchar(100) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `connection` varchar(100) DEFAULT NULL,
  `switch` varchar(100) DEFAULT NULL,
  `main_color` varchar(100) DEFAULT NULL,
  `key_color` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kp_products`
--

INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`) VALUES
(1, 'keycap 1', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'keycap 2', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'keycap 3', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'keycap 4', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'black'),
(6, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'white'),
(7, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'purple'),
(8, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'black'),
(9, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'white'),
(10, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'purple'),
(11, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'black'),
(12, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'white'),
(13, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'purple'),
(14, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'black'),
(15, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'white'),
(16, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'purple'),
(17, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'black'),
(18, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'white'),
(19, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'purple'),
(20, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'black'),
(21, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'white'),
(22, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'purple'),
(23, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'black'),
(24, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'white'),
(25, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'purple'),
(26, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'black'),
(27, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'white'),
(28, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'purple'),
(29, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'black'),
(30, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'white'),
(31, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'purple'),
(32, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'black'),
(33, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'white'),
(34, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'purple'),
(35, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'black'),
(36, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'white'),
(37, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'purple'),
(38, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'black'),
(39, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'white'),
(40, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'purple'),
(41, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'black'),
(42, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'white'),
(43, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'purple'),
(44, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'black'),
(45, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'white'),
(46, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'purple'),
(47, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'black'),
(48, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'white'),
(49, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'purple'),
(50, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'black'),
(51, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'white'),
(52, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'purple'),
(53, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'black'),
(54, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'white'),
(55, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'purple'),
(56, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'black'),
(57, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'white'),
(58, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'purple'),
(59, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'black'),
(60, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'white'),
(61, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'purple'),
(62, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'black'),
(63, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'white'),
(64, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'purple'),
(65, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'black'),
(66, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'white'),
(67, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'purple'),
(68, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'black'),
(69, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'white'),
(70, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'purple'),
(71, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'black'),
(72, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'white'),
(73, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'purple'),
(74, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'black'),
(75, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'white'),
(76, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'purple'),
(77, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'black'),
(78, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'white'),
(79, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'purple'),
(80, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'black'),
(81, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'white'),
(82, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'purple'),
(83, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'black'),
(84, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'white'),
(85, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'purple'),
(86, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'black'),
(87, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'white'),
(88, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'purple'),
(89, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'black'),
(90, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'white'),
(91, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'purple'),
(92, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'black'),
(93, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'white'),
(94, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'purple'),
(95, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'black'),
(96, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'white'),
(97, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'purple'),
(98, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'black'),
(99, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'white'),
(100, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'purple'),
(101, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'black'),
(102, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'white'),
(103, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'purple'),
(104, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'black'),
(105, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'white'),
(106, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'purple'),
(107, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'black'),
(108, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'white'),
(109, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'purple'),
(110, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'black'),
(111, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'white'),
(112, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'purple'),
(113, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'black'),
(114, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'white'),
(115, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'purple'),
(116, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'black'),
(117, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'white'),
(118, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'purple'),
(119, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'black'),
(120, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'white'),
(121, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'purple'),
(122, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'black'),
(123, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'white'),
(124, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'purple'),
(125, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'black'),
(126, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'white'),
(127, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'purple'),
(128, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'black'),
(129, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'white'),
(130, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'purple'),
(131, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'black'),
(132, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'white'),
(133, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'purple'),
(134, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'black'),
(135, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'white'),
(136, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'purple'),
(137, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'black'),
(138, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'white'),
(139, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'purple'),
(140, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'black'),
(141, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'white'),
(142, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'purple'),
(143, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'black'),
(144, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'white'),
(145, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'purple'),
(146, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'black'),
(147, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'white'),
(148, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'purple'),
(149, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'black'),
(150, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'white'),
(151, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'purple'),
(152, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'black'),
(153, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'white'),
(154, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'purple'),
(155, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'black'),
(156, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'white'),
(157, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'purple'),
(158, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'black'),
(159, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'white'),
(160, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'purple'),
(161, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'black'),
(162, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'white'),
(163, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'purple'),
(164, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'black'),
(165, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'white'),
(166, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'purple'),
(167, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'black'),
(168, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'white'),
(169, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'purple'),
(170, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'black'),
(171, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'white'),
(172, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'purple'),
(173, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'black'),
(174, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'white'),
(175, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'purple');
INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`) VALUES
(176, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'black'),
(177, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'white'),
(178, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'purple'),
(179, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'black'),
(180, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'white'),
(181, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'purple'),
(182, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'black'),
(183, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'white'),
(184, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'purple'),
(185, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'black'),
(186, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'white'),
(187, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'purple'),
(188, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'black'),
(189, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'white'),
(190, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'purple'),
(191, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'black'),
(192, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'white'),
(193, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'purple'),
(194, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'black'),
(195, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'white'),
(196, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'purple'),
(197, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'black'),
(198, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'white'),
(199, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'purple'),
(200, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'black'),
(201, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'white'),
(202, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'purple'),
(203, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'black'),
(204, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'white'),
(205, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'purple'),
(206, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'black'),
(207, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'white'),
(208, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'purple'),
(209, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'black'),
(210, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'white'),
(211, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'purple'),
(212, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'black'),
(213, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'white'),
(214, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'purple'),
(215, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'black'),
(216, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'white'),
(217, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'purple'),
(218, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'black'),
(219, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'white'),
(220, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'purple'),
(221, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'black'),
(222, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'white'),
(223, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'purple'),
(224, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'black'),
(225, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'white'),
(226, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'purple'),
(227, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'black'),
(228, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'white'),
(229, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'purple'),
(230, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'black'),
(231, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'white'),
(232, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'purple'),
(233, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'black'),
(234, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'white'),
(235, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'purple'),
(236, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'black'),
(237, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'white'),
(238, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'purple'),
(239, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'black'),
(240, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'white'),
(241, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'purple'),
(242, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'black'),
(243, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'white'),
(244, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'purple'),
(245, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'black'),
(246, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'white'),
(247, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'purple'),
(248, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'black'),
(249, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'white'),
(250, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'purple'),
(251, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'black'),
(252, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'white'),
(253, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'purple'),
(254, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'black'),
(255, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'white'),
(256, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'purple'),
(257, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'black'),
(258, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'white'),
(259, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'purple'),
(260, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'black'),
(261, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'white'),
(262, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'purple'),
(263, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'black'),
(264, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'white'),
(265, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'purple'),
(266, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'black'),
(267, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'white'),
(268, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'purple'),
(269, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'black'),
(270, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'white'),
(271, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'purple'),
(272, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'black'),
(273, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'white'),
(274, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'purple'),
(275, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'black'),
(276, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'white'),
(277, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'purple'),
(278, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'black'),
(279, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'white'),
(280, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'purple'),
(281, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'black'),
(282, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'white'),
(283, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'purple'),
(284, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'black'),
(285, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'white'),
(286, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'purple'),
(287, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'black'),
(288, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'white'),
(289, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'purple'),
(290, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'black'),
(291, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'white'),
(292, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'purple'),
(293, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'black'),
(294, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'white'),
(295, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'purple'),
(296, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'black'),
(297, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'white'),
(298, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'purple'),
(299, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'black'),
(300, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'white'),
(301, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'purple'),
(302, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'black'),
(303, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'white'),
(304, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'purple'),
(305, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'black'),
(306, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'white'),
(307, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'purple'),
(308, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'black'),
(309, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'white'),
(310, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'purple'),
(311, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'black'),
(312, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'white'),
(313, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'purple'),
(314, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'black'),
(315, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'white'),
(316, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'purple'),
(317, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'black'),
(318, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'white'),
(319, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'purple'),
(320, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'black'),
(321, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'white'),
(322, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'purple'),
(323, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'black'),
(324, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'white'),
(325, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'purple'),
(326, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'black'),
(327, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'white'),
(328, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'purple'),
(329, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'black'),
(330, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'white'),
(331, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'purple'),
(332, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'black'),
(333, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'white'),
(334, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'purple'),
(335, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'black'),
(336, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'white'),
(337, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'purple'),
(338, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'black'),
(339, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'white'),
(340, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'purple'),
(341, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'black'),
(342, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'white'),
(343, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'purple'),
(344, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'black'),
(345, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'white'),
(346, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'purple'),
(347, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'black'),
(348, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'white');
INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`) VALUES
(349, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'purple'),
(350, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'black'),
(351, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'white'),
(352, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'purple'),
(353, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'black'),
(354, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'white'),
(355, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'purple'),
(356, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'black'),
(357, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'white'),
(358, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'purple'),
(359, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'black'),
(360, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'white'),
(361, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'purple'),
(362, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'black'),
(363, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'white'),
(364, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'purple'),
(365, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'black'),
(366, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'white'),
(367, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'purple'),
(368, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'black'),
(369, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'white'),
(370, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'purple'),
(371, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'black'),
(372, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'white'),
(373, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'purple'),
(374, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'black'),
(375, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'white'),
(376, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'purple'),
(377, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'black'),
(378, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'white'),
(379, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'purple'),
(380, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'black'),
(381, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'white'),
(382, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'purple'),
(383, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'black'),
(384, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'white'),
(385, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'purple'),
(386, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'black'),
(387, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'white'),
(388, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'purple'),
(389, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'black'),
(390, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'white'),
(391, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'purple'),
(392, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'black'),
(393, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'white'),
(394, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'purple'),
(395, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'black'),
(396, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'white'),
(397, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'purple'),
(398, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'black'),
(399, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'white'),
(400, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'purple'),
(401, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'black'),
(402, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'white'),
(403, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'purple'),
(404, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'black'),
(405, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'white'),
(406, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'purple'),
(407, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'black'),
(408, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'white'),
(409, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'purple'),
(410, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'black'),
(411, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'white'),
(412, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'purple'),
(413, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'black'),
(414, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'white'),
(415, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'purple'),
(416, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'black'),
(417, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'white'),
(418, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'purple'),
(419, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'black'),
(420, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'white'),
(421, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'purple'),
(422, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'black'),
(423, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'white'),
(424, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'purple'),
(425, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'black'),
(426, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'white'),
(427, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'purple'),
(428, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'black'),
(429, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'white'),
(430, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'purple'),
(431, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'black'),
(432, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'white'),
(433, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'purple'),
(434, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'black'),
(435, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'white'),
(436, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'purple');

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_user`
--

CREATE TABLE `kp_user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kp_user`
--

INSERT INTO `kp_user` (`id_user`, `name`, `email`, `password`, `cpf`, `phone`) VALUES
(1, 'João Paulo Ersching', 'joao.ersching@gmail.com', '00000000', '139.108.109-93', '(47) 98892-1683');

--
-- Acionadores `kp_user`
--
DELIMITER $$
CREATE TRIGGER `after_insert_user` AFTER INSERT ON `kp_user` FOR EACH ROW BEGIN
    INSERT INTO kp_address (id_user, address, zip_code, city, state)
    VALUES (NEW.id_user, '', '', '', '');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_user_products`
--

CREATE TABLE `kp_user_products` (
  `id_user_products` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kp_user_products`
--

INSERT INTO `kp_user_products` (`id_user_products`, `id_user`, `id_product`, `quantity`) VALUES
(1, 1, 113, 4),
(2, 1, 2, 1),
(3, 1, 5, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `kp_address`
--
ALTER TABLE `kp_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `address_fkUser` (`id_user`);

--
-- Índices de tabela `kp_order`
--
ALTER TABLE `kp_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `order_fkUser` (`id_user`);

--
-- Índices de tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  ADD PRIMARY KEY (`id_order_items`),
  ADD KEY `order_items_fkOrder` (`id_order`),
  ADD KEY `order_items_fkProduct` (`id_product`);

--
-- Índices de tabela `kp_products`
--
ALTER TABLE `kp_products`
  ADD PRIMARY KEY (`id_product`);

--
-- Índices de tabela `kp_user`
--
ALTER TABLE `kp_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Índices de tabela `kp_user_products`
--
ALTER TABLE `kp_user_products`
  ADD PRIMARY KEY (`id_user_products`),
  ADD KEY `cart_items_fkCart` (`id_user`),
  ADD KEY `cart_items_fkProduct` (`id_product`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `kp_address`
--
ALTER TABLE `kp_address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `kp_order`
--
ALTER TABLE `kp_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  MODIFY `id_order_items` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_products`
--
ALTER TABLE `kp_products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT de tabela `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `kp_user_products`
--
ALTER TABLE `kp_user_products`
  MODIFY `id_user_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `kp_address`
--
ALTER TABLE `kp_address`
  ADD CONSTRAINT `address_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);

--
-- Restrições para tabelas `kp_order`
--
ALTER TABLE `kp_order`
  ADD CONSTRAINT `order_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);

--
-- Restrições para tabelas `kp_order_items`
--
ALTER TABLE `kp_order_items`
  ADD CONSTRAINT `order_items_fkOrder` FOREIGN KEY (`id_order`) REFERENCES `kp_order` (`id_order`),
  ADD CONSTRAINT `order_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_products` (`id_product`);

--
-- Restrições para tabelas `kp_user_products`
--
ALTER TABLE `kp_user_products`
  ADD CONSTRAINT `user_products_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_products` (`id_product`),
  ADD CONSTRAINT `user_products_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
