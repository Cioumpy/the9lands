<?php
	include "../scripts/config.php";		// Cofiguration file for the Database connection
	include "../scripts/session.php";		// Checks if a member section is active
	include "../scripts/charrules.php";	// Get the rules regarding characters
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - D&D 3.5</title>
		<link href="../styles/style.css" rel="stylesheet" type="text/css">
		<link href="../styles/charsheet.css" rel="stylesheet" type="text/css">
		<link href="../styles/attach.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<?php include "frames/header.php" ?>

		<div id="mainbody">

			<div id="charlist">

				<div class="charchoice">
					<div id="newavatarimg">+</div>
					<div class="chardescrip">
						<p class="charname">Create New</p>
						<a class="viewcharsheet" href="newchar.php">Create</a>
					</div>
				</div>

				<?php
				// Create connection
				$conn = new mysqli($servername, $userid, $keyword, $dbname);

				// Check connection
				if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
				}

				$sql = "SELECT * FROM characters WHERE playername='$sessuser';";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					// output data of each row
					while($row = $result->fetch_assoc()) {
						include "frames/viewchar.php";
					}
				}

/*			foreach ($character as $key => $value) {
					// code...
				}

*/


				mysqli_close($conn);

				?>

			</div>

	  </div>

	  <script src="../scripts/main.js"></script>
	</body>

</html>
