-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Jun-2023 às 14:41
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

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
-- Estrutura da tabela `kp_address`
--

CREATE TABLE `kp_address` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(8) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kp_cart`
--

CREATE TABLE `kp_cart` (
  `id_cart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kp_cart_items`
--

CREATE TABLE `kp_cart_items` (
  `id_cart_items` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kp_order`
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
-- Estrutura da tabela `kp_order_items`
--

CREATE TABLE `kp_order_items` (
  `id_order_items` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kp_product`
--

CREATE TABLE `kp_product` (
  `id_product` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `layout` varchar(100) NOT NULL,
  `size` varchar(10) NOT NULL,
  `connection` varchar(100) NOT NULL,
  `switch` varchar(100) NOT NULL,
  `keycap` varchar(100) NOT NULL,
  `main_color` varchar(100) NOT NULL,
  `key_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kp_user`
--

CREATE TABLE `kp_user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `kp_address`
--
ALTER TABLE `kp_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `address_fkUser` (`id_user`);

--
-- Índices para tabela `kp_cart`
--
ALTER TABLE `kp_cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `cart_fkUser` (`id_user`);

--
-- Índices para tabela `kp_cart_items`
--
ALTER TABLE `kp_cart_items`
  ADD PRIMARY KEY (`id_cart_items`),
  ADD KEY `cart_items_fkCart` (`id_cart`),
  ADD KEY `cart_items_fkProduct` (`id_product`);

--
-- Índices para tabela `kp_order`
--
ALTER TABLE `kp_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `order_fkUser` (`id_user`);

--
-- Índices para tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  ADD PRIMARY KEY (`id_order_items`),
  ADD KEY `order_items_fkOrder` (`id_order`),
  ADD KEY `order_items_fkProduct` (`id_product`);

--
-- Índices para tabela `kp_product`
--
ALTER TABLE `kp_product`
  ADD PRIMARY KEY (`id_product`);

--
-- Índices para tabela `kp_user`
--
ALTER TABLE `kp_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `kp_address`
--
ALTER TABLE `kp_address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_cart`
--
ALTER TABLE `kp_cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_cart_items`
--
ALTER TABLE `kp_cart_items`
  MODIFY `id_cart_items` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de tabela `kp_product`
--
ALTER TABLE `kp_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `kp_address`
--
ALTER TABLE `kp_address`
  ADD CONSTRAINT `address_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);

--
-- Limitadores para a tabela `kp_cart`
--
ALTER TABLE `kp_cart`
  ADD CONSTRAINT `cart_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);

--
-- Limitadores para a tabela `kp_cart_items`
--
ALTER TABLE `kp_cart_items`
  ADD CONSTRAINT `cart_items_fkCart` FOREIGN KEY (`id_cart`) REFERENCES `kp_cart` (`id_cart`),
  ADD CONSTRAINT `cart_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`);

--
-- Limitadores para a tabela `kp_order`
--
ALTER TABLE `kp_order`
  ADD CONSTRAINT `order_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`);

--
-- Limitadores para a tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  ADD CONSTRAINT `order_items_fkOrder` FOREIGN KEY (`id_order`) REFERENCES `kp_order` (`id_order`),
  ADD CONSTRAINT `order_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
