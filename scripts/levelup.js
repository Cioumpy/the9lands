// Character JavaScript Objects == The Nine Lands Website
/*
    It uses some functions from the main.js (and possibly other .js sheets) as following:

    # showIdAmongClasses() - in main.js
    # setInputValue() - in main.js
    # callFunction() - in main.js
    # Character() object class - in charobjclass.js
    # Level() object class - in charobjclass.js
*/



// ========================================================================== //
// New Level Variables		    																								//
// ========================================================================== //
/*  */

var myCharacter = window[myCharString];
var newLvl = new Level();



// ========================================================================== //
// Drag & Drop Functions Set																									//
// ========================================================================== //
/* These functions control the behaviour of the Drag & Drop elements. */

/*
*/
var dragSrcEl = null; // Initialising the Draggable Source Element.

function handleDragStart(e) {
  // Target (this) element is the source node.
  this.style.opacity = '0.4';

  dragSrcEl = this;

  e.dataTransfer.effectAllowed = 'move';
  e.dataTransfer.setData('text/html', this.innerHTML);
}

function handleDragOver(e) {
  if (e.preventDefault) {
    e.preventDefault(); // Necessary. Allows us to drop.
  }

  e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.

  return false;
}

function handleDragEnter(e) {
  // this / e.target is the current hover target.
  this.classList.add('over');
}

function handleDragLeave(e) {
  this.classList.remove('over');  // this / e.target is previous target element.
}

function handleDrop(e) {
  // this/e.target is current target element.

  if (e.stopPropagation) {
    e.stopPropagation(); // Stops some browsers from redirecting.
  }

  // Don't do anything if dropping the same tile we're dragging.
  if (dragSrcEl != this) {
    // Set the source tile's HTML to the HTML of the tile we dropped on.
    dragSrcEl.innerHTML = this.innerHTML;
    this.innerHTML = e.dataTransfer.getData('text/html');
  }

  return false;
}

function handleDragEnd(e) {
  // this/e.target is the source node.

  [].forEach.call(tiles, function (tile) {
    tile.classList.remove('over');
		tile.removeAttribute('style');
  });

	setAbilTotals();
}

var tiles = document.querySelectorAll('#rolltilediv .rolltile');
[].forEach.call(tiles, function(tile) {
  tile.addEventListener('dragstart', handleDragStart);
	tile.addEventListener('dragenter', handleDragEnter);
  tile.addEventListener('dragover', handleDragOver);
  tile.addEventListener('dragleave', handleDragLeave);
	tile.addEventListener('drop', handleDrop);
  tile.addEventListener('dragend', handleDragEnd);
});



// ========================================================================== //
// AJAX Functions Set																													//
// ========================================================================== //
/*  */

/* Shows inside the description box the description of the items in the list */
function showDesc(descFunction, id) {
  var xhttp;
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
			var myObj = JSON.parse(this.responseText);
      descFunction(myObj, id);
    }
  };
  xhttp.open("GET", "../scripts/ddrulesJSON.php", true);
  xhttp.send();
}



// ========================================================================== //
// Requisites Functions																												//
// ========================================================================== //
/*  */

function checkAbility(myChar, myParam) {
	myArray = myParam.split("=");
	var gotAbility = false;
	var abScore = myChar.get_Ability(myArray[0]);
	if (newLvl != undefined) {
		abScore += newLvl.get_Ability(myArray[0]);
	}
	if (abScore >=  Number(myArray[1])) {
		gotAbility = true;
	}
	return gotAbility;
}

function checkBAB(myChar, bab) {
  let gotBAB = false;
  let babScore = myChar.get_BAB();
  if (newLvl != undefined) {
		babScore += newLvl.get_BAB();
	}
  if (babScore >= Number(bab)) {
		gotBAB = true;
	}
	return gotBAB;
}

