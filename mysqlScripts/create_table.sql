CREATE TABLE account(
    user_id serial primary key,
    user_Name VARCHAR(50) UNIQUE NOT NULL,
    user_password  VARCHAR(50) NOT NULL,
    email VARCHAR(355) NOT NULL
);