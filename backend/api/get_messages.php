<?php

include 'db_connection.php';

$result = $conn->query("SELECT message FROM messages");

$messages = [];

while($row = $result->fetch_assoc()){
$messages[] = $row;
}

echo json_encode($messages);

?>