<?php
// Character Sheet Object file
/* This file is going to replace the "charrules.php" file in this directory. */

	class Character {

// Setting up the variables to collect from the characters table in the Database
		public 	$info = array();

		public function set_info($label, $new_value) {
			$this->info[$label] = $new_value;
		}

		public function get_info() {
			return $this->info;
		}
// *****************************************************************************

// Setting up the variables to collect from the characters table in the Database

		// Define the Abilities' Name, Short Name, Score and Modifier
		public $ability = array(
			'strength' => array(
				'name' => 'Strength',
				'shtname' => 'STR',
				'score' => 0,
				'modifier' => 0,
			),
			'dexterity' => array(
				'name' => 'Dexterity',
				'shtname' => 'DEX',
				'score' => 0,
				'modifier' => 0,
			),
			'constitution' => array(
				'name' => 'Constitution',
				'shtname' => 'CON',
				'score' => 0,
				'modifier' => 0,
			),
			'intelligence' => array(
				'name' => 'Intelligence',
				'shtname' => 'INT',
				'score' => 0,
				'modifier' => 0,
			),
			'wisdom' => array(
				'name' => 'Wisdom',
				'shtname' => 'WIS',
				'score' => 0,
				'modifier' => 0,
			),
			'charisma' => array(
				'name' => 'Charisma',
				'shtname' => 'CHA',
				'score' => 0,
				'modifier' => 0,
			),
		);

		public function set_ability($new_str, $new_dex, $new_con, $new_int, $new_wis, $new_cha) {
			$this->ability['strength']['score'] = $new_str;
			$this->ability['strength']['modifier'] = floor(($new_str - 10) / 2);
			$this->ability['dexterity']['score'] = $new_dex;
			$this->ability['dexterity']['modifier'] = floor(($new_dex - 10) / 2);
			$this->ability['constitution']['score'] = $new_con;
			$this->ability['constitution']['modifier'] = floor(($new_con - 10) / 2);
			$this->ability['intelligence']['score'] = $new_int;
			$this->ability['intelligence']['modifier'] = floor(($new_int - 10) / 2);
			$this->ability['wisdom']['score'] = $new_wis;
			$this->ability['wisdom']['modifier'] = floor(($new_wis - 10) / 2);
			$this->ability['charisma']['score'] = $new_cha;
			$this->ability['charisma']['modifier'] = floor(($new_cha - 10) / 2);
		}

		public function get_ability() {
			return $this->ability;
		}

// Define the Base Attack Bonus' Name, Short Name and Score
		public $bab = array(
			'name' => 'Base Attack Bonus',
			'shtname' => 'BAB',
			'score' => 0,
		);

		public function set_bab($new_bab) {
			$this->bab['score'] = $new_bab;
		}

// Define the Saving Throws' Name, Short Name, Key Ability and Score
		public $bSavThrows = array(
			'fort' => array(
				'name' => 'Fortitude',
				'shtname' => 'Fort',
				'keyability' => 'constitution',
				'score' => 0,
			),
			'refl' => array(
				'name' => 'Reflexes',
				'shtname' => 'Refl',
				'keyability' => 'dexterity',
				'score' => 0,
			),
			'will' => array(
				'name' => 'Will',
				'shtname' => 'Will',
				'keyability' => 'wisdom',
				'score' => 0,
			),
		);

		public function set_bSavThrows($new_fort, $new_refl, $new_will) {
			$this->bSavThrows['fort']['score'] = $new_fort;
			$this->bSavThrows['refl']['score'] = $new_refl;
			$this->bSavThrows['will']['score'] = $new_will;
		}

// Define the Skills' Name, Key Ability and Score
		public $bSkills = array();

		public function set_bSkills($skill, $label, $new_value) {
			$this->$bSkills[$skill][$label] = $new_value;
		}

	}



// o===(===========>   *************************************   <===========)===o

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

// Create a Character object for every character owned and set its $info array
	$sql = "SELECT * FROM characters WHERE playername='$sessuser';";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		// output data of each row
		while ($row = $result->fetch_assoc()) {
			$character[$row['id']] = new Character;
			foreach ($row as $key => $value) {
				$character[$row['id']]->set_info($key, $value);
			}
		}
	}

	// Close connection
	mysqli_close($conn);


?>
