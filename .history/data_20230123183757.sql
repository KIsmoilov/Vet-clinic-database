/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 03, 2020', 0, true, '10.23');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, true, '8');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'Jan 07, 2021', 1, false, '15.04');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, '11');

/* Query and update animals table */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 08, 2020', 0, false, '-11');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'Nov 15, 2021', 2, true, '-5.7');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'Apr 02, 1993', 3, false, '-12.13');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, true, '-45');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'Jun 07, 2005', 7, true, '20.4');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, true, '17');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, true, '22');

/* Insert the following data into the owners table */

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jannifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert the following data into the species table */

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/* Modify your inserted animals so it includes the species_id value: */
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

/* Modify your inserted animals to include owner information (owner_id) */
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';


/* Insert the following data for vets */

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 04, 1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 08, 2008');

/* Insert the following data for specialties */

INSERT INTO specializations (vets_id, species_id) VALUES (1,1);
INSERT INTO specializations (vets_id, species_id) VALUES (3,1);
INSERT INTO specializations (vets_id, species_id) VALUES (3,2);
INSERT INTO specializations (vets_id, species_id) VALUES (4,2);

/* Insert the following data for visits */

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'May 24, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'Jul 22, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'Feb 02, 2021'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Jan 05, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Mar 08, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'May 14, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'May 04, 2021'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'Feb 24, 2021'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Dec 21, 2019'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'Aug 10, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Apr 07, 2021'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'Sep 29, 2019'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'Oct 03, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'Nov 04, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Jan 24, 2019'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'May 15, 2019'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Feb 27, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'Aug 03, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
'May 24, 2020'
);

INSERT INTO visits (animals_id, vets_id, date) 
VALUES (
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'Jan 11, 2021'
);


/* Add data to your database */

INSERT INTO visits (animals_id, vets_id, date) 
SELECT * FROM (SELECT id FROM animals) animals_ids, 
(SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;


insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';