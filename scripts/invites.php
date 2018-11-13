<?php

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 

// The following script collects the invites info for the current session member

	$invitesql = "SELECT * FROM invites WHERE username='$sessuser';";
	$inviteresult = $conn->query($invitesql);
	
	if ($inviteresult->num_rows > 0) {
		$invitesmaxid = 0;
		$invites = array();
		// insert data of each row in campaigns[][]
		while($inviterow = $inviteresult->fetch_assoc()) {
			if ($inviterow['id'] > $invitesmaxid) {
				$invitesmaxid = $inviterow['id'];
			}
			foreach ($inviterow as $inv_label => $inv_value) {
				if($inv_label != 'id') {
					$invites[$inviterow['id']][$inv_label] = $inv_value;
				}
			}
		}
	}
	
	/* Now we have a bidimensional array $invites[id][column label] and its highest id: $invitesmaxid. */

	
	$campsql = "SELECT * FROM campaigns WHERE id IN (SELECT camp FROM invites WHERE username='$sessuser');";
	$campresult = $conn->query($campsql);
	
	if ($campresult->num_rows > 0) {
		$campsmaxid = 0;
		$campaigns = array();
		// insert data of each row in campaigns[][]
		while($camprow = $campresult->fetch_assoc()) {
			if ($camprow['id'] > $campsmaxid) {
				$campsmaxid = $camprow['id'];
			}
			foreach ($camprow as $cpg => $cpg_value) {
				if($cpg != 'id') {
					$campaigns[$camprow['id']][$cpg] = $cpg_value;
				}
			}
		}
	}	

	// Close connection
	mysqli_close($conn);
	
?>