function checkFeat(myChar, feat) {
	var gotFeat = false;
  let myFeatList = myChar.get_Feats();
	if (myFeatList.length > 0) {
		for (var i = 0; i < myFeatList.length; i++) {
			if (feat == myFeatList[i]) {
				gotFeat = true;
				break;
			}
		}
	}
	return gotFeat;
}

function checkProficiencies(myChar, feat) {
	var gotFeat = false;
  let myProfList = myChar.get_Proficiencies();
	if (myProfList.length > 0) {
		for (var i = 0; i < myProfList.length; i++) {
			if (feat == myProfList[i]) {
				gotFeat = true;
				break;
			}
		}
	}
	return gotFeat;
}

function isFeatTaken(feat) {
  return checkProficiencies(myCharacter, feat) ||
         checkProficiencies(newLvl, feat) ||
         checkFeat(myCharacter, feat);
}

function isFeatJustTaken(feat) {
  return checkFeat(newLvl, feat);
}

function isFeatAvailable(myFeat) {
	var available = true;
	if (myFeat.requisites[0] != "") {
		for (var i = 0; i < myFeat.requisites.length; i++) {
			if (i % 2 == 0) {
				if (!callBoolFunc(myFeat.requisites[i], myFeat.requisites[i + 1])) {
					available = false;
					break;
				}
			}
		}
	}
	return available;
}

// This function's name is stored in the DataBase.
// DO NOT CALL THIS FUNCTION outside "callFunction()"!!!
function reqAbility(ability) {
	return checkAbility(myCharacter, ability);
}

// This function's name is stored in the DataBase.
// DO NOT CALL THIS FUNCTION outside "callFunction()"!!!
function reqBAB(bab) {
	return checkBAB(myCharacter, bab);
}

// This function's name is stored in the DataBase.
// DO NOT CALL THIS FUNCTION outside "callFunction()"!!!
function reqFeat(feat) {
	return checkFeat(myCharacter, feat) ||
         checkFeat(newLvl, feat) ||
         checkProficiencies(myCharacter, feat) ||
         checkProficiencies(newLvl, feat);
}



// ========================================================================== //
// Classes Functions Set																											//
// ========================================================================== //
/*  */

