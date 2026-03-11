<?php

include 'config.php';

$result = $conn->query("SELECT note FROM notes");

$notes=[];

while($row=$result->fetch_assoc()){
$notes[]=$row;
}

echo json_encode($notes);

?>
