<?php
/* Login Page == "The Nine Lands" Website. */
/* ========================================================================== */
/*
*/



  // Starts the session
  // session_start();

  // Set path variables
  $pathtoroot = "..";
  $path_session = "assets/commons/scripts/session";

  // Include session scripts
  include "$pathtoroot/$path_session/config.php";    // Configuration file for the Database connection
  include "$pathtoroot/$path_session/session.php";   // Script file for checking session variables

?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - d20 System</title>
		<link href="../assets/charlist/styles/style.less" rel="stylesheet/less" type="text/css">

		<!-- Adding Less CSS Precompiler -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
	</head>

	<body>
	</body>

</html>
