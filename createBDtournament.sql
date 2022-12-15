CREATE SCHEMA IF NOT EXISTS `tournament` ;

CREATE TABLE IF NOT EXISTS `tournament`.`tournament` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `organizer` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `tournament`.`player` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(45),
    `category` VARCHAR(45),
    `wins` INT,
    PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `tournament`.`team` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `player1_id` INT NOT NULL,
    `player2_id` INT NOT NULL,
    `description` VARCHAR(45) NOT NULL,
    `tournament_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_team_player1_idx` (`player1_id` ASC),
    INDEX `fk_team_player2_idx` (`player2_id` ASC),
    INDEX `fk_team_tournament_idx` (`tournament_id` ASC),
    CONSTRAINT `fk_team_player1`
        FOREIGN KEY (`player1_id`)
        REFERENCES `tournament`.`player` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_team_player2`
        FOREIGN KEY (`player2_id`)
        REFERENCES `tournament`.`player` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_team_tournament`
        FOREIGN KEY (`tournament_id`)
        REFERENCES `tournament`.`tournament` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `tournament`.`match` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `time` TIME NOT NULL,
    `team1_id` INT NOT NULL,
    `team2_id` INT NOT NULL,
    `score1` INT,
    `score2` INT,
    `score3` INT,
    `zone` INT,
    `tournament_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_match_team1_idx` (`team1_id` ASC),
    INDEX `fk_match_team2_idx` (`team2_id` ASC),
    INDEX `fk_match_tournament_idx` (`tournament_id` ASC),
    CONSTRAINT `fk_match_team1`
        FOREIGN KEY (`team1_id`)
        REFERENCES `tournament`.`team` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_match_team2`
        FOREIGN KEY (`team2_id`)
        REFERENCES `tournament`.`team` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_match_tournament`
        FOREIGN KEY (`tournament_id`)
        REFERENCES `tournament`.`tournament` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)