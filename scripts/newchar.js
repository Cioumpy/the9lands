// New Character JavaScript == The Nine Lands Website
/*	It controls the behaviour of the interactive objects in the newchar2.php page and its children.
		It uses some functions from the main.js (and possibly other .js sheets) as following:

		# showIdAmongClasses() - in main.js
		# setInputValue - in main.js
*/



function setSideImages(gameImg) {
	var mySideImgs = document.getElementsByClassName('sideimg');
	for (var i = 0; i < mySideImgs.length; i++) {
		var myImg = mySideImgs[i];
		myImg.setAttribute('src', '../images/' + gameImg + '-logo.png')
	}
}

function setGame(myGame) {
	setInputValue('game', myGame);
	setSideImages(myGame);
}

function setCampaign(myId, myCamp, myGame, myLvl) {
	highlightListItem('listcamp' + myId, 'listitem');
	showIdAmongClasses(myId, 'col', 'camp');

	setInputValue('campaign', myCamp);
	setGame(myGame);
	setInputValue('startlevel', myLvl);
}

function setCustomCamp() {
	showIdAmongClasses(0, 'col', 'camp');

	setInputValue('campaign', '');
}

function nxtStepReady(step) {
	var mySideBtn = document.getElementById('subbtn' + step);
	var myNxtBtn = document.getElementById('nxtbtn' + step);
	mySideBtn.removeAttribute('disabled');
	myNxtBtn.removeAttribute('disabled');
}

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
	setInputValue('gender', myGender);
	nxtStepReady(stepNum);
	shineOnMe('genderbtn', myGender);
}

function setRace(myId, raceValue, stepNum) {
	highlightListItem('listrace' + myId, 'listitem');
	showIdAmongClasses(myId, 'col', 'race');
	for (var i = 1; i <= 6; i++) {
		showIdAmongClasses(myId + 'ability' + i, 'ability' + i, 'race');
	}
	nxtStepReady(stepNum);

	setInputValue('race', raceValue);
}

function setClass(myId, classValue, stepNum) {
	highlightListItem('listclass' + myId, 'listitem');
	showIdAmongClasses(myId, 'col', 'class');
	nxtStepReady(stepNum);

	setInputValue('class', classValue);
}

function setAlignment(myId, value, stepNum) {
	highlightListItem('listalignment' + myId, 'subbtns');
	showIdAmongClasses(myId, 'col', 'alignment');
	nxtStepReady(stepNum);

	setInputValue('alignment', value);
}



function rollAbilities() {
	var allRolls = document.getElementsByClassName('rolltile');
	// var tooWeak = true;
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
}

function setAbilTotals() {
	var abilityNames = ['strength', 'dexterity', 'constitution', 'intelligence', 'wisdom', 'charisma'];
	var allRolls = document.getElementsByClassName('rolltile');
	for (var i = 1; i <= allRolls.length; i++) {

		var thisScore = document.getElementById('roll' + i);
		var raceAbilities = document.getElementsByClassName('raceability' + i);
		var thisTotal = document.getElementById('tot' + i);
		var thisModifier = document.getElementById('mod' + i);

		var thisRaceMod;
		for (var x = 0; x < raceAbilities.length; x++) {
			var actualRaceAbility = raceAbilities[x];
			if (!actualRaceAbility.classList.contains('hidden')) {
				thisRaceMod = Number(actualRaceAbility.innerHTML);
			}
		}

		var tempScore = Number(thisScore.innerHTML);
		var tempTot = thisRaceMod + tempScore;
		var tempMod = (tempTot > 11) ? "+" + Math.floor((tempTot - 10) / 2) : Math.floor((tempTot - 10) / 2);
		var thisAbility = abilityNames[i-1];

		thisTotal.innerHTML = tempTot;
		thisModifier.innerHTML = tempMod;
		setInputValue(thisAbility, thisTotal.innerHTML);
		nxtStepReady(5);
	}
}

function setAbilities() {
	rollAbilities();
	setAbilTotals();
}


var dragSrcEl = null;

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

  // Don't do anything if dropping the same column we're dragging.
  if (dragSrcEl != this) {
    // Set the source column's HTML to the HTML of the column we dropped on.
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
  tile.addEventListener('dragstart', handleDragStart, false);
	tile.addEventListener('dragenter', handleDragEnter, false);
  tile.addEventListener('dragover', handleDragOver, false);
  tile.addEventListener('dragleave', handleDragLeave, false);
	tile.addEventListener('drop', handleDrop, false);
  tile.addEventListener('dragend', handleDragEnd, false);
});
