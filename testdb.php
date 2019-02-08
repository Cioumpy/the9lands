<?php
	include "scripts/config.php";     	// Cofiguration file for the Database connection
	include "scripts/session.php";    	// Checks if a member section is active
	include "scripts/functions.php";		// Enables the website´s general PHP functions

	include "scripts/invites.php";  		// Get the rules regarding invites
	include "scripts/ddrules.php";			// Get the rules of the game
	include "scripts/character.php";  	// Get the rules regarding characters
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">

		<title>The Nine Lands Online Tabletop - D&D 3.5</title>

		<link href="styles/style.css" rel="stylesheet" type="text/css">
		<link href="styles/attach.css" rel="stylesheet" type="text/css">

		<script>
			var gameRules = JSON.parse('<?php echo json_encode($ddRules); ?>');
			var invitesList = JSON.parse('<?php echo json_encode($invites); ?>');
		</script>
	</head>

	<body>

		<?php include "pages/frames/header.php" ?>

		<div id="mainbody">

			<?php

				// Create connection
				$conn = new mysqli($servername, $userid, $keyword, $dbname);

				// Check connection
				if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
				}

				$sql = "SELECT * FROM t9lddrules.abilities;";
				$myAbilities = getDBTable($sql, $conn);

				mysqli_close($conn);

				echo "<b>Testing the generic function getDBTable with t9lddrules.abilities:</b><br>";
				print_r($myAbilities);
				echo "<br><br>";

				echo '<h6>The $character[1] Object</h6><br>';
				print_r($character[1]);
				echo "<br><br>";
				echo '<h6>The $ddRules Object</h6><br>';
				print_r($ddRules);
				echo "<br><br>";

				echo '<h6>The gameRules JS object (mirror of $ddRules)</h6><br>';
				print_r(json_encode($ddRules, JSON_PRETTY_PRINT));
				echo "<br><br>";

				echo '<h6>The invitesList JS object (mirror of $invites)</h6><br>';
				print_r(json_encode($invites, JSON_PRETTY_PRINT));
				echo "<br><br>";

				$testvar1 = 1 / 3;
				$testvar2 = $testvar1 * 3;
				$testvar3 = $testvar1 + $testvar1 + $testvar1;

				echo "<p>";
				echo "<strong>TestVar 1:</strong> " . $testvar1 . "<br>";
				echo "<strong>TestVar 2:</strong> " . $testvar2 . "<br>";
				echo "<strong>TestVar 3:</strong> " . $testvar3 . "<br>";
				echo "</p>";

				echo "<h3>Player's Stats</h3>";
				echo "<p>";

				echo 	$_SESSION['fullname'] . "<br>";
				echo 	$_SESSION['email'] . "</p>";

				echo "<h3>Playing Characters Stats</h3>";
				echo "<p>";
					foreach ($pcstat as $pc_label => $pc_value) {
						echo "<strong>" . $pc_label . ":</strong> " . $pc_value . "<br>";
					}
				echo "</p>";

				// Create connection
				$conn = new mysqli($servername, $userid, $keyword, $dbname);

				// Check connection
				if ($conn->connect_error) {
					die("Connection failed: " . $conn->connect_error);
				}

				$sql = "SELECT * FROM characters WHERE playername='$sessuser';";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					echo "<h3>Characters List</h3>";
					echo "<table>";
					// output data of each row
					$rowindex = 0;
					while($row = $result->fetch_assoc()) {
						$rowindex = $rowindex + 1;
						if ($rowindex == 1) {
							echo "<tr>";
								foreach ($row as $r => $r_value) {
									echo "<th>" . $r . "</th>";
								}
							echo "</tr>";
						}
						echo "<tr>";
							foreach ($row as $r => $r_value) {
								echo "<td>" . $r_value . "</td>";
							}
						echo "</tr>";
					}
					echo "</table>";
				} else {
					echo "You have no characters.";
				}

				echo "<br><br>";



				$charsql = "SELECT * FROM progrchar" . $pcstat['id'] . ";";
				$charresult = $conn->query($charsql);

				if ($charresult->num_rows > 0) {
					echo "<h3>" . $pcstat['charname'] . "'s Stats</h3>";

				// Get the Charachter Class Level ******************************* //
					$charlevel = 0;
					$charbab = 0;
					// output data of each row
					while($charrow = $charresult->fetch_assoc()) {
						if ($charrow['level'] > $charlevel) {
							$charlevel = $charrow['level'];
							$charbab = $charbab + $charrow['bab'];
						}
						if ($charrow['level'] == $charlevel) {
							$charstr = $charrow['strength'];
							$chardex = $charrow['dexterity'];
							$charcon = $charrow['constitution'];
							$charint = $charrow['intelligence'];
							$charwis = $charrow['wisdom'];
							$charcha = $charrow['charisma'];
						}
					}
					$charbab = floor($charbab);

					echo "<p><strong>Level:</strong> " . $charlevel . "</p>";

					for ($countlvl = 1; $countlvl <= $charlevel; $countlvl++) {
						$nextlvlxp = $nextlvlxp + $countlvl;
						if ($countlvl == $charlevel -1) {
							$baselvlxp = $nextlvlxp;
						}
					}
					$nextlvlxp = $nextlvlxp * 1000;
					$baselvlxp = $baselvlxp * 1000;

					echo "<p><strong>Base XP:</strong> " . $baselvlxp . "</p>";
					echo "<p><strong>XP to next level:</strong> " . $nextlvlxp . "</p>";
					echo "<p><strong>Strength:</strong> " . $charstr . "</p>";
					echo "<p><strong>Dexterity:</strong> " . $chardex . "</p>";
					echo "<p><strong>Constitution:</strong> " . $charcon . "</p>";
					echo "<p><strong>Intelligence:</strong> " . $charint . "</p>";
					echo "<p><strong>Wisdom:</strong> " . $charwis . "</p>";
					echo "<p><strong>Charisma:</strong> " . $charcha . "</p>";

					echo "<p><strong>Base Attack Bonus:</strong> " . $charbab . "</p>";

			// ************************************************************** //


				} else {
					echo "You don't have any active character (yet!).";
				}

				echo "<br><br>";


			// Get the Charachter Skill Points ******************************* //
				$skillssql = "SELECT * FROM skillschar" . $pcstat['id'] . ";";
				$skillsresult = $conn->query($skillssql);

				if ($skillsresult->num_rows > 0) {
					echo "<h3>" . $pcstat['charname'] . "'s Skill Ranks</h3>";

					$pcskill = array();
					// output data of each row
					while($skillsrow = $skillsresult->fetch_assoc()) {
						foreach ($skillsrow as $sk => $sk_value) {
							$pcskill[$sk] = $pcskill[$sk] + $sk_value;
						}
					}

					echo "<p>";
					foreach ($pcskill as $sk => $sk_value) {
						echo "<span style='font-weight: bold'>";
						if ($sk == "sp") {
							echo "Skill Points";
						} else {
							echo $ddskillname[$sk];
							if ($ddskillunt[$sk] != null) {
								echo " O";
							}
							echo " - " . $ddskillkey[$sk];
							if ($ddskillarmpen[$sk] != null) {
								echo "*";
							}
						}
						echo ":</span> " . $sk_value . "<br>";
					}
					echo "</p>";

				} else {
					echo "This character doesn't have any skills (yet!).";
				}

			// ************************************************************** //


				echo "<br><br>";

				mysqli_close($conn);

				echo "<h3>Object Oriented Programming</h3>";
				echo "<h4>Characters List</h4>";

				echo "<table>";
				$counter = 0;
				foreach ($character as $item => $useless) {
					$counter++;
					$test_info = $character[$item]->get_info();
					if ($counter = 1) {
						echo "<tr>";
						foreach ($test_info as $key => $value) {
							echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $key . "</th>";
						}
						echo "</tr>";
					}
					echo "<tr>";
					foreach ($test_info as $key => $value) {
						echo "<td style='border: 1px solid white; padding: 5px'>" . $value . "</td>";
					}
					echo "</tr>";
				}
				echo "</table>";

				echo "<br><br>";

				echo "<h4>ddRules Database Tables</h4>";

			// Print the Classes Stats ************************************** //
				// Printing all the keys and values one by one
				echo "<table>";
				$test_abil = $ddRules->get_ability();
				$keys = array_keys($test_abil);
				echo "<tr>";
				echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'></th>";
				foreach($test_abil[$keys[1]] as $key => $value) {
						echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $key . "</th>";
				}
				echo "</tr>";
				for($i = 0; $i < count($test_abil); $i++) {
				    echo "<tr><th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $keys[$i] . "</th>";
				    foreach($test_abil[$keys[$i]] as $key => $value) {
				        echo "<td style='border: 1px solid white; padding: 5px'>" . $value . "</td>";
				    }
				    echo "</tr>";
				}
				echo "</table>";

			// ************************************************************** //

				echo "<br>";

			// Print the Classes Stats ************************************** //
				// Printing all the keys and values one by one
				echo "<table>";
				$test_classes = $ddRules->get_classes();
				$keys = array_keys($test_classes);
				echo "<tr>";
				echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'></th>";
				foreach($test_classes[$keys[1]] as $key => $value) {
						echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $key . "</th>";
				}
				echo "</tr>";
				for($i = 0; $i < count($test_classes); $i++) {
				    echo "<tr><th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $keys[$i] . "</th>";
				    foreach($test_classes[$keys[$i]] as $key => $value) {
				        echo "<td style='border: 1px solid white; padding: 5px'>" . $value . "</td>";
				    }
				    echo "</tr>";
				}
				echo "</table>";

			// ************************************************************** //

				echo "<br><br>";


				if ($sessuser != null) {
					echo "Connected as " . $sessuser . "!";
				} else {
					echo "You are not connected. You are here as a guest.";
				}

			?>

			<hr> <!-- ******************************************************************************************************* -->
			<hr> <!-- ******************************************************************************************************* -->

	  </div>

	  <script src="scripts/main.js"></script>
		<script>
			document.getElementById('dndskills').innerHTML = Object.keys(gameSkills).length;
		</script>
	</body>

</html>
