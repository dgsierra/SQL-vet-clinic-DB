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

/* 5. Queries to exercies  */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) as "Escape count" FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

elong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';


SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id JOIN species on species.id = animals.species_id WHERE animals.species_id = '2' AND animals.owners_id = '2';

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id WHERE animals.escape_attempt = '0' AND animals.owners_id = '5';

SELECT full_name, COUNT(owners_id) FROM owners JOIN animals on owners.id = animals.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vets_id = '1' ORDER BY visits.date_of_visit desc limit 1;

SELECT COUNT(DISTINCT animals_id) FROM visits WHERE vets_id = '2';

SELECT vets.name, specialization.vets_id, specialization.species_id FROM vets LEFT JOIN specialization ON specialization.vets_id = vets.id;

SELECT animals.name, COUNT(animals_id) FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(animals_id) desc limit 1;

SELECT animals.name , visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vets_id = '3';

SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits);

SELECT animals.name, date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vets_id = '2'ORDER BY visits.date_of_visit ASC LIMIT '1';

SELECT *, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits);

SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets_id = '2';

SELECT full_name, COUNT(owners_id) FROM owners JOIN animals on owners.id = animals.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;

SELECT species.name, COUNT(animals.species_id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Vet Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id) desc limit 1;
