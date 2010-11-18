include("circleRequirements/dragonrealms.js");
include("circleRequirements/requirements.js");

var circle = 0;
var guild = "";

script.addAction(function(text, c) { 
	circle = parseInt(c);
}, "Circle: (.+)");

script.addAction(function(text, g) {
	guild = g;
}, "Guild: (.+)");


script.put("info");
script.put("exp all");
script.pause(2);

if (guild == "Cleric") {
    include("circleRequirements/cleric.js");
	var clericReqs = new ClericRequirements();
	clericReqs.echoReport(circle);
} else if (guild == "Warrior Mage") {
    include("circleRequirements/warmage.js");
	var warmageReqs = new WarriorMageRequirements();
	warmageReqs.echoReport(circle);
} else if (guild == "Barbarian") {
   include("circleRequirements/Barbarian.js");
   var barbarianReqs = new BarbarianRequirements();
   barbarianReqs.echoReport(circle);
} else if (guild = "Moon Mage") {
   include("circleRequirements/moonmage.js");
   var moonMageReqs = new moonMageRequirements();
   moonMageReqs.echoReport(circle);
}
