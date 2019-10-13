<div id="titlebox">
	<h1>The Nine Lands</h1>
	<h2>d20 System Online Tabletop RPG</h2>
</div>

<div id="mainbody">

	<?php echo form_open('pages/view'); ?>

<!--	<form action="/assets/commons/scripts/session/login.php" method="post">		-->
		<div class="container">
			<label>USERNAME</label>
			<input type="text" placeholder="Enter Username" name="uname" required>

			<label>PASSWORD</label>
			<input type="password" placeholder="Enter Password" name="psw" required>

			<?php echo validation_errors(); ?>

			<button type="submit">LOGIN</button>
			<label><input type="checkbox" checked> Remember me</label>
			<span class="psw">Forgot <a href="#">password</a>?</span>
		</div>

	</form>

</div>