function classDefaultDesc() {
	var section = document.getElementById('classcol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "url('../images/webelements/banners/classes/dddefault.png'), url('../images/webelements/backgrounds/background-map.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">About Classes</span>";

	var descTxt = "<p>Adventurers seek gold, glory, justice, fame, power, knowledge, or maybe some other goals&#8212;perhaps noble or perhaps base. Each chooses a different way to attain those goals, from brutal combat power, to mighty magic, to subtle skills. Some adventurers prevail and grow in experience, wealth, and power. Others die.</p>";
	descTxt += "<p>Your character&#39;s class is his or her profession or vocation. It determines what he or she is able to do: combat prowess, magical ability, skills, and more. Class is probably the first choice you make about your character&#8212;just ahead of race, or perhaps in conjunction with that decision. The class you choose determines where you should best place your character&#39;s ability scores and suggests which races are best to support that class choice.</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function classDesc(rulesObj, id) {
  var section = document.getElementById('classcol');
	var myClass = rulesObj.classes[id];
	var myDesc = rulesObj.classesdesc[id];

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "url('../images/webelements/banners/classes/" + myDesc.image + "'), url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">" + myClass.class + "</span>";

	var descTxt = "";
	descTxt += "<p>" + myDesc.intro + "</p>";
	descTxt += "<p>" + myDesc.Characteristics + "</p>";
	descTxt += "<p><b>Hit Die:</b> d" + myClass.hd + ".</p>";
	descTxt += "<p><span class=\"partitle\">Class Skills</span><br>";
	descTxt += "The " + myClass.class + "&#39;s class skills (and the key ability for each skill) are ";

	var lastSkill, skillKeys, key;
	skillKeys = Object.keys(rulesObj.skills);

	// To add an "and" before the last item, we need to know its id
	for (var i = 0; i < skillKeys.length; i++) {
		key = skillKeys[i];
		if (myClass.classskills[key].classskill == 1) {
			lastSkill = key;
		}
	}

	// Checking if each skill is a class skill and, if yes, listing it
	var x = 0;
	var craft = perf = prof = true;
	for (var i = 0; i < skillKeys.length; i++) {
		key = skillKeys[i];
		if (myClass.classskills[key].classskill == 1) {
			x++;
			if (rulesObj.skills[key].skill.search("Craft") == 0) { // Group all Craft skills
				if (craft) {
					if (x > 1) {
						if (key == lastSkill) {
							descTxt += " and ";
						} else {
							descTxt += ", ";
						}
					}
					descTxt += "Craft";
					for (var y = 0; y < Object.keys(rulesObj.abilities).length; y++) {
						if (rulesObj.abilities[y + 1].ability == rulesObj.skills[key].ability) {
							descTxt += " (" + rulesObj.abilities[y + 1].shtname + ")";
						}
					}
					craft = false;
				}
			} else if (rulesObj.skills[key].skill.search("Perform") == 0) { // Group all Perform skills
				if (perf) {
					if (x > 1) {
						if (key == lastSkill) {
							descTxt += " and ";
						} else {
							descTxt += ", ";
						}
					}
					descTxt += "Perform";
					for (var y = 0; y < Object.keys(rulesObj.abilities).length; y++) {
						if (rulesObj.abilities[y + 1].ability == rulesObj.skills[key].ability) {
							descTxt += " (" + rulesObj.abilities[y + 1].shtname + ")";
						}
					}
					perf = false;
				}
			} else if (rulesObj.skills[key].skill.search("Profession") == 0) { // Group all Profession skills
				if (prof) {
					if (x > 1) {
						if (key == lastSkill) {
							descTxt += " and ";
						} else {
							descTxt += ", ";
						}
					}
					descTxt += "Profession";
					for (var y = 0; y < Object.keys(rulesObj.abilities).length; y++) {
						if (rulesObj.abilities[y + 1].ability == rulesObj.skills[key].ability) {
							descTxt += " (" + rulesObj.abilities[y + 1].shtname + ")";
						}
					}
					prof = false;
				}
			} else { // List other skills normally
				if (x > 1) {
					if (key == lastSkill) {
						descTxt += " and ";
					} else {
						descTxt += ", ";
					}
				}
				descTxt += myClass.classskills[key].skill;
				for (var y = 0; y < Object.keys(rulesObj.abilities).length; y++) {
					if (rulesObj.abilities[y + 1].ability == rulesObj.skills[key].ability) {
						descTxt += " (" + rulesObj.abilities[y + 1].shtname + ")";
					}
				}
			}
		}
	}
	descTxt += ".";

	descTxt += "<br><b>Skill Points per level:</b> " + myClass.skillpoints + " + Intelligence modifier.<br>";
	descTxt += "<b>At first level:</b> (" + myClass.skillpoints + " + Intelligence modifier) &times; 4.</p>";

	// Creating a table with the Class stats for each level
	descTxt += "<br><label><b>" + myClass.class + "&#39;s Stats Table:</b></label>";
	descTxt += "<table>";

	// Defining all the columns titles for this table
	descTxt += "<tr>";
	descTxt += "<th class=\"cellcenter\">Level</th>";
	descTxt += "<th class=\"cellcenter\">BAB</th>";
	descTxt += "<th class=\"cellcenter\">Fort</th>";
	descTxt += "<th class=\"cellcenter\">Refl</th>";
	descTxt += "<th class=\"cellcenter\">Will</th>";
	descTxt += "<th>Class Features</th>";
	descTxt += "</tr>";

	// Showing the variables for every row (level)
	for (var i = 1; i <= myClass.maxlvl; i++) {
		descTxt += "<tr>"; // Opening the table row

		// Level
		descTxt += "<th class=\"cellcenter\">" + i + "</th>";

		// Base Attack Bonus
		descTxt += "<td>+" +  Math.floor(i * myClass.bab);
		if (i * myClass.bab >= 6) {
			descTxt += " / +" + (Math.floor(i * myClass.bab) - 5);
		}
		if (i * myClass.bab >= 11) {
			descTxt += " / +" + (Math.floor(i * myClass.bab) - 10);
		}
		if (i * myClass.bab >= 16) {
			descTxt += " / +" + (Math.floor(i * myClass.bab) - 15);
		}
		descTxt += "</td>";

		// Fortitude Saving Throw
		descTxt += "<td class=\"cellcenter\">+";
		if (myClass.fort == 'good') {
			descTxt += Math.floor(i / 2 + 2);
		} else {
			descTxt += Math.floor(i / 3);
		}
		descTxt += "</td>";

		// Reflexes Saving Throw
		descTxt += "<td class=\"cellcenter\">+";
		if (myClass.refl == 'good') {
			descTxt += Math.floor(i / 2 + 2);
		} else {
			descTxt += Math.floor(i / 3);
		}
		descTxt += "</td>";

		// Will Saving Throw
		descTxt += "<td class=\"cellcenter\">+";
		if (myClass.will == 'good') {
			descTxt += Math.floor(i / 2 + 2);
		} else {
			descTxt += Math.floor(i / 3);
		}
		descTxt += "</td>";

		// Class Features
		descTxt += "<td></td>";

		descTxt += "</tr>"; // Closing the table row
	}
	descTxt += "</table>"; // Closing the table

	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function setNewClass(myId, classValue, stepNum) {
  newLvl.set_Level(myCharacter.get_Level() + 1);
  newLvl.set_FeatPoints();
	newLvl.set_Class(myId); 	// newLvl.class.class goes to <form>

	highlightListItem('classitem' + myId, 'classlist');
	showDesc(classDesc, myId);
	nxtStepReady(stepNum);

// To be moved into the createCharacter() function
	setInputValue('class', newLvl.class.class);
}

function showNewClassesModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'race', 'class', 'box', 'newchar');
}



