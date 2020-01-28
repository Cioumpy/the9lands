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
		<?php if (isset($_SESSION['role']) && $_SESSION['role'] == 'admin'): ?>
			<a type="button" href="<?php echo site_url('backoffice/accounts'); ?>" title="Backoffice" target="_blank"><span class="glyphicon glyphicon-wrench"></span></a>
		<?php endif; ?>
		<a type="button" href="<?php echo site_url(); ?>" title="Profile"><span class="glyphicon glyphicon-user"></a>
		<a type="button" href="<?php echo site_url('pages/logout'); ?>" title="Logout"><span class="glyphicon glyphicon-log-out"></span></a>
	</div>

</div>

<div id="row_bottom">

	<div id="main_menu">

		<?php foreach ($main_menu as $menu_entry => $link): ?>
			<a href="<?php echo $link; ?>"><label class="mainmenu_item"><?php echo $menu_entry; ?></label></a>
		<?php endforeach; ?>

	</div>

</div>

</body>
</html>
