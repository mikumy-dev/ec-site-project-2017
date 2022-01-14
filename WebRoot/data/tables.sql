CREATE TABLE addr(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT,
`productid` INT,
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `area`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`areaid` INT,
`cityid` INT,
`area` VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `city`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`cityid` INT,
`provinceid` INT,
`city` VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `collection`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT,
`productid` INT,
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`productid` INT,
`userid` INT,
`content` VARCHAR(500),
`status` VARCHAR(20),
`tasteid` INT,
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table `order`;
CREATE TABLE `order`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT,
`ordernum` VARCHAR(50),
`turnover_time` DATE,
`addrid` INT,
`status` VARCHAR(20),
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order_schedule`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`productid` INT,
`taste` INT,
`num` INT,
`orderid` INT,
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table `product`;
CREATE TABLE `product`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`product_name` VARCHAR(100),
`product_picture_big` VARCHAR(200),
`product_picture_mid` VARCHAR(200),
`product_picture_small` VARCHAR(200),
`product_details_picture` VARCHAR(200),
`product_type` INT,
`material_addr` VARCHAR(300),
`produce_addr` VARCHAR(300),
`ingredients` VARCHAR(500),
`specifications` INT,
`expiration_time` VARCHAR(25),
`standard_no` VARCHAR(50),
`production_license` VARCHAR(50),
`storage` VARCHAR(50),
`edible_methods` VARCHAR(150),
`inventory` INT,
`price` DOUBLE,
`sales_volume` INT,
`good_comment_ratio` DOUBLE,
`tasteid` VARCHAR(20),
`status` VARCHAR(20),
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE,
`product_details` LONG VARCHAR
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `province`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`provinceid` INT,
`province` VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shopCart`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` INT,
`total_money` DOUBLE,
`quantity` INT,
`product_id` INT,
`remark` VARCHAR(200),
`price` DOUBLE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taste`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(20),
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `type`(
`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`type_name` VARCHAR(20),
`iconpath` VARCHAR(200),
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table `user`;
CREATE TABLE `user`(
`uid` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`avatar` VARCHAR(200),
`username` VARCHAR(20),
`nickname` VARCHAR(20),
`realname` VARCHAR(20),
`sex` VARCHAR(20),
`birthday` Date,
`phone` VARCHAR(20),
`email` VARCHAR(50),
`loginpwd` VARCHAR(50),
`status` VARCHAR(20),
`role` VARCHAR(20),
`created_by` VARCHAR(20),
`created_date` DATE,
`last_update_by` VARCHAR(20),
`last_update_date` DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;