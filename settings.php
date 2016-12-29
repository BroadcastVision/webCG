<?php
include("logic/config.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>WebCG - Settings</title>
	<?php include("head.php"); ?>	
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include("navigation.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Settings
					</h1>
                </div>
            </div>
			
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-info-circle fa-fw"></i> About (v<?php echo $cg_version; ?>)
                        </div>
                        <div class="panel-body">
							<p>WebCG is a framework capable of generating dynamic HTML templates for <a href="http://www.casparcg.com/" target="_blank">CasparCG</a>.</p>
							<p>Successfully tested in <strong>CasparCG Server 2.0.7</strong></p>
							<p>Project Page: <a href="https://mz.unic.ac.cy/webcg/" target="_blank">https://mz.unic.ac.cy/webcg</a></p>
							<p>For Support or Sugestions please use the <a href="http://casparcg.com/forum/viewtopic.php?f=9&t=3938" target="_blank">CasparCG Forum topic</a></p>
							<p>Special thanks to the <a href="http://www.casparcg.com/forum" target="_blank">CasparCG Community</a> and Tom Jenkinson for the <a href="https://github.com/tjenkinson/CasparCG-PHP-ServerConnection" target="_blank">PHP ServerConnection class</a>.</p>
							<p>Theme credits: <a href="https://startbootstrap.com/template-overviews/sb-admin-2/" target="_blank">SB Admin 2</a></p>
						</div>
                    </div>
                </div>
				<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-gear fa-fw"></i> Settings
                        </div>
                        <div class="panel-body">
							<table class="table">
								<div class="alert alert-info">
								You can edit this parameters from the <strong>logic/config.php</strong> file.
								</div>
								<tbody>
									<tr>
										<td style="border-top:0;"><i class="fa fa-television fa-fw"></i> Resolution</td>
										<td style="border-top:0;"><?php echo $width."x".$height;?></td>
									</tr>
									<tr>
										<td><i class="fa fa-server fa-fw"></i> CasparCG Address</td>
										<td><?php echo $ip.":".$port;?></td>
									</tr>
									<tr>
										<td><i class="fa fa-list-ol fa-fw"></i> CasparCG Channel</td>
										<td><?php echo $channel;?></td>
									</tr>
								</tbody>
							</table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
			
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<!-- /.modal -->

    <?php include("scripts.php"); ?>

</body>

</html>
