// New Character JavaScript == The Nine Lands Website
/*	It controls the behaviour of the interactive objects in the newchar.php page and its children.
		It uses some functions from the main.js (and possibly other .js sheets) as following:

		# showIdAmongClasses() - in main.js
		# setInputValue() - in main.js
    # callFunction() - in main.js
		# Character() object class - in charobjclass.js
		# Level() object class - in charobjclass.js
*/



// ========================================================================== //
// New Character Variables																										//
// ========================================================================== //
/*  */

var newCharacter = new Character();
var currLvl = new Level();
var myCharacter = "newCharacter";



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
// Page Transition Functions Set																							//
// ========================================================================== //
/* These functions control the turning from a page to another of the New
 	 Character Creation modals */

function nxtStepReady(step) {
	var mySideBtn = document.getElementById('subbtn' + step);
	var myNxtBtn = document.getElementById('nxtbtn' + step);
	mySideBtn.disabled = false;
	myNxtBtn.disabled = false;
}

function nxtStepUnready(step) {
	var mySideBtn = document.getElementById('subbtn' + step);
	var myNxtBtn = document.getElementById('nxtbtn' + step);
	mySideBtn.disabled = true;
	myNxtBtn.disabled = true;
}

function turnPage(oldId, newId, pageClass, pagePrefix) {
	var oldPage = document.getElementById(pagePrefix + oldId);
	oldPage.classList.add('closing');
	setTimeout(function() {
		showIdAmongClasses(newId, pageClass, pagePrefix);
		oldPage.classList.remove('closing');
	}, 500);
}

function openToPage(myModal, myOldId, myNewId, myClass, myPrefix) {
	if (activeModal != null && activeModal.id == myModal) {
		turnPage(myOldId, myNewId, myClass, myPrefix);
	} else {
		if (activeModal != null) {
			closeModal();
		}
		showModal(myModal, myNewId, myClass, myPrefix);
	}
}



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
// Campaigns Functions Set																										//
// ========================================================================== //
/*  */

function setGame(myGame) {
	var mySideImgs = document.getElementsByClassName('sideimg');
	for (var i = 0; i < mySideImgs.length; i++) {
		var myImg = mySideImgs[i];
		myImg.setAttribute('src', '../images/' + myGame + '-logo.png')
	}
	newCharacter.setCharGame(myGame); 			// goes to <form>

// To be moved into the createCharacter() function
	setInputValue('game', newCharacter.game);
}

function setStartLevel(myLvl) {
	newCharacter.setCharStartLvl(myLvl);	 	// goes to <form>
	var myXP = 0;
	for (var i = 0; i < myLvl; i++) {
		myXP += i;
	}
	newCharacter.setCurrXp(myXP * 1000);	 	// goes to <form>

// To be moved into the createCharacter() function
	setInputValue('startlevel', newCharacter.startlevel);
	setInputValue('currxp', newCharacter.currxp);
}

function setCampaign(invId, myId, myCamp, myGame, myLvl) {
// Set the campaign properties in the newCharacter object
	newCharacter.setCharCampaign(myCamp); 	// goes to <form>
	setGame(myGame);
	setStartLevel(myLvl);
	currLvl.setLevel(1);

	var diceBtn = document.getElementById('rollthedice');
	if (invitesList[invId] !== undefined && invitesList[invId].roll1 != null) {
		for (var rl = 1; rl <= 6; rl++) {
			var abScr = document.getElementById('roll' + rl);
			abScr.innerHTML = invitesList[invId]['roll' + rl];
		}
		if (!diceBtn.classList.contains("hidden")) {
			diceBtn.classList.add("hidden");
		}
	} else {
		for (var rl = 1; rl <= 6; rl++) {
			var abScr = document.getElementById('roll' + rl);
			abScr.innerHTML = "";
		}
		if (diceBtn.classList.contains("hidden")) {
			diceBtn.classList.remove("hidden");
		}
	}

	highlightListItem('campitem' + myId, 'camplist');
	showIdAmongClasses(myId, 'col', 'camp');

// To be moved into the createCharacter() function
	setInputValue('campaign', newCharacter.campaign);

}

function setCustomCamp() {  // Probably to delete (useless)
	showIdAmongClasses(0, 'col', 'camp');

	setInputValue('campaign', '');
}



// ========================================================================== //
// Gender Functions Set																												//
// ========================================================================== //
/*  */

