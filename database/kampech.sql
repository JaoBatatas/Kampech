-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/06/2023 às 15:09
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
  `zip_code` varchar(8) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_product`
--

CREATE TABLE `kp_product` (
  `id_product` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `layout` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connection` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `switch` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `main_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `key_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_user`
--

CREATE TABLE `kp_user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kp_user_products`
--

CREATE TABLE `kp_user_products` (
  `id_user_products` int NOT NULL,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL
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
-- Índices de tabela `kp_product`
--
ALTER TABLE `kp_product`
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
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_order`
--
ALTER TABLE `kp_order`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_order_items`
--
ALTER TABLE `kp_order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_product`
--
ALTER TABLE `kp_product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kp_user_products`
--
ALTER TABLE `kp_user_products`
  MODIFY `id_user_products` int NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `order_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`);

--
-- Restrições para tabelas `kp_user_products`
--
ALTER TABLE `kp_user_products`
  ADD CONSTRAINT `user_products_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_products_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
