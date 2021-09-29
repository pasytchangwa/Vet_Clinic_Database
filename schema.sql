/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    Id integer GENERATED ALWAYS AS IDENTITY,
    Name varchar(100),
    Date_of_birth DATE,
    Escape_attempts INT,
    Neutered BOOLEAN,
    Weight_kg DECIMAL,
    PRIMARY KEY(Id)
);
ALTER TABLE animals ADD column species text;

CREATE TABLE owners(
id INT generated always as identity,
full_name text,
age INT,
PRIMARY KEY(id));

CREATE TABLE species(
id INT generated always as identity,
name text,
PRIMARY KEY(id));


ALTER TABLE animals DROP column species;

ALTER TABLE animals ADD column species_id int;
ALTER TABLE animals
ADD constraint fk_species
FOREIGN KEY(species_id)
REFERENCES species (id);

ALTER TABLE animals ADD column owners_id int;
ALTER TABLE animals
ADD constraint fk_owner
FOREIGN KEY(owner_id)
REFERENCES owners (id);
