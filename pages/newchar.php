<?php
	include "../scripts/config.php";		  // Cofiguration file for the Database connection
	include "../scripts/session.php";		  // Checks if a member section is active
	include "../scripts/functions.php";		// Enables the website´s generic PHP functions
	include "../scripts/ddrules.php";			// Get the rules of the games
	include "../scripts/invites.php";			// Get the rules regarding invites
?>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">

		<title>The Nine Lands Online Tabletop - D&D 3.5</title>

		<link href="/styles/newchar.less" rel="stylesheet/less" type="text/css">
		<link href="/styles/attach.css" rel="stylesheet" type="text/css">

		<script>
		  less = {
		    env: "development"
		  };
		</script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
		<script>
			/* This variable mirrors the PHP $ddRules object in JavaScript. */
			var gameRules = JSON.parse('<?php echo json_encode($ddRules); ?>');
			var invitesList = JSON.parse('<?php echo json_encode($invites); ?>');
		</script>
	</head>



	<body>

		<!-- Campaign Selection screen                                                  -->

		<div class="mainbox" id="newcampbox">

			<div class="pagetitle">
				<div class="sideimgbox">
					<img src="../images/shield.png" height="40px">
				</div>
				<div class="titlebox embossed">
			    <h2>Select Campaign</h2>
				</div>
				<div class="sideimgbox">
					<img src="../images/shield.png" height="40px">
				</div>
			</div>

			<div class="mainscreen">

				<div class="subscreen listcol embossed">
					<div class="listtitle golden">Campaigns</div>
					<div class="itemlist">
						<label class="listitem camplist selected" id="campitem0" onclick="setCampaign(0, 0, '', 'dd', '1')">Custom Character</label>
						<?php
							for ($inv = 1; $inv <= $invitesmaxid; $inv++) {
								if ($invites[$inv]['username'] != null) {
									$campid = $invites[$inv]['camp'];
									echo "<label class=\"listitem camplist\" id=\"campitem" . $campid . "\" onclick=\"setCampaign(" . $inv . ", " . $campid . ", '" . $campaigns[$campid]['campaign'] . "', '" . $campaigns[$campid]['game'] . "', '" . $campaigns[$campid]['startlevel'] . "')\">" . $campaigns[$campid]['campaign'] . "</label>";
								}
							}
						?>
					</div>
				</div>

				<div class="subscreen desccol campcol" id="camp0">
					<div class="banner">
						<div class="bannerbox campbanner" style="background-image: none, url('../images/webelements/banners/campaigns/default.jpg')">
							<span class="bannertitle">Custom Character</span>
						</div>
					</div>
					<div class="descbox">
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
							<input type="number" min="1" max="20" value="1" onchange="setStartLevel(this.value)">
						</span>
					</div>
				</div>

				<?php
					for ($inv = 1; $inv <= $invitesmaxid; $inv++) {
						if ($invites[$inv]['username'] != null) {
							$campid = $invites[$inv]['camp'];
							echo "<div class=\"subscreen desccol campcol hidden\" id=\"camp" . $campid . "\">";
							echo "	<div class=\"banner\">";
							echo "		<div class=\"bannerbox\" style=\"background-image: none, url('../images/webelements/banners/campaigns/" . $campaigns[$campid]['banner'] . "')\">";
							echo "			<span class=\"bannertitle\">" . $campaigns[$campid]['campaign'] . "</span>";
							echo "		</div>";
							echo "	</div>";
							echo "	<div class=\"descbox\">" . $campaigns[$campid]['campdesc'] . "</div>";
							echo "	<div class=\"campruleset embossed\">";
							echo "		<span>";
							echo "			<b>Game Ruleset: </b>";
							if ($campaigns[$campid]['game'] == 'dd') {
								echo "Dungeons & Dragons 3.5";
							} else {
								echo "Pathfinder";
							}
							echo "		</span>";
							echo "		<span><b>Starting Level: </b>" . $campaigns[$campid]['startlevel'] . "</span>";
							echo "	</div>";
							echo "</div>";
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
			    <h1>Create New Character</h1>
				</div>
				<div class="sideimgbox">
					<img class="sideimg" src="../images/dd-logo.png" height="30px">
				</div>
			</div>

			<div class="mainscreen">

				<div class="subscreen listcol embossed">
					<div class="itemlist">
						<button class="subbtns" onclick="showModal('newcharmodal', 'gender', 'box', 'newchar')">GENDER</button>
						<button class="subbtns" id="subbtn1" onclick="showNewRacesModal()" disabled>RACE</button>
						<button class="subbtns" id="subbtn2" onclick="showNewClassesModal()" disabled>CLASS</button>
						<button class="subbtns" id="subbtn3" onclick="showNewAlignmentsModal()" disabled>ALIGNMENT</button>
						<button class="subbtns" id="subbtn4" onclick="showNewAbilitiesModal()" disabled>ABILITIES</button>
						<button class="subbtns" id="subbtn5" onclick="showSkillsModal()" disabled>SKILLS</button>
						<button class="subbtns" id="subbtn6" onclick="showNewFeatsModal()" disabled>FEATS</button>
						<button class="subbtns" id="subbtn7" onclick="showNewAppearanceModal()" disabled>APPEARANCE</button>
						<button class="subbtns" id="subbtn8" onclick="showNewNameModal()" disabled>NAME</button>
					</div>
				</div>

				<div class="subscreen col2">
					<h6></h6>
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
						<div></div>
					</div>
					<button class="subbtns rightbtns">BIOGRAPHY</button>
					<button class="subbtns rightbtns">IMPORT</button>
				</div>

			</div> <!-- .mainscereen -->

			<div class="pagefooter">
				<div class="pagebuttons embossed">
					<a class="mainbtns" href="charsheet.php">Back</a>
					<a class="mainbtns redbtn" href="newchar.php">Start Over</a>

					<form action="charsheet.php">

						<input class="hidden" type="radio" name="campaign" value="" checked>
						<input class="hidden" type="radio" name="game" value="dd" checked>
						<input class="hidden" type="radio" name="startlevel" value="1" checked>
						<input class="hidden" type="radio" name="currxp" value="0" checked>

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

		<div id="newcharmodal" class="modal persp3d centerxy hidden">

			<!-- ******* Gender Section ******* -->

			<div class="mainbox newcharbox hidden" id="newchargender">

				<div class="pagetitle">
					<div class="sideimgbox">
						<img class="sideimg" src="../images/dd-logo.png" height="30px">
					</div>
					<div class="titlebox embossed">
				    <h2>Gender</h2>
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
						<button class="mainbtns bluebtn" id="nxtbtn1" onclick="showNewRacesModal()" disabled>Next</button>
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
				    <h2>Race</h2>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen listcol embossed">
						<div class="listtitle bluebtn golden" onclick="raceDefaultDesc()">Races</div>
						<div class="itemlist">
							<?php
								for ($rc = 1; $rc <= count($ddRules->races); $rc++) {
									if ($ddRules->races[$rc]['race'] != null) {
										echo "<label class=\"listitem racelist\" id=\"raceitem" . $rc . "\" onclick=\"setNewRace(" . $rc . ", '" . $ddRules->races[$rc]['race'] . "', 2)\">" . $ddRules->races[$rc]['race'] . "</label>";
									}
								}
							?>
						</div>
					</div>

					<div class="subscreen desccol" id="racecol">
						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/webelements/banners/races/dddefault.png'), url('../images/webelements/banners/campaigns/default.jpg')">
								<span class="bannertitle">Races in the World</span>
							</div>
						</div>
						<div class="descbox">
							<p>The elven woods are home to the elves and their allies. Not many dwarves or half-orcs live there. In turn, elves, humans, halflings, and half-orcs are hard to find in underground dwarven cities. And while nonhumans may travel through the human countryside, most country folk are humans. In the big cities, however, the promise of power and profit brings together people of all the common races: humans, dwarves, elves, gnomes, half-elves, half-orcs, and halflings. </p>
							<p>You can play a character of any race and class combination, but certain races do better pursuing certain careers. Halflings, for example, can be fighters, but their small size and special features make them better as rogues.</p>
						</div>
					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn2" onclick="showNewClassesModal()" disabled>Next</button>
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
				    <h2>Class</h2>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen listcol embossed">
						<div class="listtitle bluebtn golden" onclick="classDefaultDesc()">Classes</div>
						<div class="itemlist">
							<?php
								for ($rc = 1; $rc <= count($ddRules->classes); $rc++) {
									if ($ddRules->classes[$rc]['class'] != null) {
										echo "<label class=\"listitem classlist\" id=\"classitem" . $rc . "\" onclick=\"setNewClass(" . $rc . ", '" . $ddRules->classes[$rc]['class'] . "', 3)\">" . $ddRules->classes[$rc]['class'] . "</label>";
									}
								}
							?>
						</div>
					</div>

					<div class="subscreen desccol" id="classcol">
						<div class="banner">
							<div class="bannerbox" style="background-image: url('../images/webelements/banners/classes/dddefault.png'), url('../images/webelements/backgrounds/background-map.jpg')">
								<span class="bannertitle">About Classes</span>
							</div>
						</div>
						<div class="descbox">
							<p>Adventurers seek gold, glory, justice, fame, power, knowledge, or maybe some other goals&#8212;perhaps noble or perhaps base. Each chooses a different way to attain those goals, from brutal combat power, to mighty magic, to subtle skills. Some adventurers prevail and grow in experience, wealth, and power. Others die.</p>
							<p>Your character&#39;s class is his or her profession or vocation. It determines what he or she is able to do: combat prowess, magical ability, skills, and more. Class is probably the first choice you make about your character&#8212;just ahead of race, or perhaps in conjunction with that decision. The class you choose determines where you should best place your character&#39;s ability scores and suggests which races are best to support that class choice.</p>
						</div>
					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn3" onclick="showNewAlignmentsModal()" disabled>Next</button>
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
				    <h2>Alignment</h2>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen listcol algcol embossed">
						<?php
							for ($rc = 1; $rc <= count($ddRules->alignments); $rc++) {
								if ($ddRules->alignments[$rc]['alignment'] != null) {
									echo "<button class=\"subbtns algbtn\" id=\"listalignment" . $rc . "\" onclick=\"setAlignment(" . $rc . ", '" . $ddRules->alignments[$rc]['alignment'] . "', 4)\">" . $ddRules->alignments[$rc]['alignment'] . "</button>";
								}
							}
						?>
					</div>

					<div class="subscreen desccol" id="alignmentcol">
						<div class="banner">
							<div class="bannerbox" style="background-image: none, url('../images/webelements/banners/campaigns/default.jpg')">
								<span class="bannertitle">The Nine Alignments</span>
							</div>
						</div>
						<div class="descbox">
							<p>Nine distinct alignments define all the possible combinations of the lawful–chaotic axis with the good–evil axis. Each alignment description below depicts a typical character of that alignment. Remember that individuals vary from this norm, and that a given character may act more or less in accord with his or her alignment from day to day. Use these descriptions as guidelines, not as scripts.<br>
								<br>
								The first six alignments, lawful good through chaotic neutral, are the standard alignments for player characters. The three evil alignments are for monsters and villains.</p>
						</div>
					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn4" onclick="showNewAbilitiesModal()" disabled>Next</button>
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
				    <h2>Abilities</h2>
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
								echo "	<span class=\"rollbox centerxy embossed\" id=\"race" . $ddRules->abilities[$rll]['ability'] . "\"></span>";
								echo "	<span> = </span>";
								echo "	<span class=\"rollbox centerxy embossed golden\" id=\"tot" . $rll . "\"></span>";
								echo "	<span class=\"rollbox centerxy embossed golden\" id=\"mod" . $rll . "\"></span>";
								echo "</div>";
							}
							echo "</div>";
							?>
						</div>
						<button class="subbtns" id="rollthedice" style="flex-grow: 0" onclick="rollAbilities()"><div class="rollbtn"></div></button>
					</div>

					<div class="subscreen desccol abilitiescol" id="abilities0">

						<div class="banner">
							<div class="bannerbox abilbanner" style="background-image: none, url('../images/webelements/banners/abilityrolls.jpg')">
								<span class="bannertitle">Ability Rolls</span>
							</div>
						</div>

						<div class="descbox">
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
						<button class="mainbtns bluebtn" id="nxtbtn5" onclick="showSkillsModal()" disabled>Next</button>
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
				    <h2>Skills</h2>
					</div>
				</div>

				<div class="mainscreen">

					<div class="skillscreen embossed">
						<div class="listtitle bluebtn golden" onclick="skillDefaultDesc()">Skills</div>
						<div class="skilllist">
							<?php
								for ($i = 1; $i <= count($ddRules->skills); $i++) {
									echo "<div class=\"skillrow\" id=\"skillrow" . $i . "\" onclick=\"showSkillDesc(" . $i . ")\">";
									echo "	<div class=\"skillname skill" . $i . "\">" . $ddRules->skills[$i]['skill'] . "</div>";
									echo "	<div class=\"statsholder\">";
									echo "		<label class=\"skillkey skill" . $i . "\">";
									for ($y = 1; $y <= count($ddRules->abilities); $y++) {
										if ($ddRules->abilities[$y]['ability'] == $ddRules->skills[$i]['ability']) {
											echo $ddRules->abilities[$y]['shtname'];
										}
									}
									echo "		</label>";
									echo "		<div class=\"skillstat skilltotals centerxy embossed\" id=\"skilltot" . $i . "\" style=\"background-color: rgba(255, 255, 255, 0.2)\"></div>";
									echo "		<span>=</span>";
									echo "		<div class=\"skillstat centerxy embossed\" id=\"skillmod" . $i . "\"></div>";
									echo "		<span>+</span>";
									echo "		<div class=\"skillstat skillranks centerxy embossed\" id=\"skillrank" . $i . "\" style=\"background-color: rgba(100, 149, 237, 0.2)\">0</div>";
									echo "		<div class=\"hidden\" id=\"skillpts" . $i . "\"></div>";
									echo "		<span>+</span>";
									echo "		<div class=\"skillstat centerxy embossed\" id=\"skillother" . $i . "\"></div>";
									echo "	</div>";
									echo "</div>";
								}
							?>
						</div>
						<div class="skillbar bluebtn">Available Skill Points: <span class="skillstat centerxy embossed" id="avskillpts"></span></div>
					</div>

					<div class="subscreen desccol" id="skillscol">

						<div class="banner">
							<div class="bannerbox" style="background-image: none, url('../images/webelements/banners/abilityrolls.jpg')">
								<span class="bannertitle">Skills</span>
							</div>
						</div>

						<div class="descbox">
							<p>Lidda the rogue can walk quietly up to a door, put her ear to it, and hear the troglodyte priest on the other side casting a spell on his pet crocodile. If Jozan the cleric were to try the same thing, he’d probably make so much noise that the troglodyte would hear him. Jozan could, however, identify the spell that the evil priest is casting. Actions such as these rely on the skills that characters have (in this case, Move Silently, Listen, and Spellcraft).</p>
						</div>

						<div class="modranks hidden" id="modranks">
							<span class="roman" style="font-size: 2.5em">Ranks</span>
							<div id="skillbtns">
								<button class="modrankbtn tiled" style="background-image: url('../images/webelements/buttons/btn_arrowup.png'), url('../images/wood-bck.jpg')"></button>
								<div class="embossed roman" id="skilldescrank">0</div>
								<button class="modrankbtn tiled" style="background-image: url('../images/webelements/buttons/btn_arrowdown.png'), url('../images/wood-bck.jpg')"></button>
							</div>
						</div>

					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn6" onclick="showNewFeatsModal()" disabled>Next</button>
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
				    <h2>Feats</h2>
					</div>
				</div>

				<div class="mainscreen">

					<div class="subscreen listcol embossed">
					</div>

					<div class="subscreen desccol" id="featscol">

						<div class="banner">
							<div class="bannerbox" style="background-image: none, url('../images/webelements/banners/abilityrolls.jpg')">
								<span class="bannertitle">Feats</span>
							</div>
						</div>

						<div class="descbox">
							<p>A feat is a special feature that either gives your character a new capability or improves one that he or she already has.<br>For example, Lidda (a halfling rogue) chooses to start with the Improved Initiative feat at 1st level. That feat gives her a +4 bonus on her initiative checks. At 3rd level (and every 3rd level), she gains a new feat and chooses Dodge. This feat allows her to avoid the attacks of an opponent she selects by improving her Armor Class against that opponent.<br>Unlike a skill, a feat has no ranks. A character either has a feat or does not.</p>
						</div>

					</div>

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn7" onclick="showNewAppearanceModal()" disabled>Next</button>
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
				    <h2>Appearance</h2>
					</div>
				</div>

				<div class="mainscreen">

				</div> <!-- .mainscereen -->

				<div class="pagefooter">
					<div class="pagebuttons embossed">
						<button class="mainbtns bluebtn" onclick="closeModal()">Back</button>
						<button class="mainbtns bluebtn" id="nxtbtn8" onclick="showNewNameModal()" disabled>Next</button>
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
				    <h2>Name</h2>
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
		<script src="../scripts/charobjclass.js"></script>
		<script src="../scripts/newchar.js"></script>
		<script src="../scripts/levelup.js"></script>

	</body>

</html>
