
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


