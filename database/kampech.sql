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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kp_cart` (
  `id_cart` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kp_cart_items` (
  `id_cart_items` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kp_order` (
  `id_order` int NOT NULL,
  `id_user` int NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kp_order_items` (
  `id_order_items` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `kp_user` (
  `id_user` int NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  MODIFY `id_address` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_cart`
  MODIFY `id_cart` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_cart_items`
  MODIFY `id_cart_items` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_order`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_order_items`
  MODIFY `id_order_items` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_product`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `kp_user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT;


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