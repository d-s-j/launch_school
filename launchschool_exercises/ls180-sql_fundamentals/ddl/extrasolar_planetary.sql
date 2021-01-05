/* Create and connect to 'extrasolar' database */
DROP DATABASE IF EXISTS extrasolar;

CREATE DATABASE extrasolar;

\c extrasolar

/* Create 'stars' and 'planets' table */
CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance int NOT NULL CHECK (distance > 0),
  spectral_type char(1),
  companions int NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1),
  mass int,
);

/* Relate 'stars' and 'planets' tables */
ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

/* Alter data types for column 'name' and 'distance' from the 'stars' table */
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

ALTER TABLE stars
ALTER COLUMN distance TYPE decimal;

/* Add a constraint to 'stars' */
ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

/* Delete a constraint from 'stars' */
ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

/* Create a enumerated data type for a 'stars' constraint */
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral_type_enum
                           USING spectral_type::spectral_type_enum;

/* Alter data type for column 'mass' from the 'planets' table */
ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
ADD CHECK (mass > 0.0),
ALTER COLUMN designation SET NOT NULL;


/* Add a column to 'planets' table */
ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

/* Add data */
INSERT INTO stars (name, distance, spectral_type, companions)
VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id, semi_major_axis)
VALUES ('b', 0.0036, 1, 0.04);
INSERT INTO planets (designation, mass, star_id, semi_major_axis)
VALUES ('c', 0.1, 2, 40);

/* Create a 'moon' table */
CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets (id)
);

/* Create backup of database 'extrasolar' from terminal
$ pg_dump --inserts extrasolar > extrasolar.dump.sql */

/* Delete database 'extrasolar' */
\c postgres -- connect to a different database
DROP DATABASE extrasolar