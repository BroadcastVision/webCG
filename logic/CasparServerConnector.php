<?php
class CasparServerConnector
{
	private $address;
	private $port;
	private $socket = FALSE;
	private $connected = FALSE;	

	public function __construct($address, $port) {
		$this->address = $address;
		$this->port = $port;
		if (!$this->connectSocket()) {
			throw new Exception("The socket could not be created.");
		}
	}
	
	private function connectSocket() {
		if ($this->connected) {
			return TRUE;
		}
		$this->socket = fsockopen($this->address, $this->port, $errno, $errstr, 10);
		if ($this->socket !== FALSE) {
			$this->connected = TRUE;
		}
		return $this->connected;
	}
	
	public function makeRequest($out) {
		if (!$this->connectSocket()) { // reconnect if not connected
			return FALSE;
		}
		fwrite($this->socket, $out . "\r\n");
		
		$line = fgets($this->socket);
		$line = explode(" ", $line);
		$status = intval($line[0], 10);
		$hasResponse = true;
		if ($status ===  200) { // several lines followed by empty line
			$endSequence = "\r\n\r\n";
		}
		else if ($status === 201) { // one line of data returned
			$endSequence = "\r\n";
		}
		else {
			$hasResponse = FALSE;
		}
		
		if ($hasResponse) {
			$response = stream_get_line($this->socket, 1000000, $endSequence);
		}
		else {
			$response = FALSE;
		}
		return array("status"=>$status, "response"=>$response);
	}
	
	public static function escapeString($string) {
		return str_replace('"', '\"', str_replace("\n", '\n', str_replace('\\', '\\\\', $string)));
	}
	
	public function closeSocket() {
		if (!$this->connected) {
			return TRUE;
		}
		fclose($this->socket);
		$this->connected = FALSE;
		return TRUE;
	}
	
	public function __destruct() {
		$this->closeSocket();
	}
}
