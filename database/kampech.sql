-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/07/2023 às 13:10
-- Versão do servidor: 8.0.21
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
  `id_address` int NOT NULL,
  `id_user` int NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(9) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id_order` int NOT NULL,
  `id_user` int NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `kp_order`
--

INSERT INTO `kp_order` (`id_order`, `id_user`, `order_date`, `total`, `payment`) VALUES
(1, 1, '2023-06-30', 199.60, 'boleto'),
(2, 1, '2023-07-01', 699.00, 'pix'),
(3, 1, '2023-07-01', 69.90, 'credito'),
(4, 1, '2023-07-01', 69.90, 'debito'),
(5, 1, '2023-07-01', 69.90, 'credito');

--
-- Acionadores `kp_order`
--
DELIMITER $$
CREATE TRIGGER `add_order_items` AFTER INSERT ON `kp_order` FOR EACH ROW BEGIN
  INSERT INTO `kp_order_items` (`id_order`, `id_product`, `price`)
  SELECT NEW.`id_order`, up.`id_product`, p.`price` * up.`quantity`
  FROM `kp_user_products` up
  JOIN `kp_products` p ON up.`id_product` = p.`id_product`
  WHERE up.`id_user` = NEW.`id_user`;

  DELETE FROM `kp_user_products`
  WHERE `id_user` = NEW.`id_user`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_order_items`
--

