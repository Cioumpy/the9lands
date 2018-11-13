<?php
	include "scripts/config.php";  // Cofiguration file for the Database connection
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - D&D 3.5</title>
		<link href="/styles/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<div id="mainbody">

			<form action="scripts/login.php" method="post">
				<div>
					<h1>The Nine Lands</h1>
					<h2>d20 System Online Tabletop RPG</h2>
				</div>
				<div class="container">
					<label>USERNAME</label>
					<input type="text" placeholder="Enter Username" name="uname" required>

					<label>PASSWORD</label>
					<input type="password" placeholder="Enter Password" name="psw" required>

					<button type="submit">LOGIN</button>
					<label><input type="checkbox" checked> Remember me</label>
					<span class="psw">Forgot <a href="#">password?</a></span>
				</div>
			</form>

		</div>

	  <script src="scripts/main.js"></script>
	</body>

</html>
