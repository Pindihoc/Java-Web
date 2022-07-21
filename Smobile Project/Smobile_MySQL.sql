DROP DATABASE IF EXISTS Smobile;
CREATE DATABASE Smobile;
 
USE `Smobile`;
 
 -- creating tables
CREATE TABLE User(
	`user_mail` NVARCHAR(100) NOT NULL,
	`password` NVARCHAR(64) NOT NULL,
	`account_role` INT NOT NULL DEFAULT 0,
	`user_name` NVARCHAR(50) NOT NULL,
	`user_address` NVARCHAR(255) NULL,
	`user_phone` NVARCHAR(10) NULL,
    `account_state` INT NOT NULL DEFAULT 0,
    `false_login_count` int NOT NULL DEFAULT 0,
PRIMARY KEY (
	`user_mail` ASC
) 
);

CREATE TABLE Admin(
	`admin_mail` NVARCHAR(100) NOT NULL,
	`password` NVARCHAR(64) NOT NULL,
	`admin_name` NVARCHAR(50) NOT NULL,
	`admin_address` NVARCHAR(255) NULL,
	`admin_phone` NVARCHAR(10) NULL,
PRIMARY KEY (
	`admin_mail` ASC
) 
);

CREATE TABLE Categories(
	`category_id` INT AUTO_INCREMENT NOT NULL,
    `product_type` NVARCHAR(100) NOT NULL,
    `product_brand` NVARCHAR(100) NOT NULL,
PRIMARY KEY(
	`category_id` ASC
)
);

CREATE TABLE Products(
	`product_id` INT AUTO_INCREMENT NOT NULL,
	`product_name` NVARCHAR(100) NOT NULL,
	`product_des` NVARCHAR(255) NULL,
	`product_price` DOUBLE NOT NULL,
	`product_img_source` NVARCHAR(255) NULL,
	`category_id` INT NOT NULL,
PRIMARY KEY (
	`product_id` ASC
) 
);

CREATE TABLE Discounts(
	`discount_id` INT AUTO_INCREMENT NOT NULL,
    `discount_code` NVARCHAR(20) NOT NULL UNIQUE,
    `discount_percentage` INT NOT NULL,
    `discount_state` INT NOT NULL DEFAULT 0,
PRIMARY KEY(
	`discount_id` ASC
),
CHECK (discount_percentage >= 0 AND discount_percentage <= 100)
);

CREATE TABLE Orders(
	`order_id` INT AUTO_INCREMENT NOT NULL,
	`order_status` INT NULL,
	`order_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `order_payment_method` INT NOT NULL,
	`discount_code` NVARCHAR(20),
    `prediscount_total_price` DOUBLE NOT NULL,
    `postdiscount_total_price` DOUBLE NOT NULL,
	`order_mail` NVARCHAR(100) NOT NULL,
	`order_address` NVARCHAR(255) NOT NULL,
    `order_phone` VARCHAR(10) NOT NULL,
PRIMARY KEY (
	`order_id` ASC
)
);

CREATE TABLE Orders_detail(
	`order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`amount_product` INT NOT NULL,
	`price_product` DOUBLE NOT NULL
);

CREATE TABLE Cart(
	`user_mail` NVARCHAR(100) NOT NULL,
	`product_id` INT NOT NULL,
	`amount_product` INT NOT NULL
);

-- setting keys/constraints
ALTER TABLE Products  ADD FOREIGN KEY(`category_id`)
REFERENCES Categories (`category_id`);

ALTER TABLE Orders  ADD FOREIGN KEY(`discount_code`)
REFERENCES Discounts (`discount_code`);

ALTER TABLE Orders_detail  ADD FOREIGN KEY(`order_id`)
REFERENCES Orders (`order_id`);
 
ALTER TABLE Orders_detail  ADD FOREIGN KEY(`product_id`)
REFERENCES Products (`product_id`);

ALTER TABLE Cart  ADD FOREIGN KEY(`user_mail`)
REFERENCES User (`user_mail`);

ALTER TABLE Cart  ADD FOREIGN KEY(`product_id`)
REFERENCES Products (`product_id`);

-- setting procedures
delimiter //
CREATE PROCEDURE GetProductsType (
p_u INT,
p_v INT,
p_b VARCHAR(50))
BEGIN
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand 
 FROM (
	SELECT *,
    ROW_NUMBER() OVER (ORDER BY product_id) AS 'row'
	FROM Products p WHERE p.product_type = p_b) p
  WHERE p.row >= p_u AND p.row <= p_v;
END//
delimiter ;

delimiter //
CREATE PROCEDURE GetProducts (
p_u INT,
p_v INT)
BEGIN
 SELECT p.product_id ,p.product_name, p.product_des, p.product_price, p.product_img_source, p.product_type, p.product_brand 
 FROM ( 
	SELECT *, ROW_NUMBER() OVER(ORDER BY product_id) AS 'row'
	FROM Products p) p 
WHERE p.row >= p_u AND p.row <= p_v;
END//
delimiter ;
 
-- Inserting data for Categories table
INSERT INTO Categories(product_type, product_brand)
VALUES('cellphone','apple');

