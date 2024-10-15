<?php
class Database {
    public $pdo;

    public function __construct($db, $user = "root", $pwd = "", $host = "localhost") {
        try {
            $this->pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pwd);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Connected to database $db";
        } catch (PDOException $e) {
            echo "Connectie niet goed gelukt: " . $e->getMessage();
        }
    }

    public function updateStudent($student_id, $name, $age, $email) {
        $sqlQuery = "UPDATE students SET name = :name, age = :age, email = :email WHERE student_id = :student_id";
        $stmt = $this->pdo->prepare($sqlQuery);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':age', $age, PDO::PARAM_INT);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':student_id', $student_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo "$student_id is goed ge edit.";
        } else {
            echo "Editen van student mislukt.";
        }
    }

    public function deleteStudent($student_id) {
        $sqlQuery = "DELETE FROM students WHERE student_id = :student_id";
        $stmt = $this->pdo->prepare($sqlQuery);
        $stmt->bindParam(':student_id', $student_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo "$student_id is verwijderd.";
        } else {
            echo "Deleten van die student is mislukt.";
        }
    }
}
?>
