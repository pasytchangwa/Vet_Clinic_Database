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

CREATE TABLE vets(
    id integer GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age integer,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE specialization(
    specie_id integer not null,
    vets_id int not null,
    FOREIGN KEY(specie_id) REFERENCES species (id),
    FOREIGN KEY(vets_id) REFERENCES vets (id),
    PRIMARY KEY(specie_id, vets_id)
);

CREATE TABLE visits(
    animals_id integer not null,
    vet_id int not null,
    date date,
    id integer GENERATED ALWAYS AS IDENTITY,
    FOREIGN KEY(animals_id) REFERENCES animals (id),
    FOREIGN KEY(vet_id) REFERENCES vets (id),
    PRIMARY KEY(id)
);


