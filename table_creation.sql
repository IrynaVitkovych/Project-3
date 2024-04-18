---creating schema for tables


----create table for Actors
DROP TABLE Actors

CREATE TABLE Actors (
Actor VARCHAR(100),
Actor_ID VARCHAR(10) NOT NULL,
PRIMARY KEY (Actor_ID)
);

SELECT * FROM Actors

-- create table for Directors
DROP TABLE Directors

CREATE TABLE Directors (
Director VARCHAR(100),
Director_ID INT NOT NULL,
PRIMARY KEY (Director_ID)
);

SELECT * FROM Directors

--create table for genres
DROP TABLE Genres

CREATE TABLE Genres (
Genre VARCHAR(20),
Genre_ID INT NOT NULL,
PRIMARY KEY (Genre_ID)
);

SELECT * FROM Genres

--create table for Oscar Award ID
DROP TABLE Oscar_AwardID

CREATE TABLE Oscar_AwardID (
    Oscar_Award_ID CHAR(7) NOT NULL,
    Award VARCHAR(150),
    PRIMARY KEY (Oscar_Award_ID)
);

SELECT * FROM Oscar_AwardID

--create table for Golden Globe Award ID
DROP TABLE GG_AwardID

CREATE TABLE GG_AwardID (
    GG_Award_ID CHAR(5) NOT NULL,
    Golden_Globe_Award VARCHAR(100),
    PRIMARY KEY (GG_Award_ID)
);

SELECT * FROM GG_AwardID

--create table for Movies
DROP TABLE Movies

CREATE TABLE Movies (
    Movie_Name VARCHAR(100),
	Rating FLOAT,
    Votes INT,
    Meta_score FLOAT,
    PG_Rating VARCHAR(10),
    Year INT,
    Duration VARCHAR(8),
    Director VARCHAR (100),
	Movie_ID INT NOT NULL,
    Director_ID INT NOT NULL,
    PRIMARY KEY (Movie_ID),
    FOREIGN KEY (Director_ID) REFERENCES  Directors(Director_ID)
 
);

SELECT * FROM Movies

--create table for Movies_Actors
DROP TABLE Movies_Actors

CREATE TABLE Movies_Actors (
    Movie_Name VARCHAR(100),
    Movie_ID INT NOT NULL,
    Actor VARCHAR(100),
    Actor_ID VARCHAR NOT NULL,
    FOREIGN KEY (Movie_ID) REFERENCES Movies(Movie_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actors(Actor_ID)
);

SELECT * FROM Movies_Actors

--create table for Golden Globe Winners in Film
DROP TABLE GoldenGlobe_Winners

CREATE TABLE GoldenGlobe_Winners (
    Golden_Globe_Winner_ID INT NOT NULL,
    Winner VARCHAR(100),
    Year_Ceremony INT,
    Movie_Name VARCHAR(100),
    Golden_Globe_Award VARCHAR(150),
    GG_Award_ID CHAR(5),
    PRIMARY KEY (Golden_Globe_Winner_ID)
);

SELECT * FROM GoldenGlobe_Winners

--create table for Oscar_Winners
DROP TABLE Oscar_Winners

CREATE TABLE Oscar_Winners (
    Oscar_Winner_ID INT,
	Winner VARCHAR (100),
	Award VARCHAR(50),
	Oscar_Award_ID CHAR(7) NOT NULL,
	Movie_Name VARCHAR(100),
	Year_Ceremony CHAR(4),
	Year_Film CHAR(4),
	PRIMARY KEY (Oscar_Winner_ID),
    FOREIGN KEY (Oscar_Award_ID) REFERENCES Oscar_AwardID(Oscar_Award_ID)
);

SELECT * FROM Oscar_Winners

--create table for Genres of Movies
DROP TABLE Movies_Genres

CREATE TABLE Movies_Genres (
    Movie_Name VARCHAR(100),
    Movie_ID INT NOT NULL,
    Genre VARCHAR(20),
    Genre_ID INT NOT NULL,
    FOREIGN KEY (Movie_ID) REFERENCES Movies(Movie_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID)
);

SELECT * FROM Movies_Genres

--create Oscar Winner Demographics table
CREATE TABLE oscar_winner_demographics (
	Oscar_winner_demo_ID INT NOT NULL,
	Oscar_Award_ID CHAR(7),
	birthplace CHAR (11),
	date_of_birth DATE,
	race_ethnicity VARCHAR(10),
	religion VARCHAR(20),
	sexual_orientation VARCHAR(50),
	year_of_award INT,
	award VARCHAR(100),
	biourl VARCHAR(100),
	Movie_Name VARCHAR (100),
	Winner VARCHAR (100),
	PRIMARY KEY (Oscar_winner_demo_ID),
	FOREIGN KEY (oscar_award_ID) REFERENCES Oscar_AwardID(Oscar_Award_ID)
);

SELECT * FROM oscar_winner_demographics