--  Inserting data for Products table
INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 13 Pro Max 128GB','Màn hình: 6.7", Super Retina XDR
HĐH: iOS 15
CPU: Apple A15 Bionic
RAM: 6 GB, ROM: 128 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',30.290,'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-1-1.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 13 Pro 128GB','Màn hình: 6.1", Super Retina XDR
HĐH: iOS 15
CPU: Apple A15 Bionic
RAM: 6 GB, ROM: 128 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',27.590,'https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-xam-1.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 13 128GB','Màn hình: 6.1", Super Retina XDR
HĐH: iOS 15
CPU: Apple A15 Bionic
RAM: 4 GB, ROM: 128 GB
Camera: 2 camera 12 MP, Selfie: 12 MP',20.790,'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-1-5.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 13 mini 128GB','Màn hình: 5.4", Super Retina XDR
HĐH: iOS 15
CPU: Apple A15 Bionic
RAM: 4 GB, ROM: 128 GB
Camera: 2 camera 12 MP, Selfie: 12 MP',19.290,'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-1-1.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 12 Pro 512GB','Màn hình: 6.1", Super Retina XDR
HĐH: iOS 15
CPU: Apple A14 Bionic
RAM: 6 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',28.490,'https://cdn.tgdd.vn/Products/Images/42/228739/iphone-12-pro-512gb-xanh-1-org.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 12 64GB','Màn hình: 6.1", Super Retina XDR
HĐH: iOS 15
CPU: Apple A14 Bionic
RAM: 4 GB, ROM: 64 GB
Camera: 2 camera 12 MP, Selfie: 12 MP',19.990,'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-1-2.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 12 mini 64GB','Màn hình: 5.4", Super Retina XDR
HĐH: iOS 15
CPU: Apple A14 Bionic
RAM: 4 GB, ROM: 64 GB
Camera: 2 camera 12 MP, Selfie: 12 MP',14.990,'https://cdn.tgdd.vn/Products/Images/42/225380/iphone-12-mini-1-1-org.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 11 Pro Max 512GB','Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',43.990,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg',1);

INSERT INTO  Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 11 Pro Max 256GB','Màn hình: 6.5", Super Retina XDR
HĐH: iOS 13
CPU: Apple A13 Bionic 6 nhân
RAM: 4 GB, ROM: 512 GB
Camera: 3 camera 12 MP, Selfie: 12 MP',37.990,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone Xs Max 256GB','Màn hình: 6.5", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.990,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone X 256GB','Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 256 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.990,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone Xs 64GB','Màn hình: 5.8", Super Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 4 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.990,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone Xr 128GB','Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone Xr 128GB','Màn hình: 6.1", Liquid Retina
HĐH: iOS 12
CPU: Apple A12 Bionic 6 nhân
RAM: 3 GB, ROM: 128 GB
Camera: 12 MP, Selfie: 7 MP',17.990,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 8 Plus 64GB','Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A11 Bionic 6 nhân
RAM: 3 GB, ROM: 64 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.590,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 7 Plus 32GB','Màn hình: 5.5", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 3 GB, ROM: 32 GB
Camera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.490,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg',1);

INSERT INTO Products(product_name,product_des,product_price,product_img_source,category_id)
VALUES('iPhone 7 32GB','Màn hình: 4.7", Retina HD
HĐH: iOS 12
CPU: Apple A10 Fusion 4 nhân 64-bit
RAM: 2 GB, ROM: 32 GB
Camera: 12 MP, Selfie: 7 MP',10.490,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg',1);

-- Inserting data for Discounts table
INSERT INTO Discounts(`discount_code`, `discount_percentage`, `discount_state`)
VALUES('Smobile', '20', 0);

-- inserting data for User table
INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('duongdt@fpt.com.vn', '123456789', 0, 'Đinh Tùng Dương', 'Đại học FPT', '0765870407');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('quytd@fpt.com.vn', '123456789', 0, 'Thái Duy Quý', 'Đại học Đà Lạt', '1234567');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user@gmail.com', 'user@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user1@gmail.com', 'user1@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user2@gmail.com', 'user2@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user3@gmail.com', 'user3@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user4@gmail.com', 'user4@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user5@gmail.com', 'user5@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user6@gmail.com', 'user6@gmail.com', 0, 'User', 'User', 'User');

INSERT INTO User (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`) 
VALUES ('user7@gmail.com', 'user7@gmail.com', 0, 'User', 'User', 'User');

-- inserting data for Admin table
INSERT INTO Admin(`admin_mail`,`password`,`admin_name`)
VALUES ('admin@gmail.com','admin@gmail.com','admin');

INSERT INTO Admin(`admin_mail`,`password`,`admin_name`)
VALUES ('admin1@gmail.com','admin1@gmail.com','admin');

INSERT INTO Admin(`admin_mail`,`password`,`admin_name`)
VALUES ('admin2@gmail.com','admin2@gmail.com','admin');

INSERT INTO Admin(`admin_mail`,`password`,`admin_name`)
VALUES ('admin3@gmail.com','admin3@gmail.com','admin');
