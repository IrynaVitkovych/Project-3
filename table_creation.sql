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
Genre VARCHAR(20) NOT NULL,
Genre_ID INT NOT NULL,
PRIMARY KEY (Genre_ID)
);

SELECT * FROM Genre

--create table for Oscar Award ID
DROP TABLE Oscar_AwardID

CREATE TABLE Oscar_AwardID (
    Oscar_Award_ID CHAR(7),
    Award VARCHAR(150),
    PRIMARY KEY (Oscar_Award_ID)
);

SELECT * FROM Oscar_AwardID

--create table for Golden Globe Award ID
DROP TABLE GG_AwardID

CREATE TABLE GG_AwardID (
    GG_Award_ID CHAR(5),
    Golden_Globe_Award VARCHAR(100),
    PRIMARY KEY (GG_Award_ID)
);

SELECT * FROM GG_AwardID

--create table for Movies
DROP TABLE Movies

CREATE TABLE Movies (
    Movie_ID INT NOT NULL,
    Movie_Name VARCHAR(100),
    Rating FLOAT,
    Votes INT,
    Meta_score FLOAT,
    PG_Rating VARCHAR(10),
    Year INT,
    Duration VARCHAR(8),
    Director_ID INT,
    Oscar_Award_ID CHAR(7),
    GG_Award_ID CHAR(5),
    PRIMARY KEY (Movie_ID),
    FOREIGN KEY (Director_ID) REFERENCES  Directors(Director_ID),
    FOREIGN KEY (Oscar_Award_ID) REFERENCES Oscar_AwardID(Oscar_Award_ID),
    FOREIGN KEY (GG_Award_ID) REFERENCES  GG_AwardID(GG_Award_ID)
);

SELECT * FROM Movies

--create table for Movies_Actors
DROP TABLE Movies_Actors

CREATE TABLE Movies_Actors (
    Movie_Name VARCHAR(100),
    Movie_ID INT NOT NULL,
    Actor VARCHAR(100),
    Actor_ID INT NOT NULL,
    FOREIGN KEY (Movie_ID) REFERENCES Movies(Movie_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actors(Actor_ID)
);

SELECT * FROM Movies_Actors

--create table for Golden Globe Winners in Film
DROP TABLE GoldenGlobe_Winners

CREATE TABLE GoldenGlobe_Winners (
    Movie_Name VARCAHR(100),
    Year INT,
    Status CHAR(6),
    Golden_Globe_Award VARCHAR(150),
    GG_Award_ID CHAR(5),
    FOREIGN KEY Movie_Name REFERENCES Movies(Movie_Name),
    FOREIGN KEY GG_Award_ID REFERENCES GG_AwardID(GG_Award_ID)
);

SELECT * FROM GoldenGlobe_Winners

--create table for Oscar_Winners
DROP TABLE Oscar_Winners

CREATE TABLE Oscar_Winners
    Year_Film CHAR(4),
    Year_Ceremony CHAR(4),
    Award VARCHAR(50),
    Name_Of_Winner VARCHAR(100),
    Movie_Name VARCHAR(100),
    Oscar_Award_ID CHAR(7)
    FOREIGN KEY Movie_Name REFERENCES Movies(Movie_Name),
    FOREIGN KEY Oscar_Award_ID REFERENCES Oscar_AwardID(Oscar_Award_ID)
);

SELECT * FROM Oscar_Winners

--Create table for Oscar Award Winner Demographics
DROP TABLE Oscar_Winner_Demographics

CREATE TABLE Oscar_Winner_Demographics (
    birthplace VARCHAR(100),
    date_of_birth CHAR(11),
    race_ethnicity VARCAHR(10),
    religion VARCHAR(20),
    sexual_orientation VARCAHR(20),
    year_of_award CHAR(4),
    award VARCAHR(100),
    biourl VARHCHAR(100),
    Movie_Name VARHCAHR(100),
    Winner VARCHAR(100),
    FOREIGN KEY (Movie_Name) REFERENCES Movies(Movie_Name)
);

SELECT * FROM Oscar_Winner_Demographics
