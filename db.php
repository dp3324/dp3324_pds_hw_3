<?php
    $host = "localhost";
    $port = 8889;
    $username = "root";
    $password = "root";
    $database = "bakery";

    $db = new mysqli($host, $username, $password, $database, $port) or die('Could not connect: '.mysqli_error());
?>