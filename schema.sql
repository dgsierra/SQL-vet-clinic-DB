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
