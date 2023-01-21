/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT NOT NULL,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL NOT NULL
);

/* Query and update animals table */

ALTER TABLE animals ADD species VARCHAR(100);

/* Create a table named owners */

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(100) NOT NULL,
	age INT)

/* Create a table named species */

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100) NOT NULL)


/* Modify animals table */
/* Remove column species */

ALTER TABLE animals
DROP COLUMN species;

/* Add column species_id which is a foreign key referencing species table */

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id)

/* Add column owner_id which is a foreign key referencing the owners table */

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (owner_id) REFERENCES owners (id)

/* Create a table named vets */

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100) NOT NULL,
	age INT,
	date_of_graduation DATE)
