<?php
// Send commands to CasparCG Server.
include('config.php');
include('CasparServerConnector.php');

$connector = new CasparServerConnector($ip, $port);

// !Important: The POST data is not sanitized.
$command = $_POST['casparcg_command'];

$connector->makeRequest("$command");

$connector->closeSocket();
?>