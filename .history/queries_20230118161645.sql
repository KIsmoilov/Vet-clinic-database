/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN 'Jan 01, 2016' AND 'Dec 31, 2019';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3; 
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > '10.5'; 
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN '10.4' AND '17.3';

/*Update the table column and rollback*/

BEGIN TRANSACTION;
ALTER TABLE animals RENAME COLUMN species to unspecified;

ROLLBACK;


/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.*/
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set.*/
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

/*Commit the transaction.*/
COMMIT;

/*Verify that change was made and persists after commit.*/
SELECT * FROM animals;




/*Inside a transaction delete all records in the animals table, then roll back the transaction.*/
BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;


/*Inside a transaction:
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.*/

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT point1;

/*Update all animals' weight to be their weight multiplied by -1.*/

UPDATE animals
SET weight_kg = weight_kg * -1;

/*Rollback to the savepoint*/

ROLLBACK TO point1;
SELECT * FROM animals;

/*Update all animals' weights that are negative to be their weight multiplied by -1.*/

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

/*Commit transaction*/

COMMIT;
SELECT * FROM animals;

