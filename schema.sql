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
