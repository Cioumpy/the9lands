<?php
/* Login Page == "The Nine Lands" Website. */
/* ========================================================================== */
/*
*/



  // Starts the session
  // session_start();

  // Set path variables
  $pathtoroot = "..";
  $path_session = "assets/commons/scripts/session";

  // Include session scripts
  include "$pathtoroot/$path_session/config.php";    // Configuration file for the Database connection
  include "$pathtoroot/$path_session/session.php";   // Script file for checking session variables

?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - d20 System</title>
		<link href="../assets/home/styles/style.less" rel="stylesheet/less" type="text/css">

		<!-- Adding Less CSS Precompiler -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
	</head>

	<body>
		<audio autoplay loop>
		  <source src="/assets/commons/audio/celtic_music.mp3" type="audio/mpeg">
		  Your browser does not support the audio tag.
		</audio>

    <div id="top_row">

      <div id="titlebox">
      	<h1>The Nine Lands</h1>
      	<h2>d20 System Online Tabletop RPG</h2>
      </div>

      <div id="session_menu">
        <a type="button" href="#"><img src="/assets/commons/images/style/inputs/buttons/profile.png" alt="Profile" height="40px" /></a>
        <a type="button" href="<?php echo "$pathtoroot/$path_session/logout.php"; ?>"><img src="/assets/commons/images/style/inputs/buttons/logout_door.png" alt="Logout" height="40px" /></a>
      </div>

    </div>

    <div id="bottom_row">

  		<div id="main_menu">

				<label class="mainmenu_item"><a href="charlist.php">View your Characters</a></label>
				<label class="mainmenu_item"><a href="#">Play a Campaign</a></label>
				<label class="mainmenu_item"><a href="#">Run a Campaign</a></label>
				<label class="mainmenu_item"><a href="#">Write a Campaign</a></label>
				<label class="mainmenu_item"><a href="#">Open Game Content Rules</a></label>
				<label class="mainmenu_item"><a href="#"><i>Ad Hoc</i> Rules</a></label>

  		</div>

    </div>

	</body>

</html>
