/*Queries that provide answers to the questions from all projects.*/
SELECT "name" FROM public.animals WHERE "name" LIKE '%mon';
SELECT "name" FROM public.animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';
SELECT * FROM public.animals WHERE escape_attempts<3 AND neutered IS true;
SELECT date_of_birth FROM public.animals WHERE name LIKE 'Pikachu' OR name LIKE 'Agumon';
SELECT "name", "escape_attempts" FROM public.animals WHERE weight_kg>10.5
SELECT * FROM public.animals WHERE neutered=true;
SELECT * FROM public.animals WHERE NOT name= 'Gabumon';
SELECT * FROM public.animals WHERE weight_kg>=10.4 AND weight_kg<=17.3
