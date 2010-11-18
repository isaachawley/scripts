/**
 * Circle requirements for a War Mage
 */

groupSkills[MAGIC].push("Elemental Magic");

function WarriorMageRequirements ()
{
	this.totalMagic = new GroupRequirement(MAGIC);
	this.totalMagic.setRange(1, 30, 20);
	this.totalMagic.setRange(31, 70, 28);
	this.totalMagic.setRange(71, 100, 33);
	this.totalMagic.setRange(101, 150, 38);

	this.targeted = new SkillRequirement("Targeted Magic");
	this.targeted.setRange(1, 70, 4);
	this.targeted.setRange(71, 150, 6);
	
	this.firstWeapon = new GroupRequirement(WEAPON, 0);
	this.firstWeapon.setRange(1, 30, 3);
	this.firstWeapon.setRange(31, 100, 4);
	this.firstWeapon.setRange(101, 150, 5);
	
  this.secondWeapon = new GroupRequirement(WEAPON, 1);
  this.secondWeapon.setRange(1, 10, 0);
  this.secondWeapon.setRange(11, 30, 2);
  this.secondWeapon.setRange(31, 100, 3);
  this.secondWeapon.setRange(101, 150, 4);
	
  this.thirdWeapon = new GroupRequirement(WEAPON, 2);
  this.thirdWeapon.setRange(1, 70, 0);
  this.thirdWeapon.setRange(71, 100, 2);
  this.thirdWeapon.setRange(101, 150, 3);

	this.parry = new SkillRequirement("Parry Ability");
	this.parry.setRange(1, 10, 2);
	this.parry.setRange(11, 70, 3);
	this.parry.setRange(71, 150, 4);
	
	this.multi = new SkillRequirement("Multi Opponent");
	this.multi.setRange(1, 100, 2);
	this.multi.setRange(101, 150, 4);

	this.firstArmor = new GroupRequirement(ARMOR, 0);
	this.firstArmor.setRange(1, 70, 2);
	this.firstArmor.setRange(71, 100, 3);
	this.firstArmor.setRange(101, 150, 4);

	this.shield = new SkillRequirement("Shield Usage");
	this.shield.setRange(1, 10, 2);
	this.shield.setRange(11, 30, 0);
	this.shield.setRange(31, 150, 0);
	
	this.survivalReqs = new Array();
	for (var i = 0; i < 9; i++) {
		this.survivalReqs[i] = new GroupRequirement(SURVIVAL, i);
  		if (i < 6) {
  			this.survivalReqs[i].setRange(1, 70, 1);
  			this.survivalReqs[i].setRange(71, 150, 2);
      } else {
        this.survivalReqs[i].setRange(1, 100, 0);
  			this.survivalReqs[i].setRange(101, 150, 2);
      }
	}

	this.loreReqs = new Array();
	for (var i = 0; i < 4; i++) {
		this.loreReqs[i] = new GroupRequirement(LORE, i);
		if (i < 3) {
			this.loreReqs[i].setRange(1, 10, 1);
			this.loreReqs[i].setRange(11, 70, 2);
			this.loreReqs[i].setRange(71, 150, 3);
		} else {
			this.loreReqs[i].setRange(1, 10, 1);
			this.loreReqs[i].setRange(11, 30, 0);
			this.loreReqs[i].setRange(31, 70, 2);
			this.loreReqs[i].setRange(71, 100, 0);			
			this.loreReqs[i].setRange(101, 150, 3);
		}
	}
	
  this.allRequirements = new Array(this.totalMagic, this.targeted, this.firstWeapon, this.secondWeapon, this.thirdWeapon, this.parry, this.multi, this.firstArmor, this.shield);
  for (var i = 0; i < this.loreReqs.length; i++) {
   this.allRequirements.push(this.loreReqs[i]);
  }
  for (var i = 0; i < this.survivalReqs.length; i++) {
   this.allRequirements.push(this.survivalReqs[i]);
  }
}

WarriorMageRequirements.prototype.getRequirements = function (circle)
{
	var requirements = new Object();

	for (var i = 0; i < this.allRequirements.length; i++)
	{
		requirements[this.allRequirements[i]] = this.allRequirements[i].getRequirement(circle);
	}

	return requirements;	
}

WarriorMageRequirements.prototype.echoReport = function(currentCircle)
{
	var potentialCircle = 999;
	var nextPotentialReqs = new Object();

	for (var i = 0; i < this.allRequirements.length; i++) {
		var requirement = this.allRequirements[i];
		if (requirement instanceof SkillRequirement) {
			var max = requirement.getMaxCircle()-1;
			potentialCircle = Math.min(max - 1, potentialCircle);			
			if ( max < currentCircle ) {
			  nextPotentialReqs[requirement.skill] = requirement.getNeededRanks(max+1);
			}
    } else if (requirement instanceof GroupRequirement ) {
			var max = 999;
	
			if (requirement == this.totalMagic) {
				max = requirement.getMaxCircleFromTotal();
			if ( max < currentCircle ) {nextPotentialReqs[requirement.groupDescription] = requirement.getNeededRanksFromTotal(max+1);}
			} else {
				max = requirement.getMaxCircleFromSkillNumber()-1;
				var num = requirement.skillNumber+1;
				var skill = requirement.getHighestSkill(num);
        if ( max < currentCircle + 1 ) {
				    nextPotentialReqs[skill+ " (" + requirement.groupDescription + " #" + num + ")"] = requirement.getNeededRanksFromSkillNumber(max+1);          
          }
			}

			potentialCircle = Math.min(max - 1, potentialCircle);
		}
	}

	script.echo("Your CURRENT circle is: " + currentCircle);
	potentialCircleUp= potentialCircle +1
	script.echo("Your POTENTIAL circle (without extra ranks) is: " + potentialCircleUp);

	var nextCircle = potentialCircleUp+1;
	script.echo("For circle " + nextCircle + ", you need:");
	for (var reqName in nextPotentialReqs) {
		var amount = nextPotentialReqs[reqName];
		
		if (amount) {
			var total = amount + game.getExp(reqName).getRank();
			//script.echo("  " + amount + " (" + total + " total) ranks in " + reqName);
			script.echo("  " + amount + " ranks in " + reqName);
		}
	}
}
