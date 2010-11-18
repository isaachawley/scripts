/**
 * Warlock Dragonrealms Library v0.2.1
 *
 * The purpose of this code is to break up as much information as possible
 * about the game environment into a easy-to-use programmatic interface
 *
 * To use the Dragonrealms library:
 *  include("dragonrealms.js");
 *
 * By default, room exits and objects come in a big string from the game.
 * We do the hard work of splitting up the string into a list for you:
 * for (roomExit in game.getRoomExits()) {
 *   // do something with roomExit
 * }
 *
 * for (roomObject in game.getRoomObjects()) {
 *   // do something with roomObject
 * }
 *
 * if (game.countObjects("jadice flower") > 1) {
 *	script.put("get flower");
 *	script.put("eat flower");
 * }
 *
 * An example using experience: 
 *  script.put("exp all");
 *  script.waitForPrompt();
 *  for (skill in game.getExpSkills()) {
 *    var rank = game.getExp(skill).getRank();
 *    var percent = game.getExp(skill).getPercent();
 *    var mindState = game.getExp(skill).getMindState();
 *    if (game.getExp(skill).isMindLocked()) {
 *			// ..
 *    }
 *  }
 *
 *  var overallMindState = game.getOverallMindState();
 *  var tdps = game.getTdps();
 *  var favors = game.getFavors();
 *  var deaths = game.getDeaths();
 *
 *  Move multiple directions in one function call:
 *  move("north", "east", "west", ....);
 *
 *  Ease of use functions:
 *  put("'hello!");
 *  echo(message):
 *  waitForPrompt();
 *  waitForRe(regex);
 *  waitFor(string);
 *  pause(seconds);
 *
 *  Send a command, and wait for the prompt:
 *  putwait("power");
 *
 */

/* Check if this library has already been initialized */
if (!game) {

function Game ()
{
	this.exp = new Object();
	this.meleeListeners = new Array();
}

function EXP (skill) {
	this.skill = skill;
}

EXP.prototype.isMindLocked = function () {
	return this.mindState == "mind lock";
}

EXP.prototype.getRank = function () {
	return this.rank;
}

EXP.prototype.getPercent = function () {
	return this.percent;
}

EXP.prototype.getMindState = function () {
	return this.mindState;
}

EXP.prototype.request = function () {
	script.put("exp " + this.skill);
	script.waitForPrompt();
	script.pause(1);
}

function readExp (text, skill1, rank1, percent1, state1, text2, skill2, rank2, percent2, state2)
{
	if (game.exp[skill1] == null) { game.exp[skill1] = new EXP(skill1); }
	game.exp[skill1].rank = parseInt(rank1);
	game.exp[skill1].percent = parseInt(percent1);
	game.exp[skill1].mindState = state1;
	if (skill2 != null)
	{
		if (game.exp[skill2] == null) { game.exp[skill2] = new EXP(skill2); }
		game.exp[skill2].rank = parseInt(rank2);
		game.exp[skill2].percent = parseInt(percent2);
		game.exp[skill2].mindState = state2;
	}
}

Game.prototype.getRoomExits = function ()
{
	var exitsStr = "" + roomExits;
	exitsStr = exitsStr.replace(/Obvious .+:/, "");
	var exitArr = exitsStr.split(", ");
	delete exitArr.remove; // This deletes the remove method off of this object, which causes issues with for in exits
	return exitArr;
}

Game.prototype.getRoomObjects = function ()
{
	var objectsStr = "" + roomObjects;
	objectsStr = objectsStr.replace(/You notice (a|some)/, "");
	objectsStr = objectsStr.replace(/\.$/, "");
	var objectArr = objectsStr.split(/,\s|and\san?\s/);
	delete objectArr.remove; // This deletes the remove method off of this object, which causes issues with for in objects
	return objectArr;
}

/**
 * Count the number of objects that match the passed in string in the current room
 */
Game.prototype.countObjects = function (obj)
{
	var count = 0;
	var objs = this.getRoomObjects();
	script.echo(objs);
	for (var o = 0; o < objs.length; o++) {
		if (objs[o].indexOf(obj) > -1) {
			count++;
		}
	}
	return count;
}

Game.prototype.getOverallMindState = function ()
{
	return this.overallMindState;
}

Game.prototype.getTdps = function ()
{
	return this.tdps;
}

Game.prototype.getFavors = function ()
{
	return this.favors;
}

Game.prototype.getDeaths = function ()
{
	return this.deaths;
}

Game.prototype.getExpSkills = function ()
{
	return this.exp;
}

Game.prototype.getExp = function (skill)
{
	if (this.exp[skill] == null) {
		this.exp[skill] = new EXP(skill);
	}

	return this.exp[skill];
}

Game.prototype.requestExp = function (skill)
{
	script.put("exp " + skill);
	script.waitForPrompt();
	script.pause(1);

	return this.getExp(skill);
}

Game.prototype.addMeleeListener = function (listener)
{
	this.meleeListeners.push(listener);
}

Array.prototype.remove=function(s){
  for(i=0;i<this.length;i++){
    if(s==this[i]) this.splice(i, 1);
  }
}

Game.prototype.removeMeleeListener = function (listener)
{
	this.meleeListeners.remove(listener);
}

var game = new Game();

var mindStates = "clear|dabbling|perusing|learning|thoughtful|thinking|considering|pondering|ruminating|concentrating|attentive|deliberative|interested|examining|understanding|absorbing|intrigued|scrutinizing|analyzing|studious|focused|very focused|engaged|very engaged|cogitating|fascinated|captivated|engrossed|riveted|very riveted|rapt|very rapt|enthralled|nearly locked|mind lock";
script.addAction(readExp,"\\s+([^:]+):\\s+(\\d+)\\s(\\d+\\.?\\d*)%\\s(" + mindStates + ")(\\s+\\(\\d+/\\d+\\)\\s+([^:]+):\\s+(\\d+)\\s(\\d+)%\\s(" + mindStates + ")\\s+\\(\\d+/\\d+\\))?");

script.addAction(function (text, state) { game.overallMindState = state; }, "Overall state of mind:\\s+(.+)");
script.addAction(function (text, tdps, favors, deaths) {
	game.tdps = parseInt(tdps);
	game.favors = parseInt(favors);
	game.deaths = parseInt(deaths);
}, "Time Development Points: (\\d+)\\s+Favors: (\\d+)\\s+Deaths: (\\d+)");

script.addAction(function (text, critter) {
	/*for (var i = 0; i < meleeListeners.length; i++) {
		var listener = game.meleeListeners[i];
		listener(critter);
	}*/
}, "(.+) closes to melee range on you!");


function put(str) { script.put(str); }
function echo(str) { script.echo(str); }

function move(str) {
	if (arguments.length == 1) { script.move(str); }
	else {
		for (var i = 0; i < arguments.length; i++) {
			script.move(arguments[i]);
		}
	}
}

function waitForPrompt() { script.waitForPrompt(); }
function waitForRoundtime() { script.waitForRoundtime(); }
function waitFor(str) { script.waitFor(str); }
function waitForRe(str) { script.waitForRe(str); }
function pause(amount) { script.pause(amount); }

function putwait(str) {
	put(str);
	script.waitForPrompt();
}
}
