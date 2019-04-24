CREATE DATABASE giraffe;

USE giraffe;

CREATE TABLE student (
	student_id INT PRIMARY KEY, 
    name VARCHAR(20),
    major VARCHAR(20)
); 

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student VALUES(4, 'JACK', 'Biology');
INSERT INTO student VALUES(5, 'MIKE', 'Computer Science');

DROP TABLE student;

CREATE TABLE student (
	student_id INT, 
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE,
    PRIMARY KEY(student_id)
); 

UPDATE student SET name = "tom" WHERE student_id = 1;
DELETE FROM student WHERE student_id = 5;
DELETE FROM student WHERE name = 'tom' and major = 'Bio';

DROP TABLE student;

CREATE TABLE student (
	student_id INT PRIMARY KEY, 
    name VARCHAR(20),
    major VARCHAR(20)
); 

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Computer Science');

SELECT student.name, student.major FROM student ORDER BY name;
SELECT student.name, student.major FROM student ORDER BY name DESC;
SELECT * FROM student ORDER BY name ASC;
SELECT * FROM student ORDER BY major, student_id;
SELECT * FROM student ORDER BY major, student_id DESC;
SELECT * FROM student LIMIT 2;
SELECT * FROM student ORDER BY student_id DESC LIMIT 2;
SELECT * FROM student WHERE major='Biology';
SELECT name, major FROM student WHERE major='Chemistry' OR major='Biology';
SELECT name, major FROM student WHERE major <> 'Chemistry';
SELECT name, major FROM student WHERE student_id < 3;
SELECT name, major FROM student WHERE student_id <= 3;
SELECT name, major FROM student WHERE student_id < 3 AND name <> 'Jack';
SELECT * FROM student WHERE name IN ('Claire', 'Kate', 'Mike');
SELECT * FROM student WHERE major IN ('Biology', 'Chemistry');
SELECT * FROM student WHERE major IN ('Biology', 'Chemistry') AND student_id > 2;









































