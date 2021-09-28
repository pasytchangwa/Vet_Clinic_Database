/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE Name LIKE '%mon%';
SELECT Name FROM animals WHERE Date_of_birth BETWEEN (to_date('01/01/2016','mm/dd/yyyy')) AND (to_date('12/31/2019','mm/dd/yyyy'));
SELECT Name FROM animals WHERE Neutered = True AND Escape_attempts < 3;
SELECT Date_of_birth FROM animals WHERE Name = 'Agumon' or Name= 'Pikachu';
SELECT Name,Escape_attempts FROM animals WHERE Weight_kg > 10.5;
SELECT * FROM animals WHERE Neutered = True;
SELECT * FROM animals WHERE Name != 'Gabumon';
SELECT * FROM animals WHERE Weight_kg >= 10.4 AND Weight_kg <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE Date_of_birth BETWEEN (to_date('01/02/2022','mm/dd/yyyy')) AND (to_date('12/31/2022','mm/dd/yyyy'));
SAVEPOINT SP1;

UPDATE animalsSET weight_kg = weight_kg * -1;
ROLLBACK to SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(Escape_attempts) FROM animals
WHERE Escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;
SELECT SUM(Escape_attempts) FROM animals
WHERE Neutered = True;
SELECT SUM(Escape_attempts) FROM animals
WHERE Neutered = False;
SELECT Neutered, MIN(Weight_kg) FROM animals
GROUP BY Neutered;
SELECT Neutered, MAX(Weight_kg) FROM animals
GROUP BY Neutered;
SELECT Neutered, AVG(Escape_attempts) FROM animals
WHERE Date_of_birth BETWEEN (to_date('01/01/1990','mm/dd/yyyy')) AND (to_date('12/31/2000','mm/dd/yyyy'))
GROUP BY Neutered;

