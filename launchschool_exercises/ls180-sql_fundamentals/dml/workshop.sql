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

/* Write an SQL query to display devices name and parts part_number */
SELECT devices.name, parts.part_number
  FROM devices
       INNER JOIN parts
       ON devices.id = parts.device_id;

/* Write an SQL query to display all parts where part_number's start with '3' */
SELECT * FROM parts WHERE LEFT(CAST(part_number AS text), 1) = '3';
SELECT * FROM parts WHERE CAST(part_number AS text) LIKE '3%';
SELECT * FROM parts WHERE part_number::text LIKE '3%';

/* Write an SQL query to display the name of each device with number of parts for that device */
SELECT devices.name AS name, COUNT(parts.device_id)
  FROM devices 
       LEFT JOIN parts
       ON devices.id = parts.device_id 
       GROUP BY devices.name;

/* Write an SQL query " ", descending alphabetical order */
SELECT devices.name AS name, COUNT(parts.device_id)
  FROM devices
       JOIN parts
       ON devices.id = parts.device_id
       GROUP BY devices.name
       ORDER BY name DESC;

/* Write two SQL queries:
One that lists parts belong to a device
One that lists parts do not belong to a device */
SELECT part_number, device_id FROM parts WHERE device_id IS NOT NULL;
SELECT part_number, device_id FROM parts WHERE device_id IS NULL;

/* Write an SQL query that returns the name of the oldest device */
SELECT name AS oldest_device FROM devices ORDER BY created_at LIMIT 1;

/* Update the last two parts using device "Gyroscope" to use "Accelerometer" */
UPDATE parts SET device_id = 1 WHERE part_number = 24 OR part_number = 25;
/* Update smallest part_number to be associated with "Gyroscope" */
UPDATE parts SET device_id = 2 WHERE part_number = (SELECT MIN(part_number) FROM parts);

/* Delete any data related to "Accelerometer" */
DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE name = 'Accelerometer';
