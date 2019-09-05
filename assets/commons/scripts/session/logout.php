<?php
	/* Starts the session */
	session_start();

	/* Removes all variables in the session */
	session_unset();

	/* Destroys the current session */
	session_destroy();

	/* Redirects to the Login page */
	$pathtoroot = "../../../..";
	header("location: $pathtoroot/index.php");
?>
