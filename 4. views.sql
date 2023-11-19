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