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
VALUES("Technology");

INSERT INTO department(name)
VALUES("Artwork");

INSERT INTO department(name)
VALUES("Sound Design");

INSERT INTO department(name)
VALUES("Writing");

INSERT INTO department(name)
VALUES("Accounting");

INSERT INTO department(name)
VALUES("Marketing");

INSERT INTO department(name)
VALUES("Human Resources");

INSERT INTO department(name)
VALUES("Management");

INSERT INTO role(title,salary,department_id)
VALUES("Technology Executive",200000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Software Engineer",120000,1);

INSERT INTO role(title,salary,department_id)
VALUES("Software Engineer",70000,1);

INSERT INTO role(title,salary,department_id)
VALUES("Art Executive",180000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Lead 2D Artist",110000,2);

INSERT INTO role(title,salary,department_id)
VALUES("2D Artist",60000,2);

INSERT INTO role(title,salary,department_id)
VALUES("Lead 3D Artist",120000,2);

INSERT INTO role(title,salary,department_id)
VALUES("3D Artist",70000,2);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Level Designer",110000,2);

INSERT INTO role(title,salary,department_id)
VALUES("Level Designer",70000,2);

INSERT INTO role(title,salary,department_id)
VALUES("Audio Executive",180000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Audio Engineer",120000,3);

INSERT INTO role(title,salary,department_id)
VALUES("Audio Engineer",70000,3);

INSERT INTO role(title,salary,department_id)
VALUES("Writing Executive",180000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Story Writer",110000,4);

INSERT INTO role(title,salary,department_id)
VALUES("Story Writer",60000,4);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Accountant",150000,5);

INSERT INTO role(title,salary,department_id)
VALUES("Accountant",90000,5);

INSERT INTO role(title,salary,department_id)
VALUES("Marketing Executive",180000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Lead Marketing Analyst",110000,6);

INSERT INTO role(title,salary,department_id)
VALUES("Marketing Analyst",60000,6);

INSERT INTO role(title,salary,department_id)
VALUES("Lead HR Representative",110000,7);

INSERT INTO role(title,salary,department_id)
VALUES("HR Representative",60000,7);

INSERT INTO role(title,salary,department_id)
VALUES("Chief Operations Officer",250000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Chief Financial Officer",250000,8);

INSERT INTO role(title,salary,department_id)
VALUES("Chief Executive Officer",300000,8);