<?php
include("logic/config.php");

// Delete Layer.
if ( isset($_GET['delete']) ){
	$id = sanitize($mysqli, $_GET['delete']);
	delete_layer($mysqli, $id);
	header("Location: ./");
}

// Add Layer.
if ( isset($_POST['layer_name']) ){
	$name = sanitize($mysqli, $_POST['layer_name']);
	add_layer($mysqli, $name);
	header("Location: ./");
}

// Check if CasparCG Server is online.
$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
$connection =  @socket_connect($socket, $ip, $port);

if( $connection ){
	$status = 'online';
}
else {
	$status = 'offline: <i>' . socket_strerror(socket_last_error( $socket )) . '</i>';
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
<title>WebCG Client</title>
<?php include("head.php"); ?>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include("navigation.php"); ?>

        <div id="page-wrapper">
			
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Rundown
					<div class="pull-right">
						<button class="btn btn-primary" data-toggle="modal" data-target="#addModal"><i class="fa fa-plus" aria-hidden="true"></i> Add Layer </button>
						<a href="./" class="btn btn-warning"><i class="fa fa-circle-o-notch" aria-hidden="true"></i> Reload Rundown [F5]</a>
						<button type="button" class="btn btn-danger command" data-command="CLEAR <?php echo $channel;?>"><i class="fa fa-eraser fa-fw"></i> Clear Channel [F10]</button>
					</div>
					</h1>
                </div>
            </div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="alert alert-success">
                        <strong>CasparCG</strong> [<?php echo $ip.":".$port;?>] is <?php echo $status; ?>
                    </div>
                </div>
			</div>

			<div class="form-group input-group">
				<span class="input-group-addon"><i><i class="fa fa-terminal fa-fw"></i> Executed Command</i></span>
				<input id="executed-command" class="form-control input" type="text" readonly>
			</div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-navicon fa-fw"></i> Layers
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>Name</th>
										<th>Video Layer</th>
										<th>Transition</th>
										<th>Duration</th>
										<th>Direction</th>
										<th>Playout</th>										
									</tr>
								</thead>
								<tbody>
									<?php
									$result = $mysqli->query("
										SELECT layers.id AS id, layers.name AS name, video_layer, transitions.name AS transition_name, duration, directions.name AS direction_name
										FROM layers, transitions, directions
										WHERE
											layers.visible = '1' AND
											layers.transition = transitions.id AND
											layers.direction = directions.id
										ORDER BY video_layer DESC, layers.name
									");
									
									$total_layers = mysqli_num_rows($result);
									
									if ($total_layers > 0){
										while($layer = $result->fetch_assoc()){
											
										$command_play = "PLAY ".$channel."-".$layer['video_layer']." [HTML] &quot;http://".$_SERVER["SERVER_ADDR"]."/".basename($_SERVER["REQUEST_URI"])."/layers/".$layer['id'].".html&quot;"." ".$layer['transition_name']." ".$layer['duration']." Linear"." ".$layer['direction_name'];
										$command_stop = "STOP ".$channel."-".$layer['video_layer'];
										
										?>
										<tr>
											<td><a href="layer.php?id=<?php echo $layer['id']; ?>" title="Layer Settings"><strong><?php echo $layer['name']; ?></strong></a></td>
											<td class="small"><?php echo $layer['video_layer']; ?></td>
											<td class="small"><?php echo $layer['transition_name']; ?></td>
											<td class="small"><?php echo $layer['duration']; ?> frame</td>
											<td class="small"><?php echo $layer['direction_name']; ?></td>
											<td>
												
												<div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-success command" data-command="<?php echo $command_play; ?>">
                                                    	<i class="fa fa-play" aria-hidden="true"></i> PLAY
                                                    </button>
                                                    <button type="button" class="btn btn-sm btn-danger command" data-command="<?php echo $command_stop; ?>">
                                                    	<i class="fa fa-stop" aria-hidden="true"></i> STOP
                                                    </button>
                                                </div>
											</td>
										</tr>
										<?php
										if(count(detect_f($mysqli, $layer['id'])) > 0){
										?>
										<tr>
											<td colspan="6" class="options">											
												<form id="form-<?php echo $layer['id']; ?>">
													<?php
													
													// Get placeholders and values.
													list($placeholders, $field_values) = detect_placeholders($mysqli, $layer['id']);
													
													$counter = 0;
													foreach ( detect_f($mysqli, $layer['id']) as $value ){
													?>
													<div class="form-group input-group col-lg-2 form-options">
														<span class="input-group-addon input-sm">
															<strong><?php echo $placeholders[$counter];?></strong>
														</span>
														<input type="text" name="<?php echo $value;?>" 
														<?php 
														if(isset($field_values[$counter])){
														?> 
															value="<?php echo htmlspecialchars($field_values[$counter]);?>"
														<?php 
														} 
														?>
														class="form-control input input-sm">
													</div>
													<?php
													$counter++;
													}
													?>
													<button type="button" class="btn btn-sm btn-primary update" data-id="<?php echo $layer['id']; ?>" data-layer="<?php echo $layer['video_layer']; ?>"><i class="fa fa-refresh" aria-hidden="true"></i> UPDATE</button>
												</form>
											</td>
										</tr>
										<?php
										}
										?>

										<?php
										}
									}
									else{
										?>
										<tr>
											<td colspan="4">No active layers found.</td>
										</tr>
										<?php
									}
									?>
								</tbody>
							</table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->                    
                </div>
            </div>
            <!-- /.row -->
			
			<div class="spacer"></div>
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
	<!-- Modal: Add Module -->
	<div class="modal" id="addModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Add Layer</h4>
				</div>
				<form method="post">
					<div class="modal-body">
						<div class="form-group">							
								<label>Layer Name</label>
								<input class="form-control" name="layer_name" required>							
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Add</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

    <?php include("scripts.php"); ?>
	
	<script>		
		// Modal Call, focus.
		$(document).ready(function() {
			$('.modal').on('shown.bs.modal', function () {
				$('[name="layer_name"]').focus();
			});
		});
		
		// Command Execusion.
		$(document).ready(function() {
			$(".command").click(function(){

				// Get command.
				var command = $(this).data('command');
				
				// Update command textfield for preview.
				$('#executed-command').attr('value', command);
				
				// Send command to Command Handler for execution.
				$.ajax({			
					url: 'http://<?php echo $_SERVER["SERVER_ADDR"];?>/<?php echo $folder_main_path; ?>/logic/CommandHandler.php',
					type: 'POST',
					data: {casparcg_command: command}
				});

			});
		});
		
		// On key press.
		document.onkeydown = function(e) {		
		switch (e.keyCode) {
			case 121: // Clear Channel.
				e.preventDefault();
				
				var command = 'CLEAR <?php echo $channel;?>';
				
				// Update command textfield for preview.
				$('#executed-command').attr('value', command);
				
				// Send command to Command Handler for execution.
				$.ajax({			
					url: 'http://<?php echo $_SERVER["SERVER_ADDR"];?>/<?php echo $folder_main_path;?>/logic/CommandHandler.php',
					type: 'POST',
					data: {casparcg_command: command}
				});
				break;
			}
		}
		
		// Layer Update Execusion.
		$(document).ready(function() {
			$(".update").click(function(){

				// Get layer id.
				var layer_id = $(this).data('id');
				
				// Get video layer.
				var video_layer = $(this).data('layer');

				// Get dynamic values.	
				var dynamic_fields = new Array();
								
				$('form#form-'+layer_id+' input[type=text]').each(function(){
					var name = $(this).attr("name");
					var value = $(this).val();

					// Update the file template permanent to reflect changes in f[] values.
					$.ajax({
						url: 'logic/LayerValuesHandler.php',
						type: 'POST',
						data: {layer: layer_id, field_id: name, field_value: value,}
					});

					// Create array.
					dynamic_fields.push(name, escape(value));					
				});
				
				// Create command.	
				
				// Add single quotes to array values.
				var newArr = jQuery.map( dynamic_fields, function( n, i ) {
				  return ( "\'"+n+"\'" );
				});
				
				var command = 'CALL <?php echo $channel ?>-'+video_layer+' INVOKE "DynamicFields('+newArr+')"';

				// Send command to Command Handler for execution.
				$.ajax({
					url: 'http://<?php echo $_SERVER["SERVER_ADDR"];?>/<?php echo $folder_main_path; ?>/logic/CommandHandler.php',
					type: 'POST',
					data: {casparcg_command: command}
				});
				
				// Update command textfield for preview.
				$('#executed-command').attr('value', command);

			});
		});
	</script>

</body>

</html>