// ========================================================================== //
// Abilities Functions Set																										//
// ========================================================================== //
/*  */

function setAbilTotals() {
	var newAbilities = gameRules.abilities;
	for (var i = 1; i <= Object.keys(newAbilities).length; i++) {
		newAbilities[i].roll = Number(document.getElementById('roll' + i).innerHTML);
		var thisTotal = document.getElementById('tot' + i);
		var thisModifier = document.getElementById('mod' + i);

		var tempTot = Number(myCharacter.race[gameRules.abilities[i].ability]) + newAbilities[i].roll;
		newAbilities[i].score = tempTot;
		var tempMod = Math.floor((tempTot - 10) / 2);
		newAbilities[i].modifier = tempMod;

		thisTotal.innerHTML = tempTot;
		thisModifier.innerHTML = (tempMod > 0) ? "+" + tempMod : tempMod;

// To be moved into the createCharacter() function
// (uncomment the two lines under, when moving the code!)
// for (var i = 1; i <= newLvl.abilities.length; i++) {
		setInputValue(gameRules['abilities'][i].ability, newAbilities[i].score); // newAbilities[i].score ==> newLvl.abilities[i].score
// }

	}
	newLvl.set_Abilities(newAbilities);

	nxtStepReady(5);
}

function rollAbilities() {
	var allRolls = document.getElementsByClassName('rolltile');
	var maxScr = 0;
	var totMod = 0;
	while (maxScr <= 13 || totMod <= 1) {
		for (var scr = 1; scr <= allRolls.length; scr++) {
			var abScr = document.getElementById('roll' + scr);
			var dieScr = 0;
			var dieMin = 6;
			for (var rll = 1; rll <= 4; rll++) {
        var thisRoll = rolld(6);
				dieScr = dieScr + thisRoll;
				if (thisRoll < dieMin) {
					dieMin = thisRoll;
				}
			}
			dieScr = dieScr - dieMin;
			if (dieScr > maxScr) {
				maxScr = dieScr;
			}
			totMod = totMod + Math.floor((dieScr - 10) / 2);
			abScr.innerHTML = dieScr;
		}
	}
	setAbilTotals();
}

