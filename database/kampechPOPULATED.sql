SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `kp_address` (
  `id_address` int NOT NULL,
  `id_user` int NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(8) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_address` (`id_address`, `id_user`, `address`, `zip_code`, `city`, `state`) VALUES
(1, 1, 'Rua das Flores, 123', '01234567', 'São Paulo', 'SP'),
(2, 2, 'Avenida das Américas, 456', '23456789', 'Rio de Janeiro', 'RJ'),
(3, 3, 'Avenida Paulista, 789', '34567890', 'São Paulo', 'SP'),
(4, 4, 'Rua das Palmeiras, 1011', '45678901', 'Curitiba', 'PR');

CREATE TABLE `kp_cart` (
  `id_cart` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_cart` (`id_cart`, `id_user`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

CREATE TABLE `kp_cart_items` (
  `id_cart_items` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_cart_items` (`id_cart_items`, `id_cart`, `id_product`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 1),
(5, 4, 2);

CREATE TABLE `kp_order` (
  `id_order` int NOT NULL,
  `id_user` int NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_order` (`id_order`, `id_user`, `order_date`, `total`, `payment`) VALUES
(1, 1, '2023-05-26', '299.98', 'Cartão de crédito'),
(2, 2, '2023-05-27', '299.99', 'PIX'),
(3, 3, '2023-05-28', '99.99', 'Cartão de débito'),
(4, 4, '2023-05-29', '199.99', 'Boleto');

CREATE TABLE `kp_order_items` (
  `id_order_items` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_order_items` (`id_order_items`, `id_order`, `id_product`, `price`) VALUES
(1, 1, 1, '99.99'),
(2, 1, 2, '199.99'),
(3, 2, 3, '299.99'),
(4, 3, 1, '99.99'),
(5, 4, 2, '199.99');

CREATE TABLE `kp_product` (
  `id_product` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `layout` varchar(100) NOT NULL,
  `size` varchar(10) NOT NULL,
  `connection` varchar(100) NOT NULL,
  `switch` varchar(100) NOT NULL,
  `main_color` varchar(100) NOT NULL,
  `key_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_product` (`id_product`, `name`, `description`, `price`, `image_url`, `layout`, `size`, `connection`, `switch`, `main_color`, `key_color`) VALUES
(1, 'Keyboard 1', 'This is a description of Keyboard 1', '99.99', 'https://example.com/keyboard1.jpg', 'ABNT', '100%', 'USB', 'Blue', 'Branco', 'Branco'),
(2, 'Keyboard 2', 'This is a description of Keyboard 2', '199.99', 'https://example.com/keyboard2.jpg', 'ABNT2', '80%', 'Bluetooth', 'Brown', 'Preto', 'Roxo'),
(3, 'Keyboard 3', 'This is a description of Keyboard 3', '299.99', 'https://example.com/keyboard3.jpg', 'ABNT2', '65%', 'Wireless', 'Red', 'Cinza', 'Preto'),
(4, 'Keyboard 4', 'This is a description of Keyboard 4', '349.99', 'https://example.com/keyboard4.jpg', 'ABNT', '60%', 'Wireless', 'Red', 'Cinza', 'Preto');

CREATE TABLE `kp_user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kp_user` (`id_user`, `name`, `email`, `password`, `cpf`, `phone`) VALUES
(1, 'João Silva', 'joao.silva@example.com', 'password1', '12345678901', '11987654321'),
(2, 'Maria Santos', 'maria.santos@example.com', 'password2', '23456789012', '21987654321'),
(3, 'Lucas Souza', 'lucas.souza@example.com', 'password3', '34567890123', '31987654321'),
(4, 'Ana Paula', 'ana.paula@example.com', 'password4', '45678901234', '41987654321');


ALTER TABLE `kp_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `address_fkUser` (`id_user`);

ALTER TABLE `kp_cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `cart_fkUser` (`id_user`);

ALTER TABLE `kp_cart_items`
  ADD PRIMARY KEY (`id_cart_items`),
  ADD KEY `cart_items_fkCart` (`id_cart`),
  ADD KEY `cart_items_fkProduct` (`id_product`);

ALTER TABLE `kp_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `order_fkUser` (`id_user`);

ALTER TABLE `kp_order_items`
  ADD PRIMARY KEY (`id_order_items`),
  ADD KEY `order_items_fkOrder` (`id_order`),
  ADD KEY `order_items_fkProduct` (`id_product`);

ALTER TABLE `kp_product`
  ADD PRIMARY KEY (`id_product`);

ALTER TABLE `kp_user`
  ADD PRIMARY KEY (`id_user`);


ALTER TABLE `kp_address`
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `kp_cart`
  MODIFY `id_cart` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `kp_cart_items`
  MODIFY `id_cart_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `kp_order`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `kp_order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `kp_product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `kp_user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `kp_address`
  ADD CONSTRAINT `address_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `kp_cart`
  ADD CONSTRAINT `cart_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `kp_cart_items`
  ADD CONSTRAINT `cart_items_fkCart` FOREIGN KEY (`id_cart`) REFERENCES `kp_cart` (`id_cart`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `kp_order`
  ADD CONSTRAINT `order_fkUser` FOREIGN KEY (`id_user`) REFERENCES `kp_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `kp_order_items`
  ADD CONSTRAINT `order_items_fkOrder` FOREIGN KEY (`id_order`) REFERENCES `kp_order` (`id_order`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_items_fkProduct` FOREIGN KEY (`id_product`) REFERENCES `kp_product` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;