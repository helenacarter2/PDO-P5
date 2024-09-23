CREATE DATABASE school_ROC

USE school_ROC

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (40),
    age INT,
    email VARCHAR (80)
);

INSERT INTO students (name, age, email)
VALUES 
('Cahit', 17, 'Cahitsoy@example.com'),
('Helena', 16, 'Helenacarter@example.com'),
('Jayden', 16, 'Jayden@example.com'),
('Adzhun', 18, 'Azdhun@example.com'),
('Senn', 17, 'Senn@example.com');
