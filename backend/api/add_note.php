<?php

include 'config.php';

$data = json_decode(file_get_contents("php://input"), true);

$note = $data['note'];

$stmt = $conn->prepare("INSERT INTO notes(note) VALUES (?)");
$stmt->bind_param("s",$note);
$stmt->execute();

echo "Note added";

?>
