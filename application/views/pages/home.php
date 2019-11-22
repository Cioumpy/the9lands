<audio autoplay loop>
	<source src="/media/commons/audio/celtic_music.mp3" type="audio/mpeg">
	Your browser does not support the audio tag.
</audio>

<div id="row_top">

	<div id="title_box">
		<h1></h1>
		<h2></h2>
	</div>

	<div id="session_menu">
		<a type="button" href="<?php echo site_url(); ?>"><span class="glyphicon glyphicon-user"></a>
		<a type="button" href="<?php echo site_url('pages/logout'); ?>" title="Logout"><span class="glyphicon glyphicon-log-out"></span></a>
	</div>

</div>

<div id="row_bottom">

	<div id="main_menu">

		<?php foreach ($main_menu as $key => $value): ?>
			<label class="mainmenu_item"><a href="<?php echo $value; ?>"><?php echo $key; ?></a></label>
		<?php endforeach; ?>

	</div>

</div>

</body>
</html>
