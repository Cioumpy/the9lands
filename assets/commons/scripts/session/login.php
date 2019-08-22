<?php
/* Login Script == "The Nine Lands" Website. */
/* ========================================================================== */
/*
*/



	$pathtoroot = "../../../..";
	include $pathtoroot . "/assets/commons/scripts/session/config.php";  // Configuration file for the Database connection

	if ($_SERVER["REQUEST_METHOD"] == "POST") {

		// Define and validate the input fields
		$memberid = validate_input($_POST["uname"]);
	  $memberpsw = validate_input($_POST["psw"]);

		// Create connection and check it
		$conn = new mysqli($servername, $userid, $keyword, $dbname);
		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}

		// Retrieve stored password for current user from database
		$sql = "SELECT password FROM accounts WHERE username='$memberid';";
		$result = $conn->query($sql);
		if ($result->num_rows == 1) {
			while ($row = $result->fetch_assoc()) {
				$stored_password = $row['password'];
			}
		}

		// Verify the password
		if(password_verify($memberpsw, $stored_password)) {
			// If password is valid, set session user and go to home page
			$_SESSION['member'] = $memberid;
			unset($_SESSION['error']);
			header("location: " . $pathtoroot . "/assets/pages/home.php");
		} else {
			// If password is invalid, generate an error and go back to login page
			$_SESSION['error'] = "Username or Password are invalid!";
			header("location: " . $pathtoroot . "/index.php");
		}

	}

	function validate_input($data) {
	  $data = trim($data);
	  $data = stripslashes($data);
	  $data = htmlspecialchars($data);
	  return $data;
	}

?>
