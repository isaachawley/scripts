/**
 * Circle requirements for a cleric
 */

groupSkills[MAGIC].push("Holy Magic");

function ClericRequirements ()
{
	this.harness = new SkillRequirement("Harness Ability");
	this.harness.setRange(1, 30, 4);
	this.harness.setRange(31, 70, 5);
	this.harness.setRange(71, 100, 6);
	this.harness.setRange(101, 150, 7);

	this.totalMagic = new GroupRequirement(MAGIC);
	this.totalMagic.setRange(1, 30, 20);
	this.totalMagic.setRange(31, 70, 28);
	this.totalMagic.setRange(71, 100, 33);
	this.totalMagic.setRange(101, 150, 38);

	this.firstArmor = new GroupRequirement(ARMOR, 0);
	this.firstArmor.setRange(1, 70, 2);
	this.firstArmor.setRange(71, 150, 3);

	this.shield = new SkillRequirement("Shield Usage");
	this.shield.setRange(1, 10, 1);
	this.shield.setRange(11, 30, 2);
	this.shield.setRange(31, 150, 0);

	this.parry = new SkillRequirement("Parry Ability");
	this.parry.setRange(1, 10, 2);
	this.parry.setRange(11, 150, 3);

	this.firstWeapon = new GroupRequirement(WEAPON, 0);
	this.firstWeapon.setRange(1, 30, 3);
	this.firstWeapon.setRange(31, 100, 4);
	this.firstWeapon.setRange(101, 150, 5);

	this.loreReqs = new Array();
	for (var i = 0; i < 4; i++) {
		this.loreReqs[i] = new GroupRequirement(LORE, i);
		if (i == 0 || i == 1) {
			this.loreReqs[i].setRange(1, 10, 2);
			this.loreReqs[i].setRange(11, 100, 3);
			this.loreReqs[i].setRange(101, 150, 4);
		} else if (i == 2) {
			this.loreReqs[i].setRange(1, 10, 1);
			this.loreReqs[i].setRange(11, 30, 2);
			this.loreReqs[i].setRange(31, 100, 2);
			this.loreReqs[i].setRange(101, 150, 4);
		} else if (i == 3) {
			this.loreReqs[i].setRange(1, 30, 1);
			this.loreReqs[i].setRange(31, 100, 2);
			this.loreReqs[i].setRange(101, 150, 3);
		}
	}

	this.survivalReqs = new Array();
	for (var i = 0; i < 7; i++) {
		this.survivalReqs[i] = new GroupRequirement(SURVIVAL, i);
		if (i >= 0 && i <= 6) {
			this.survivalReqs[i].setRange(1, 70, 1);
			this.survivalReqs[i].setRange(71, 150, 2);
		} else {
			this.survivalReqs[i].setRange(1, 100, 0);
			this.survivalReqs[i].setRange(101, 150, 2);
		}
	}

	this.allRequirements = new Array(this.harness, this.totalMagic, this.firstArmor, this.shield, this.parry, this.firstWeapon);
	for (var i = 0; i < this.loreReqs.length; i++) {
		this.allRequirements.push(this.loreReqs[i]);
	}
	for (var i = 0; i < this.survivalReqs.length; i++) {
		this.allRequirements.push(this.survivalReqs[i]);
	}
}

ClericRequirements.prototype.getRequirements = function (circle)
{
	var requirements = new Object();

	for (var i = 0; i < this.allRequirements.length; i++)
	{
		requirements[this.allRequirements[i]] = this.allRequirements[i].getRequirement(circle);
	}

	return requirements;	
}

ClericRequirements.prototype.echoReport = function(currentCircle)
{
	var potentialCircle = 999;
	var nextPotentialReqs = new Object();

	for (var i = 0; i < this.allRequirements.length; i++) {
		var requirement = this.allRequirements[i];
		if (requirement instanceof SkillRequirement) {
			var max = requirement.getMaxCircle();
			potentialCircle = Math.min(max - 1, potentialCircle);
			nextPotentialReqs[requirement.skill] = requirement.getNeededRanks(max+1);
		} else if (requirement instanceof GroupRequirement ) {
			var max = 999;
			if (requirement == this.totalMagic) {
				max = requirement.getMaxCircleFromTotal();
				nextPotentialReqs[requirement.groupDescription] = requirement.getNeededRanksFromTotal(max+1);
			} else {
				max = requirement.getMaxCircleFromSkillNumber();
				var num = requirement.skillNumber+1;
				var skill = requirement.getHighestSkill(num);

				nextPotentialReqs[skill+ " (" + requirement.groupDescription + " #" + num + ")"] = requirement.getNeededRanksFromSkillNumber(max+1);
			}
			potentialCircle = Math.min(max - 1, potentialCircle);
		}
	}

	script.echo("Your CURRENT circle is: " + currentCircle);
	script.echo("Your POTENTIAL circle (without extra ranks) is: " + potentialCircle);

	var nextCircle = potentialCircle+1;
	script.echo("For circle " + nextCircle + ", you need:");
	for (var reqName in nextPotentialReqs) {
		var amount = nextPotentialReqs[reqName];
		
		if (amount) {
			var total = amount + game.getExp(reqName).getRank();
			script.echo("  " + amount + " (" + total + " total) ranks in " + reqName);
		}
	}
}
