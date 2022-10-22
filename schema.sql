CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date,
    scape_attempts bigint,
    neutered boolean NOT NULL,
    weight_kg numeric,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

ALTER TABLE public.animals
    ADD COLUMN species text COLLATE pg_catalog."default";

ADD COLUMN species VARCHAR;

CREATE TABLE owners(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name varchar(100) NOT NULL,
  age int NOT NULL
);

CREATE TABLE species(
  id bigsERIAL PRIMARY KEY NOT NULL,
  name varchar(100) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species varchar(100);

ALTER TABLE animals ADD species_id BIGINt REFERENCES species(id);

ALTER TABLE animals ADD owners_id BIGINT REFERENCES owners(id);
