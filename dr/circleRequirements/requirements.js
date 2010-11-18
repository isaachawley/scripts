
function Requirement ()
{
	this.ranges = new Array();
}

Requirement.prototype.setRange = function(start, end, amount)
{
	for (var i = start - 1; i < end; i++) {
		this.ranges[i] = amount;
	}
}

Requirement.prototype.getRequirement = function (circle)
{
	var requirement = 0;
	for (var i = 0; i < circle ; i++) {
		requirement += this.ranges[i];
	}

	return requirement;
}

Requirement.prototype.meetsRequirement = function(circle, amount)
{
	var req = this.getRequirement(circle);
	var meetsReq = req <= amount;
	return meetsReq;
}

var MAGIC = 0;
var SURVIVAL = 1;
var LORE = 2;
var WEAPON = 3;
var ARMOR = 4;
	// exp groups

var groupSkills = new Array();
//groupSkills[MAGIC] = new Array(
//	"Primary Magic", "Harness Ability", "Power Perceive", "Magical Devices", "Targeted Magic"
//);

groupSkills[MAGIC] = new Array(
	"Arcana", "Harness Ability", "Power Perceive", "Targeted Magic"
);
/*
	Guild Scripts will need to add to this group their primary magic skill:
	"Arcane Magic" - Necromancers
	"Elemental Magic" - Bards & Warrior Mages
	"Holy Magic" - Clerics & Paladins
	"Inner Magic" - Barbarians, Thieves and Traders
	"Life Magic" - Empaths and Ranger
	"Lunar Magic" - Moon Mages
*/

groupSkills[SURVIVAL] = new Array(
	"Evasion", "Climbing", "Perception", "Hiding", "Lockpicking", "Disarm Traps", "Lockpicking", "Stalking", "Stealing", "First Aid", "Foraging", "Escaping", "Skinning", "Swimming"
);

groupSkills[LORE] = new Array(
	"Scholarship", "Mechanical Lore", "Appraisal", "Teaching", "Percussions", "Strings"
);

groupSkills[WEAPON] = new Array(
	"Light Edged", "Medium Edged", "Heavy Edged", "Twohanded Edged", "Medium Blunt", "Heavy Blunt", "Twohanded Blunt", "Slings", "Staff Sling", "Long Bow", "Composite Bow", "Short Bow", "Light Crossbow", "Heavy Crossbow", "Pikes", "Light Thrown", "Heavy Thrown", "Brawling"
);

groupSkills[ARMOR] = new Array(
	"Leather Armor", "Light Chain", "Heavy Chain", "Light Plate", "Heavy Plate"
);

var groupDescriptions = new Array("Magic", "Survival", "Lore", "Weapon", "Armor");

function GroupRequirement (group)
{
	this.ranges = new Array();
	this.group = group;
	this.groupDescription = groupDescriptions[group];
	this.skillNumber = 0;
}

function GroupRequirement (group, skillNumber)
{
	this.ranges = new Array();
	this.group = group;
	this.groupDescription = groupDescriptions[group];
	this.skillNumber = skillNumber;
}

GroupRequirement.prototype = new Requirement;

GroupRequirement.prototype.setSkillNumber = function (n) {
	this.skillNumber = n;
}

GroupRequirement.prototype.getTotalRanks = function()
{
	var totalRanks = 0;
	for (var i = 0; i < groupSkills[this.group].length; i++) {
		var skill = groupSkills[this.group][i];
		
		totalRanks += game.getExp(skill).getRank();
	}
	return totalRanks;
}

GroupRequirement.prototype.getHighestSkill = function (n)
{
	if (n == null) { n = 1; }

	var skills = groupSkills[this.group].slice();
	skills.sort(function(a,b) {
		return game.getExp(b).getRank() - game.getExp(a).getRank();
	});

	return skills[n-1];
}

GroupRequirement.prototype.getMaxCircleFromTotal = function ()
{
	var totalRanks = this.getTotalRanks();
	for (var circle = 1; 
		this.meetsRequirement(circle, totalRanks) && (circle < this.ranges.length);
		circle++) {
	}

	return circle;
}

GroupRequirement.prototype.getMaxCircleFromSkillNumber = function ()
{
	var n = this.skillNumber == null ? 1 : this.skillNumber+1;
	var highestSkill = this.getHighestSkill(n);
	var rank = game.getExp(highestSkill).getRank();

	for (var circle = 1; 
		this.meetsRequirement(circle, rank) && (circle < this.ranges.length);
		circle++) {
	}

	return circle;
}

GroupRequirement.prototype.getNeededRanksFromTotal = function (circle)
{
	var totalRanks = this.getTotalRanks();
	return (this.getRequirement(circle) - totalRanks);
}

GroupRequirement.prototype.getNeededRanksFromSkillNumber = function (circle)
{
	var n = this.skillNumber == null ? 1 : this.skillNumber+1;
	var highestSkill = this.getHighestSkill(n);
	var rank = game.getExp(highestSkill).getRank();
	return (this.getRequirement(circle) - rank);
}

function SkillRequirement (skill)
{
	this.skill = skill;
	this.ranges = new Array();
}

SkillRequirement.prototype = new Requirement;

SkillRequirement.prototype.getMaxCircle = function ()
{
	var rank = game.getExp(this.skill).getRank();
	for (var circle = 1; 
		this.meetsRequirement(circle, rank) && (circle < this.ranges.length);
		circle++) {
	}

	return circle;
}

SkillRequirement.prototype.getNeededRanks = function (circle)
{
	return (this.getRequirement(circle) - game.getExp(this.skill).getRank());
}
