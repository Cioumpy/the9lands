<?php
	include "config.php";   // Configuration file for the Database connection
	include "session.php";  // Checks if a member section is active

	// Define character id
	$charid = $_POST['charid'];

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	$sql = "SELECT * FROM characters WHERE playername='$sessuser'";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		// update data of each row
		while($row = $result->fetch_assoc()) {
			if($row['id'] != $charid) {
				$updsql = "UPDATE characters SET active='false' WHERE id='" . $row['id'] . "';";
			} else {
				$updsql = "UPDATE characters SET active='true' WHERE id='" . $row['id'] . "';";
			}
			$conn->query($updsql);
		}
	}

	// close connection
	mysqli_close($conn);

	// reload the characters page
	header("location: ../pages/charsheet.php");
?>
