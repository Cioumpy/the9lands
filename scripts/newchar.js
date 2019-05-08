// New Character JavaScript == The Nine Lands Website
/*	It controls the behaviour of the interactive objects in the newchar.php page and its children.
		It uses some functions from the main.js (and possibly other .js sheets) as following:

		# showIdAmongClasses() - in main.js
		# setInputValue() - in main.js
		# Character() object class - in charobjclass.js
		# Level() object class - in charobjclass.js
*/



// ========================================================================== //
// New Character Variables																										//
// ========================================================================== //
/*  */

var newCharacter = new Character();
var currLvl = new Level();



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

/* AJAX functions */
function showDesc(url, descFunction, id) {
  var xhttp;
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
			var myObj = JSON.parse(this.responseText);
      descFunction(myObj, id);
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
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
/* End of AJAX */

function raceDefaultDesc() {
	var section = document.getElementById('racecol');

	var banner = section.getElementsByClassName('bannerbox');
	banner[0].style.backgroundImage = "url('../images/webelements/banners/races/dddefault.png'), url('../images/webelements/banners/campaigns/default.jpg')";
	banner[0].innerHTML = "<span class=\"bannertitle\">Races in the World</span>";

	var descTxt = "<p>The elven woods are home to the elves and their allies. Not many dwarves or half-orcs live there. In turn, elves, humans, halflings, and half-orcs are hard to find in underground dwarven cities. And while nonhumans may travel through the human countryside, most country folk are humans. In the big cities, however, the promise of power and profit brings together people of all the common races: humans, dwarves, elves, gnomes, half-elves, half-orcs, and halflings. </p>";
	descTxt += "<p>You can play a character of any race and class combination, but certain races do better pursuing certain careers. Halflings, for example, can be fighters, but their small size and special features make them better as rogues.</p>";
	section.getElementsByClassName('descbox')[0].innerHTML = descTxt;
}

function setNewRace(myId, raceValue, stepNum) {
	newCharacter.setRace(myId); 	// newCharacter.race.race goes to <form>

	highlightListItem('raceitem' + myId, 'racelist');
	showDesc("../scripts/ddrulesJSON.php", raceDesc, myId);
/*	showIdAmongClasses(myId, 'col', 'race'); */
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

function setNewClass(myId, classValue, stepNum) {
	currLvl.setClass(myId); 	// currLvl.class.class goes to <form>

	highlightListItem('classitem' + myId, 'classlist');
	showIdAmongClasses(myId, 'col', 'class');
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

function setAlignment(myId, value, stepNum) {
	newCharacter.setCharAlignment(value);		// newCharacter.alignment goes to <form>

	highlightListItem('listalignment' + myId, 'subbtns');
	showIdAmongClasses(myId, 'col', 'alignment');
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

function showSkillDesc(skId) {
	highlightListItem('skillrow' + skId, 'skillrow');
	showIdAmongClasses(skId, 'col', 'skills');
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

	document.getElementById('skilldescrank' + skId).innerHTML = currLvl.skills[skId].ranks;		//	goes to <form>
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

function showFeatDesc(ftId) {
	showIdAmongClasses(ftId, 'col', 'feats');
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
