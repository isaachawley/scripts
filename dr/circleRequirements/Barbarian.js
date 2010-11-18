/**
 * Circle requirements for a Barbarian
 */

groupSkills[MAGIC].push("Inner Magic");

function BarbarianRequirements ()
{

	
	this.firstWeapon = new GroupRequirement(WEAPON, 0);
	this.firstWeapon.setRange(1, 10, 4);
	this.firstWeapon.setRange(11, 30, 5);
	this.firstWeapon.setRange(31, 150, 6);
	
  this.secondWeapon = new GroupRequirement(WEAPON, 1);
  this.secondWeapon.setRange(1, 10, 4);
  this.secondWeapon.setRange(11, 30, 5);
  this.secondWeapon.setRange(31, 70, 4);
  this.secondWeapon.setRange(71, 150, 6);
	
  this.thirdWeapon = new GroupRequirement(WEAPON, 2);
  this.thirdWeapon.setRange(1, 30, 0);
  this.thirdWeapon.setRange(31, 100, 4);
  this.thirdWeapon.setRange(101, 150, 6);

  this.fourthWeapon = new GroupRequirement(WEAPON, 3);
  this.fourthWeapon.setRange(1, 100, 0);
  this.fourthWeapon.setRange(101, 150, 6);

  this.fifthWeapon = new GroupRequirement(WEAPON, 4);
  this.fifthWeapon.setRange(1, 100, 0);
  this.fifthWeapon.setRange(101, 150, 6);


	this.parry = new SkillRequirement("Parry Ability");
	this.parry.setRange(1, 100, 4);
	this.parry.setRange(101, 150, 5);
	
	this.multi = new SkillRequirement("Multi Opponent");
	this.multi.setRange(1, 10, 2);
	this.multi.setRange(11, 70, 3);
	this.multi.setRange(71, 150, 4);


	this.firstArmor = new GroupRequirement(ARMOR, 0);
	this.firstArmor.setRange(1, 10, 3);
	this.firstArmor.setRange(11, 70, 4);
	this.firstArmor.setRange(71, 100, 5);
	this.firstArmor.setRange(101, 150, 6);

	this.secondArmor = new GroupRequirement(ARMOR, 1);
	this.secondArmor.setRange(1, 70, 0);
	this.secondArmor.setRange(71, 150, 4);

	
	this.firstSur = new GroupRequirement(SURVIVAL, 0);
	this.firstSur.setRange(1, 30, 2);
	this.firstSur.setRange(30, 150, 3);

	this.secondSur = new GroupRequirement(SURVIVAL, 1);
	this.secondSur.setRange(1, 30, 2);
	this.secondSur.setRange(30, 150, 3);

	this.thirdSur = new GroupRequirement(SURVIVAL, 2);
	this.thirdSur.setRange(1, 70, 2);
	this.thirdSur.setRange(101, 150, 3);

	this.fourthSur = new GroupRequirement(SURVIVAL, 3);
	this.fourthSur.setRange(1, 100, 2);
	this.fourthSur.setRange(101, 150, 3);

	this.fifthSur = new GroupRequirement(SURVIVAL, 4);
	this.fifthSur.setRange(1, 100, 2);
	this.fifthSur.setRange(101, 150, 3);

	this.sixthSur = new GroupRequirement(SURVIVAL, 5);
	this.sixthSur.setRange(1, 100, 2);
	this.sixthSur.setRange(101, 150, 3);

	this.seventhSur = new GroupRequirement(SURVIVAL, 6);
	this.seventhSur.setRange(1, 10, 2);
	this.seventhSur.setRange(11, 70, 0);
	this.seventhSur.setRange(71, 100, 2);
	this.seventhSur.setRange(101, 150, 3);

	this.eighthSur = new GroupRequirement(SURVIVAL, 7);
	this.eighthSur.setRange(1, 10, 2);
	this.eighthSur.setRange(11, 70, 0);
	this.eighthSur.setRange(71, 100, 2);
	this.eighthSur.setRange(101, 150, 3);

	this.firstlore = new GroupRequirement (LORE, 0);
	this.firstlore.setRange(1, 70, 0)
	this.firstlore.setRange(71, 150, 2)


	this.secondlore = new GroupRequirement (LORE, 1);
	this.secondlore.setRange(1, 100, 0)
	this.secondlore.setRange(101, 150, 2)


	


  this.allRequirements = new Array(this.firstWeapon, this.secondWeapon, this.thirdWeapon, this.fourthWeapon, this.fifthWeapon, this.parry, this.multi, this.firstArmor, this.secondArmor, this.firstSur, this.secondSur, this.thirdSur, this.fourthSur, this.fifthSur, this.sixthSur, this.seventhSur, this.eighthSur, this.firstlore, this.secondlore);
  
  
}

BarbarianRequirements.prototype.getRequirements = function (circle)
{
	var requirements = new Object();

	for (var i = 0; i < this.allRequirements.length; i++)
	{
		requirements[this.allRequirements[i]] = this.allRequirements[i].getRequirement(circle);
	}

	return requirements;	
}

BarbarianRequirements.prototype.echoReport = function(currentCircle)
{
	var potentialCircle = 999;
	var nextPotentialReqs = new Object();

	for (var i = 0; i < this.allRequirements.length; i++) {
		var requirement = this.allRequirements[i];
		if (requirement instanceof SkillRequirement) {
			var max = requirement.getMaxCircle() - 1;
			potentialCircle = Math.min(max - 1, potentialCircle);			
			if ( max < currentCircle ) {
			  nextPotentialReqs[requirement.skill] = requirement.getNeededRanks(max+1);
			}
    } else if (requirement instanceof GroupRequirement ) {
			var max = 999;
	
			if (requirement == this.totalMagic) {
				max = requirement.getMaxCircleFromTotal();
			if ( max < currentCircle ) {nextPotentialReqs[requirement.groupDescription] = requirement.getNeededRanksFromTotal(max + 1);}
			} else {
				max = requirement.getMaxCircleFromSkillNumber() - 1;
				var num = requirement.skillNumber + 1;
				var skill = requirement.getHighestSkill(num);
        if ( max < currentCircle + 1 ) {
				    nextPotentialReqs[skill + " (" + requirement.groupDescription + " #" + num + ")"] = requirement.getNeededRanksFromSkillNumber(max+1);          
          }
			}

			potentialCircle = Math.min(max - 1, potentialCircle);
		}
	}

	script.echo("Your CURRENT circle is: " + currentCircle);
	potentialCircleUp = potentialCircle + 1;
	script.echo("Your POTENTIAL circle (without extra ranks) is: " + potentialCircleUp);

	var nextCircle = currentCircle + 1;
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
