<?php

include("logic/config.php");

if (isset($_GET['id']) && isset($_GET['clone'])){ // Clone.
	
	$id = sanitize($mysqli, $_GET['id']);
	
	// Clone this layer. Add a prefix [Clone].
	$mysqli->query("
		INSERT INTO layers (name,icon,video_layer,transition,duration,direction,css,html_php,js,visible)
			SELECT CONCAT('[Clone] ', name),icon,video_layer,transition,duration,direction,css,html_php,js,visible
			FROM layers
			WHERE id='$id'
	");
	
	// Generate Layer HTML file.
	generate_html_layer($mysqli, $mysqli->insert_id, $folder_main_path);
	
	// Redirect to the new layer page.
	header("Location: layer.php?id=".$mysqli->insert_id);	
}

if (isset($_POST['layer_name'])){ // Update detaills.

	// Sanitize input.
	$id = sanitize($mysqli, $_GET['id']);	
	$layer_name = sanitize($mysqli, $_POST['layer_name']);
	$layer_icon = sanitize($mysqli, $_POST['layer_icon']);
	$layer_video_layer = sanitize($mysqli, $_POST['layer_video_layer']);
	$transition = sanitize($mysqli, $_POST['layer_transition']);
	$duration = sanitize($mysqli, $_POST['layer_duration']);
	$direction = sanitize($mysqli, $_POST['layer_direction']);
	$css = sanitize($mysqli, $_POST['textarea_css']);
	$html_php = sanitize($mysqli, $_POST['textarea_html_php']);
	$js = sanitize($mysqli, $_POST['textarea_js']);
	
	if(isset($_POST['visible']))
		$visible = 1;
	else
		$visible = 0;
	
	$mysqli->query	("
						UPDATE layers 
						SET 
							name = '$layer_name',
							icon = '$layer_icon', 
							video_layer = '$layer_video_layer',
							transition = '$transition',
							duration = '$duration',
							direction = '$direction',
							css = '$css',
							html_php = '$html_php',
							js = '$js',
							visible = '$visible'
						WHERE id='$id' 
						LIMIT 1
					");
					
	echo $mysqli->error;
	
	// Generate Layer HTML file.
	generate_html_layer($mysqli, $id, $folder_main_path);

	// Redirect to the layer page.
	header("Location: layer.php?id=".$id);	
}

if ( isset($_GET['id']) ){
	
	// Sanitize input.
	$id = sanitize($mysqli, $_GET['id']);
	
	$result = $mysqli->query("
								SELECT layers.id AS id, layers.name AS name, icon, video_layer, transitions.name AS transition_name, duration, directions.name AS direction_name, css, html_php, js, visible
								FROM layers, transitions, directions
								WHERE
									layers.id = '".$id."' AND
									layers.transition = transitions.id AND
									layers.direction = directions.id
								ORDER BY video_layer, layers.name
							");
	
	$count_layers = mysqli_num_rows($result);
	if($count_layers == 0)
		header("Location: ./");
	$layer = $result->fetch_assoc(); // Get layer details.
}
else
	header("Location: ./");


// Get all Transitions.
$result_transitions = $mysqli->query("SELECT * FROM transitions");

// Get all Directions.
$result_directions = $mysqli->query("SELECT * FROM directions");
?>
<!DOCTYPE html>
<html lang="en">

<head>

	<title>Layer: <?php echo $layer['name']; ?></title>
	<?php include("head.php"); ?>
	
	<style>
	#editor_css, #editor_html, #editor_js{border:0;}
	.textarea_hide{display:none;}
	</style>
	
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include("navigation.php"); ?>

        <div id="page-wrapper">
            <form id="layer_form" method="post">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Layer: <?php echo $layer['name']; ?>
						<div class="pull-right">
							<a href="index.php?delete=<?php echo $layer['id']; ?>" class="btn btn-default" data-toggle="confirmation" data-placement="top"><i class="fa fa-remove"></i> Delete </a>
							<a href="preview.php?id=<?php echo $layer['id']; ?>&mode=browser" class="btn btn-success" target="_blank"><i class="fa fa-tv" aria-hidden="true"></i> Preview</a>
							<a href="layer.php?id=<?php echo $layer['id']; ?>&clone" class="btn btn-primary" data-toggle="confirmation" data-placement="top"><i class="fa fa-clone" aria-hidden="true"></i> Clone</a>
							<button type="submit" form="layer_form" type="button" class="btn btn-primary"><i class="fa fa-save" aria-hidden="true"></i> Save</button>
						</div>
						</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-cog fa-fw"></i> Settings
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="col-lg-4">
									<label>Name</label>
									<input class="form-control" name="layer_name" value="<?php echo $layer['name']; ?>" required>
								</div>
								<div class="col-lg-2">
									<label>Video Layer</label>
									<input class="form-control" name="layer_video_layer" value="<?php echo $layer['video_layer']; ?>" required>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
										<label>Transition</label>
										<select name="layer_transition" class="form-control">
											<?php
											while($transition = $result_transitions->fetch_assoc()){
											?>
												<option value="<?php echo $transition['id']; ?>" <?php if ($layer['transition_name']==$transition['name']){echo "selected";} ?>><?php echo $transition['name']; ?></option>
											<?php
											}
											?>
										</select>
									</div>
								</div>
								<div class="col-lg-2">
									<label>Duration (frame)</label>
									<input class="form-control" name="layer_duration" value="<?php echo $layer['duration']; ?>" required>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
										<label>Direction</label>
										<select name="layer_direction" class="form-control">
											<?php
											while($direction = $result_directions->fetch_assoc()){
											?>
												<option value="<?php echo $direction['id']; ?>" <?php if ($layer['direction_name']==$direction['name']){echo "selected";} ?>><?php echo $direction['name']; ?></option>
											<?php
											}
											?>
										</select>
									</div>
								</div>
								
								<div class="col-lg-12">
									<hr/>
								</div>

								<div class="col-lg-2">
									<div class="form-group">
									<label>Rundown Visibility</label>
										<div class="checkbox">
											<label>
												<input name="visible" type="checkbox" <?php if($layer['visible']==1) echo "checked"; ?>>Active
											</label>
										</div>
									</div>
								</div>
								
								<div class="col-lg-3">
									<label>Layer Icon (<a href="http://fontawesome.io/icons/" target="_blank" title="Font Awesome Icons">?</a>)</label>
									<input class="form-control" name="layer_icon" value="<?php echo $layer['icon']; ?>" placeholder="fa-square-o">
								</div>
								
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->                    
					</div>
				</div>
				<!-- /.row -->
				
				<div class="alert alert-danger">
				Use <strong>double quotes</strong> for coding only. If you use single quotes you may experience issues while importing/exporting the MySQL database.
				</div>
								
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>CSS Code</strong>
							</div>
							<div class="panel-body">
								<pre id="editor_css" style="height: 400px;"><?php echo htmlspecialchars($layer['css']); ?></pre>
								<textarea name="textarea_css" class="textarea_hide"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>HTML + PHP Code</strong>
							</div>
							<div class="panel-body">
								<div class="alert alert-info">
                                To include <strong>PHP</strong> code use normally the <strong>&#60;?php ... ?&#62;</strong> tags.
								</div>
								<div class="alert alert-info">
                                To assign dynamically values to div tags from the <strong>Rundown</strong> use only: <strong>&#60;div id="f0"&#62;&#60;/div&#62;</strong> etc.
								</div>								
								
								<?php
								if(count(detect_f($mysqli, $layer['id'])) > 0){
								?>
								<div class="alert alert-success">
                                <strong>Dynamic Fields detected:</strong>
								<?php
								$dv = NULL;
								foreach(detect_f($mysqli, $layer['id']) as $dynamic_value) {
									$dv .=  $dynamic_value.", ";
								}
								echo trim($dv, ", ");
								?>
								</div>								
								<?php
								}
								?>
								
								<pre id="editor_html_php" style="height: 400px;"><?php echo htmlspecialchars($layer['html_php']); ?></pre>
								<textarea name="textarea_html_php" class="textarea_hide"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>JavaScript Code</strong>
							</div>
							<div class="panel-body">
								<div class="alert alert-info">
                                Include the  <strong>&#60;script&#62;</strong> tag in your code. JQuery script is automatically loaded.
								</div>
								<pre id="editor_js" style="height: 400px;"><?php echo htmlspecialchars($layer['js']); ?></pre>
								<textarea name="textarea_js" class="textarea_hide"></textarea>
							</div>
						</div>
					</div>
				</div>
			
			</form>
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php include("scripts.php");  ?>
	<script src="assets/ace/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
	<script>
		// CSS Editor.
		var editor_css = ace.edit("editor_css");
		editor_css.setTheme("ace/theme/monokai");
		editor_css.setOption("showPrintMargin", false);
		editor_css.session.setUseWorker(false);
		editor_css.getSession().setMode("ace/mode/css");
		
		$("textarea[name='textarea_css']").val(editor_css.getSession().getValue());		
		editor_css.getSession().on('change', function () {
			$("textarea[name='textarea_css']").val(editor_css.getSession().getValue());
		});
		
		// HTML + PHP Editor.
		var editor_html_php = ace.edit("editor_html_php");
		editor_html_php.setTheme("ace/theme/monokai");
		editor_html_php.setOption("showPrintMargin", false);
		editor_html_php.session.setUseWorker(false);
		editor_html_php.getSession().setMode("ace/mode/html");
			
		$("textarea[name='textarea_html_php']").val(editor_html_php.getSession().getValue());		
		editor_html_php.getSession().on('change', function () {
			$("textarea[name='textarea_html_php']").val(editor_html_php.getSession().getValue());
		});
		
		// JS Editor.
		var editor_js = ace.edit("editor_js");
		editor_js.setTheme("ace/theme/monokai");
		editor_js.setOption("showPrintMargin", false);
		editor_js.session.setUseWorker(false);
		editor_js.getSession().setMode("ace/mode/javascript");
		
		$("textarea[name='textarea_js']").val(editor_js.getSession().getValue());		
		editor_js.getSession().on('change', function () {
			$("textarea[name='textarea_js']").val(editor_js.getSession().getValue());
		});
	</script>	

</body>

</html>
