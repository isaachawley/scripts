/**
 * Circle requirements for a Moon Mage
 *  as described at:
 *   https://www.play.net/forums/messages.asp?forum=20&category=24&topic=1&message=38
 */

groupSkills[MAGIC].push("Lunar Magic");

function moonMageRequirements ()
{
	this.totalMagic = new GroupRequirement(MAGIC);
	this.totalMagic.setRange(1, 30, 20);
	this.totalMagic.setRange(31, 70, 28);
	this.totalMagic.setRange(71, 100, 33);
	this.totalMagic.setRange(101, 150, 38);

	this.powerperc = new SkillRequirement("Power Perceive");
	this.powerperc.setRange(1, 30, 4);
	this.powerperc.setRange(31, 70, 5);
	this.powerperc.setRange(71, 100, 6);
	this.powerperc.setRange(101, 150, 7);
	
	this.astrology = new SkillRequirement("Astrology");
	this.astrology.setRange(1,30,2);
	this.astrology.setRange(31,70,3);
	this.astrology.setRange(71,100,4);
	this.astrology.setRange(101,150,5);
	
	this.scholar = new SkillRequirement("Scholarship");
	this.scholar.setRange(1,70,3);
	this.scholar.setRange(71,150,4);
	
	this.teach = new SkillRequirement("Teaching");
	this.teach.setRange(1,100,2);
	this.teach.setRange(101,150,3);
	
	this.lore1 = new GroupRequirement(LORE,0);
	this.lore1.setRange(1,30,2);
	this.lore1.setRange(31,100,3);
	this.lore1.setRange(101,150,4);
	
	this.lore2 = new GroupRequirement(LORE,1);
	this.lore2.setRange(1,70,0);
	this.lore2.setRange(71,100,2);
	this.lore2.setRange(101,150,3);
	
	
	this.survivalReqs = new Array();
	for (var i = 0; i <= 7; i++) {
		this.survivalReqs[i] = new GroupRequirement(SURVIVAL, i);
		if (i <= 5) {
			this.survivalReqs[i].setRange(1, 30, 2);
			this.survivalReqs[i].setRange(31, 150, 3);
		} else {
			this.survivalReqs[i].setRange(1, 10, 2);
			this.survivalReqs[i].setRange(11, 70, 0);
			this.survivalReqs[i].setRange(71, 150, 3); 
		}
	}
	
	this.allRequirements = new Array(this.totalMagic, this.powerperc, this.astrology, this.scholar, this.teach, this.lore1, this.lore2);
	for (var i = 0; i < this.survivalReqs.length; i++) {
		this.allRequirements.push(this.survivalReqs[i]);
	}
}

moonMageRequirements.prototype.getRequirements = function (circle)
{
	var requirements = new Object();

	for (var i = 0; i < this.allRequirements.length; i++)
	{
		requirements[this.allRequirements[i]] = this.allRequirements[i].getRequirement(circle);
	}

	return requirements;	
}

moonMageRequirements.prototype.echoReport = function(currentCircle)
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
