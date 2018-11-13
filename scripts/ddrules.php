<?php
	/*  */

	class gameRules {
		public $game;
		public $abilities = array();
		public $races = array();
		public $classes = array();
		public $classesdesc = array();
		public $alignments = array();

		public function __construct($gm, $activeConn) {
			$this->game = $gm;

			$sql = "SELECT * FROM t9lddrules.abilities;";
			$this->abilities = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9lddrules.racelist;";
			$this->races = getDBTable($sql, $activeConn);

			$sql = "SELECT id, class, shtname, hd, maxlvl, bab, fort, refl, will FROM t9lddrules.baseclasslist;";
			$this->classes = getDBTable($sql, $activeConn);

			$sql = "SELECT id, class, shtdesc, manual, page, image, intro, Adventures, Characteristics, Alignment, Religion, Background, Races, Other_Classes, Role FROM t9lddrules.baseclasslist;";
			$this->classesdesc = getDBTable($sql, $activeConn);

			$sql = "SELECT * FROM t9lddrules.alignments;";
			$this->alignments = getDBTable($sql, $activeConn);
		}

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

	}

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

	$goodts = 1 / 2;
	$poorts = 1 / 3;

// ************************************************************** //

	// Close connection
	mysqli_close($conn);


?>
