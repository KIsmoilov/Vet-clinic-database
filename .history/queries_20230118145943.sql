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

begin transaction;
ALTER TABLE animals RENAME COLUMN species to unspecified;

ROLLBACK;
