<?php

$host = "RDS_ENDPOINT";
$user = "admin";
$password = "StrongPassword123";
$db = "notesdb";

$conn = new mysqli($host,$user,$password,$db);

if($conn->connect_error){
die("Database connection failed");
}

?>
