<?php
	include "../scripts/config.php";   // Cofiguration file for the Database connection
	include "../scripts/session.php";  // Checks if a member section is active
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - D&D 3.5</title>
		<link href="/styles/style.css" rel="stylesheet" type="text/css">
		<link href="/styles/attach.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<?php include "frames/header.php" ?>

		<div id="mainbody">

			<?php
				// Create connection
				$conn = new mysqli($servername, $userid, $keyword, $dbname);

				// Check connection
				if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
				}

				$sql = "SELECT  username, password, first_name, last_name, email FROM accounts;";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					echo "<table><tr><th>User</th><th>Password</th><th>Name</th><th>Email</th></tr>";
					// output data of each row
					while($row = $result->fetch_assoc()) {
						$yourfirstname = $row["first_name"];
						$yourlastname = $row["last_name"];
						$yourfullname = $yourfirstname . " " . $yourlastname;
						$youremail = $row["email"];
						echo "<tr><td>" . $row["username"]. "</td><td>" . $row["password"]. "</td><td>" . $yourfullname . "</td><td>" . $youremail . "</td></tr>";
					}
					echo "</table>";
				} else {
					echo "0 results";
				}

				echo "<br><br>";

				if ($sessuser != null) {
					echo "Connected as " . $sessuser . "!";
				} else {
					echo "You are not connected. You are here as a guest.";
				}

				mysqli_close($conn);
			?>

			<hr> <!-- ******************************************************************************************************* -->
			<hr> <!-- ******************************************************************************************************* -->

			<h3>Temporary links</h3>
			<p>These are links to quickly navigate to the pages you're working on:</p>
			<ul>
				<li><a href="charsheet.php" style="color: goldenrod">Characters List Page</a></li>
				<li><a href="newchar.php" style="color: goldenrod">New Character Page</a></li>
				<li><a href="../testdb.php" style="color: goldenrod">Test Page</a>: a page to test formulas and see the results.</li>
			</ul>

			<hr> <!-- ******************************************************************************************************* -->
			<hr> <!-- ******************************************************************************************************* -->

			<p>In this website you will be able <strong>(eventually)</strong> to play your own adventures of:</p>
			<ul>
  			<li><strong>Dungeons & Dragons 3.5</strong></li>
  			<li><strong>Pathfinder</strong></li>
  		</ul>
			</p>with your friends online!</p>

			<hr> <!-- ******************************************************************************************************* -->

			<h3>The Nine Lands Online RPG Tabletop Website</h3>
			<p>Stuff done:</p>
			<ul>
				<li>Wrote the Login Page (index.php + login.php);</li>
				<li>Made a Logout button (+ logout.php);</li>
				<li>Started to write the Player's Page/Homepage (player.php);</li>
				<li>Started to write the Characters page (charsheet.php);</li>
				<li>Started to write the Manuals' Download page (manuals.php);</li>
	     	<li>Made a database to allow users to register and login (the9lands.account);</li>
			</ul>
			<p>Stuff to do:</p>
			<ul>
	     	<li>Write the Playing Characters' page;</li>
	     	<li>Write the Dungeon Master's page;</li>
	     	<li>Write the Account's page;</li>
	     	<li>Build a database with data on the rules of the game.</li>
	     	<li>Make a link to the d20SRD for D&D 3.5 and Pathfinder rules;</li>
	     	<li>Finish to write the Manuals' Download page;</li>
	     	<li>Finish to write the Homepage.</li>
	     	<li></li>
	     </ul>

			<hr> <!-- ******************************************************************************************************* -->

	     <h3>Playing Characters' Page</h3>
	     <p>Stuff done:</p>
	     <ul>
				<li>Started to write the Characters page (charsheet.php);</li>
	     	<li>Started to write a viewable Character Sheet (frames/viewchar.php);</li>
	     	<li>Started to build a Charachter Sheet Database (the9lands.characters);</li>
	     	<li>Allowed users to have more Playing Charachter Sheets (frames/charbox.php);</li>
	     </ul>

	     <p>Stuff to do:</p>
	     <ul>
	     	<li>Write an editable Character Sheet;</li>
	     	<li>Write the program to play the game online;</li>
	     	<li>Build a Charachter Sheet;</li>
	     	<li>Write the program to create an add Playing Charachter Sheets to the database;</li>
	     	<li></li>
	     </ul>

			<hr> <!-- ******************************************************************************************************* -->

	     <h3>Manuals' Download Page</h3>
	     <p>Started to write the Manuals' Download page.</p>
	     <p>Stuff done:</p>
	     <ul>
	     	<li>Wrote the basic HTML, CSS, and JS for the page;</li>
	     	<li>Found some thumbnails for the manuals' covers;</li>
	     	<li>Made a link to a manual to test.</li>
	     </ul>
	     <p>Stuff to do:</p>
	     <ul>
	     	<li>Find the rest of the manuals and thumbnails to add to the page;</li>
	     	<li>Make a properly structured folder for the manuals in each language to download;</li>
	     	<li>If it's a good idea, build a database with data on the manuals.</li>
	     	<li></li>
	     	<li></li>
	     </ul>
	  </div>

	  <script src="../scripts/main.js"></script>
	</body>

</html>
