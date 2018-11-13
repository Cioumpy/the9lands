<?php
	include "../scripts/config.php";		  // Cofiguration file for the Database connection
	include "../scripts/session.php";		  // Checks if a member section is active
	include "../scripts/functions.php";		// Enables the website´s generic PHP functions

	include "../scripts/ddrules.php";			// Get the rules of the games
	include "../scripts/invites.php";			// Get the rules regarding invites
//	include "../scripts/character.php";  	// Get the rules regarding characters
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>The Nine Lands Online Tabletop - D&D 3.5</title>
		<link href="/styles/style.css" rel="stylesheet" type="text/css">
		<link href="/styles/newchar.css" rel="stylesheet" type="text/css">
		<link href="/styles/attach.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<!-- Campaign Selection screen                                                  -->

		<div class="mainbox" id="newcampbox">

			<div class="pagetitle">
				<div class="sideimgbox">
					<img src="../images/shield.png" height="40px">
				</div>
				<div class="titlebox embossed">
			    <h5>Select Campaign</h5>
				</div>
				<div class="sideimgbox">
					<img src="../images/shield.png" height="40px">
				</div>
			</div>

			<div class="mainscreen">

				<div class="subscreen col1 embossed">
					<div class="listtitle golden">Campaigns</div>
					<br>
					<label class="listitem selected" id="listcamp0" onclick="setCampaign(0, '', 'dd', '1')">Custom Character</label>
					<?php
						for ($inv = 1; $inv <= $invitesmaxid; $inv++) {
							if ($invites[$inv]['username'] != null) {
								$campid = $invites[$inv]['camp'];
								echo "<label class=\"listitem\" id=\"listcamp" . $campid . "\" onclick=\"setCampaign(" . $campid . ", '" . $campaigns[$campid]['campaign'] . "', '" . $campaigns[$campid]['game'] . "', '" . $campaigns[$campid]['startlevel'] . "')\">" . $campaigns[$campid]['campaign'] . "</label>";
							}
						}
					?>
				</div>

				<div class="subscreen campcol" id="camp0">
					<div class="banner">
						<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
							<span>Custom Character</span>
						</div>
					</div>
					<div class="campdesc">
						<p>You are going to create a standard character of your own choice.</p>
					</div>
					<div class="campruleset embossed">
						<span>
							<b>Game Ruleset: </b>
							<select onchange="setGame(this.value)">
								<option value="dd">Dungeons & Dragons 3.5</option>
								<option value="pf">Pathfinder</option>
							</select>
						</span>
						<span>
							<b>Starting Level: </b>
							<input type="number" min="1" max="20" value="1" onchange="setInputValue('startlevel', this.value)">
						</span>
					</div>
				</div>

				<?php
					for ($inv = 1; $inv <= $invitesmaxid; $inv++) {
						if ($invites[$inv]['username'] != null) {
							$campid = $invites[$inv]['camp'];
							include "frames/campaigns.php";
						}
					}
				?>

			</div> <!-- .mainscreen -->

			<div class="pagefooter">
				<div class="pagebuttons embossed">
					<a type="button" class="mainbtns" href="/pages/charsheet.php">Back</a>
					<button class="mainbtns" onclick="showIdAmongClasses('newcharbox', 'mainbox', '')">Start</button>
				</div>
			</div>

		</div>

		<!-- Here ends the Campaign Selection screen and starts the Character Creation screen. -->

		<div class="mainbox hidden" id="newcharbox">

			<div class="pagetitle">
				<div class="sideimgbox">
					<img class="sideimg" src="../images/dd-logo.png" height="30px">
				</div>
				<div class="titlebox embossed">
			    <h5>Create New Character</h5>
				</div>
				<div class="sideimgbox">
					<img class="sideimg" src="../images/dd-logo.png" height="30px">
				</div>
			</div>

			<div class="mainscreen">

				<div class="subscreen col1 embossed">
					<button class="subbtns" onclick="showModal('newcharmodal', 'gender', 'box', 'newchar')">GENDER</button>
					<button class="subbtns" id="subbtn1" onclick="showModal('newcharmodal', 'race', 'box', 'newchar')" disabled>RACE</button>
					<button class="subbtns" id="subbtn2" onclick="showModal('newcharmodal', 'class', 'box', 'newchar')" disabled>CLASS</button>
					<button class="subbtns" id="subbtn3" onclick="showModal('newcharmodal', 'alignment', 'box', 'newchar')" disabled>ALIGNMENT</button>
					<button class="subbtns" id="subbtn4" onclick="showModal('newcharmodal', 'abilities', 'box', 'newchar')" disabled>ABILITIES</button>
					<button class="subbtns" id="subbtn5" onclick="showModal('newcharmodal', 'skills', 'box', 'newchar')" disabled>SKILLS</button>
					<button class="subbtns" id="subbtn6" onclick="showModal('newcharmodal', 'feats', 'box', 'newchar')" disabled>FEATS</button>
					<button class="subbtns" id="subbtn7" onclick="showModal('newcharmodal', 'appearance', 'box', 'newchar')" disabled>APPEARANCE</button>
					<button class="subbtns" id="subbtn8" onclick="showModal('newcharmodal', 'name', 'box', 'newchar')" disabled>NAME</button>
				</div>

				<div class="subscreen col2">
					<table>
						<tr><td><b>Gender:</b></td><td>Male</td></tr>
						<tr><td><b>Race:</b></td><td>Human</td></tr>
						<tr><td><b>Class:</b></td><td>Paladin</td></tr>
						<tr><td><b>Alignment:</b></td><td>Legal Good</td></tr>
						<tr><td><b>Patron Deity:</b></td><td>Heironeous</td></tr>
					</table>
					<br>
					<table>
						<tr><td><b>Strength:</b></td><td>18</td><td>(+4)</td></tr>
						<tr><td><b>Dexterity:</b></td><td>16</td><td>(+3)</td></tr>
						<tr><td><b>Constitution:</b></td><td>18</td><td>(+4)</td></tr>
						<tr><td><b>Intelligence:</b></td><td>12</td><td>(+1)</td></tr>
						<tr><td><b>Wisdom:</b></td><td>16</td><td>(+3)</td></tr>
						<tr><td><b>Charisma:</b></td><td>18</td><td>(+4)</td></tr>
					</table>
				</div>

				<div class="subscreen col3 embossed">
					<div class="avatarbox">
						<div>
							<img src="../images/thumbs/chars/testavatar.jpg">
						</div>
					</div>
					<button class="subbtns rightbtns">BIOGRAPHY</button>
					<button class="subbtns rightbtns">IMPORT</button>
				</div>

			</div> <!-- .mainscereen -->

			<div class="pagefooter">
				<div class="pagebuttons embossed">
					<a class="mainbtns" href="charsheet.php">Back</a>
					<a class="mainbtns redbtn" href="#">Start Over</a>

					<form action="charsheet.php">

						<input class="hidden" type="radio" name="campaign" value="" checked>
						<input class="hidden" type="radio" name="game" value="dd" checked>
						<input class="hidden" type="radio" name="startlevel" value="1" checked>

						<input class="hidden" type="radio" name="gender" value="" checked>
						<input class="hidden" type="radio" name="race" value="" checked>
						<input class="hidden" type="radio" name="class" value="" checked>
						<input class="hidden" type="radio" name="alignment" value="" checked>
						<input class="hidden" type="radio" name="strength" value="" checked>
						<input class="hidden" type="radio" name="dexterity" value="" checked>
						<input class="hidden" type="radio" name="constitution" value="" checked>
						<input class="hidden" type="radio" name="intelligence" value="" checked>
						<input class="hidden" type="radio" name="wisdom" value="" checked>
						<input class="hidden" type="radio" name="charisma" value="" checked>
						<input class="hidden" type="radio" name="" value="" checked>

						<button class="mainbtns bluebtn" type="submit" disabled>Accept</button>

					</form>

				</div>
			</div>

		</div>

		<!-- Here ends the Character Creation main screen and start the Modal Submenu screens. -->

		<div id="newcharmodal" class="modal centerxy hidden">

			<!-- ******* Gender Section ******* -->

			<div class="mainbox newcharbox hidden" id="newchargender">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Gender</h5>
					</div>
				</div>

				<div class="mainscreen">

					<div class="genderbox embossed">
						<button class="subbtns genderbtn" id="imgMale" onclick="setGender('Male', 1)"></button>
						<button class="subbtns genderbtn" id="imgFemale" onclick="setGender('Female', 1)"></button>
					</div>

				</div> <!-- .mainscereen -->

				<div class="campruleset embossed">
					<span>Your character can be male or female. This choice is purely<br>aesthetical and will have no impact on your character stats.</span>
				</div>

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn1" onclick="showIdAmongClasses('race', 'box', 'newchar')" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Race Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharrace">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Race</h5>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen col1 embossed">
						<div class="listtitle bluebtn golden">Races</div>
						<br>
						<?php
							for ($rc = 1; $rc <= count($ddRules->races); $rc++) {
								if ($ddRules->races[$rc]['race'] != null) {
									echo "<label class=\"listitem\" id=\"listrace" . $rc . "\" onclick=\"setRace(" . $rc . ", '" . $ddRules->races[$rc]['race'] . "', 2)\">" . $ddRules->races[$rc]['race'] . "</label>";
								}
							}
						?>
					</div>

					<div class="subscreen racecol" id="race0">
						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
								<span>Races in the World</span>
							</div>
						</div>
						<div class="racedesc">
							<p>The elven woods are home to the elves and their allies. Not many dwarves or half-orcs live there. In turn, elves, humans, halflings, and half-orcs are hard to find in underground dwarven cities. And while nonhumans may travel through the human countryside, most country folk are humans. In the big cities, however, the promise of power and profit brings together people of all the common races: humans, dwarves, elves, gnomes, half-elves, half-orcs, and halflings. </p>
							<p>You can play a character of any race and class combination, but certain races do better pursuing certain careers. Halflings, for example, can be fighters, but their small size and special features make them better as rogues.</p>
						</div>
					</div>

					<?php
						for ($rc = 1; $rc <= count($ddRules->races); $rc++) {
							if ($ddRules->races[$rc]['race'] != null) {
								include "frames/races.php";
							}
						}
					?>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn2" onclick="showIdAmongClasses('class', 'box', 'newchar')" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Class Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharclass">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Class</h5>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen col1 embossed">
						<div class="listtitle bluebtn golden">Classes</div>
						<br>
						<?php
							for ($rc = 1; $rc <= count($ddRules->classes); $rc++) {
								if ($ddRules->classes[$rc]['class'] != null) {
									echo "<label class=\"listitem\" id=\"listclass" . $rc . "\" onclick=\"setClass(" . $rc . ", '" . $ddRules->classes[$rc]['class'] . "', 3)\">" . $ddRules->classes[$rc]['class'] . "</label>";
								}
							}
						?>
					</div>

					<div class="subscreen classcol" id="class0">
						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
								<span>About Classes</span>
							</div>
						</div>
						<div class="racedesc">
							<p>Adventurers seek gold, glory, justice, fame, power, knowledge, or maybe some other goals&#8212;perhaps noble or perhaps base. Each chooses a different way to attain those goals, from brutal combat power, to mighty magic, to subtle skills. Some adventurers prevail and grow in experience, wealth, and power. Others die.</p>
							<p>Your character’s class is his or her profession or vocation. It determines what he or she is able to do: combat prowess, magical ability, skills, and more. Class is probably the first choice you make about your character&#8212;just ahead of race, or perhaps in conjunction with that decision. The class you choose determines where you should best place your character&#39;s ability scores and suggests which races are best to support that class choice.</p>
						</div>
					</div>

					<?php
						for ($rc = 1; $rc <= count($ddRules->classes); $rc++) {
							if ($ddRules->classes[$rc]['class'] != null) {
								include "frames/classes.php";
							}
						}
					?>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn3" onclick="showIdAmongClasses('alignment', 'box', 'newchar')" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Alignment Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharalignment">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Alignment</h5>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen col1 algcol embossed">
						<?php
							for ($rc = 1; $rc <= count($ddRules->alignments); $rc++) {
								if ($ddRules->alignments[$rc]['alignment'] != null) {
									echo "<button class=\"subbtns algbtn\" id=\"listalignment" . $rc . "\" onclick=\"setAlignment(" . $rc . ", '" . $ddRules->alignments[$rc]['alignment'] . "', 4)\">" . $ddRules->alignments[$rc]['alignment'] . "</button>";
								}
							}
						?>
					</div>

					<div class="subscreen alignmentcol" id="alignment0">
						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
								<span>The Nine Alignments</span>
							</div>
						</div>
						<div class="racedesc">
							<p>Nine distinct alignments define all the possible combinations of the lawful–chaotic axis with the good–evil axis. Each alignment description below depicts a typical character of that alignment. Remember that individuals vary from this norm, and that a given character may act more or less in accord with his or her alignment from day to day. Use these descriptions as guidelines, not as scripts.<br>
								<br>
								The first six alignments, lawful good through chaotic neutral, are the standard alignments for player characters. The three evil alignments are for monsters and villains.</p>
						</div>
					</div>

					<?php
						for ($rc = 1; $rc <= count($ddRules->alignments); $rc++) {
								include "frames/alignments.php";
						}
					?>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn4" onclick="showIdAmongClasses('abilities', 'box', 'newchar')" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Abilities Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharabilities">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Abilities</h5>
					</div>
				</div>

				<div class="mainscreen">

					<div class="rollscreen">
						<div class="rollcol">
							<?php

							echo "<div class=\"rollabildiv\">";
							for ($rll = 1; $rll <= count($ddRules->abilities); $rll++) {
								echo "<label class=\"golden\">" . $ddRules->abilities[$rll]['shtname'] . "</label> ";
							}
							echo "</div>";

							echo "<div id=\"rolltilediv\">";
							for ($rll = 1; $rll <= count($ddRules->abilities); $rll++) {
								echo "<span class=\"rollbox embossed\">";
								echo "	<span class=\"rolltile\" id=\"roll" . $rll . "\" draggable=\"true\"></span>";
								echo "</span>";
							}
							echo "</div>";

							echo "<div class=\"rollabildiv\">";
							for ($rll = 1; $rll <= count($ddRules->abilities); $rll++) {
								echo "<div class=\"rollline centerxy\">";
								echo "	<span> + </span>";
								for ($rc = 1; $rc <= count($ddRules->races); $rc++) {
									echo "	<span class=\"raceability" . $rll . " rollbox centerxy embossed hidden\" id=\"race" . $rc . "ability" . $rll . "\">" . $ddRules->races[$rc][$ddRules->abilities[$rll]['ability']] . "</span>";
								}
								echo "	<span> = </span>";
								echo "	<span class=\"rollbox centerxy embossed golden\" id=\"tot" . $rll . "\"></span>";
								echo "	<span class=\"rollbox centerxy embossed golden\" id=\"mod" . $rll . "\"></span>";
								echo "</div>";
							}
							echo "</div>";
							?>
						</div>
						<button class="subbtns" style="flex-grow: 0" onclick="setAbilities()"><div class="rollbtn"></div></button>
					</div>

					<div class="subscreen abilitiescol" id="abilities0">

						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
								<span>Ability Rolls</span>
							</div>
						</div>

						<div class="racedesc">
							<p>Just about every die roll you make is going to be modified based on your character&#39;s abilities. A tough character has a better chance of surviving a wyvern&#39;s poison sting. A perceptive character is more likely to notice bugbears sneaking up from behind. A stupid character is not as likely to find a secret door that leads to a hidden treasure chamber. Your ability scores tell you what your modifiers are for rolls such as these.
								<br>
								<br>
								Your character has six abilities: Strength (abbreviated Str), Dexterity (Dex), Constitution (Con), Intelligence (Int), Wisdom (Wis), and Charisma (Cha). Each of your character&#39;s above-average abilities gives you a benefit on certain die rolls, and each below-average ability gives you a disadvantage on other die rolls. When creating your character, you roll your scores randomly, assign them to the abilities as you like, and raise and lower them according to the character&#39;s race. Later, you can increase them as your character advances in experience.</p>
						</div>

					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn5" onclick="" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Skills Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharskills">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Skills</h5>
					</div>
				</div>

				<div class="mainscreen">

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn6" onclick="" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Feats Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharfeats">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Feats</h5>
					</div>
				</div>

				<div class="mainscreen">

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn7" onclick="" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Appearance Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharappearance">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Appearance</h5>
					</div>
				</div>

				<div class="mainscreen">

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn8" onclick="" disabled>Next</button>
					</div>
				</div>

			</div>

			<!-- ******* Name Section ******* -->

			<div class="mainbox newcharbox hidden" id="newcharname">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h5>Name</h5>
					</div>
				</div>

				<div class="mainscreen">

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn9" onclick="" disabled>Next</button>
					</div>
				</div>

			</div>

		</div> <!-- End of Modal -->

	  <script src="../scripts/main.js"></script>
	  <script src="../scripts/newchar.js"></script>

	</body>

</html>
