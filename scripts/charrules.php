<?php
	
	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 

	
	// Get the Ability Names **************************************** //
		$abilname = array("strength"=>"Strength", "dexterity"=>"Dexterity", "constitution"=>"Constitution", "intelligence"=>"Intelligence", "wisdom"=>"Wisdom", "charisma"=>"Charisma");
		$abilshtname = array("strength"=>"STR", "dexterity"=>"DEX", "constitution"=>"CON", "intelligence"=>"INT", "wisdom"=>"WIS", "charisma"=>"CHA");
		
	// ************************************************************** //	
			

	// Get the Classes Stats **************************************** //
		$ddclassessql = "SELECT id, class, shtname, hd, bab, fort, refl, will FROM ddbaseclasslist;";
		$ddclassesresult = $conn->query($ddclassessql);
		
		$ddclassmaxid = 0;
		$ddclasses = array();
		if ($ddclassesresult->num_rows > 0) {
			// output data of each row
			while($ddclassesrow = $ddclassesresult->fetch_assoc()) {
				if ($ddclassmaxid < $ddclassesrow['id']) {
					$ddclassmaxid = $ddclassesrow['id'];
				}
				foreach ($ddclassesrow as $cl => $cl_value) {
					if($cl != 'id') {
						$ddclasses[$ddclassesrow['id']][$cl] = $cl_value;
					}
				}
			}
		}
		
		$goodts = 1 / 2;
		$poorts = 1 / 3;
		
	// ************************************************************** //	
			
	// Get the Classes Descriptions ********************************* //
		$ddclassesdescsql = "SELECT id, class, shtdesc, manual, page, image, intro, Adventures, Characteristics, Alignment, Religion, Background, Races, Other_Classes, Role FROM ddbaseclasslist;";
		$ddclassesdescresult = $conn->query($ddclassesdescsql);
		
		$ddclassesdesc = array();
		if ($ddclassesdescresult->num_rows > 0) {
			// output data of each row
			while($ddclassesdescrow = $ddclassesdescresult->fetch_assoc()) {
				foreach ($ddclassesdescrow as $cldes => $cldes_value) {
					if($cldes != 'id') {
						$ddclassesdesc[$ddclassesdescrow['id']][$cldes] = $cldes_value;
					}
				}
			}
		}
		
	// ************************************************************** //	
			

	// Get the Skill Names ****************************************** //
		$ddskillssql = "SELECT * FROM ddskills;";
		$ddskillsresult = $conn->query($ddskillssql);
		
		if ($ddskillsresult->num_rows > 0) {
			$ddskillname = array();
			$ddskillkey = array();
			// output data of each row
			while($ddskillsrow = $ddskillsresult->fetch_assoc()) {
				foreach ($ddskillsrow as $sk => $sk_value) {
					if ($ddskillsrow['class'] == "Skill Name") {
						$ddskillname[$sk] = $sk_value;
					}
					if ($ddskillsrow['class'] == "Untrained") {
						$ddskillunt[$sk] = $sk_value;
					}
					if ($ddskillsrow['class'] == "Ability") {
						$ddskillkey[$sk] = $sk_value;
					}
					if ($ddskillsrow['class'] == "Armor Penalty") {
						$ddskillarmpen[$sk] = $sk_value;
					}
				}
			}
		}
		
	// ************************************************************** //	
			

	// Close connection
	mysqli_close($conn);
	
?>