function shineOnMe(myClass, myValue) {
	var gndImgs = document.getElementsByClassName(myClass);
	for (var i = 0; i < gndImgs.length; i++) {
		var myImg = gndImgs[i];
		if (myImg.classList.contains('brilliant')) {
			myImg.classList.remove('brilliant');
		}
	}
	var gndImg = document.getElementById('img' + myValue);
	gndImg.classList.add('brilliant')
}

function setGender(myGender, stepNum) {
	newCharacter.setCharGender(myGender); 	// goes to <form>

	nxtStepReady(stepNum);
	shineOnMe('genderbtn', newCharacter.gender);

// To be moved into the createCharacter() function
	setInputValue('gender', newCharacter.gender);
}



// ========================================================================== //
// Races Functions Set																												//
// ========================================================================== //
/*  */

function raceDefaultDesc() {
	var section = document.getElementById('racecol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "url('../images/webelements/banners/races/dddefault.png'), url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">Races in the World</span>";

	var descTxt = "<p>The elven woods are home to the elves and their allies. Not many dwarves or half-orcs live there. In turn, elves, humans, halflings, and half-orcs are hard to find in underground dwarven cities. And while nonhumans may travel through the human countryside, most country folk are humans. In the big cities, however, the promise of power and profit brings together people of all the common races: humans, dwarves, elves, gnomes, half-elves, half-orcs, and halflings. </p>";
	descTxt += "<p>You can play a character of any race and class combination, but certain races do better pursuing certain careers. Halflings, for example, can be fighters, but their small size and special features make them better as rogues.</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function raceDesc(rulesObj, id) {
  var section = document.getElementById('racecol');
	var myRace = rulesObj.races[id];
	var myDesc = rulesObj.racedescs[id];

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "url('../images/webelements/banners/races/" + myDesc.image + "'), url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">" + myRace.race + "</span>";

	var descTxt = "";
	descTxt += "<p>" + myDesc.intro + "</p>";
	descTxt += "<p>All the members of the " + myRace.race + " race share the following stats:</p>";
	descTxt += "<ul>";

	if (myDesc.abilitydesc != null) {
		descTxt += "<li><b>";
		var longlist = false;
		var abilKeys = Object.keys(rulesObj.abilities);
		for (var i = 0; i < abilKeys.length; i++) {
			if (myRace[rulesObj.abilities[abilKeys[i]].ability] != 0) {
				if (longlist) {
					descTxt += ", ";
				}
				descTxt += rulesObj.abilities[abilKeys[i]].name + " ";
				if (myRace[rulesObj.abilities[abilKeys[i]].ability] > 0) {
					descTxt += "+";
				}
				descTxt += myRace[rulesObj.abilities[abilKeys[i]].ability];
				if (!longlist) {
					longlist = true;
				}
			}
		}
		descTxt += ": </b>" + myDesc.abilitydesc + "</li>";
	}

	descTxt += "<li><b>Size: </b>" + myDesc.size + ".</li>";
	descTxt += "<li><b>Speed: </b>" + myDesc.speed + " ft.</li>";

	for (var i = 0; i < myDesc.othertraits.length; i++) {
		descTxt += "<li>" + myDesc.othertraits[i] + "</li>";
	}

	descTxt += "<li><b>Automatic Languages: </b>";
	for (var i = 0; i < myRace.autolangs.length; i++) {
		if (i > 0) {
			if (i == myRace.autolangs.length - 1) {
				descTxt += " and ";
			} else {
				descTxt += ", ";
			}
		}
		descTxt += myRace.autolangs[i]
	}
	descTxt += ".</li>";

	descTxt += "<li><b>Bonus Languages: </b>";
	for (var i = 0; i < myRace.bonuslangs.length; i++) {
		if (i > 0) {
			if (i == myRace.bonuslangs.length - 1) {
				descTxt += " and ";
			} else {
				descTxt += ", ";
			}
		}
		descTxt += myRace.bonuslangs[i]
	}
	descTxt += ".</li>";

	descTxt += "<li><b>Favored Class: </b>" + myRace.favclass + ".</li>";
	descTxt += "</ul>";

	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function setNewRace(myId, raceValue, stepNum) {
	newCharacter.setRace(myId); 	// newCharacter.race.race goes to <form>

	highlightListItem('raceitem' + myId, 'racelist');
	showDesc(raceDesc, myId);
	// showIdAmongClasses(myId, 'col', 'race');
	nxtStepReady(stepNum);

// To be moved into the createCharacter() AJAX function
	setInputValue('race', newCharacter.race.race);
}

function showNewRacesModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'gender', 'race', 'box', 'newchar');
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
	currLvl.setClass(myId); 	// currLvl.class.class goes to <form>
  for (var i = 0; i < gameRules.classes[myId].proficiencies.length; i++) {
    currLvl.addFeat(gameRules.classes[myId].proficiencies[i]);
  }

	highlightListItem('classitem' + myId, 'classlist');
	showDesc(classDesc, myId);
	// showIdAmongClasses(myId, 'col', 'class');
	nxtStepReady(stepNum);

// To be moved into the createCharacter() function
	setInputValue('class', currLvl.class.class);
}

function showNewClassesModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'race', 'class', 'box', 'newchar');
}



// ========================================================================== //
// Alignments Functions Set																										//
// ========================================================================== //
/*  */

function alignDefaultDesc() {
	var section = document.getElementById('alignmentcol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">The Nine Alignments</span>";

	var descTxt = "<p>Nine distinct alignments define all the possible combinations of the lawful–chaotic axis with the good–evil axis. Each alignment description below depicts a typical character of that alignment. Remember that individuals vary from this norm, and that a given character may act more or less in accord with his or her alignment from day to day. Use these descriptions as guidelines, not as scripts.<br>";
	descTxt += "<br>The first six alignments, lawful good through chaotic neutral, are the standard alignments for player characters. The three evil alignments are for monsters and villains.</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function alignDesc(rulesObj, id) {
  var section = document.getElementById('alignmentcol');
	var myAlignment = rulesObj.alignments[id];

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">" + myAlignment.alignment + "</span>";

	var descTxt = "<p><b>" + myAlignment.type + ":</b> " + myAlignment.desc + "</p>";

	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function setAlignment(myId, value, stepNum) {
	newCharacter.setCharAlignment(value);		// newCharacter.alignment goes to <form>

	highlightListItem('listalignment' + myId, 'subbtns');
	showDesc(alignDesc, myId);
	// showIdAmongClasses(myId, 'col', 'alignment');
	nxtStepReady(stepNum);

// To be moved into the createCharacter() function
	setInputValue('alignment', newCharacter.alignment);
}

function showNewAlignmentsModal() {
	// Enable the allowed alignments for the selected class
	for (var al = 1; al <= Object.keys(gameRules.alignments).length; al++) {
		var thisAlignBtn = document.getElementById('listalignment' + al);
		thisAlignBtn.disabled = true;
		if (currLvl.class.alignments[al].available == 1) {
			thisAlignBtn.disabled = false;
		}
	}

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'class', 'alignment', 'box', 'newchar');
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

		var tempTot = Number(newCharacter.race[gameRules.abilities[i].ability]) + newAbilities[i].roll;
		newAbilities[i].score = tempTot;
		var tempMod = Math.floor((tempTot - 10) / 2);
		newAbilities[i].modifier = tempMod;

		thisTotal.innerHTML = tempTot;
		thisModifier.innerHTML = (tempMod > 0) ? "+" + tempMod : tempMod;

// To be moved into the createCharacter() function
// (uncomment the two lines under, when moving the code!)
// for (var i = 1; i <= currLvl.abilities.length; i++) {
		setInputValue(gameRules['abilities'][i].ability, newAbilities[i].score); // newAbilities[i].score ==> currLvl.abilities[i].score
// }

	}
	currLvl.setAbilities(newAbilities);

	nxtStepReady(5);
}

