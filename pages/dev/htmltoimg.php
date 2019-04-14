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

		<style>
			.canvas__container {
			  height: 250px;
			  position: relative;
			  width: 150px;
				top: 5px;
				left: 5px;
			}
			.canvas__canvas {
				height: 250px;
			  position: relative;
			  width: 150px;
			  z-index: 1;
				border: 5px solid gray;

				background-image: url('/images/thumbs/chars/testavatar.jpg');
				background-position: center;
				background-repeat: no-repeat;
				background-size: 100% 100%;
			}
			.canvas__mirror {
				height: 250px;
			  left: 0;
			  position: absolute;
			  top: 5px;
				left: 5px;
				z-index: 0;
				width: 150px;
			}
		</style>

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

		<div class="canvas__container">
		  <canvas id="cnvs" class="canvas__canvas"></canvas>
		  <img src="/images/thumbs/chars/testavatar.jpg" id="mirror" class="canvas__mirror" />
		</div>

		<a href="#" class="button" id="btn-download">Download</a>



		<script>
			var cnvs = document.getElementById('cnvs'),
			    ctx = cnvs.getContext('2d'),
			    mirror = document.getElementById('mirror');

			cnvs.width = mirror.width = window.innerWidth;
			cnvs.height = mirror.height = window.innerHeight;

			mirror.addEventListener('contextmenu', function (e) {
			    var dataURL = canvas.toDataURL('image/png');
			    mirror.src = dataURL;
			});

			var button = document.getElementById('btn-download');
			button.addEventListener('click', function (e) {
			    var dataURL = canvas.toDataURL('image/png');
			    button.href = dataURL;
			});
		</script>
	</body>

</html>
