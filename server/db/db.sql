-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.genres
(
    id bigserial NOT NULL,
    genre_name character varying(45),
    genre_image text,
    genre_description text,
    created_at timestamp with time zone DEFAULT current_timestamp,
    updated_at timestamp with time zone DEFAULT now(),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.anime
(
    id bigserial NOT NULL,
    name character varying(255),
    episodes integer,
    image text,
    year integer,
    creator character varying(255),
    genre_id bigint,
    description text,
    created_at timestamp with time zone DEFAULT current_timestamp,
    updated_at timestamp with time zone DEFAULT now(),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.anime
    ADD CONSTRAINT genre_id FOREIGN KEY (genre_id)
    REFERENCES public.genres (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
    -- -----------------------------------------------------
-- Schema dojos_and_ninjas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dojos_and_ninjas` ;

-- -----------------------------------------------------
-- Schema dojos_and_ninjas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dojos_and_ninjas` DEFAULT CHARACTER SET utf8 ;
USE `dojos_and_ninjas` ;

-- -----------------------------------------------------
-- Table `dojos_and_ninjas`.`dojos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dojos_and_ninjas`.`dojos` ;

CREATE TABLE IF NOT EXISTS `dojos_and_ninjas`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NULL,
  `genre_description` TEXT,
  `created_at` DATETIME NULL default current_timestamp,
  `updated_at` DATETIME NULL default now() on update now(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dojos_and_ninjas`.`ninjas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dojos_and_ninjas`.`ninjas` ;

CREATE TABLE IF NOT EXISTS `dojos_and_ninjas`.`ninjas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `image` VARCHAR(255) NULL,
  `dojo_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_ninjas_dojos_idx` (`dojo_id` ASC) VISIBLE,
  CONSTRAINT `fk_ninjas_dojos`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `dojos_and_ninjas`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- genres pre-populated information
-- -----------------------------------------------------


INSERT INTO genres(genre_name, genre_image, genre_description)
VALUES ('Fantasy','http://www.j1studios.com/wordpress/wp-content/uploads/AoT_S3.jpg', 'Fantasy is an encompassing genre that can house everything from medieval magic, swords, dragons, elves, and anything not explicitly rooted in scientific explanations. If the content falls outside of reality and is not explainable with real-world science, chances are it will be here.'),
('Action','http://images.gmanews.tv/webpics/2021/01/my_hero_academia_2021_01_26_15_02_29.jpg', 'Action favors things happening over extended dialogue or an emphasis on mundane activities. You will not find daily life here, but rather relentless fighting, limitless power levels, and a major emphasis on maximizing strength.'),
('Science Fiction','https://geekculture.co/wp-content/uploads/2018/04/cowboy-bebop-886x500.jpg', 'Unlike its counterpart in fantasy, this genre emphasizes possibly fantastical advances in technology that can be explained using real-world science. Attention to details such as gravity, atmospheric pressure, and forces apply here. You will not find the power of friendship, probably...'),
('Slice of Life','https://i0.wp.com/www.monstersandcritics.com/wp-content/uploads/2020/04/Fruits-Basket-Season-3-release-date-Fruits-Basket-3rd-Season-Furuba-ending-2021.jpg?resize=780%2C439&ssl=1', 'Similar to a piece of cake, this genre is typically sweet and calming. It often portrays people going about their delay lives, good or otherwise, and the trials and tribulations of mundanity.'),
('Mecha','https://staticc.sportskeeda.com/editor/2022/03/b090b-16485410205928-1920.jpg', 'This is all about giant robots fighting things, typically other giant robots, but monsters and armies apply as well.'),
('Romance','https://www.voicemag.uk/filesystem/user_cropped/article/1269b7e1530b61ea83328a5e5289db7785b961f5.jpeg','For the love of love, this genre is all about stomach butterflies, sweaty palms, overthinking, and the hedgehog dilemma.');

-- -----------------------------------------------------
-- genres sample update statement
-- -----------------------------------------------------

UPDATE genres 
SET 
    genre_name = 'Mecha'
WHERE
    id = 1;

UPDATE genres 
SET 
    genre_image = 'https://static1.srcdn.com/wordpress/wp-content/uploads/2022/01/K-On-anime.jpeg'
WHERE
    id = 4;


-- -----------------------------------------------------
-- anime pre-populated information
-- -----------------------------------------------------

INSERT INTO anime(name, episodes, image, year, creator,genre_id)
VALUES ('Gurren Lagann',27,'https://cdn.myanimelist.net/images/anime/7/6425l.jpg',2007,'Hiroyuki Imaishi',5),
('Outlaw Star',24,'https://cdn.myanimelist.net/images/anime/7/28848.jpg',1998,'creator',3),
('Spice and Wolf',25,'https://cdn.myanimelist.net/images/anime/5/59401.jpg',2008,'creator',1),
('Darling in the Franxx',24,'https://cdn.myanimelist.net/images/anime/1614/90408.jpg',2018,'creator',5),
('Black Lagoon',29,'https://cdn.myanimelist.net/images/anime/8/75529.jpg',2006,'creator',2),
('Attack on Titan',86,'https://cdn.myanimelist.net/images/anime/10/47347.jpg',2013,'creator',1),
('Darker Than Black',37,'https://cdn.myanimelist.net/images/anime/5/19570.jpg',2007,'creator',2),
('Kobayashi Dragon Maid',25,'https://cdn.myanimelist.net/images/anime/5/85434.jpg',2017,'creator',4),
('A Silent Voice',1,'https://cdn.myanimelist.net/images/anime/1122/96435.jpg',2016,'creator',6),
('Fullmetal Alchemist Brotherhood',64,'https://cdn.myanimelist.net/images/anime/1223/96541.jpg',2009,'creator',1),
('My Hero Academia',113,'https://cdn.myanimelist.net/images/anime/10/78745.jpg',2016,'creator',2),
('Dragon Ball Z',291,'https://cdn.myanimelist.net/images/anime/1607/117271.jpg',1989,'creator',2),
('Cowboy Bebop',26,'https://cdn.myanimelist.net/images/anime/4/19644.jpg',1998,'creator',3),
('Neon Genesis Evangelion',26,'https://cdn.myanimelist.net/images/anime/1314/108941.jpg',1995,'creator',5),
('Demon Slayer',37,'https://cdn.myanimelist.net/images/anime/1286/99889.jpg',2019,'creator',1),
('Horimiya',13,'https://cdn.myanimelist.net/images/anime/1695/111486.jpg',2021,'creator',6),
('Fruits Basket',26,'https://cdn.myanimelist.net/images/anime/4/75204.jpg',2001,'creator',4),
('Samurai Champloo',26,'https://cdn.myanimelist.net/images/anime/1375/121599.jpg',2004,'creator',2),
('Record of Lodoss War',13,'https://cdn.myanimelist.net/images/anime/1644/92493.jpg',1997,'creator',1),
('Death Note',37,'https://cdn.myanimelist.net/images/anime/9/9453.jpg',2007,'creator',2),
('Jujutsu Kaisen',24,'https://cdn.myanimelist.net/images/anime/1171/109222.jpg',2020,'creator',1),
('Tonikawa',12,'https://cdn.myanimelist.net/images/anime/1613/108722.jpg',2020,'creator',6);

select * 
from anime
INNER JOIN genres ON anime.genre_id= genres.id


select * from anime inner join genres on anime.genre_id=genres.id


-- -----------------------------------------------------
-- users database SQL
-- -----------------------------------------------------

    id bigint DEFAULT nextval('public.anime_id_seq'::regclass),
    first character varying(255) NOT NULL,
    last character varying(255) NOT NULL,
    username character(23) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying NOT NULL,
    created_at time with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
        DROP TABLE public.users;
        CONSTRAINT ALTER TABLE ONLY public.users
        ADD CONSTRAINT username UNIQUE (username);