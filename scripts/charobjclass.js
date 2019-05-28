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

	this.firstname = "Hero";
	this.lastname = "OfHeroes";
	this.gender = null;
	this.alignment = null;
	this.avatar = null;

	this.race = null;
	this.size = null;

	// Level Variables & Functions -----------------------------------------------
	this.progression = [];

	this.addLevel = function (newlvl) { this.progression.push(newlvl); };

	// Setters -------------------------------------------------------------------
	this.set_Campaign = function (camp) { this.campaign = camp; };
	this.set_Game = function (gm) { this.game = gm; };
	this.set_StartLvl = function (stlvl) { this.startlevel = stlvl; };
	this.set_CurrXp = function (currxp) { this.currxp = currxp; };

	this.set_FirstName = function (firstname) { this.firstname = firstname; };
	this.set_LastName = function (lastname) { this.lastname = lastname; };
	this.set_Gender = function (gender) { this.gender = gender; };
	this.set_Alignment = function (alnmt) { this.alignment = alnmt; };
	this.set_Race = function (raceId) {
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

	// Getters -------------------------------------------------------------------
	this.get_Player = function () { return this.player; };
	this.get_Campaign = function () { return this.campaign; };
	this.get_Game = function () { return this.game; };
	this.get_StartLvl = function () { return this.startlevel; };
	this.get_CurrXp = function () { return this.currxp; };

	this.get_FirstName = function () { return this.firstname; };
	this.get_LastName = function () { return this.lastname; };
	this.get_Gender = function (gender) { return this.gender; };
	this.get_Alignment = function (alnmt) { return this.alignment; };
	this.get_Race = function (raceId) { return this.race.race; };

	this.get_Level = function () { return this.progression.length; };

	this.get_Ability = function (ability) {
		let score = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				score += this.progression[i].get_Ability(ability);
			}
		}
		return score;
	};
	this.get_AbilityMod = function (ability) {
		return Math.floor((this.get_Ability(ability) - 10) / 2);
	};

	this.get_BAB = function () {
		let bab = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				bab += this.progression[i].get_BAB();
			}
		}
		return bab;
	};
	this.get_Fort = function () {
		let fort = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				fort += this.progression[i].get_Fort();
			}
		}
		return fort;
	};
	this.get_Refl = function () {
		let refl = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				refl += this.progression[i].get_Refl();
			}
		}
		return refl;
	};
	this.get_Will = function () {
		let will = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				will += this.progression[i].get_Will();
			}
		}
		return will;
	};

	this.get_SkillRanks = function (skill) {
		let ranks = 0;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				ranks += this.progression[i].get_SkillRanks(skill);
			}
		}
		return ranks;
	};
	this.get_SkillRacial = function (skill) {
		let racial = 0;
		for (var i = 0; i < Object.keys(this.skills).length; i++) {
			let skId = Object.keys(this.skills)[i];
			if (skill == this.skills[skId].skill) {
				racial = Number(this.race.skillbonus[skId].bonus);
				break;
			}
		}
		return racial;
	};
	this.get_SkillSizeMod = function (skill) {
		if (skill == "Hide") {
			return Number(this.race.size.hide);
		} else {
			return 0;
		}
	};
	this.get_SkillVariousMod = function (skill) {
		let various = 0;
		various += this.get_SkillSizeMod();
		return various;
	}
	this.get_SkillMod = function (skill) {
		let mod = 0;
		mod += this.get_SkillRanks(skill);
		mod += this.get_SkillRacial(skill);
		mod += this.get_SkillVariousMod(skill);
		return mod;
	};

	this.get_Proficiencies = function () {
		let charProfic = this.race.proficiencies;
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				let thisLvl = this.progression[i];
				for (var y = 0; y < thisLvl.get_Proficiencies().length; y++) {
					charProfic.push(thisLvl.get_Proficiencies()[y]);
				}
			}
		}
		return charProfic;
	}
	this.get_Feats = function () {
		let charFeats = [];
		if (this.progression.length > 0) {
			for (var i = 0; i < this.progression.length; i++) {
				let thisLvl = this.progression[i];
				for (var y = 0; y < thisLvl.get_Feats().length; y++) {
					charFeats.push(thisLvl.get_Feats()[y]);
				}
			}
		}
		return charFeats;
	}

}



function Level() {
	this.level = 0;

	this.class = null;
	this.abilities = gameRules.abilities;
	this.skills = gameRules.skills;
	this.featPoints = 0;
	this.feats = [];


	// Setters -------------------------------------------------------------------
	this.set_Level = function (lvl) { this.level = lvl; };

	this.set_Class = function (classId) {
		let actualClass = gameRules.classes[classId];
		actualClass.id = classId;

		this.class = actualClass;
	};
	this.set_Abilities = function (abil) { this.abilities = abil; };
	this.set_Skills = function (actualSkills) { this.skills = actualSkills; };
	this.set_FeatPoints = function () {
		if (this.level == 1 || this.level % 3 == 0) {
			this.featPoints = 1;
		}
	}
	this.addFeat = function (newfeat) { this.feats.push(newfeat); };
	this.removeFeat = function (oldfeat) {
		for (var i = 0; i < this.feats.length; i++) {
			if (this.feats[i] == oldfeat) {
				this.feats.splice(i, 1);
				break;
			}
		}
	}

	// Getters -------------------------------------------------------------------
	this.get_Level = function () { return Number(this.level); };

	this.get_Ability = function (ability) {
		let abScore = 0;
		for (var i = 0; i < Object.keys(this.abilities).length; i++) {
			let abId = Object.keys(this.abilities)[i];
			if (ability == this.abilities[abId].ability) {
				abScore = Number(this.abilities[abId].score);
				break;
			}
		}
		return abScore;
	};
	this.get_AbilityMod = function (ability) {
		return Math.floor((this.get_Ability(ability) - 10) / 2);
	};

	this.get_Class = function () { return this.class.class; };

	this.get_BAB = function () { return Number(this.class.bab); };
	this.get_Fort = function () { return Number(this.class.fort); };
	this.get_Refl = function () { return Number(this.class.refl); };
	this.get_Will = function () { return Number(this.class.will); };

	this.get_SkillRanks = function (skill) {
		let rank = 0;
		for (var i = 0; i < Object.keys(this.skills).length; i++) {
			let skId = Object.keys(this.skills)[i];
			if (skill == this.skills[skId].skill) {
				rank = Number(this.skills[skId].ranks);
				break;
			}
		}
		return rank;
	};

	this.get_FeatPoints = function () { return this.featPoints;	}
	this.get_Proficiencies = function () { return this.class.proficiencies; };
	this.get_Feats = function () { return this.feats; };
	
}
