<?php
/* Login Page == "The Nine Lands" Website. */
/* ========================================================================== */
/*
*/



	// Includes
	include "/index-assets/scripts/config.php";  // Configuration file for the Database connection
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - d20 System</title>
		<link href="/assets/styles/index.less" rel="stylesheet/less" type="text/css">

		<!-- Adding Less CSS Precompiler -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
	</head>

	<body>

		<div id="titlebox">
			<h1>The Nine Lands</h1>
			<h2>d20 System Online Tabletop RPG</h2>
		</div>

		<div id="mainbody">

			<form action="scripts/login.php" method="post">
				<div class="container">
					<label>USERNAME</label>
					<input type="text" placeholder="Enter Username" name="uname" required>

					<label>PASSWORD</label>
					<input type="password" placeholder="Enter Password" name="psw" required>

					<button type="submit">LOGIN</button>
					<label><input type="checkbox" checked> Remember me</label>
					<span class="psw">Forgot <a href="#">password</a>?</span>
				</div>
			</form>

		</div>

	  <script src="scripts/main.js"></script>
	</body>

</html>
