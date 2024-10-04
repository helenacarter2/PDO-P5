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

class Database {
    private $conn;

    public function __construct($host, $username, $password, $database) {
        $this->conn = new mysqli($host, $username, $password, $database);

        if ($this->conn->connect_error) {
            die("Connectie mislukt: " . $this->conn->connect_error);
        }
    }

    
    public function updateStudent($student_id, $name, $age, $email) {
        $stmt = $this->conn->prepare("UPDATE students SET name=?, age=?, email=? WHERE student_id=?");
        $stmt->bind_param("sisi", $name, $age, $email, $student_id);

        if ($stmt->execute()) {
            echo "$student_id is goed ge edit.";
        } else {
            echo "Editen van student mislukt. " . $stmt->error;
        }

        $stmt->close();
    }


    public function deleteStudent($student_id) {
        $stmt = $this->conn->prepare("DELETE FROM students WHERE student_id=?");
        $stmt->bind_param("i", $student_id);

        if ($stmt->execute()) {
            echo "$student_id is goed verwijderd.";
        } else {
            echo "Deleten van student mislukt. " . $stmt->error;
        }

        $stmt->close();
    }

   
    public function selectData() {
        $result = $this->conn->query("SELECT * FROM students");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function __destruct() {
        $this->conn->close();
    }
}
