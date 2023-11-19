DROP TRIGGER IF EXISTS `games`.`check_price`;
CREATE TRIGGER `check_price` BEFORE INSERT ON `games` FOR EACH ROW BEGIN
		IF NEW.price < 0 
			THEN SET NEW.price = abs(NEW.price);
        END IF;
END