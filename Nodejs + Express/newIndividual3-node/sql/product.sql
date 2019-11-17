use wchen;
CREATE TABLE IF NOT EXISTS `PRODUCTS` (
  `prd_id` int(11) NOT NULL,
  `prd_name` varchar(20) NOT NULL,
  `prd_price` varchar(10) NOT NULL
);

select * from PRODUCTS;
desc PRODUCTS;