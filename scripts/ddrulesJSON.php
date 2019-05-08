<?php
  include "../scripts/config.php";
  include "../scripts/functions.php";		// Enables the website´s general PHP functions
  include "../scripts/ddrules.php";			// Get the rules of the games
  print_r(json_encode($ddRules));
?>
