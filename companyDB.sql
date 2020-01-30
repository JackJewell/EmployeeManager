DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE department(
    id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE role(
    id INT NOT NULL AUTO_INCREMENT, 
    title VARCHAR(30) NOT NULL,
    salary INT(18) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,
    PRIMARY KEY (id)
);

INSERT INTO department(name)
VALUES
    ("Technology"),
    ("Artwork"),
    ("Sound Design"),
    ("Writing"),
    ("Accounting"),
    ("Marketing"),
    ("Human Resources"),
    ("Management");

INSERT INTO role(title,salary,department_id)
VALUES
    ("Technology Executive",200000,8),
    ("Lead Software Engineer",120000,1),
    ("Software Engineer",70000,1),
    ("Art Executive",180000,8),
    ("Lead 2D Artist",110000,2),
    ("2D Artist",60000,2),
    ("Lead 3D Artist",120000,2),
    ("3D Artist",70000,2),
    ("Lead Level Designer",110000,2),
    ("Level Designer",70000,2),
    ("Audio Executive",180000,8),
    ("Lead Audio Engineer",120000,3),
    ("Audio Engineer",70000,3),
    ("Writing Executive",180000,8),
    ("Lead Story Writer",110000,4),
    ("Story Writer",60000,4),
    ("Lead Accountant",150000,5),
    ("Accountant",90000,5),
    ("Marketing Executive",180000,8),
    ("Lead Marketing Analyst",110000,6),
    ("Marketing Analyst",60000,6),
    ("Lead HR Representative",110000,7),
    ("HR Representative",60000,7),
    ("Chief Operations Officer",250000,8),
    ("Chief Financial Officer",250000,8),
    ("Chief Executive Officer",300000,8);