function setNewAbilities() {
	var allRolls = document.getElementsByClassName('rolltile');
	var maxScr = 0;
	var totMod = 0;
	while (maxScr <= 13 || totMod <= 1) {
		for (var scr = 1; scr <= allRolls.length; scr++) {
			var abScr = document.getElementById('roll' + scr);
			var dieScr = 0;
			var dieMin = 6;
			for (var rll = 1; rll <= 4; rll++) {
				dieScr = dieScr + rolld(6);
				if (dieScr < dieMin) {
					dieMin = dieScr;
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
		newCharacter.race[gameRules.abilities[i].ability];
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
	document.getElementById('skilldescrank').innerHTML = currLvl.skills[id].ranks;
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
		pointsSum += Number(currLvl.skills[sk].points);
	}
	document.getElementById('avskillpts').innerHTML =
	(Number(currLvl.class.skillpoints) + Number(newCharacter.race.skillpoints) +
	Number(currLvl.abilities[4].modifier)) * 4 - pointsSum;
}

function setSkillTotals() {
	for (var sk = 1; sk <= Object.keys(gameRules.skills).length; sk++) {
		var skillTotal = document.getElementById('skilltot' + sk);
		var skillMod = Number(document.getElementById('skillmod' + sk).innerHTML);
		var skillRanks = Number(document.getElementById('skillrank' + sk).innerHTML);
		var skillBonus = Number(newCharacter.race.skillbonus[sk].bonus);

		if (gameRules.skills[sk].untrained == 0 && currLvl.skills[sk].ranks == 0) {
			skillTotal.innerHTML = "";
		} else {
			skillTotal.innerHTML = skillMod + skillRanks + skillBonus;
		}
	}
}

function modSkillRanks(skId, plusOrMinus) {

	var avSkPts = Number(document.getElementById('avskillpts').innerHTML);

	var maxRanks = Number(currLvl.level) + 3;
	if (currLvl.class.classskills[skId].classskill == 0) {
		maxRanks = maxRanks / 2;
	}

	if (plusOrMinus) {
		if (Number(currLvl.skills[skId].ranks) < maxRanks && avSkPts > 0) {
			currLvl.skills[skId].points++;
		}
	} else {
		if (currLvl.skills[skId].points > 0) {
			currLvl.skills[skId].points--;
		}
	}

	if (currLvl.class.classskills[skId].classskill == 1) {
		currLvl.skills[skId].ranks = currLvl.skills[skId].points;
	} else {
		currLvl.skills[skId].ranks = currLvl.skills[skId].points / 2;
	}

	document.getElementById('skilldescrank').innerHTML = currLvl.skills[skId].ranks;		//	goes to <form>
	document.getElementById('skillrank' + skId).innerHTML = Math.floor(currLvl.skills[skId].ranks);
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
		thisSkillRanks.innerHTML = currLvl.skills[sk].ranks;

		// Assign the key ability modifiers for each skill
		var thisSkillMod = document.getElementById('skillmod' + sk);
		for (var i = 1; i <= Object.keys(currLvl.abilities).length; i++) {
			if (gameRules.skills[sk].ability == currLvl.abilities[i].ability) {
				thisSkillMod.innerHTML = Number(currLvl.abilities[i].modifier);
			}
		}

		// Assign the racial and size modifiers for each skill
		var thisSkillBonus = document.getElementById('skillother' + sk);
		if (gameRules.skills[sk].skill == "Hide") {
			thisSkillBonus.innerHTML = Number(newCharacter.race.skillbonus[sk].bonus) + Number(newCharacter.size.hide);
		} else {
			thisSkillBonus.innerHTML = Number(newCharacter.race.skillbonus[sk].bonus);
		}

		// Highlight the class skills with a golden color (see .classskill CSS rule)
		var thisSkillRow = document.getElementById('skillrow' + sk);
		if (thisSkillRow.classList.contains('classskill')) {
			thisSkillRow.classList.remove('classskill');
		}
		if (currLvl.class.classskills[sk].classskill == 1) {
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

function featDefaultDesc() {
	var section = document.getElementById('featscol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "none, url('../images/webelements/banners/abilityrolls.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">Feats</span>";

	var descTxt = "<p>Lidda the rogue can walk quietly up to a door, put her ear to it, and hear the troglodyte priest on the other side casting a spell on his pet crocodile. If Jozan the cleric were to try the same thing, he’d probably make so much noise that the troglodyte would hear him. Jozan could, however, identify the spell that the evil priest is casting. Actions such as these rely on the skills that characters have (in this case, Move Silently, Listen, and Spellcraft).</p>";
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
	openToPage('newcharmodal', 'skills', 'feats', 'box', 'newchar');
}



// ========================================================================== //
// Appearance Functions Set																												//
// ========================================================================== //
/*  */

function showNewAppearanceModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'feats', 'appearance', 'box', 'newchar');
}



// ========================================================================== //
// Name Functions Set																												//
// ========================================================================== //
/*  */

function showNewNameModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'appearance', 'name', 'box', 'newchar');
}
