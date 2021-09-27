/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE Name LIKE '%mon%';
SELECT Name FROM animals WHERE Date_of_birth BETWEEN (to_date('01/01/2016','mm/dd/yyyy')) AND (to_date('12/31/2019','mm/dd/yyyy'));
SELECT Name FROM animals WHERE Neutered = True AND Escape_attempts < 3;
SELECT Date_of_birth FROM animals WHERE Name = 'Agumon' or Name= 'Pikachu';
SELECT Name,Escape_attempts FROM animals WHERE Weight_kg > 10.5;
SELECT * FROM animals WHERE Neutered = True;
SELECT * FROM animals WHERE Name != 'Gabumon';
SELECT * FROM animals WHERE Weight_kg >= 10.4 AND Weight_kg <= 17.3;
