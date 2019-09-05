<?php
	$sessuser = $_SESSION['member'];

	if ($sessuser == null) {
		$_SESSION['error'] = "Your session has expired!";
		header("location: $pathtoroot/index.php");
	}

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

// The following script collects the profile info for the current session member

	$sql = "SELECT  username, password, first_name, last_name, email FROM accounts WHERE username='$sessuser'";
	$result = $conn->query($sql);

	if ($result->num_rows == 1) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			$sessfirstname = $row['first_name'];
			$sesslastname = $row['last_name'];
			$sessfullname = $sessfirstname . " " . $sesslastname;
			$sessemail = $row['email'];
		}
	}

	// Define profile variables
	$_SESSION['firstname'] = $sessfirstname;
	$_SESSION['lastname'] = $sesslastname;
	$_SESSION['fullname'] = $sessfullname;
	$_SESSION['email'] = $sessemail;

	// Close connection
	mysqli_close($conn);

?>
