<?php
session_start();
$_SESSION["dbname"] = "placeholder";
$_SESSION["dbuser"] = "root";
$_SESSION["dbpass"] = "root";
$conn = mysql_connect("localhost", $_SESSION["dbuser"], $_SESSION["dbpass"]);
$db->connectdb($_SESSION["dbname"]);
?>
