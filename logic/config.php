<?php
// PHP Dispaly all errors.
error_reporting(E_ALL);

// CG Version.
$cg_version = '1.5';

// Resolution.
$width = 1920;
$height = 1080;

// Channel.
$channel = 1;

// Database Details.
$DB_NAME = 'cg';
$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = '';

// Database Connection.
$mysqli = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
if (mysqli_connect_errno()) {
	printf("Connect failed: %s\n", mysqli_connect_error());
	exit();
}

// Charachter Encoding.
$mysqli->set_charset("utf8");

// CasparCG Server Parameters.
$ip = '127.0.0.1';
$port = '5250';

// Important Functions.
include('functions.php');

// Get page name.
$page = basename($_SERVER['PHP_SELF']);
?>