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

INSERT INTO employees(first_name,last_name,role_id,manager_id)
VALUES
        ("James","Miller",26,null),
        ("Robert","Smith",24,1),
        ("Hallie","Seppanen",25,1),
        ("Julie","Drescher",1,2),
        ("Cassidy","Johnson",4,2),
        ("William","Morgan",11,2),
        ("Mindy","McCormick",14,2),
        ("Susan","Pritcherd",17,3),
        ("Ivan","Svalberg",19,2),
        ("Michael","Jameson",22,2),
        ("Brandi","Norwood",2,4),
        ("Travis","Sharp",2,4),
        ("Daxton","Pearson",3,11),
        ("Colin","Garrett",3,11),
        ("Silvia","Wright",3,11),
        ("Jared","Daniel",3,11),
        ("Dixie","Dane",3,12),
        ("Dex", "Buckley",3,12),
        ("Irvine", "Morrison",3,12),
        ("Noble", "Disney",3,12),
        ("Brian","Roach",5,5),
        ("Mat","Landon",6,20),
        ("Leonard","Hawthorne",6,20),
        ("Elly", "Beake",6,20),
        ("Tawnya", "Ryder",6,20),
        ("Rochelle", "Vann",6,20),
        ("Mary","Horne",7,5),
        ("Alton", "Holland",8,26),
        ("Margery", "Kynaston",8,26),
        ("Leonard", "Franklin",8,26),
        ("Marge", "Foster",8,26),
        ("Arabella", "Wyndham",8,26),
        ("Antonette", "Savidge",8,26),
        ("Audie", "Thwaite",8,26),
        ("Macy", "Fisher",9,5),
        ("Zane", "Irvin",10,34),
        ("Taryn", "Beaumont",10,34),
        ("Kiley", "Kinsley",12,6),
        ("Leslie", "Hopper",13,37),
        ("Mattie", "Foster",13,37),
        ("Frank", "Herbert",15,7),
        ("Wilfred", "Summers",16,40),
        ("Elinor", "Raines",16,40),
        ("Quentin", "Garner",18,8),
        ("Barbie", "Hawthorne",18,8),
        ("Megan", "Brewster",20,9),
        ("Ivy", "King",21,45),
        ("Tabitha", "Traviss",21,45),
        ("Brent", "Sydney",21,45),
        ("Westley", "Macy",21,45),
        ("Wendi", "Rogers",23,10),
        ("Jeannine", "Neal",23,10),
        ("Erika", "Stanford",23,10),
        ("Orville", "Pierce",23,10),
        ("Natalia", "Townsend",23,10)
        
        