CREATE TABLE `kp_order_items` (
  `id_order_items` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `kp_order_items`
--

INSERT INTO `kp_order_items` (`id_order_items`, `id_order`, `id_product`, `price`) VALUES
(1, 1, 5, 69.90),
(2, 1, 113, 69.90),
(3, 1, 3, 59.80),
(4, 2, 5, 699.00),
(5, 3, 5, 69.90),
(6, 4, 5, 69.90),
(7, 5, 5, 69.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_products`
--

CREATE TABLE `kp_products` (
  `id_product` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `layout` varchar(100) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `connection` varchar(100) DEFAULT NULL,
  `switch` varchar(100) DEFAULT NULL,
  `main_color` varchar(100) DEFAULT NULL,
  `key_color` varchar(100) DEFAULT NULL,
  `productShow` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `kp_products`
--

INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`, `productShow`) VALUES
(1, 'keycap 1', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'keycap 2', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'keycap 3', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'keycap 4', 'Keycap personalizada', 29.90, 'https://i.etsystatic.com/26198213/r/il/67a30a/3804673251/il_fullxfull.3804673251_6des.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'black', 0),
(6, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'white', 0),
(7, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'black', 'purple', 0),
(8, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'black', 0),
(9, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'white', 0),
(10, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'white', 'purple', 0),
(11, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'black', 0),
(12, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'white', 0),
(13, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'blue', 'grey', 'purple', 0),
(14, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'black', 0),
(15, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'white', 0),
(16, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'black', 'purple', 0),
(17, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'black', 0),
(18, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'white', 0),
(19, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'white', 'purple', 0),
(20, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'black', 0),
(21, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'white', 0),
(22, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'red', 'grey', 'purple', 0),
(23, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'black', 0),
(24, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'white', 0),
(25, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'black', 'purple', 0),
(26, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'black', 0),
(27, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'white', 0),
(28, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'white', 'purple', 0),
(29, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'black', 0),
(30, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'white', 0),
(31, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb', 'brown', 'grey', 'purple', 0),
(32, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'black', 0),
(33, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'white', 0),
(34, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'black', 'purple', 0),
(35, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'black', 0),
(36, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'white', 0),
(37, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'white', 'purple', 0),
(38, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'black', 0),
(39, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'white', 0),
(40, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'blue', 'grey', 'purple', 0),
(41, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'black', 0),
(42, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'white', 0),
(43, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'black', 'purple', 0),
(44, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'black', 0),
(45, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'white', 0),
(46, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'white', 'purple', 0),
(47, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'black', 0),
(48, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'white', 0),
(49, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'red', 'grey', 'purple', 0),
(50, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'black', 0),
(51, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'white', 0),
(52, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'black', 'purple', 0),
(53, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'black', 0),
(54, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'white', 0),
(55, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'white', 'purple', 0),
(56, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'black', 0),
(57, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'white', 0),
(58, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'usb-c', 'brown', 'grey', 'purple', 0),
(59, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'black', 0),
(60, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'white', 0),
(61, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'black', 'purple', 0),
(62, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'black', 0),
(63, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'white', 0),
(64, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'white', 'purple', 0),
(65, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'black', 0),
(66, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'white', 0),
(67, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'blue', 'grey', 'purple', 0),
(68, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'black', 0),
(69, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'white', 0),
(70, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'black', 'purple', 0),
(71, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'black', 0),
(72, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'white', 0),
(73, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'white', 'purple', 0),
(74, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'black', 0),
(75, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'white', 0),
(76, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'red', 'grey', 'purple', 0),
(77, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'black', 0),
(78, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'white', 0),
(79, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'black', 'purple', 0),
(80, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'black', 0),
(81, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'white', 0),
(82, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'white', 'purple', 0),
(83, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'black', 0),
(84, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'white', 0),
(85, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'wireless', 'brown', 'grey', 'purple', 0),
(86, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'black', 0),
(87, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'white', 0),
(88, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'black', 'purple', 0),
(89, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'black', 0),
(90, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'white', 0),
(91, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'white', 'purple', 0),
(92, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'black', 0),
(93, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'white', 0),
(94, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'blue', 'grey', 'purple', 0),
(95, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'black', 0),
(96, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'white', 0),
(97, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'black', 'purple', 0),
(98, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'black', 0),
(99, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'white', 0),
(100, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'white', 'purple', 0),
(101, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'black', 0),
(102, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'white', 0),
(103, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'red', 'grey', 'purple', 0),
(104, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'black', 0),
(105, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'white', 0),
(106, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'black', 'purple', 0),
(107, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'black', 0),
(108, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'white', 0),
(109, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'white', 'purple', 0),
(110, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'black', 0),
(111, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'white', 0),
(112, 'Teclado Custom', 'Teclado Custom: Size: 100%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '100%', 'bluetooth', 'brown', 'grey', 'purple', 0),
(113, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'black', 0),
(114, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'white', 0),
(115, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'black', 'purple', 0),
(116, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'black', 0),
(117, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'white', 0),
(118, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'white', 'purple', 0),
(119, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'black', 0),
(120, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'white', 0),
(121, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'blue', 'grey', 'purple', 0),
(122, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'black', 0),
(123, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'white', 0),
(124, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'black', 'purple', 0),
(125, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'black', 0),
(126, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'white', 0),
(127, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'white', 'purple', 0),
(128, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'black', 0),
(129, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'white', 0),
(130, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'red', 'grey', 'purple', 0),
(131, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'black', 0),
(132, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'white', 0),
(133, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'black', 'purple', 0),
(134, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'black', 0),
(135, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'white', 0),
(136, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'white', 'purple', 0),
(137, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'black', 0),
(138, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'white', 0),
(139, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb', 'brown', 'grey', 'purple', 0),
(140, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'black', 0),
(141, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'white', 0),
(142, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'black', 'purple', 0),
(143, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'black', 0),
(144, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'white', 0),
(145, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'white', 'purple', 0),
(146, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'black', 0),
(147, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'white', 0),
(148, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'blue', 'grey', 'purple', 0),
(149, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'black', 0),
(150, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'white', 0),
(151, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'black', 'purple', 0),
(152, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'black', 0),
(153, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'white', 0),
(154, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'white', 'purple', 0),
(155, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'black', 0),
(156, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'white', 0),
(157, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'red', 'grey', 'purple', 0),
(158, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'black', 0),
(159, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'white', 0),
(160, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'black', 'purple', 0),
(161, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'black', 0),
(162, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'white', 0),
(163, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'white', 'purple', 0),
(164, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'black', 0),
(165, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'white', 0),
(166, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'usb-c', 'brown', 'grey', 'purple', 0),
(167, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'black', 0),
(168, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'white', 0),
(169, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'black', 'purple', 0),
(170, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'black', 0),
(171, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'white', 0),
(172, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'white', 'purple', 0),
(173, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'black', 0);
INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`, `productShow`) VALUES
(174, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'white', 0),
(175, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'blue', 'grey', 'purple', 0),
(176, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'black', 0),
(177, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'white', 0),
(178, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'black', 'purple', 0),
(179, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'black', 0),
(180, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'white', 0),
(181, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'white', 'purple', 0),
(182, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'black', 0),
(183, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'white', 0),
(184, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'red', 'grey', 'purple', 0),
(185, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'black', 0),
(186, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'white', 0),
(187, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'black', 'purple', 0),
(188, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'black', 0),
(189, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'white', 0),
(190, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'white', 'purple', 0),
(191, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'black', 0),
(192, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'white', 0),
(193, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'wireless', 'brown', 'grey', 'purple', 0),
(194, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'black', 0),
(195, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'white', 0),
(196, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'black', 'purple', 0),
(197, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'black', 0),
(198, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'white', 0),
(199, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'white', 'purple', 0),
(200, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'black', 0),
(201, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'white', 0),
(202, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'blue', 'grey', 'purple', 0),
(203, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'black', 0),
(204, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'white', 0),
(205, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'black', 'purple', 0),
(206, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'black', 0),
(207, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'white', 0),
(208, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'white', 'purple', 0),
(209, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'black', 0),
(210, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'white', 0),
(211, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'red', 'grey', 'purple', 0),
(212, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'black', 0),
(213, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'white', 0),
(214, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'black', 'purple', 0),
(215, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'black', 0),
(216, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'white', 0),
(217, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'white', 'purple', 0),
(218, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'black', 0),
(219, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'white', 0),
(220, 'Teclado Custom', 'Teclado Custom: Size: 80%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '80%', 'bluetooth', 'brown', 'grey', 'purple', 0),
(221, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'black', 0),
(222, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'white', 0),
(223, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'black', 'purple', 0),
(224, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'black', 0),
(225, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'white', 0),
(226, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'white', 'purple', 0),
(227, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'black', 0),
(228, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'white', 0),
(229, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'blue', 'grey', 'purple', 0),
(230, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'black', 0),
(231, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'white', 0),
(232, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'black', 'purple', 0),
(233, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'black', 0),
(234, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'white', 0),
(235, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'white', 'purple', 0),
(236, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'black', 0),
(237, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'white', 0),
(238, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'red', 'grey', 'purple', 0),
(239, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'black', 0),
(240, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'white', 0),
(241, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'black', 'purple', 0),
(242, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'black', 0),
(243, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'white', 0),
(244, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'white', 'purple', 0),
(245, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'black', 0),
(246, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'white', 0),
(247, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb', 'brown', 'grey', 'purple', 0),
(248, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'black', 0),
(249, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'white', 0),
(250, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'black', 'purple', 0),
(251, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'black', 0),
(252, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'white', 0),
(253, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'white', 'purple', 0),
(254, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'black', 0),
(255, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'white', 0),
(256, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'blue', 'grey', 'purple', 0),
(257, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'black', 0),
(258, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'white', 0),
(259, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'black', 'purple', 0),
(260, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'black', 0),
(261, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'white', 0),
(262, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'white', 'purple', 0),
(263, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'black', 0),
(264, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'white', 0),
(265, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'red', 'grey', 'purple', 0),
(266, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'black', 0),
(267, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'white', 0),
(268, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'black', 'purple', 0),
(269, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'black', 0),
(270, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'white', 0),
(271, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'white', 'purple', 0),
(272, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'black', 0),
(273, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'white', 0),
(274, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'usb-c', 'brown', 'grey', 'purple', 0),
(275, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'black', 0),
(276, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'white', 0),
(277, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'black', 'purple', 0),
(278, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'black', 0),
(279, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'white', 0),
(280, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'white', 'purple', 0),
(281, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'black', 0),
(282, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'white', 0),
(283, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'blue', 'grey', 'purple', 0),
(284, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'black', 0),
(285, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'white', 0),
(286, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'black', 'purple', 0),
(287, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'black', 0),
(288, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'white', 0),
(289, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'white', 'purple', 0),
(290, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'black', 0),
(291, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'white', 0),
(292, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'red', 'grey', 'purple', 0),
(293, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'black', 0),
(294, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'white', 0),
(295, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'black', 'purple', 0),
(296, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'black', 0),
(297, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'white', 0),
(298, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'white', 'purple', 0),
(299, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'black', 0),
(300, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'white', 0),
(301, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'wireless', 'brown', 'grey', 'purple', 0),
(302, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'black', 0),
(303, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'white', 0),
(304, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'black', 'purple', 0),
(305, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'black', 0),
(306, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'white', 0),
(307, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'white', 'purple', 0),
(308, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'black', 0),
(309, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'white', 0),
(310, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'blue', 'grey', 'purple', 0),
(311, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'black', 0),
(312, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'white', 0),
(313, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'black', 'purple', 0),
(314, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'black', 0),
(315, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'white', 0),
(316, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'white', 'purple', 0),
(317, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'black', 0),
(318, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'white', 0),
(319, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'red', 'grey', 'purple', 0),
(320, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'black', 0),
(321, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'white', 0),
(322, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'black', 'purple', 0),
(323, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'black', 0),
(324, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'white', 0),
(325, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'white', 'purple', 0),
(326, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'black', 0),
(327, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'white', 0),
(328, 'Teclado Custom', 'Teclado Custom: Size: 65%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '65%', 'bluetooth', 'brown', 'grey', 'purple', 0),
(329, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'black', 0),
(330, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'white', 0),
(331, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'black', 'purple', 0),
(332, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'black', 0),
(333, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'white', 0),
(334, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'white', 'purple', 0),
(335, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'black', 0),
(336, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'white', 0),
(337, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'blue', 'grey', 'purple', 0),
(338, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'black', 0),
(339, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'white', 0),
(340, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'black', 'purple', 0),
(341, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'black', 0),
(342, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'white', 0),
(343, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'white', 'purple', 0),
(344, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'black', 0);
INSERT INTO `kp_products` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`, `productShow`) VALUES
(345, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'white', 0),
(346, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'red', 'grey', 'purple', 0),
(347, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'black', 0),
(348, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'white', 0),
(349, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'black', 'purple', 0),
(350, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'black', 0),
(351, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'white', 0),
(352, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'white', 'purple', 0),
(353, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'black', 0),
(354, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'white', 0),
(355, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb', 'brown', 'grey', 'purple', 0),
(356, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'black', 0),
(357, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'white', 0),
(358, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'black', 'purple', 0),
(359, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'black', 0),
(360, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'white', 0),
(361, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'white', 'purple', 0),
(362, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'black', 0),
(363, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'white', 0),
(364, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'blue', 'grey', 'purple', 0),
(365, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'black', 0),
(366, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'white', 0),
(367, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'black', 'purple', 0),
(368, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'black', 0),
(369, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'white', 0),
(370, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'white', 'purple', 0),
(371, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'black', 0),
(372, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'white', 0),
(373, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'red', 'grey', 'purple', 0),
(374, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'black', 0),
(375, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'white', 0),
(376, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'black', 'purple', 0),
(377, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'black', 0),
(378, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'white', 0),
(379, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'white', 'purple', 0),
(380, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'black', 0),
(381, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'white', 0),
(382, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: usb-c; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'usb-c', 'brown', 'grey', 'purple', 0),
(383, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'black', 0),
(384, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'white', 0),
(385, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'black', 'purple', 0),
(386, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'black', 0),
(387, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'white', 0),
(388, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'white', 'purple', 0),
(389, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'black', 0),
(390, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'white', 0),
(391, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'blue', 'grey', 'purple', 0),
(392, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'black', 0),
(393, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'white', 0),
(394, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'black', 'purple', 0),
(395, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'black', 0),
(396, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'white', 0),
(397, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'white', 'purple', 0),
(398, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'black', 0),
(399, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'white', 0),
(400, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'red', 'grey', 'purple', 0),
(401, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'black', 0),
(402, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'white', 0),
(403, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'black', 'purple', 0),
(404, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'black', 0),
(405, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'white', 0),
(406, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'white', 'purple', 0),
(407, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'black', 0),
(408, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'white', 0),
(409, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: wireless; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'wireless', 'brown', 'grey', 'purple', 0),
(410, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'black', 0),
(411, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'white', 0),
(412, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'black', 'purple', 0),
(413, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'black', 0),
(414, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'white', 0),
(415, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'white', 'purple', 0),
(416, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'black', 0),
(417, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'white', 0),
(418, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: blue; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'blue', 'grey', 'purple', 0),
(419, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'black', 0),
(420, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'white', 0),
(421, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'black', 'purple', 0),
(422, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'black', 0),
(423, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'white', 0),
(424, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'white', 'purple', 0),
(425, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'black', 0),
(426, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'white', 0),
(427, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: red; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'red', 'grey', 'purple', 0),
(428, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'black', 0),
(429, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'white', 0),
(430, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: black; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'black', 'purple', 0),
(431, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'black', 0),
(432, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'white', 0),
(433, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: white; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'white', 'purple', 0),
(434, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: black', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'black', 0),
(435, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: white', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'white', 0),
(436, 'Teclado Custom', 'Teclado Custom: Size: 60%; Connection: bluetooth; Switch: brown; Keycap: ; Board color: grey; Key color: purple', 69.90, 'https://cdn.shopify.com/s/files/1/3099/8088/products/Heisenberg_Tile_3000x.jpg?v=1630345713', 'ABNT', '60%', 'bluetooth', 'brown', 'grey', 'purple', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_user`
--

CREATE TABLE `kp_user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id_user_products` int NOT NULL,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `kp_order`
--
ALTER TABLE `kp_order`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `kp_products`
--
ALTER TABLE `kp_products`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT de tabela `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `kp_user_products`
--
ALTER TABLE `kp_user_products`
  MODIFY `id_user_products` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
