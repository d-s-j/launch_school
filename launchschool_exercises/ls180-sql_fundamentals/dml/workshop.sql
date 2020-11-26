/* Create and connect to 'workshop' database */
CREATE DATABASE workshop;

\c workshop

/* Create 'devices' table */
CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

/* Create 'parts' table */
CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number int UNIQUE NOT NULL,
  device_id int REFERENCES devices(id)
);

/* Insert data into tables */
INSERT INTO devices (name)
VALUES ('Accelerometer'),
       ('Gyroscope');

INSERT INTO parts (part_number, device_id)
VALUES (11, 1),
       (12, 1),
       (13, 1),

       (21, 2),
       (22, 2),
       (23, 2),
       (24, 2),
       (25, 2),

       (31, NULL),
       (32, NULL),
       (33, NULL);

/* Write an SQL query