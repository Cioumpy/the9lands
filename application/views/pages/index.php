<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title><?php echo $title ?> - <?php echo $subtitle ?></title>

		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

		<link rel="stylesheet/less" type="text/css" href="/less/pages/<?php echo $page; ?>.less" />

		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js" ></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>

		<div id="row_top">
			<div id="title_box">
				<h1></h1>
				<h2></h2>
			</div>
		</div>

		<div id="row_bottom">

			<div id="content_box">
				<?php echo form_open('pages/login'); ?>

					<?php echo form_inputbox($login_account['email']); ?>
					<?php echo form_passwordbox($login_account['password']); ?>

					<button type="submit" name="submit">LOGIN</button>

					<div id="other_options">
						<label><input type="checkbox" checked> Remember me</label>
						<span class="psw">Forgot <a href="#">password</a>?</span>
					</div>

				<?php echo form_close(); ?>
			</div>

		</div>

	</body>
</html>
