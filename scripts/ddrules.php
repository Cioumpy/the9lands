<?php
	/*  */

	class gameRules {
		public $game;
		public $abilities = array();
		public $races = array();
		public $racedescs = array();
		public $sizes = array();
		public $classes = array();
		public $classesdesc = array();
		public $alignments = array();
		public $skills = array();
		public $skillsdesc = array();
		public $feats = array();

		public function __construct($gm, $activeConn) {
			$this->game = $gm;

		/* Get the DataBase tables to work with on the building functions. */
			$sql = "SELECT * FROM t9l" . $gm . "rules.abilities;";
			$this->abilities = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.racelist;";
			$this->races = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.racedesc;";
			$this->racedescs = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.sizes;";
			$this->sizes = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.classes;";
			$this->classes = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.classesdesc;";
			$this->classesdesc = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.alignments;";
			$this->alignments = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.skills;";
			$this->skills = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.skillsdesc;";
			$this->skillsdesc = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9l" . $gm . "rules.feats;";
			$this->feats = getDBTable($sql, $activeConn);

		/* Managing the tables to make them work at best. */
			for ($i = 1; $i <= count($this->races); $i++) {

				$raceSkill = explode(";",$this->races[$i]['skillbonus']);
				$this->races[$i]['skillbonus'] = null;
				for ($y = 1; $y <= count($this->skills) ; $y++) {
					$this->races[$i]['skillbonus'][$y]['skill'] = $this->skills[$y]['skill'];
					$this->races[$i]['skillbonus'][$y]['bonus'] = 0;
					for ($x=0; $x < count($raceSkill); $x++) {
						if (strpos($this->skills[$y]['skill'], $raceSkill[$x]) === 0) {
							$this->races[$i]['skillbonus'][$y]['bonus'] = $raceSkill[$x+1];
						}
					}
				}

				$this->races[$i]['bonusfeats'] = explode(";",$this->races[$i]['bonusfeats']);
				$this->races[$i]['autolangs'] = explode(";",$this->races[$i]['autolangs']);
				$this->races[$i]['bonuslangs'] = explode(";",$this->races[$i]['bonuslangs']);
				$this->racedescs[$i]['othertraits'] = explode(";;",$this->racedescs[$i]['othertraits']);

			}


			for ($i = 1; $i <= count($this->classes); $i++) {

				$classAlignments = explode(";",$this->classes[$i]['alignments']);
				$this->classes[$i]['alignments'] = null;
				for ($y = 1; $y <= count($this->alignments); $y++) {
					$this->classes[$i]['alignments'][$y]['alignment'] = $this->alignments[$y]['alignment'];
					$this->classes[$i]['alignments'][$y]['available'] = 0;
					for ($x=0; $x < count($classAlignments); $x++) {
						if ($classAlignments[$x] == $this->alignments[$y]['shtname']) {
							$this->classes[$i]['alignments'][$y]['available'] = 1;
						}
					}
				}

				$this->classes[$i]['bonuslangs'] = explode(";",$this->classes[$i]['bonuslangs']);
				$this->classes[$i]['proficiencies'] = explode(";;", $this->classes[$i]['proficiencies']);

				$classSkill = explode(";", $this->classes[$i]['classskills']);
				$this->classes[$i]['classskills'] = null;
				for ($y = 1; $y <= count($this->skills) ; $y++) {
					$this->classes[$i]['classskills'][$y]['skill'] = $this->skills[$y]['skill'];
					$this->classes[$i]['classskills'][$y]['classskill'] = 0;
					for ($x=0; $x < count($classSkill); $x++) {
						if (strpos($this->skills[$y]['skill'], $classSkill[$x]) === 0) {
							$this->classes[$i]['classskills'][$y]['classskill'] = 1;
						}
					}
				}

			}


			$featDesc = [];
			for ($ft = 1; $ft <= count($this->feats); $ft++) {
				$this->feats[$ft]['desc'] = explode(";;", $this->feats[$ft]['desc']);
				$this->feats[$ft]['requisites'] = explode(";;", $this->feats[$ft]['requisites']);
			}

		} // End of function __construct

		public function get_ability() {
			return $this->abilities;
		}
		public function get_races() {
			return $this->races;
		}
		public function get_classes() {
			return $this->classes;
		}
		public function get_classesdesc() {
			return $this->classesdesc;
		}

	} // End of class

// *****************************************************************************

	// Create connection
	$conn = new mysqli($servername, $userid, $keyword, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	// Set the Game Rules objects *********************************** //
	$ddRules = new gameRules('dd', $conn);
	// $pfRules = new gameRules('pf');

	// Close connection
	mysqli_close($conn);

	$goodts = 1 / 2;
	$poorts = 1 / 3;

// ************************************************************** //


?>
