<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="./">WebCG (v<?php echo $cg_version; ?>)</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li>
			<a href="settings.php"><i class="fa fa-gear fa-fw"></i> Settings</a>
		</li>
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li>
					<a href="./" <?php if($page=="index.php") echo "class=\"active\""; ?>><i class="fa fa-navicon fa-fw"></i> Rundown</a>
				</li>
				<?php
				$result = $mysqli->query("SELECT id, name, icon FROM layers ORDER BY name ASC");
				while($menu = $result->fetch_assoc()){
				?>
				<li>
					<a href="layer.php?id=<?php echo $menu['id']; ?>" <?php if(isset($_GET['id']) && $_GET['id']==$menu['id']) echo "class=\"active\""; ?>><i class="fa <?php if (!empty($menu['icon'])) echo $menu['icon']; else echo "fa-square-o"; ?> fa-fw"></i> <?php echo $menu['name']; ?></a>
				</li>
				<?php
				}
				?>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>