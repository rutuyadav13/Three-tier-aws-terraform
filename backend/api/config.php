<?php

$host = "RDS_ENDPOINT";
$dbname = "appdb";
$user = "admin";
$password = "StrongPassword123";

$conn = new mysqli($host,$user,$password,$dbname);

if($conn->connect_error){
die("Connection failed");
}

?>
