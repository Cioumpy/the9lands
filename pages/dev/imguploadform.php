<?php
	include "../../scripts/config.php";     	// Cofiguration file for the Database connection
	include "../../scripts/session.php";    	// Checks if a member section is active
	include "../../scripts/functions.php";		// Enables the website´s general PHP functions

	include "../../scripts/invites.php";  		// Get the rules regarding invites
	include "../../scripts/ddrules.php";			// Get the rules of the game
	include "../../scripts/character.php";  	// Get the rules regarding characters
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">

		<title>The Nine Lands Online Tabletop - D&D 3.5</title>

		<link href="/styles/style.less" rel="stylesheet/less" type="text/css">
		<link href="/styles/attach.css" rel="stylesheet" type="text/css">

		<script>
			less = {
				env: "development"
			};
		</script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
		<script>
			var gameRules = JSON.parse('<?php echo json_encode($ddRules); ?>');
			var invitesList = JSON.parse('<?php echo json_encode($invites); ?>');
		</script>
	</head>

	<body>

		<form action="upload.php" method="post" enctype="multipart/form-data">
		    Select image to upload:
		    <input type="file" name="fileToUpload" id="fileToUpload">
		    <input type="submit" value="Upload Image" name="submit">
		</form>

	</body>

</html>
