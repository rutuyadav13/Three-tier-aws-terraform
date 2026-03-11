<?php

include 'db_connection.php';

$data = json_decode(file_get_contents("php://input"), true);

$message = $data['message'];

$stmt = $conn->prepare("INSERT INTO messages(message) VALUES (?)");
$stmt->bind_param("s",$message);
$stmt->execute();

echo "Message saved";

?>