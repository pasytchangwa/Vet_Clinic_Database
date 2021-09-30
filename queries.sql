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

SELECT animals.Name,owner_id,full_name FROM animals
JOIN owners ON owners.id = anmals.owner_id
WHERE owners.id = 4;

SELECT animals.Name,species_id,species.name FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.id = 1;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id;

SELECT animals.name,species_id,species.name FROM animals
JOIN species ON species.id = animals.species_id;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id
where name LIKE '%mon' AND owners.id = 2;

SELECT animals.name,owner_id,full_name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE Escape_attempts = 0 AND owners.id = 5;

SELECT animals.name,COUNT(owner_id),full_name FROM animals
JOIN owners ON owners.id = animals.owner_id;

SELECT animals.name,visits.date FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.id = 1
GROUP BY animals.name,visits.date
ORDER BY date DESC LIMIT 1;

SELECT COUNT(DISTINCT visits.animals_id) FROM visits
JOIN vets ON vets.id visits.vet_id
WHERE vets.id = 3;

SELECT vets.name, species.name FROM vets
JOIN specialization ON specialization.vets_id = vets.id
JOIN species ON species.id = specialization.specie_id;

SELECT animals.name, visits.date FROM visits
    JOIN vets ON vets.id = visits.vet_id
    JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'Stephanie Mendez'
    AND visits.date BETWEEN (to_date('04/01/2020','mm/dd/yyyy')) AND (to_date('08/30/2000','mm/dd/yyyy'));

SELECT animals.name, COUNT(visits.animals_id) count_visits FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name,visits.animals_id
ORDER BY count_visits DESC LIMIT 1;

SELECT animals.name,visits.date AS first_visit FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.id = 2
GROUP BY animals.name,visits.date
ORDER BY first_visit LIMIT 1;

SELECT * FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
ORDER BY visits.date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
JOIN specialization ON specialization.vets_id = vets.id
WHERE specialization.specie_id <> animals.species_id;

SELECT species.name,COUNT(visits.animals_id) AS count_species FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.id = 2
GROUP BY species.name
ORDER BY count_species DESC LIMIT 1;
