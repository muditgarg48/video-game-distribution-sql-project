CREATE SCHEMA `server_database` ;

-- Table Creation

CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `First Name` varchar(30) NOT NULL,
  `Last Name` varchar(45) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Language` varchar(10) NOT NULL DEFAULT 'English',
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_ID_UNIQUE` (`User_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) COMMENT='List of all the users and their details in the database'

CREATE TABLE `games` (
  `Game_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) NOT NULL,
  `Price` float NOT NULL DEFAULT '0',
  `Release Date` datetime NOT NULL,
  PRIMARY KEY (`Game_ID`),
  UNIQUE KEY `Game_ID_UNIQUE` (`Game_ID`)
) COMMENT='List of all the games present in the database'

CREATE TABLE `user_libraries` (
  `Library Item ID` int NOT NULL AUTO_INCREMENT,
  `library_id` int NOT NULL,
  `game_ids` int NOT NULL,
  PRIMARY KEY (`Library Item ID`),
  KEY `Library_ID_idx` (`library_id`),
  KEY `Game_ID_idx` (`game_ids`),
  CONSTRAINT `game_ids_library` FOREIGN KEY (`game_ids`) REFERENCES`games` (`Game_ID`),
  CONSTRAINT `library_id` FOREIGN KEY (`library_id`) REFERENCES `users`(`User_ID`)
) COMMENT='Table that stores all the library items of all the users in the database by
using the User_ID from the Users table and the Game_ID from the Games table'

CREATE TABLE `user_wishlists` (
  `Wishlist Item ID` int NOT NULL AUTO_INCREMENT,
  `wishlist_id` int NOT NULL,
  `game_ids` int NOT NULL,
  PRIMARY KEY (`Wishlist Item ID`),
  KEY `User_ID_idx` (`wishlist_id`),
  KEY `Game_ID_idx` (`game_ids`),
  CONSTRAINT `game_ids_wishlist` FOREIGN KEY (`game_ids`) REFERENCES `games` (`Game_ID`),
  CONSTRAINT `Wishlist_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `users` (`User_ID`)
) COMMENT='Table that stores all the wishlists of all the users in the database by
using the User_ID from the Users table and the Game_ID from the Games table'


CREATE TABLE `user_carts` (
  `Cart Item ID` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `game_ids` int NOT NULL,
  PRIMARY KEY (`Cart Item ID`),
  KEY `User_ID_idx` (`cart_id`),
  KEY `Game_ID_idx` (`game_ids`),
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `users` (`User_ID`),
  CONSTRAINT `game_ids_cart` FOREIGN KEY (`game_ids`) REFERENCES `games` (`Game_ID`)
) COMMENT='Table that stores all the cart items of all the users in the database by
using the User_ID from the Users table and the Game_ID from the Games table'

CREATE TABLE `platforms` (
  `Platform Item ID` int NOT NULL AUTO_INCREMENT,
  `Game_ID` int NOT NULL,
  `Platform_ID` int NOT NULL,
  `Platform Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Platform Item ID`),
  KEY `game_ids_platform_idx` (`Game_ID`),
  CONSTRAINT `game_ids_platform` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`)
) COMMENT='List of all the platforms that all the games in the database are released
for'

