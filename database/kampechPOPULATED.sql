-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Maio-2023 às 14:18
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
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `address`
--

INSERT INTO `address` (`id_address`, `id_user`, `address`, `zip_code`, `city`, `state`) VALUES
(4, 13, '305 Glendale Way', '29824377', 'San Antonio', 'TX'),
(5, 20, '6 Blaine Parkway', '15526287', 'Charlotte', 'NC'),
(6, 18, '66678 Raven Street', '20235325', 'El Paso', 'TX'),
(7, 16, '1 Pine View Lane', '98932518', 'Washington', 'DC'),
(8, 14, '03 Kinsman Street', '19848945', 'Kansas City', 'MO'),
(9, 22, '2 Summerview Drive', '65092873', 'Harrisburg', 'PA'),
(10, 19, '04674 Hayes Parkway', '78981012', 'Richmond', 'VA'),
(11, 21, '13 Kedzie Pass', '35573795', 'Erie', 'PA'),
(12, 17, '92 Little Fleur Pass', '31230393', 'Birmingham', 'AL'),
(13, 15, '85685 Ohio Circle', '55532957', 'Detroit', 'MI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart`
--

CREATE TABLE `cart` (
  `id_cart` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart_items`
--

CREATE TABLE `cart_items` (
  `id_cart_items` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(3, 13, '2023-05-19', '705.00', 'Cartão de Débito'),
(4, 14, '2023-05-20', '1051.00', 'PIX'),
(5, 15, '2023-05-21', '1079.00', 'Boleto'),
(6, 16, '2023-05-22', '1164.00', 'PIX'),
(7, 17, '2023-05-23', '270.00', 'Boleto'),
(8, 18, '2023-05-24', '705.00', 'Cartão de Crédito'),
(9, 19, '2023-05-25', '1051.00', 'Cartão de Crédito'),
(10, 20, '2023-05-26', '1079.00', 'Boleto'),
(11, 21, '2023-05-27', '108.00', 'Cartão de Débito'),
(12, 22, '2023-05-28', '51.00', 'Cartão de Débito');

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
(25, 1, 5, 614),
(26, 1, 6, 550),
(27, 2, 7, 53),
(28, 2, 8, 217),
(29, 3, 9, 24),
(30, 3, 10, 681),
(31, 4, 11, 422),
(32, 4, 12, 629),
(33, 5, 13, 745),
(34, 5, 14, 334),
(35, 6, 5, 614),
(36, 6, 6, 550),
(37, 7, 7, 53),
(38, 7, 8, 217),
(39, 8, 9, 24),
(40, 8, 10, 681),
(41, 9, 11, 422),
(42, 9, 12, 629),
(43, 10, 13, 745),
(44, 10, 14, 334);

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
(5, 'Baking Powder', 'Dislocation of proximal interphalangeal joint of unspecified thumb, sequela', '614.34', 'http://dummyimage.com/146x100.png/cc0000/ffffff', 'ENG', '100%', 'USB-C'),
(6, 'Banana', 'Toxic effect of beryllium and its compounds, undetermined, sequela', '549.68', 'http://dummyimage.com/196x100.png/cc0000/ffffff', 'ABNT2', '100%', 'Wireless'),
(7, 'Pork - Tenderloin, Frozen', 'Pressure ulcer of unspecified buttock, stage 3', '52.86', 'http://dummyimage.com/206x100.png/dddddd/000000', 'ABNT2', '80%', 'USB'),
(8, 'Scallop - St. Jaques', 'Drug or chemical induced diabetes mellitus with skin complications', '217.20', 'http://dummyimage.com/215x100.png/cc0000/ffffff', 'ENG', '100%', 'USB-C'),
(9, 'Fudge - Chocolate Fudge', 'Unspecified open wound of abdominal wall, right lower quadrant without penetration into peritoneal cavity', '23.56', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff', 'ENG', '100%', 'Bluetooth'),
(10, 'Silicone Paper 16.5x24', 'Displaced fracture of proximal third of navicular [scaphoid] bone of right wrist, sequela', '681.12', 'http://dummyimage.com/134x100.png/dddddd/000000', 'ABNT', '100%', 'Wireless'),
(11, 'Soup - Campbells, Lentil', 'Toxic effect of contact with other venomous fish, intentional self-harm, subsequent encounter', '422.47', 'http://dummyimage.com/198x100.png/ff4444/ffffff', 'ENG', '80%', 'USB-C'),
(12, 'Lettuce - Red Leaf', 'Traumatic hemorrhage of right cerebrum with loss of consciousness of any duration with death due to other cause prior to regaining consciousness', '628.74', 'http://dummyimage.com/225x100.png/dddddd/000000', 'ENG', '100%', 'Wireless'),
(13, 'Lamb Rack - Ontario', 'Displaced segmental fracture of shaft of radius, right arm, initial encounter for open fracture type I or II', '745.45', 'http://dummyimage.com/159x100.png/5fa2dd/ffffff', 'ENG', '60%', 'USB-C'),
(14, 'Kippers - Smoked', 'Nondisplaced segmental fracture of shaft of radius, left arm, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion', '333.96', 'http://dummyimage.com/139x100.png/ff4444/ffffff', 'ENG', '60%', 'Bluetooth');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `cpf`, `phone`) VALUES
(13, 'Timotheus Gemlett', 'tgemlett0@phpbb.com', 'GYQjCTr3PktR', '006.068.260-41', '8047307025'),
(14, 'Dukie Gurr', 'dgurr1@hexun.com', 'lWxlbJo', '541.021.290-81', '4863106370'),
(15, 'Brewster Juhruke', 'bjuhruke2@globo.com', 'hq6Cz5T', '994.418.840-90', '6948646411'),
(16, 'Lucine Esmead', 'lesmead3@usa.gov', 'auEZr0Eqglc', '394.550.560-70', '1645052853'),
(17, 'Berny Rahl', 'brahl4@smh.com.au', 'XwEtScpsP', '971.709.870-07', '2914092043'),
(18, 'Georgi Duhig', 'gduhig5@dot.gov', 'qL5fd6yHtHBz', '266.901.470-45', '2378659142'),
(19, 'Avis Girardy', 'agirardy6@canalblog.com', '1WTnrh', '948.780.500-12', '4892562155'),
(20, 'Rube Dinnage', 'rdinnage7@artisteer.com', 'IpoBzE', '170.709.280-09', '2461127950'),
(21, 'Jennifer Tomkies', 'jtomkies8@acquirethisname.com', 'vZj73eGwxLxD', '956.704.780-45', '2131180121'),
(22, 'Park Bolduc', 'pbolduc9@myspace.com', 'uD1cHEkk6d', '878.436.740-71', '7876609984');

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
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
