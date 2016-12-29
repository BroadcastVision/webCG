<?php
// Get layer id.
include("logic/config.php");

if ( isset($_GET['id']) ){
	
	// Sanitize input.
	$id = sanitize($mysqli, $_GET['id']);
	
	$result = $mysqli->query("
								SELECT 
									name, css, html_php, js
								FROM 
									layers
								WHERE
									id = '".$id."'
							");
	
	$count_layers = mysqli_num_rows($result);
	if($count_layers == 0)
		header("Location: ./");
	$layer = $result->fetch_assoc(); // Get layer details.
}
else
	header("Location: ./");
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Preview: <?php echo $layer['name']; ?></title>
		<meta charset="utf-8">
		<style>
			* {
				-webkit-box-sizing: border-box;
				Box-Sizing:border-box;
				-webkit-backface-visibility: hidden;
				-webkit-transition: translate3d(0,0,0);
			}
			html, body {
				width: <?php echo $width; ?>px;
				height: <?php echo $height; ?>px;
				margin: 0; 
				padding: 0; 
				background: <?php if(isset($_GET['mode'])) { echo "black"; } else { echo "transparent"; } ?>;
				overflow: hidden;
				-webkit-font-smoothing: antialiased !important;
			}
			<?php 
			// Load Layer CSS.
			echo $layer['css'];
			?>		
		</style>
    </head>	
	<body>
		<?php
		// Load Layer HTML+PHP.
		$html_php = $layer['html_php'];	
		
		// Allow PHP code execution.
		eval("?> $html_php <?php ");
		?>
		
		<!-- JQquery -->
		<script src="assets/jquery-3.1.1.min.js"></script>
		
		<?php
		// Load Dynamic Fields if they exist.
		if(count(detect_f($mysqli, $id)) > 0){
			
			$fnc_elements = null;
			foreach ( detect_f($mysqli, $id) as $value ){
				$fnc_elements .= $value.", ".$value."_value, ";
			}			
			$fnc_elements = rtrim($fnc_elements,', ');

		?>
		<script>			
			// Update dynamic fields if a change is detected.
			function DynamicFields(<?php echo $fnc_elements; ?>) {
			  <?php
			  foreach ( detect_f($mysqli, $id) as $value ){
				?>
				$('#<?php echo $value; ?>').html(unescape(<?php echo $value."_value"; ?>));
				<?php
				}
			  ?>
			}			
		</script>		
		<?php
		}
		?>		
		
		<?php 
		// Load Layer JavaScript.
		echo $layer['js'];
		?>
		
	</body>
</html>