use everyone;
CREATE TABLE `attributes` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`key` varchar(50) NOT NULL COMMENT 'la categoria debe ser colocada en base de datos como TOUPPERS y sin espacios',
`value` varchar(100) NULL,
`category` varchar(20) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `zone` (
`id` int(20) NOT NULL,
`city_id` int(20) NOT NULL,
`name` varchar(20) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `department` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`country_id` int(20) NOT NULL,
`name` varchar(50) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `city` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`department_id` int(20) NOT NULL,
`name` varchar(20) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `country` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `systems` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`name` varchar(20) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `profile` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`name` varchar(20) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `profile_systems` (
`id` int(20) NOT NULL,
`profile_id` int(20) NOT NULL,
`systems_id` int(20) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `page` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`system_id` int(20) NOT NULL,
`name` varchar(20) NOT NULL,
`url` varchar(50) NULL,
`order` int(20) NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `profile_page` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`profile_id` int(20) NOT NULL,
`page_id` int(20) NOT NULL,
`view` bit NOT NULL DEFAULT 0,
`create` bit NOT NULL DEFAULT 0,
`edit` bit NOT NULL DEFAULT 0,
`delete` bit NOT NULL DEFAULT 0,
`advanced` bit NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `users` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`profile_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`name` varchar(20) NOT NULL,
`lastname` varchar(20) NOT NULL,
`email` varchar(20) NOT NULL,
`pass` varchar(50) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `users_image` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`user_id` int(20) NOT NULL,
`image_type_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`image` mediumblob NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `partner` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`user_owner_id` int(20) NOT NULL,
`partner_type_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`country_id` int(20) NOT NULL,
`department_id` int(20) NOT NULL,
`city_id` int(20) NOT NULL,
`zone_id` int(20) NOT NULL,
`name` varchar(50) NOT NULL,
`identificator` varchar(20) NOT NULL,
`email` varchar(100) NOT NULL,
`phone` varchar(100) NULL,
`address` varchar(500) NULL,
`location` varchar(100) NULL,
`free_from` date NULL,
`free_until` date NULL,
`collection_percentage` int(20) NULL,
`collection_amount` decimal(20,2) NULL,
`collection_frequency_id` int(20) NULL,
`instagram` varchar(20) NULL,
`twitter` varchar(20) NULL,
`linkedin` varchar(50) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `partner_gallery` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`image_type_id` int(20) NOT NULL,
`partner_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`posicicon` int(5) NOT NULL,
`name` varchar(20) NOT NULL,
`alt` varchar(20) NOT NULL,
`image` mediumblob NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `coins` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`name` varchar(20) NOT NULL,
`shortname` varchar(20) NOT NULL,
`symbol` varchar(5) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `coins_conversions` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`coin_from_id` int(10) NOT NULL,
`equivalence amount` decimal(20,2) NOT NULL,
`coin_until_id` int(20) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `products` (
`id` int(20) NOT NULL,
`product_father_id` int(20) NULL,
`product_type_id` int(20) NOT NULL,
`category_id` int(20) NOT NULL,
`partner_id` int(20) NOT NULL,
`country_id` int(20) NOT NULL,
`department_id` int(20) NOT NULL,
`city_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`name` varchar(200) NOT NULL,
`short_description` varchar(50) NOT NULL,
`full_description` varchar(8000) NOT NULL,
`sku` varchar(100) NOT NULL COMMENT 'DEBE SER GENERADO BAJO ESTA COMBINACION DE FUNSIONES DE PHP ==> strtoupper(uniqid(\'PROD-\').date(\"msmhhmmdssY\"));',
`published` tinyint(1) NOT NULL DEFAULT 0,
`allows_delivery` tinyint(1) NOT NULL DEFAULT 0,
`allows_search` tinyint(1) NOT NULL,
`allows_onsite` tinyint(1) NOT NULL DEFAULT 0,
`shipping_enabled` tinyint(1) NOT NULL DEFAULT 0,
`shipping_weight` decimal(20,2) NULL,
`shipping_weight_unid` varchar(5) NULL,
`shipping_width` decimal(20,2) NULL,
`shipping_height` decimal(20,2) NULL,
`shipping_free` tinyint(1) NOT NULL DEFAULT 0,
`shipping_additional_charge` decimal(20,2) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `product_gallery` (
`id` int(20) NOT NULL,
`product_id` int(20) NOT NULL,
`image_type_id` int(20) NOT NULL,
`alt` varchar(20) NOT NULL,
`name` varchar(20) NOT NULL,
`posicicon` int(5) NOT NULL,
`image` mediumblob NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `product_price` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`product_id` int(20) NOT NULL,
`coin_id` int(20) NOT NULL,
`description` varchar(50) NOT NULL,
`amount` decimal(20,2) NOT NULL,
`discount_rate` int(20) NULL,
`highlight` tinyint(1) NOT NULL DEFAULT 0,
`position` int(20) NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) 
);
CREATE TABLE `product_tag` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`product_id` int(20) NOT NULL,
`product_tag_id` int(20) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `partner_attention_hours` (
`id` int(20),
`partner_id` int(20) NOT NULL,
`time_from` time NOT NULL,
`time_until` time NOT NULL,
`weekday` varchar(10) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `partner_successes` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`partner_id` int(20) NOT NULL,
`description` varchar(280) NOT NULL,
`posicicon` int(5) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `partner_max_reservations` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`partner_id` int(20) NOT NULL,
`quantity` int(10) NOT NULL,
`weekday` varchar(10) NOT NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `reservations` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`partner_id` int(20) NOT NULL,
`user_id` int(20) NOT NULL,
`status_id` int(20) NOT NULL,
`locator` varchar(100) NULL,
`reservation_date` date NULL,
`reservation_hour` time NULL,
`reservation_creation` time NULL,
`product_name` varchar(200) NULL,
`quantity` int(5) NULL,
`unid_price` decimal(20,2) NULL,
`total_price` decimal(20,2) NULL,
`coin_shortname` varchar(20) NULL,
`method` varchar(20) NULL,
`country_name` varchar(50) NULL,
`city_name` varchar(50) NULL,
`department_name` varchar(50) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `product_locator_stock` (
`id` int(20) NOT NULL AUTO_INCREMENT,
`product_id` int(20) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`locator` varchar(200) NOT NULL,
`locator_from` date NULL,
`locator_until` date NULL,
PRIMARY KEY (`id`) 
);

ALTER TABLE `department` ADD CONSTRAINT `fk_department_country_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
ALTER TABLE `city` ADD CONSTRAINT `fk_city_department_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
ALTER TABLE `zone` ADD CONSTRAINT `fk_zone_city_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);
ALTER TABLE `profile_systems` ADD CONSTRAINT `fk_profile_systems_profile_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`);
ALTER TABLE `profile_systems` ADD CONSTRAINT `fk_profile_systems_systems_1` FOREIGN KEY (`systems_id`) REFERENCES `systems` (`id`);
ALTER TABLE `profile_page` ADD CONSTRAINT `fk_profile_page_page_1` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`);
ALTER TABLE `page` ADD CONSTRAINT `fk_page_systems_1` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`);
ALTER TABLE `users_image` ADD CONSTRAINT `fk_users_image_attributes_1` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `users_image` ADD CONSTRAINT `fk_users_image_attributes_2` FOREIGN KEY (`image_type_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `users_image` ADD CONSTRAINT `fk_users_image_users_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `users` ADD CONSTRAINT `fk_users_attributes_1` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `users` ADD CONSTRAINT `fk_users_profile_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_users_1` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_attributes_1` FOREIGN KEY (`partner_type_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_attributes_2` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_country_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_department_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_city_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_zone_1` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`);
ALTER TABLE `partner` ADD CONSTRAINT `fk_partner_attributes_3` FOREIGN KEY (`collection_frequency_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `partner_gallery` ADD CONSTRAINT `fk_partner_image_attributes_1` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `partner_gallery` ADD CONSTRAINT `fk_partner_image_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `coins_conversions` ADD CONSTRAINT `fk_coins_conversions_coins_1` FOREIGN KEY (`coin_from_id`) REFERENCES `coins` (`id`);
ALTER TABLE `coins_conversions` ADD CONSTRAINT `fk_coins_conversions_coins_2` FOREIGN KEY (`coin_until_id`) REFERENCES `coins` (`id`);
ALTER TABLE `partner_gallery` ADD CONSTRAINT `fk_partner_gallery_attributes_1` FOREIGN KEY (`image_type_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_attributes_1` FOREIGN KEY (`product_type_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_attributes_2` FOREIGN KEY (`category_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_country_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_department_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_city_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);
ALTER TABLE `products` ADD CONSTRAINT `fk_products_attributes_3` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `product_gallery` ADD CONSTRAINT `fk_product_gallery_products_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
ALTER TABLE `product_gallery` ADD CONSTRAINT `fk_product_gallery_attributes_1` FOREIGN KEY (`image_type_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `product_price` ADD CONSTRAINT `fk_product_price_products_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
ALTER TABLE `product_price` ADD CONSTRAINT `fk_product_price_coins_1` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`);
ALTER TABLE `product_tag` ADD CONSTRAINT `fk_product_tag_products_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
ALTER TABLE `product_tag` ADD CONSTRAINT `fk_product_tag_attributes_1` FOREIGN KEY (`product_tag_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `partner_attention_hours` ADD CONSTRAINT `fk_partner_attention_hours_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `partner_successes` ADD CONSTRAINT `fk_partner_successes_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `partner_max_reservations` ADD CONSTRAINT `fk_partner_max_reservations_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `reservations` ADD CONSTRAINT `fk_reservations_partner_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`);
ALTER TABLE `reservations` ADD CONSTRAINT `fk_reservations_users_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `reservations` ADD CONSTRAINT `fk_reservations_attributes_1` FOREIGN KEY (`status_id`) REFERENCES `attributes` (`id`);
ALTER TABLE `product_locator_stock` ADD CONSTRAINT `fk_product_locator_stock_products_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

