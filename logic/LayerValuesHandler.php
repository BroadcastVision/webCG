<?php
// Update the file template permanent to reflect changes in f[] values.
// ====================================================================

include("config.php");

if ( isset($_POST['layer']) ){	
	// Sanitize input.
	$id = sanitize($mysqli, $_POST['layer']);
	$field_id = sanitize($mysqli, $_POST['field_id']);
	
	// !Important: The POST data is not sanitized.
	$field_value = $_POST['field_value'];
	
	//echo $_POST['field_value']."<br>";
	//echo "Debug: Layer->$id, Field ID->$field_id, Field Value->$field_value";
	
	$result = $mysqli->query("
								SELECT html_php
								FROM layers
								WHERE id = '$id'
							");
	
	$count_layers = mysqli_num_rows($result);
	if($count_layers == 0)
		header("Location: ./");
	
	$layer = $result->fetch_assoc(); // Get layer details.
			
	$doc = new DomDocument();
	$doc->loadHTML($layer['html_php'], LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
	$doc->GetElementById($field_id)->nodeValue=$field_value;
	$change = $doc->saveHTML($doc);
	
	$change = sanitize($mysqli, $change); 
			
	// Update database.
	$mysqli->query	("
						UPDATE layers 
						SET 
							html_php = '$change'
						WHERE id='$id' 
						LIMIT 1
					");
					
	echo $mysqli->error;
	
	// Generate new file.
	generate_html_layer($mysqli, $id, $folder_main_path);
}
else
	header("Location: ./");
?>