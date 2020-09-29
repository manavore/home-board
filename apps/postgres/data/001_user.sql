CREATE SCHEMA IF NOT EXISTS mini_projet;

CREATE TABLE mini_projet."user"(
    id serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
)