function showNewAbilitiesModal() {
	// Fill up racial abilities column
	for (var i = 1; i <= 6; i++) {
		document.getElementById('race' + gameRules.abilities[i].ability).innerHTML =
		myCharacter.race[gameRules.abilities[i].ability];
	}

	// Fill up totals columns with corresponding values, if rolls are present
	if (document.getElementById('roll1').innerHTML != "") {
		setAbilTotals();
	}

	// Show the Abilities Selection <div>
	openToPage('newcharmodal', 'alignment', 'abilities', 'box', 'newchar');
}



// ========================================================================== //
// Skills Functions Set																												//
// ========================================================================== //
/*  */

function skillDefaultDesc() {
	var section = document.getElementById('skillscol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/abilityrolls.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">Skills</span>";

	var descTxt = "<p>Lidda the rogue can walk quietly up to a door, put her ear to it, and hear the troglodyte priest on the other side casting a spell on his pet crocodile. If Jozan the cleric were to try the same thing, he’d probably make so much noise that the troglodyte would hear him. Jozan could, however, identify the spell that the evil priest is casting. Actions such as these rely on the skills that characters have (in this case, Move Silently, Listen, and Spellcraft).</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;

	var ranksDiv = document.getElementById('modranks');
	if (!ranksDiv.classList.contains("hidden")) {
		ranksDiv.classList.add("hidden");
	}
}

function skillDesc(rulesObj, id) {
  var section = document.getElementById('skillscol');
	var mySkill = rulesObj.skills[id];
	var myDesc = rulesObj.skillsdesc[id];

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/abilityrolls.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">" + mySkill.skill + "</span>";

	var descTxt = "<p>" + myDesc.intro + "</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;

	var ranksDiv = document.getElementById('modranks');
	if (ranksDiv.classList.contains("hidden")) {
		ranksDiv.classList.remove("hidden");
	}
	document.getElementById('skilldescrank').innerHTML = newLvl.skills[id].ranks;
	var rankBtns = document.getElementsByClassName('modrankbtn');
  rankBtns[0].setAttribute("onclick", "modSkillRanks(" + id + ", 1)");
	rankBtns[1].setAttribute("onclick", "modSkillRanks(" + id + ", 0)");
}

function showSkillDesc(skId) {
	highlightListItem('skillrow' + skId, 'skillrow');
	showDesc(skillDesc, skId);
	// showIdAmongClasses(skId, 'col', 'skills');
}

function setSkillPoints() {
	var pointsSum = 0;
	for (var sk = 1; sk <= Object.keys(gameRules.skills).length; sk++) {
		pointsSum += Number(newLvl.skills[sk].points);
	}
  let avSkPts = 0;
  avSkPts += Number(newLvl.class.skillpoints);
  avSkPts += Number(myCharacter.race.skillpoints);
  avSkPts += Math.floor((myCharacter.get_Ability("intelligence") + newLvl.get_Ability("intelligence") - 10) / 2);
  if (newLvl.level == 1) { avSkPts *= 4; }
  avSkPts -= pointsSum;
	document.getElementById('avskillpts').innerHTML = avSkPts;
}

function setSkillTotals() {
	for (var sk = 1; sk <= Object.keys(gameRules.skills).length; sk++) {
		var skillTotal = document.getElementById('skilltot' + sk);
		var skillMod = Number(document.getElementById('skillmod' + sk).innerHTML);
		var skillRanks = Number(document.getElementById('skillrank' + sk).innerHTML);
		var skillBonus = Number(myCharacter.race.skillbonus[sk].bonus);

		if (gameRules.skills[sk].untrained == 0 && newLvl.skills[sk].ranks == 0) {
			skillTotal.innerHTML = "";
		} else {
			skillTotal.innerHTML = skillMod + skillRanks + skillBonus;
		}
	}
}

function modSkillRanks(skId, plusOrMinus) {

	var avSkPts = Number(document.getElementById('avskillpts').innerHTML);

	var maxRanks = Number(newLvl.level) + 3;
	if (newLvl.class.classskills[skId].classskill == 0) {
		maxRanks = maxRanks / 2;
	}

	if (plusOrMinus) {
		if (Number(newLvl.skills[skId].ranks) < maxRanks && avSkPts > 0) {
			newLvl.skills[skId].points++;
		}
	} else {
		if (newLvl.skills[skId].points > 0) {
			newLvl.skills[skId].points--;
		}
	}

	if (newLvl.class.classskills[skId].classskill == 1) {
		newLvl.skills[skId].ranks = newLvl.skills[skId].points;
	} else {
		newLvl.skills[skId].ranks = newLvl.skills[skId].points / 2;
	}

	document.getElementById('skilldescrank').innerHTML = newLvl.skills[skId].ranks;		//	goes to <form>
	document.getElementById('skillrank' + skId).innerHTML = Math.floor(newLvl.skills[skId].ranks);
	setSkillTotals();
	setSkillPoints();

	avSkPts = Number(document.getElementById('avskillpts').innerHTML);
	if (avSkPts == 0) {
		nxtStepReady(6);
	} else {
		nxtStepUnready(6);
	}
}

function showSkillsModal() {

	for (var sk = 1; sk <= Object.keys(gameRules.skills).length; sk++) {

		// Initialize the skill ranks
		var thisSkillRanks = document.getElementById('skillrank' + sk);
		thisSkillRanks.innerHTML = newLvl.skills[sk].ranks;

		// Assign the key ability modifiers for each skill
		var thisSkillMod = document.getElementById('skillmod' + sk);
		for (var i = 1; i <= Object.keys(newLvl.abilities).length; i++) {
			if (gameRules.skills[sk].ability == newLvl.abilities[i].ability) {
				thisSkillMod.innerHTML = Number(newLvl.abilities[i].modifier);
			}
		}

		// Assign the racial and size modifiers for each skill
		var thisSkillBonus = document.getElementById('skillother' + sk);
		if (gameRules.skills[sk].skill == "Hide") {
			thisSkillBonus.innerHTML = Number(myCharacter.race.skillbonus[sk].bonus) + Number(myCharacter.size.hide);
		} else {
			thisSkillBonus.innerHTML = Number(myCharacter.race.skillbonus[sk].bonus);
		}

		// Highlight the class skills with a golden color (see .classskill CSS rule)
		var thisSkillRow = document.getElementById('skillrow' + sk);
		if (thisSkillRow.classList.contains('classskill')) {
			thisSkillRow.classList.remove('classskill');
		}
		if (newLvl.class.classskills[sk].classskill == 1) {
			thisSkillRow.classList.add('classskill');
		}

	}

	setSkillTotals();
	setSkillPoints();

	// Show the Skills Selection <div>
	openToPage('newcharmodal', 'abilities', 'skills', 'box', 'newchar');

}



// ========================================================================== //
// Feats Functions Set																												//
// ========================================================================== //
/*  */

function showFeatList() {
  var featSection = document.getElementById('newcharfeats');
  var listColumn = featSection.getElementsByClassName('listcol')[0];
  let availableFeats = newLvl.get_FeatPoints() - newLvl.feats.length;
  if (newLvl.level == 1) {
    availableFeats += Number(myCharacter.race.bonusfeats);
  }

  var listTxt = "<div class=\"listtitle bluebtn golden\" onclick=\"featDefaultDesc()\">Feats</div>";
  listTxt += "<div class=\"itemlist\">";
  for (var i = 0; i < Object.keys(gameRules.feats).length; i++) {
    var key = Object.keys(gameRules.feats)[i];
    if (isFeatTaken(gameRules.feats[key].feat)) {
      listTxt += "<div class=\"listitem featlist taken\" id=\"featitem" + key + "\">";
      listTxt += "<input type=\"checkbox\" id=\"racechk" + key + "\" checked disabled><label class=\"checkbox\"></label>";
    } else if (!isFeatAvailable(gameRules.feats[key])) {
      listTxt += "<div class=\"listitem featlist unavailable\" id=\"featitem" + key + "\">";
      listTxt += "<input type=\"checkbox\" id=\"racechk" + key + "\" disabled><label class=\"checkbox\"></label>";
    } else {
      listTxt += "<div class=\"listitem featlist\" id=\"featitem" + key + "\">";
      if (isFeatJustTaken(gameRules.feats[key].feat)) {
        listTxt += "<input type=\"checkbox\" id=\"racechk" + key + "\" checked><label class=\"checkbox\" onclick=\"toggleFeat(" + key + ")\"></label>";
      } else {
        listTxt += "<input type=\"checkbox\" id=\"racechk" + key + "\"><label class=\"checkbox\" onclick=\"toggleFeat(" + key + ")\"></label>";
      }
    }
    listTxt += "<span class=\"featname\" onclick=\"showFeatDesc(" + key + ")\">" + gameRules.feats[key].feat + "<span>";
    listTxt += "</div>";
  }
  listTxt += "</div>";
  listTxt += "<div class=\"skillbar bluebtn\">Available Feats: <span class=\"skillstat centerxy embossed\" id=\"avfeats\"></span></div>"

  listColumn.innerHTML = listTxt;
  document.getElementById('avfeats').innerHTML = availableFeats;
}

function toggleFeat(featId) {
  let availableFeats = newLvl.get_FeatPoints() - newLvl.feats.length;
  if (newLvl.level == 1) {
    availableFeats += Number(myCharacter.race.bonusfeats);
  }
  let thisFeat = document.getElementById('racechk' + featId);

  if (checkFeat(newLvl, gameRules.feats[featId].feat)) {
    newLvl.removeFeat(gameRules.feats[featId].feat);
  } else {
    if (availableFeats > 0) {
      newLvl.addFeat(gameRules.feats[featId].feat);
    }
  }

  console.log(newLvl.feats);
  showFeatList();
}

function featDefaultDesc() {
	var section = document.getElementById('featscol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/abilityrolls.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">Feats</span>";

	var descTxt = "<p>A feat is a special feature that either gives your character a new capability or improves one that he or she already has.<br>For example, Lidda (a halfling rogue) chooses to start with the Improved Initiative feat at 1st level. That feat gives her a +4 bonus on her initiative checks. At 3rd level (and every 3rd level), she gains a new feat and chooses Dodge. This feat allows her to avoid the attacks of an opponent she selects by improving her Armor Class against that opponent.<br>Unlike a skill, a feat has no ranks. A character either has a feat or does not.</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function featDesc(rulesObj, id) {
  var section = document.getElementById('featscol');
	var myFeat = rulesObj.feats[id];

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/abilityrolls.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">" + myFeat.feat + "</span>";

	var descTxt = "<p>";
  for (var i = 0; i < myFeat.desc.length; i++) {
    if (i % 2 == 0) {
      descTxt += myFeat.desc[i] + "</p>";
    } else {
      descTxt += "<p><strong class=\"partitle\">" + myFeat.desc[i] + ":</strong><br>";
    }
  }
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function showFeatDesc(ftId) {
  showDesc(featDesc, ftId);
	// showIdAmongClasses(ftId, 'col', 'feats');
	highlightListItem('featitem' + ftId, 'featlist');
}

function setNewFeats() {
	var featBanner = document.getElementById('featbanner');
//	featBanner.style.backgroundImage = "url('../images/webelements/banners/races/dddefault.png'), url('../images/webelements/banners/campaigns/default.jpg')";

}

function showNewFeatsModal() {

	setNewFeats();

	// Show the Alignments Selection <div>
  showFeatList();
	openToPage('newcharmodal', 'skills', 'feats', 'box', 'newchar');
}
