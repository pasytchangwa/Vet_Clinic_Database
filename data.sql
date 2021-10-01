/* Populate database with sample data. */

INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Agumon', (to_date('02/03/2020','mm/dd/yyyy')), 0, True, 10.23 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES('Gabumon', (to_date('11/15/2018','mm/dd/yyyy')), 2, True, 8 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Pikachu', (to_date('01/07/2021','mm/dd/yyyy')), 1, False, 15.04 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Devimon', (to_date('05/12/2017','mm/dd/yyyy')), 5, True, 11 );
INSERT INTO animals (Id, Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Charmander', (to_date('02/08/2020','mm/dd/yyyy')), 0, False, -11 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Plantmon', (to_date('11/15/2022','mm/dd/yyyy')), 2, True, -5.7 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Squirtle', (to_date('04/02/1993','mm/dd/yyyy')), 3, False, -12.13 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Angemon', (to_date('06/12/2005','mm/dd/yyyy')), 1, True, -45 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Boarmon', (to_date('06/07/2005','mm/dd/yyyy')), 7, True, -20.4 );
INSERT INTO animals (Name,Date_of_birth,Escape_attempts,Neutered,Weight_kg) VALUES ('Blossom', (to_date('10/13/1998','mm/dd/yyyy')), 3, True, 17 );

INSERT INTO owners (full_name,age) VALUES('sam Smith', 34 ),('Jennifer Orwell', 19 ),('Bob', 45 ),('Melody Pond', 77 ),('Dean Winchester', 14 ),('Jodie Whittaker', 38 );

INSERT INTO species (name) VALUES ('Pokemon' ),('Digimon' );

UPDATE animals
SET species_id = 2
WHERE Name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE Name NOT LIKE '%mon';

UPDATE animals
SET owner_id = 1
WHERE Name = 'Agumon';
UPDATE animals
SET owner_id = 2
WHERE Name = 'Gabumon' or Name = 'Pikachu';
UPDATE animals
SET owner_id = 3
WHERE Name = 'Devimon' or Name = 'Plantmon';
UPDATE animals
SET owner_id = 4
WHERE Name = 'Charmander' or Name = 'Squirtle' or Name = 'Blossom';
UPDATE animals
SET owner_id = 5
WHERE Name = 'Angemon' or Name = 'Boarmon';

INSERT INTO vets (name,age,date_of_graduation) VALUES('Willian Tatcher', 45, (to_date('04/23/2000','mm/dd/yyyy')) );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Maisy Smith', 26, (to_date('01/17/2019','mm/dd/yyyy')) );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Stephanie Mendez', 64, (to_date('05/04/1981','mm/dd/yyyy')) );
INSERT INTO vets (name,age,date_of_graduation) VALUES('Jack Harkness', 38, (to_date('06/08/2008','mm/dd/yyyy')) );

INSERT INTO specialization (specie_id, vets_id) VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Willian Tatcher') );
INSERT INTO specialization (specie_id, vets_id) VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez') );
INSERT INTO specialization (specie_id, vets_id) VALUES((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez') );
INSERT INTO specialization (specie_id, vets_id) VALUES((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness') );

INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Willian Tatcher'), (to_date('05/24/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES (1, 3(SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (to_date('07/22/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), (to_date('02/02/2021','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('01/05/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('03/08/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('05/14/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (to_date('05/04/2021','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), (to_date('02/24/2021','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('12/21/2019','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'William Tatcher'), (to_date('08/10/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('04/07/2021','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (to_date('09/29/2019','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('10/03/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('11/04/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('01/24/2019','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('05/15/2019','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('02/27/2020','mm/dd/yyyy')) )
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), (to_date('08/03/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (to_date('05/24/2020','mm/dd/yyyy')) );
INSERT INTO visits (animals_id, vet_id, date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), (to_date('01/11/2021','mm/dd/yyyy')) );


