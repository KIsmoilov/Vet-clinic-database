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

