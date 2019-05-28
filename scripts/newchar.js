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
var myCharString = "newCharacter";



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
// Campaigns Functions Set																										//
// ========================================================================== //
/*  */

function setGame(myGame) {
	var mySideImgs = document.getElementsByClassName('sideimg');
	for (var i = 0; i < mySideImgs.length; i++) {
		var myImg = mySideImgs[i];
		myImg.setAttribute('src', '../images/' + myGame + '-logo.png')
	}
	newCharacter.set_Game(myGame); 			// goes to <form>

// To be moved into the createCharacter() function
	setInputValue('game', newCharacter.game);
}

function setStartLevel(myLvl) {
	newCharacter.set_StartLvl(myLvl);	 	// goes to <form>
	var myXP = 0;
	for (var i = 0; i < myLvl; i++) {
		myXP += i;
	}
	newCharacter.set_CurrXp(myXP * 1000);	 	// goes to <form>

// To be moved into the createCharacter() function
	setInputValue('startlevel', newCharacter.startlevel);
	setInputValue('currxp', newCharacter.currxp);
}

function setCampaign(invId, myId, myCamp, myGame, myLvl) {
// Set the campaign properties in the newCharacter object
	newCharacter.set_Campaign(myCamp); 	// goes to <form>
	setGame(myGame);
	setStartLevel(myLvl);

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
	newCharacter.set_Gender(myGender); 	// goes to <form>

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
	newCharacter.set_Race(myId); 	// newCharacter.race.race goes to <form>

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
	newCharacter.set_Alignment(value);		// newCharacter.alignment goes to <form>

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
		if (newLvl.class.alignments[al].available == 1) {
			thisAlignBtn.disabled = false;
		}
	}

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'class', 'alignment', 'box', 'newchar');
}



// ========================================================================== //
// Appearance Functions Set																										//
// ========================================================================== //
/*  */

function showNewAppearanceModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'feats', 'appearance', 'box', 'newchar');
}



// ========================================================================== //
// Name Functions Set																						   						//
// ========================================================================== //
/*  */

function showNewNameModal() {

	// Show the Alignments Selection <div>
	openToPage('newcharmodal', 'appearance', 'name', 'box', 'newchar');
}
