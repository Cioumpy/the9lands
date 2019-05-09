// Character JavaScript Objects == The Nine Lands Website
/*	*/






// ========================================================================== //
// Character Object Classes																										//
// ========================================================================== //
/*  */

function Character() {

	// Character Variables & Functions -------------------------------------------
	this.player = null;

	this.campaign  = null;			// DONE
	this.game  = null;					// DONE
	this.startlevel  = null;		// DONE
	this.currxp = null;					// DONE

	this.setCharCampaign = function (camp) { this.campaign = camp; };
	this.setCharGame = function (gm) { this.game = gm; };
	this.setCharStartLvl = function (stlvl) { this.startlevel = stlvl; };
	this.setCurrXp = function (currxp) { this.currxp = currxp; };

	this.firstname = "Hero";
	this.lastname = "OfHeroes";
	this.gender = null;
	this.alignment = null;
	this.avatar = null;
	this.race = null;
	this.size = null;

	this.setCharGender = function (gender) { this.gender = gender; };
	this.setCharAlignment = function (alnmt) { this.alignment = alnmt; };
	this.setRace = function (raceId) {
		var actualRace = gameRules.races[raceId];
		actualRace.id = raceId;

		for (var sz = 1; sz <= Object.keys(gameRules.sizes).length; sz++) {
			if (gameRules.sizes[sz].size == actualRace.size) {
				var actualSize = gameRules.sizes[sz];
				actualSize.id = sz;
			}
		}

		this.race = actualRace;
		this.size = actualSize;
	};

	// Level Variables & Functions -----------------------------------------------
	this.progression = [];
	this.feats = [];

	this.addLevel = function (newlvl) { this.progression.push(newlvl); };
	this.charLevel = function () { return this.progression.length; };
	this.addFeat = function (newfeat) {
		if (!checkFeat(this, newfeat)) {
			this.feats.push(newfeat);
		}
	};

}



function Level() {
	this.level = 0;
	this.setLevel = function (lvl) { this.level = lvl; };

	this.class = null;
	this.abilities = gameRules.abilities;
	this.skills = gameRules.skills;
	this.feats = [];

	this.setClass = function (classId) {
		let actualClass = gameRules.classes[classId];
		actualClass.id = classId;

		this.class = actualClass;
	};
	this.setAbilities = function (abil) { this.abilities = abil; };
	this.setSkills = function (actualSkills) { this.skills = actualSkills; };
	this.addFeat = function (newfeat) {
		if (!checkFeat(this, newfeat)) {
			this.feats.push(newfeat);
		}
	};
}



// ========================================================================== //
// Requisites Functions																												//
// ========================================================================== //
/*  */

function checkFeat(myChar, feat) {
	var gotFeat = false;
	if (myChar.feats.length > 0) {
		for (var i = 0; i < myChar.feats.length; i++) {
			if (feat == myChar.feats[i]) {
				gotFeat = true;
				break;
			}
		}
	}
	return gotFeat;
}
// This function's name is stored in the DataBase.
// DO NOT CALL THIS FUNCTION outside callFunction()!!!
function reqFeat(feat) {
	var myChar = eval(myCharacter);
	checkFeat(myChar, feat);
}
