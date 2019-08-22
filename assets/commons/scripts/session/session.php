<?php
	$sessuser = $_SESSION['member'];
	
	if ($sessuser == null) {
		header("location: ../index.php");
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
	

// The following script collects the playing character info for the current session member
	
	$sql = "SELECT * FROM characters WHERE playername='$sessuser' AND active='true';";
	$result = $conn->query($sql);
	
	if ($result->num_rows == 1) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			foreach ($row as $row_label => $row_value) {
				$pcstat[$row_label] = $row_value;
			}
		}
	}
/*	
	// Define playing character variables
	$_SESSION['pcid'] = $pcid;
	$_SESSION['pcname'] = $pcname;
	$_SESSION['pcgame'] = $pcgame;
	$_SESSION['pccamp'] = $pccamp;
	$_SESSION['pcavatar'] = $pcavatar;
	$_SESSION['pcrace'] = $pcrace;
	$_SESSION['pcstr'] = $pcstr;
	$_SESSION['pcdex'] = $pcdex;
	$_SESSION['pccon'] = $pccon;
	$_SESSION['pcint'] = $pcint;
	$_SESSION['pcwis'] = $pcwis;
	$_SESSION['pccha'] = $pccha;
	$_SESSION['pclevel'] = $pclevel;
*/	

	// Close connection
	mysqli_close($conn);
	
?>