CREATE TABLE `publishers` (
  `Publisher Item ID` int NOT NULL AUTO_INCREMENT,
  `Publisher_ID` int NOT NULL,
  `Publisher Name` varchar(60) NOT NULL,
  `Game_ID` int NOT NULL,
  PRIMARY KEY (`Publisher Item ID`),
  KEY `game_id_publisher_idx` (`Game_ID`),
  CONSTRAINT `game_id_publisher` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`)
) COMMENT='Table that contains all the games that each of the games in the database
belong to'

CREATE TABLE `server_database`.`genres` (
  `Genre_ID` INT NOT NULL,
  `Genre Name` VARCHAR(45) NOT NULL,
  `Game_ID` INT NOT NULL,
  INDEX `game_id_genre_idx` (`Game_ID` ASC) VISIBLE,
  CONSTRAINT `game_id_genre`
    FOREIGN KEY (`Game_ID`)
    REFERENCES `server_database`.`games` (`Game_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Table that contains all the genres that each of the games in the database belong to';

CREATE TABLE `genres` (
  `Genre Item ID` int NOT NULL AUTO_INCREMENT,
  `Genre_ID` int NOT NULL,
  `Genre Name` varchar(45) NOT NULL,
  `Game_ID` int NOT NULL,
  PRIMARY KEY (`Genre Item ID`),
  KEY `game_id_genre_idx` (`Game_ID`),
  CONSTRAINT `game_id_genre` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`)
) COMMENT='Table that contains all the genres that each of the games in the database
belong to'

-- Table Population

INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('1', 'Mudit', 'Garg', 'gargmu@tcd.ie', 'FunnyNinja23', 'English');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('2', 'Rahul', 'Garg', 'gargr@tcd.ie', '3flex@', 'Hindi');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('3', 'Yashraj', 'Saluja', 'yashraj@gmail.com', 'maakaladla134', 'Punjabi');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('4', 'Angad', 'Singh Garcha', 'garchaa@outlook.com', 'ikyktk69', 'French');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('5', 'Ritwik', 'Kumar', 'kumarritwik@aol.com', 'coolDude13', 'Tamil');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('6', 'Ananya', 'Garg', 'papaKipari@yahoo.com', 'cakemurder01', 'Hindi');
INSERT INTO `server_database`.`users` (`User_ID`, `First Name`, `Last Name`, `Email`, `Password`, `Language`) VALUES ('7', 'Mathew', 'McHart', 'mathewmc@aol.com', 'asdfmovie%', 'English');

INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('1', 'Uncharted', '23.99', '2015-10-21')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('2', 'The Spiderman', '14.99', '2021-11-17')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('3', 'GTA V', '8.99', '2013-09-10')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('4', 'Red Dead Redemption', '18.99', '2018-06-16')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('5', 'FIFA 19', '20.99', '2019-04-12')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('6', 'Cyberpunk 2077', '15.99', '2020-11-30')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('7', 'Spiderman: Miles Morales', '28.99', '2022-11-17')
INSERT INTO `server_database`.`games` (`Game_ID`, `Name`, `Price`, `Release Date`) VALUES ('8', 'Witcher 3', '32.99', '2018-03-25')

INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('1', '1', '2')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('2', '1', '3')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('3', '1', '1')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('4', '4', '3')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('5', '2', '9')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('6', '7', '5')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('7', '7', '3')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('8', '7', '1')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('9', '7', '2')
INSERT INTO `server_database`.`user_libraries` (`Library Item ID`, `library_id`, `game_ids`) VALUES ('10', '7', '4')

INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('1', '1', '7')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('2', '1', '6')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('3', '2', '3')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('4', '2', '8')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('5', '6', '3')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('6', '5', '5')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('7', '4', '5')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('8', '4', '8')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('9', '3', '5')
INSERT INTO `server_database`.`user_wishlists` (`Wishlist Item ID`, `wishlist_id`, `game_ids`) VALUES ('10', '3', '2')

INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('1', '1', '7')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('2', '1', '6')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('3', '7', '6')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('4', '7', '7')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('5', '3', '1')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('6', '3', '2')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('7', '3', '3')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('8', '3', '5')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('9', '3', '9')
INSERT INTO `server_database`.`user_carts` (`Cart Item ID`, `cart_id`, `game_ids`) VALUES ('10', '5', '9')

INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('1', '1', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('2', '1', '2', 'Xbox')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('3', '1', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('4', '2', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('5', '2', '2', 'Xbox')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('6', '2', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('7', '3', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('8', '4', '2', 'Xbox')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('9', '4', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('10', '5', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('11', '6', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('12', '7', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('13', '7', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('14', '8', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('15', '8', '2', 'Xbox')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('16', '8', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('17', '9', '1', 'PC')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('18', '9', '2', 'Xbox')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('19', '9', '3', 'Playstation')
INSERT INTO `server_database`.`platforms` (`Platform Item ID`, `Game_ID`, `Platform_ID`, `Platform Name`) VALUES ('20', '9', '4', 'Android')

INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('1', '1', 'Sony Interactive Entertainment', '1')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('2', '1', 'Sony Interactive Entertainment', '2')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('3', '1', 'Sony Interactive Entertainment', '7')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('4', '2', 'Rockstar Games', '3')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('5', '2', 'Rockstar Games', '9')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('6', '2', 'Rockstar Games', '4')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('7', '3', 'Electronic Arts', '5')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('8', '4', 'CD Projekt Red', '6')
INSERT INTO `server_database`.`publishers` (`Publisher Item ID`, `Publisher_ID`, `Publisher Name`, `Game_ID`) VALUES ('9', '4', 'CD Projekt Red', '8')

INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('1', '1', 'Action', '1')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('2', '2', 'Adventure', '1')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('3', '1', 'Action', '2')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('4', '2', 'Adventure', '2')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('5', '1', 'Action', '3')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('6', '2', 'Adventure', '3')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('7', '1', 'Action', '4')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('8', '2', 'Adventure', '4')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('9', '3', 'Unique', '4')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('10', '4', 'Sports', '5')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('11', '5', 'RPG', '6')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('12', '1', 'Action', '7')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('13', '2', 'Adventure', '7')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('14', '3', 'Unique', '8')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('15', '5', 'RPG', '8')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('16', '1', 'Action', '9')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('17', '2', 'Adventure', '9')
INSERT INTO `server_database`.`genres` (`Genre Item ID`, `Genre_ID`, `Genre Name`, `Game_ID`) VALUES ('18', '5', 'RPG', '9')

INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('1', '1', '2')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('2', '1', '3')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('3', '1', '4')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('4', '1', '5')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('5', '2', '1')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('6', '2', '3')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('7', '2', '4')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('8', '3', '1')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('9', '3', '2')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('10', '4', '1')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('11', '4', '2')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('12', '5', '1')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('13', '5', '6')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('14', '6', '5')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('15', '4', '6')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('16', '6', '4')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('17', '6', '7')
INSERT INTO `server_database`.`friend_list` (`Relationship ID`, `user_id`, `friend_id`) VALUES ('18', '7', '6')

-- Views

CREATE VIEW `gta5_holders` AS
    SELECT 
        `user_libraries`.`library_id` AS `GTA 5 Holders' User ID`
    FROM
        `user_libraries`
    WHERE
        (`user_libraries`.`game_ids` = 3)

CREATE VIEW `action_games` AS
    SELECT 
        `genres`.`Game_ID` AS `Action_Game_IDs`
    FROM
        `genres`
    WHERE
        (`genres`.`Genre Name` = 'Action')

-- Triggers 

DROP TRIGGER IF EXISTS `games`.`check_price`;
CREATE TRIGGER `check_price` BEFORE INSERT ON `games` FOR EACH ROW BEGIN
		IF NEW.price < 0 
			THEN SET NEW.price = abs(NEW.price);
        END IF;
END