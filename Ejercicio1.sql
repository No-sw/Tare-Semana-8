--DDL
USE master;

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Twitter')
DROP DATABASE Twitter;

CREATE DATABASE Twitter;

USE Twitter;

CREATE TABLE Tweets(
tweet_id INT NOT NULL IDENTITY(1,1),
content varchar(250) NOT NULL,
PRIMARY KEY(tweet_id)
);
INSERT INTO Tweets 
([content])
VALUES
('Vote for Biden'),
('Let us make America great again!'),
('Stick with you forever'),
('Hello people'),
('What a wonderful day'),
('I love this song'),
('The show Fionna and Cake is amazing'),
('Happy Sunday!'),
('I feel good'),
('America for Americans - Monroe'),
('I love pizza'),
('I feel good'),
('Vote for Trump'),
('Vote Republican'),
('Jerusalem the Hoy City'),
('Vote for Democrats'),
('McDonald is my favorite restaurant'),
('I hate mondays'),
('Today is a sunny day'),
('Tomorrow is my birthday');

Select tweet_id
From Tweets
Where len(content)>15;
