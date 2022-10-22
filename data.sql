/* Populate database with sample data. */
INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES
    (1, 'Agumon', '02-03-2020', 0, true, 10.23, null),
    (2, 'Gabumon', '11-15-2018', 2, true, 8, null),
    (3, 'Pikachu', '01-07-2021', 1, false, 15.04, null),
    (4, 'Devimon', '05-12-2017', 5, true, 11, null),
    (6, 'Plantmon', '11-15-2021', 2, TRUE, -5.7, null),
    (5, 'Charmander', '02-08-2020', 0, false, -11, null),
	(7, 'Squirtle', '04-02-1993', 3, false, -12.13, null),
	(8, 'Angemon', '06-12-2005', 1, true, -45, null),
	(9, 'Boarmon', '06-07-2005', 7, true, 20.4, null),
	(9, 'Blossom', '09-13-1998', 3, true, 17, null),
	(10, 'Ditto', '05-14-2022', 4, true, 22, null);

INSERT INTO owners(full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
  ('Pokemon'),
  ('Digimon');

BEGIN TRANSACTION;

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animal SET species_id = 1 WHERE name NOT LIKE '%mon';

COMMIT;

/* RELATE TABLES */

BEGIN TRANSACTION;

UPDATE animal SET owners_id = 1 WHERE name = 'Agumon';

UPDATE animal SET owners_id = 2 WHERE name  = 'Gabumon' OR name ='Pikachu';

UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

COMMIT;
