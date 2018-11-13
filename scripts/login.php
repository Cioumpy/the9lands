<?php
	include "config.php";  // Cofiguration file for the Database connection

	// Define login variables
	$memberid = $_POST['uname'];
	$memberpsw = $_POST['psw'];

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	$sql = "SELECT  username, password FROM accounts WHERE username='$memberid' AND password='$memberpsw'";
	$result = $conn->query($sql);

	$found = false;

	if ($result->num_rows == 1) {
		$found = true;
	}

	mysqli_close($conn);

	if ($found) {
		$_SESSION['member'] = $memberid;
		header("location: ../pages/player.php");
	} else {
		header("location: ../index.php");
	}

?>
