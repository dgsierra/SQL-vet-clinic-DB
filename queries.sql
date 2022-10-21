/*Queries that provide answers to the questions from all projects.*/
SELECT "name" FROM public.animals WHERE "name" LIKE '%mon';
SELECT "name" FROM public.animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';
SELECT * FROM public.animals WHERE escape_attempts<3 AND neutered IS true;
SELECT date_of_birth FROM public.animals WHERE name LIKE 'Pikachu' OR name LIKE 'Agumon';
SELECT "name", "escape_attempts" FROM public.animals WHERE weight_kg>10.5
SELECT * FROM public.animals WHERE neutered=true;
SELECT * FROM public.animals WHERE NOT name= 'Gabumon';
SELECT * FROM public.animals WHERE weight_kg>=10.4 AND weight_kg<=17.3

/* 1. Update Table    */

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

SELECT name,species FROM animals;

ROLLBACK TRANSACTION;

SELECT name,species FROM animals;

/* 2. Update  */

BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT name,species FROM animals;

COMMIT TRANSACTION;

SELECT name,species FROM animals;

/* 3. Delete Records of Animals  */

BEGIN TRANSACTION;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK TRANSACTION;

SELECT * FROM animals;

/* 4. Update  */

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-1-1';

SELECT name, date_of_birth FROM animals;

SAVEPOINT S1;

UPDATE animals
SET weight_kg = weight_kg * (-1);

SELECT name, weight_kg from animals;

ROLLBACK TO S1;

UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;

SELECT name, weight_kg from animals;

COMMIT TRANSACTION;

/* 5. Queries that provide answers to the questions  */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) as "Escape count" FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;
