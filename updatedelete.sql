CREATE DATABASE IF NOT EXISTS `school-ROC`;

USE `school-ROC`;

CREATE TABLE IF NOT EXISTS `students` (
    `student_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    `age` INT,
    `email` VARCHAR(100)
);

INSERT INTO `students` (`name`, `age`, `email`) VALUES
('Cahit Soy', 18, 'cahitsoy@gmail.com'),
('Helena Carter', 16, 'helenacarter@gmail.com'),
('Nana', 17, 'nana@gmail.com'),
('Sheviny', 17, 'sheviny@gmail.com'),
('Adzhun', 18, 'adzhun@gmail.com');
