<?php
class Database {
    private $conn;

    public function __construct($host, $username, $password, $database) {
        $this->conn = new mysqli($host, $username, $password, $database);

        if ($this->conn->connect_error) {
            die("De connectie mislukt: " . $this->conn->connect_error);
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
            echo "Deleten van die student is mislukt. " . $stmt->error;
        }

        $stmt->close();
    }
}
?>
