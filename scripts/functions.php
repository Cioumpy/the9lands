<?php
	// Generic PHP Functions script file - The Nine Lands Website

	/* 	Here below are all the functions related to the database.
	 		Remember to call them only under an active connection!
	*/

	function getDBTable($dbQuery, $connVar) {
		$myTable = array();
		$myResult = $connVar->query($dbQuery);

		if ($myResult->num_rows > 0) {
			while ($row = $myResult->fetch_assoc()) {
				foreach ($row as $key => $value) {
					if ($key != 'id') {
						$myTable[$row['id']][$key] = $value;
					}
				}
			}
		}

		return $myTable;
	}


?>
