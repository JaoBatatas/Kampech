-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Maio-2023 às 12:35
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

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
-- Estrutura da tabela `address`
--

CREATE TABLE `address` (
  `id_address` int NOT NULL,
  `id_user` int NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `address`
--

INSERT INTO `address` (`id_address`, `id_user`, `address`, `zip_code`, `cpf`, `city`, `state`, `phone`) VALUES
(1, 1, 'Rua das Flores, 123', '12345-678', '123.456.789-00', 'São Paulo', 'SP', '(11) 91234-5678'),
(2, 2, 'Avenida das Américas, 456', '23456-789', '234.567.890-12', 'Rio de Janeiro', 'RJ', '(21) 92345-6789');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart`
--

CREATE TABLE `cart` (
  `id_cart` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart_items`
--

CREATE TABLE `cart_items` (
  `id_cart_items` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cart_items`
--

INSERT INTO `cart_items` (`id_cart_items`, `id_cart`, `id_product`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 2),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order`
--

CREATE TABLE `order` (
  `id_order` int NOT NULL,
  `id_user` int NOT NULL,
  `date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `order`
--

INSERT INTO `order` (`id_order`, `id_user`, `date`, `total`, `payment`) VALUES
(1, 1, '2023-05-01', '350.00', 'Cartão de Crédito'),
(2, 2, '2023-05-02', '200.00', 'Boleto Bancário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_items`
--

CREATE TABLE `order_items` (
  `id_order_items` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `order_items`
--

INSERT INTO `order_items` (`id_order_items`, `id_order`, `id_product`, `price`) VALUES
(1, 1, 1, 250),
(2, 1, 3, 100),
(3, 2, 2, 150),
(4, 2, 4, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `layout` varchar(20) NOT NULL,
  `size` varchar(20) NOT NULL,
  `connection` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `product`
--

INSERT INTO `product` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`) VALUES
(1, 'Teclado Mecânico', 'Teclado mecânico com switches azuis e iluminação RGB.', '250.00', 'https://www.example.com/image1.jpg', 'ABNT2', 'Full', 'USB'),
(2, 'Teclado Membrana', 'Teclado de membrana com iluminação RGB.', '150.00', 'https://www.example.com/image2.jpg', 'ABNT2', 'Tenkeyless', 'Bluetooth'),
(3, 'Keycap Set', 'Conjunto de keycaps em PBT com perfil OEM.', '100.00', 'https://www.example.com/image3.jpg', 'ABNT2', 'Full', 'USB'),
(4, 'Switches Marrons', 'Conjunto com 100 switches marrons para teclados mecânicos.', '50.00', 'https://www.example.com/image4.jpg', 'ABNT2', 'Full', 'USB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '123456'),
(2, 'Maria Santos', 'maria.santos@email.com', '123456');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `fk_user` (`id_user`);

--
-- Índices para tabela `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `fk_user3` (`id_user`);

--
-- Índices para tabela `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id_cart_items`),
  ADD KEY `fk_cart` (`id_cart`),
  ADD KEY `fk_product2` (`id_product`);

--
-- Índices para tabela `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_user2` (`id_user`);

--
-- Índices para tabela `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id_order_items`),
  ADD KEY `fk_order` (`id_order`),
  ADD KEY `fk_product` (`id_product`);

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id_cart_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Limitadores para a tabela `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Limitadores para a tabela `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id_cart`),
  ADD CONSTRAINT `fk_product2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Limitadores para a tabela `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_user2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Limitadores para a tabela `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`),
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
