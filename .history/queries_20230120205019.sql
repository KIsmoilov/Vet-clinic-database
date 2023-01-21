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


/*How many animals are there?*/
SELECT COUNT(*) FROM animals;

/*How many animals have never tried to escape?*/
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

/*What is the average weight of animals?*/
SELECT AVG(weight_kg) FROM animals;

/*Who escapes the most, neutered or not neutered animals?*/
SELECT neutered, escape_attempts
FROM animals
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals)

/*What is the minimum and maximum weight of each type of animal?*/
SELECT
   species, MIN(weight_kg), MAX(weight_kg)
FROM
    animals
GROUP BY species

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT
   species, AVG(escape_attempts)
FROM
    animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species





/* Write queries (using JOIN) to answer the following questions */

/* What animals belong to Melody Pond? */

SELECT animals.name, owners.full_name
From animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond'

/* List of all animals that are pokemon (their type is Pokemon). */

SELECT animals.name, species.name
From animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon'

/* List all owners and their animals, remember to include those that don't own any animal. */

SELECT owners.full_name, animals.name
From owners
FULL JOIN animals
ON animals.owner_id = owners.id

/* How many animals are there per species? */

SELECT COUNT(*) Total, species.name
From animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name

/* List all Digimon owned by Jennifer Orwell. */

SELECT animals.name, species.name, owners.full_name
From animals
JOIN owners
ON animals.owner_id = owners.id
JOIN species
ON animals.species_id = species.id
WHERE owners.full_name = 'Jannifer Orwell' AND species.name = 'Digimon'

/* List all animals owned by Dean Winchester that haven't tried to escape. */

SELECT animals.name, animals.escape_attempts, owners.full_name
From animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0

/* Who owns the most animals? */

SELECT COUNT(owners.full_name) AS counts, owners.full_name
From animals
JOIN owners
ON animals.owner_id = owners.id
Group by owners.full_name
order by counts desc limit 1




/* Who was the last animal seen by William Tatcher? */

SELECT animals.name, vets.name, visits.date 
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.name = 'William Tatcher'
ORDER BY date DESC LIMIT 1

/* How many different animals did Stephanie Mendez see? */

SELECT COUNT(animals.name) 
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez'; 

/* List all vets and their specialties, including vets with no specialties. */

SELECT vets.name, species.name 
FROM vets 
FULL JOIN specializations 
ON specializations.vets_id = vets.id 
FULL JOIN species 
ON species.id = specializations.species_id

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

SELECT animals.name, vets.name, visits.date 
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30'

/* What animal has the most visits to vets? */

SELECT COUNT(animals.name), animals.name
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id 
GROUP BY animals.name
Order by count DESC limit 1

/* Who was Maisy Smith's first visit? */

SELECT animals.name, vets.name
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id 
WHERE vets.name = 'Maisy Smith'
Order BY date ASC LIMIT 1

/* Details for most recent visit: animal information, vet information, and date of visit. */

SELECT animals.name, vets.name, visits.date 
FROM animals 
JOIN visits 
ON visits.animals_id = animals.id 
JOIN vets 
ON vets.id = visits.vets_id
ORDER BY date DESC LIMIT 1

/* How many visits were with a vet that did not specialize in that animal's species? */

SELECT vets.name, species.name, COUNT(species.name)
FROM animals 
FULL JOIN visits 
ON visits.animals_id = animals.id
FULL JOIN vets 
ON vets.id = visits.vets_id
FULL JOIN species 
ON animals.species_id = species.id
GROUP BY vets.name, species.name

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */

SELECT vets.name, species.name, COUNT(species.name)
FROM animals 
FULL JOIN visits 
ON visits.animals_id = animals.id
FULL JOIN vets 
ON vets.id = visits.vets_id
FULL JOIN species 
ON animals.species_id = species.id 
WHERE vets.name = 'Maisy Smith'
Group by species.name, vets.name
order by count desc limit 1

