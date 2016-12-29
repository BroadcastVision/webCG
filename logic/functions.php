<?php
// Sanitize function.
function sanitize($mysqli, $value){
	return $mysqli->real_escape_string($value);
	echo $mysqli->error;
}

// Delete Layer.
function delete_layer($mysqli, $id){
	$mysqli->query("DELETE FROM layers WHERE id='$id' LIMIT 1");
	echo $mysqli->error;
}

// Add Layer.
function add_layer($mysqli, $name){
	$mysqli->query("INSERT INTO layers(name) VALUES('$name')");
	echo $mysqli->error;
}

// Detect the presense of f0,f1,f2, etc. tags in the HTML code.
function detect_f($mysqli, $id){
	
	// Get the HTML code for the layer.
	$result = $mysqli->query("SELECT html_php FROM layers WHERE id = '$id' LIMIT 1");
	$layer = $result->fetch_assoc();
	
	// This array saves all the div id.
	$dynamic_text = array();
	
	if ($layer['html_php'] != NULL){	
		$dom = new DOMdocument();
		libxml_use_internal_errors(true);
		$dom->loadHTML($layer['html_php']);
		libxml_clear_errors();
		
		$xpath = new DOMXpath($dom);
		$nodes = $xpath->query('//div[starts-with(@id, "f")]');
		
		foreach($nodes as $result){
			
			$div_id = $result->getAttribute('id');
			
			// Check if its an f0, f1, f2, etc. value.		
			$tmp = ltrim($div_id, 'f');
			
			// Check if the second part of the string after [f] is integer number.
			if(ctype_digit($tmp)){
				$dynamic_text[] = $div_id;
			}		
		}
	}
	
	return $dynamic_text;	
}

// Detect the presense of placeholders in dynamic values.
function detect_placeholders($mysqli, $id){
	
	// Get the HTML code for the layer.
	$result = $mysqli->query("SELECT html_php FROM layers WHERE id = '$id' LIMIT 1");
	$layer = $result->fetch_assoc();
	
	// This array saves all the div id.
	$placeholders = array();
	
	if ($layer['html_php'] != NULL){	
		$dom = new DOMdocument();
		libxml_use_internal_errors(true);
		$dom->loadHTML($layer['html_php']);
		libxml_clear_errors();
		
		$xpath = new DOMXpath($dom);
		$nodes = $xpath->query('//div[@placeholder]');
		
		foreach($nodes as $result){			
			$div_placeholder = $result->getAttribute('placeholder');
			$placeholders[] = $div_placeholder;	
		}
	}
	
	return $placeholders;	
}
?>