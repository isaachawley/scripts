#TRAVEL SCRIPT 8/19/07
 ; -- This script was created by Kraelyst the Hand
 ; -- Most current version of this script available at
 ; -- http://www.lurksponge.com/travel

put set RoomNames
put set Description

deletefromhighlightstrings string="***"
AddToHighlightStrings string="***" forecolor=14 highlightEntireLine=True
AddToHighlightStrings string="***" forecolor=#FFFF00 highlightEntireLine=True
deletefromhighlightstrings string="* * *"
AddToHighlightStrings string="* * *" forecolor=15 highlightEntireLine=True
AddToHighlightStrings string="* * *" forecolor=#FFFFFF highlightEntireLine=True 

if_1 goto INSTRUCTIONS
GOTO NODESTINATION

INSTRUCTIONS:
ECHO
ECHO
ECHO
ECHO
ECHO
ECHO
ECHO
ECHO
ECHO
ECHO ========================================================
ECHO
ECHO *** VALID DESTINATIONS: Any settlement on the mainland
ECHO * * * Only the first 3 letters of the destination need to be inputed
ECHO * * * To see a full list of destinations begin the script without specifying a location
ECHO
ECHO ========================================================
ECHO 
pause
goto %1

CHECKLOCATION1:
pause
match leaveallferries ["Hodierna's Grace"]
match leaveallferries ["Kertigen's Honor"]
match leaveallferries ["Her Opulence"]
match leaveallferries ["His Daring Exploit"]
match leaveallferries Deck]
match leaveallferries a wooden flatboat mounted atop steel
match toleth1 [Southern Trade Route, Outside Leth Deriel]
match toleth2 [Deobar Bower Gate, Esouvar Deriel]
match tocrossing1 [The Crossing, Alfren's Ferry]
match tocrossing2 [Middens, Crossbow Bend]
match tocrossing3 [Eastern Tier, Outside Gate]
match tocrossing4 [Northeast Wilds, Outside Northeast Gate]
match tocrossing5 [North Turnpike, Forest]
match tocrossing6 [Mycthengelde, Flatlands]
match tocrossing7 [The Crossing Docks, South End]
match totiger1 [Grassland Path, Village Gate]
match toarthe1 [Valley, Village Gate]
match tokaerna [Northern Trade Road, Kaerna
match toriverhaven1 [Riverhaven, Ferry Dock]
match toriverhaven2 [Riverhaven, Pier]
match toriverhaven3 [Riverhaven, Stone Bridge]
match toriverhaven4 [Riverhaven Exterior, Southwest Gate]
match toriverhaven5 [Riverhaven, Outside North Gate]
match toriverhaven6 [Salt Yard, Barge Dock]
match tolang1 [Langenfirth, Wharf]
match tolang2 [North Road, River's Edge]
match tohorseclan [Gilen Otso Steppes, Grasslands]
match MUS-BARGE [Outside Muspar'i]
match GoDesertEast [Outside Muspar'i, Barge Platform]
match mus-hva Dry Dock]
match fal-fer bridge that once spanned the expanse of the river
match CHECKLOCATION2 You glance
put look
put glance
matchwait

CHECKLOCATION2:
pause
match totheren1 [Mistwood Forest, North of a Ravine]
match tofornsted1 [Arnshal Road, Keep Entrance]
match tostone2 [Lairocott Brach, Saverack]
match towolf1 [Wildulf Woods, Needlenose Creek]
match towolf2 [Wildulf Woods, Dirt Road]
match toknife1 [Wilderness, Gully]
match kni-tig [Knife Clan, Sentry]
match wol-tig towering trees of Wildulf Woods.
match ace-let [Acenamacra Pier]
match thr-riv Stone Docks, Covered Shore]
match sha-n [Shard, North Bridge]
match sha-e [Shard, East Bridge]
match sha-s [Shard, South Bridge]
match sha-w [Shard, West Bridge]
match skiff-ila [Ilaya Taipa, Baso Dock]
match startfaldesus The town of Riverhaven, the bridge's
match AINFERRY1-FORF [Haalikshal Highway, Ferry Dock]
match ainferry-ain [Ain Ghazal, Ferry Dock]
match toraven1 [Seord Kerwaith, North Gate]
match tohib1 [Haalikshal Highway, East Park]
match tohib2 [Gate to Hibarnhvidar]
match tohib3 [Outer Hibarnhvidar, Before the Great Gate]
match leaveallferries so that it slips through the water
match leaveallferries ["The Riverhawk"]
match leaveallferries ["Imperial Glory"]
match leaveskiff Skiff]

;BEGIN CUT BELOW THIS LINE
match todirge1 [Kraelyst's Home]
match NOSTART You glance
put look
put glance
matchwait
;END CUT ABOVE THIS LINE

startfaldesus:
pause
move se
move s
move s
move s
move se
move s
move se
goto croc-dir

tohib1:
pause
move go raven gate
move w
move w
move w
move s
move se
move se
move se
move go gate
goto %1

tohib2:
pause
move go gate
move e
move e
move e
move e
move e
move e
move se
move e
move e
move s
move se
move se
move se
move go gate
goto %1

tohib3:
pause
move go double gate
goto %1

toraven1:
pause
move go gate
move se
goto %1

toleth1:
pause
move go gate
move se
move se
move se
move se
move se
move se
move se
goto %1

toleth2:
pause
move go gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto %1

tocrossing1:
pause
move go square
move ne
move e
move e
tocrossinga7:
move e
move e
move ne
move go bridge
move ne
goto %1

tocrossing7:
pause
move out
goto tocrossinga7

tocrossing2:
pause
move ne
move n
move n
move w
move sw
move sw
move w
move w
move w
move n
move nw
move nw
move w
move s
move s
move sw
move w
tocrossing3:
pause
move go gate
move w
move w
move w
move w
goto %1

tocrossing4:
pause
move go gate
move w
move s
move s
move s
move s
move sw
move s
move s
move s
move w
move w
move w
goto %1

tocrossing5:
pause
move go arch
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
move s
move s
move s
move se
goto %1

tocrossing6:
pause
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
move s
move s
move s
move se
goto %1

totiger1:
pause
move go gate
pause
goto %1

towolf1:
move s
towolf2:
put sw
move s
goto %1

toknife1:
pause
pause
put go bridge
move n
goto %1

toarthe1:
pause
move up
move up
move w
goto %1

tokaerna:
pause
match to1kaerna [Kaerna Village, By the Well]
match tostone1 The store is squat but neat,
put go town gate
matchwait
to1kaerna:
move n
move ne
tostone1:
move go town gate
move nw
move nw
move n
move e
move e
goto %1

tostone2:
pause
put out
move down
move climb trail
goto %1

todirge1:
pause
put unlock door
pause
put open door
move go door
put close house
pause
put lock house
move n
move n
move se
move e
move e
move go path
goto %1

toriverhaven1:
pause
move go ramp
move go wooden archway
move ne
move w
goto %1

toriverhaven2:
pause
move e
move s
move e
move go wooden archway
move ne
move w
goto %1

toriverhaven3:
pause
move go east gate
move w
move w
move w
move w
move w
move w
move w
goto %1

toriverhaven4:
pause
move go narrow gate
move e
move e
move e
move e
move e
move e
move e
goto %1

toriverhaven5:
pause
move go north gate
move s
move s
move s
move s
move s
move s
move s
move s
move s
goto %1

toriverhaven6:
pause
move n
move n
move ne
move nw
move out
move w
move w
move w
move w
move w
move w
goto %1

tolang1:
pause
move w
move s
move w
goto %1

tolang2:
pause
put go bridge
match tolang2north Obvious paths: south.
match tolang2south Obvious paths: north.
matchwait
tolang2north:
pause
move s
move s
tolang2south:
pause
move go shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
goto %1

tofornsted1:
pause
move go gate
move e
move go ironwood door
move e
move go gate
goto %1

tohorseclan:
pause
move go path
pause
goto %1

BEGINSCRIPT:
pause
goto %1

fay:
fayr:
fayri:
fayrin:
fayrins:
fayrin's:
fayrin'sr:
fayrin'sre:
fayrin'sres:
fayrin'srest:
fayrinsr:
fayrinsre:
fayrinsres:
fayrinsrest:
fayre:
fayren:
fayren':
fayren's:
fayren'sr:
fayren'sre:
fayren'sres:
fayren'srest:
fayrens:
fayrensr:
fayrensre:
fayrensres:
fayrensrest:
mara:
maracheck:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-fay The greying wooden boards of the platform
match finish [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-ste Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-let hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

ste:
stee:
steel:
steelc:
steelcl:
steelcla:
steelclaw:
steelclawclan:
stea:
steal:
stealc:
stealcl:
stealcla:
stealclaw:
stealclawclan:
SCC:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-fay The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match finish [Steelclaw Clan, Entrance]
match sha-ste Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-let hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

sha:
shar:
shard:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match shard-directions Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-let hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

hor:
hors:
horse:
horsec:
horsecl:
horsecla:
horseclan:
zal:
zald:
zaldi:
zaldit:
zaldita:
zalditai:
zalditaip:
zalditaipi:
zalditaipa:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match sha-hor Wyvern Mountain towers far into the sky
match finish [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-let hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-hor [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

gon:
gond:
gondo:
gondol:
gondola:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match leth-exp1 The Pig's Pannage,
match finish Like an aerie forgotten in the wilderness
match finish [Gondola, Cab
match finish The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

let:
leth:
lethd:
lethde:
lethder:
lethderi:
lethderie:
lethderiel:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match gon-let Like an aerie forgotten in the wilderness
match leth-exp1 The Pig's Pannage,
match finish Sana'ati Dyaus Drui'tas]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

ace:
acen:
acena:
acenam:
acenama:
acenamac:
acenamacr:
acenamacra:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match gon-let Like an aerie forgotten in the wilderness
match leth-exp1 The Pig's Pannage,
match let-ace Sana'ati Dyaus Drui'tas]
match finish [Acenamacra Pier]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

alf:
alfr:
alfre:
alfren:
alfrens:
alfren's:
alfren'sf:
alfren'sfe:
alfren'sfer:
alfren'sferr:
alfren'sferry:
alfrensf:
alfrensfe:
alfrensfer:
alfrensferr:
alfrensferry:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match finish Segoltha South Bank]
match gon-let Like an aerie forgotten in the wilderness
match leth-exp1 The Pig's Pannage,
match let-alf Sana'ati Dyaus Drui'tas]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

cro:
cros:
cross:
crossi:
crossin:
crossing:
crossings:
thec:
thecr:
thecro:
thecros:
thecross:
thecrossi:
thecrossin:
thecrossing:
thecrossings:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match tig-cro The Pig's Pannage,
match finish facade of the First Provincial Bank
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

art:
arth:
arthe:
arthed:
artheda:
arthedal:
arthedale:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match dir-sto [North Roads Caravansary]
match sto-art You travel through a small
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match cro-art facade of the First Provincial Bank
match tig-cro The Pig's Pannage,
match finish small, white-washed sign staked along
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

kae:
kaer:
kaern:
kaerna:
kaernav:
kaernavi:
kaernavil:
kaernavill:
kaernavilla:
kaernavillag:
kaernavillage:
kea:
kear:
kearn:
kearna:
kearnav:
kearnavi:
kearnavil:
kearnavill:
kearnavilla:
kearnavillag:
kearnavillage:
match sto-kae You travel through a small
match art-kae small, white-washed sign staked along
match stoneclan Obvious exits:
match stoneclan Obvious paths:
put look
matchwait


sto:
ston:
stone:
stonec:
stonecl:
stonecla:
stoneclan:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match dir-sto [North Roads Caravansary]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match cro-art facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match tig-cro The Pig's Pannage,
match finish You travel through a small
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

car:
cara:
carav:
carava:
caravan:
caravans:
caravansa:
caravansar:
caravansary:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match CRO-CAR facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match tig-cro The Pig's Pannage,
match finish [North Roads Caravansary]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

dir:
dirg:
dirge:
dark:
darks:
darkst:
darksto:
darkston:
darkstone:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match CRO-CAR facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match tig-cro The Pig's Pannage,
match todirge2 [North Roads Caravansary]
match finish [Dirge
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

nor:
nort:
north:
northr:
northro:
northroa:
northroad:
northroadf:
northroadfe:
northroadfer:
northroadferr:
northroadferry:
northroadd:
northroaddo:
northroaddoc:
northroaddock:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match finish [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match CRO-CAR facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match tig-cro The Pig's Pannage,
match car-northroad [North Roads Caravansary]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

riv:
rive:
river:
riverh:
riverha:
riverhav:
riverhave:
riverhaven:
hav:
have:
haven:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match finish [Riverhaven, Town Square]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

fal:
fald:
falde:
faldes:
faldesu:
faldesur:
faldesuri:
faldesuriv:
faldesurive:
faldesuriver:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match CRO-CAR facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-faldesu [North Roads Caravansary]
match tig-cro The Pig's Pannage,
match fer-faldesu [North Road, Ferry]
match riv-faldesu [Riverhaven, Town Square]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

thr:
thro:
thron:
throne:
thronec:
throneci:
thronecit:
thronecity:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match riv-thr [Riverhaven, Town Square]
match finish Stone Docks, Covered Shore]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait


ros:
ross:
rossm:
rossma:
rossman:
rossmans:
rossman's:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-the Wheels and hooves clatter on the wood
match elb-the [El'Bain's Stop, Picnic Area]
match skillcheck7 [North Road, Barony Pass]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match finish [Rossman's Landing, Southeast Gate]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

the:
ther:
there:
theren:
therenb:
therenbo:
therenbor:
therenboro:
therenborou:
therenboroug:
therenborough:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match lan-the Wheels and hooves clatter on the wood
match elb-the [El'Bain's Stop, Picnic Area]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match finish [North Road, Barony Pass]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

lan:
lang:
lange:
langen:
langenf:
langenfi:
langenfir:
langenfirt:
langenfirth:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match the-lan [North Road, Barony Pass]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match finish Wheels and hooves clatter on the wood
match elb-lan [El'Bain's Stop, Picnic Area]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

for:
forn:
forns:
fornst:
fornste:
fornsted:
fornstea:
fornstead:
match hva-for [Arnshal Road, Mountain Approach]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match lan-the Wheels and hooves clatter on the wood
match elb-the [El'Bain's Stop, Picnic Area]
match the-for [North Road, Barony Pass]
match tig-cro The Pig's Pannage,
match finish [Outside the Fornsted Walls]
match GROUPCHECK11 [North Road, Ferry]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

hva:
hvar:
hava:
havar:
hvara:
havarl:
hvaral:
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match lan-the Wheels and hooves clatter on the wood
match elb-the [El'Bain's Stop, Picnic Area]
match the-for [North Road, Barony Pass]
match for-hva [Outside the Fornsted Walls]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match finish [Arnshal Road, Mountain Approach]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

mus:
musp:
muspa:
muspar:
muspari:
muspar'i:
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match lan-the Wheels and hooves clatter on the wood
match elb-the [El'Bain's Stop, Picnic Area]
match the-for [North Road, Barony Pass]
match for-hva [Outside the Fornsted Walls]
match hva-mus [Arnshal Road, Mountain Approach]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

tig:
tige:
tiger:
tigerc:
tigercl:
tigercla:
tigerclan:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match cro-tig facade of the First Provincial Bank
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match finish The Pig's Pannage,
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

wol:
wolf:
wolfc:
wolfcl:
wolfcla:
wolfclan:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match cro-tig facade of the First Provincial Bank
match tig-wol The Pig's Pannage,
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

kni:
knif:
knife:
knifec:
knifecl:
knifecla:
knifeclan:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match cro-tig facade of the First Provincial Bank
match tig-kni The Pig's Pannage,
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

el:
elb:
elba:
elbai:
elbain:
elbains:
elbain's:
el':
el'b:
el'ba:
el'bai:
el'bain:
el'bains:
el'bain's:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match the-elb [North Road, Barony Pass]
match gon-let Like an aerie forgotten in the wilderness
match let-cro Sana'ati Dyaus Drui'tas]
match ferry-cro Segoltha South Bank]
match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
match art-sto small, white-washed sign staked along
match sto-dir You travel through a small
match dir-car [Dirge, Outside Gate]
match dir-riv [North Roads Caravansary]
match riv-ros [Riverhaven, Town Square]
match ros-the [Rossman's Landing, Southeast Gate]
match lan-elb Wheels and hooves clatter on the wood
match finish [El'Bain's Stop, Picnic Area]
match tig-cro The Pig's Pannage,
match GROUPCHECK11 [North Road, Ferry]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match ila-let hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

ila:
ilay:
ilaya:
ilayat:
ilayata:
ilayatai:
ilayataip:
ilayataipa:
tai:
taip:
taipa:
ill:
illa:
illay:
illaya:
illayat:
illayata:
illayatai:
illayataip:
illayataipa:
ile:
iley:
ileya:
ileyat:
ileyata:
ileyatai:
ileyatap:
ileyataipa:
riverc:
rivercl:
rivercla:
riverclan:
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match gon-let Like an aerie forgotten in the wilderness
match tig-cro The Pig's Pannage,
match let-ila Sana'ati Dyaus Drui'tas]
match on-gondola [Gondola, Cab
match south-platform The greying wooden boards of the platform
match fay-gon [Fayrin's Rest, Anloraten Crossing]
match ste-fay [Steelclaw Clan, Entrance]
match sha-gon Wyvern Mountain towers far into the sky
match hor-sha [Zaldi Taipa, Cedar Path]
match finish hard to see the road beyond the
match ain-ila Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match raven2-raven1 [Raven's Point, Gear Gate]
match rav-sha [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

ain:
aing:
aingh:
aingha:
ainghaz:
ainghaza:
ainghazal:
ainga:
aingaz:
aingaza:
aingazal:
aingah:
aingahz:
aingahza:
aingahzal:
aingazh:
aingazha:
aingazhal:
aingazah:
aingazahl:
gha:
ghaz:
ghaza:
ghazal:
gaz:
gaza:
gazal:
gah:
gahz:
gahza:
gahzal:
gazh:
gazha:
gazhal:
gazah:
gazahl:
pause
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match GETCROSSINGDOKORA facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match GETLETHDOKORA Sana'ati Dyaus Drui'tas]
match gon-let Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match sha-rav Wyvern Mountain towers far into the sky
match hor-rav [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-ain hard to see the road beyond the
match finish Ghazal, East Pier]
match forf-ain The Dwarven road, smoothly cobbled,
match GetHibDokora [Inner Hibarnhvidar, Entry]
match GetRavenDokora [Raven's Point, Gear Gate]
match raven1-raven2 [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

out:
oute:
outer:
outerh:
outerhi:
outerhib:
outerhiba:
outerhibar:
outerhibarn:
outerhibarnh:
outerhibarnhv:
outerhibarnhvi:
outerhibarnhvid:
outerhibarnhvida:
outerhibarnhvidar:
hib:
hiba:
hibar:
hibarn:
hibarnh:
hibarnhv:
hibarnhvi:
hibarnhvid:
hibarnhvida:
hibarnhvidar:
hibarnv:
hibarnvh:
hibarnvhi:
hibarnvhid:
hibarnvhida:
hibarnvhidar:
hibarnvi:
hibarnvid:
hibarnvida:
hibarnvidar:
inn:
inne:
inner:
innerh:
innerhi:
innerhib:
innerhiba:
innerhibar:
innerhibarn:
innerhibarnh:
innerhibarnhv:
innerhibarnhvi:
innerhibarnhvid:
innerhibarnhvida:
innerhibarnhvidar:
pause
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match GETCROSSINGDOKORA facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match sha-rav Wyvern Mountain towers far into the sky
match hor-rav [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-ain hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-hib The Dwarven road, smoothly cobbled,
match hibfinish [Inner Hibarnhvidar, Entry]
match rav-forf [Raven's Point, Gear Gate]
match raven1-raven2 [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

boa:
boar:
boarc:
boarcl:
boarcla:
boarclan:
pause
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match GETCROSSINGDOKORA facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match sha-rav Wyvern Mountain towers far into the sky
match hor-rav [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-ain hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-hib The Dwarven road, smoothly cobbled,
match hib-boa [Inner Hibarnhvidar, Entry]
match rav-forf [Raven's Point, Gear Gate]
match raven1-raven2 [Seord Kerwaith, Gear Gate]
match finish [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

rav:
rave:
raven:
ravens:
ravensp:
ravenspo:
ravenspoi:
ravenspoin:
ravenspoint:
raven':
raven's:
raven'sp:
raven'spo:
raven'spoi:
raven'spoin:
raven'spoint:
pause
match hva-for [Arnshal Road, Mountain Approach]
match for-the [Outside the Fornsted Walls]
match lan-riv Wheels and hooves clatter on the wood
match elb-riv [El'Bain's Stop, Picnic Area]
match the-ros [North Road, Barony Pass]
match ros-riv [Rossman's Landing, Southeast Gate]
match fer-dir [North Road, Ferry]
match riv-dir [Riverhaven, Town Square]
match dir-car [Dirge, Outside Gate]
match car-cro [North Roads Caravansary]
match sto-art You travel through a small
match art-cro small, white-washed sign staked along
match leth-exp2 facade of the First Provincial Bank
match fer-let Segoltha South Bank]
match let-gon Sana'ati Dyaus Drui'tas]
match north-platform Like an aerie forgotten in the wilderness
match on-gondola [Gondola, Cab
match gon-sha The greying wooden boards of the platform
match fay-ste [Fayrin's Rest, Anloraten Crossing]
match ste-sha [Steelclaw Clan, Entrance]
match sha-rav Wyvern Mountain towers far into the sky
match hor-rav [Zaldi Taipa, Cedar Path]
match leth-exp1 The Pig's Pannage,
match ila-ain hard to see the road beyond the
match ain-forf Ghazal, East Pier]
match forf-rav The Dwarven road, smoothly cobbled,
match hib-forf [Inner Hibarnhvidar, Entry]
match finish [Raven's Point, Gear Gate]
match finish [Seord Kerwaith, Gear Gate]
match boa-hib [Boar Clan, Before the Gate]
match CHECKLOCATION1 You glance
put look
put glance
matchwait

nen:
nena:
nenav:
nenavd:
nenavde:
nenavdel:
nenavdela:
nenavdelar:
nenavda:
nenavdal:
nenavdala:
nenavdalar:
pause
ECHO
ECHO *** Just Kidding!  Nobody knows where the lost village of Nenav Delar is located!
ECHO *** Let me know if you find it!
ECHO
pause
pause
ECHO
ECHO *** Here's the story from the book "The Lost Village" by Trefinja Giln
ECHO ==============================
ECHO It was a cool fall afternoon in the year 157; we were having our typical meeting of the clan council discussing matters for our coming weeks festivities.  The light-hearted discussions within the council's chamber was abruptly shattered by a young Dwarven messenger.  The trembling and bloodied messenger barely managed to make it through the entrance before collapsing to the ground.  His bloodshot and glassy eyes looked up at me as I stood over him, he clasped my hand and said in a dusky, broken voice, "Nenav... Dalar... village in the mountains... slaves... help them... help... them."  He closed his eyes and breathed his last breath.  I immediately called for the village Empath but it was too late, he could not be saved.  In his right hand he was clutching a tattered and torn piece of parchment which I soon pried loose from his grip, and it read:               
ECHO 
ECHO -------------------                                   
ECHO Khenea's Prophecy                                     
ECHO -------------------                                   
ECHO                                                       
ECHO The watchers wait on a Hero's breath.                 
ECHO To bring forth an end to darkness reign.              
ECHO Death shall sow, and time will burn, before the Hero comes.                                                
ECHO 
ECHO Now time won't slay the ancient wrong                 
ECHO Nor part the evil's deed                              
ECHO In blood they plead, in heart as one, one day the Hero comes.                                                
ECHO 
ECHO When the new day opens and travelers approach         
ECHO The curse is nears its end                            
ECHO All could be the one we need, so watch... the Hero comes.                                                
ECHO 
ECHO And so it shall... come to pass                       
ECHO What evil made, be undone                             
ECHO By the Hero's hand we do await, for now the Hero comes.                                                
ECHO 
ECHO But fail it could this rite of good                   
ECHO And lead us down the starry road                      
ECHO 
ECHO If the Kvika Heart is not retrieved, then death is what will come.                                       
ECHO 
ECHO So we pray the answer will unfold                     
ECHO The prophecy we do speak                              
ECHO We wait on one to liberate, our souls... our lives... 
ECHO we seek.                                              
ECHO 
ECHO Please my lord, heed Khenea's prophecy and send us    
ECHO help.  I don't know how much longer we can wait, just 
ECHO follow along the great mountains on the edge of the   
ECHO horizon until you find the break in the...            
ECHO                                                       
ECHO --------------------------------------                
ECHO The rest of the parchment was torn off                
ECHO --------------------------------------                
ECHO                                                       
ECHO After receiving this letter we searched for more information about this hidden village, but unfortunately we found nothing.  I write this journal in hopes that someday someone will be able to resume the search and maybe decipher the cryptic message within the parchment.  
ECHO                          
ECHO ===========================
ECHO
EXIT

GON-LET:
ECHO
ECHO * * * Leaving the Dragonspine Mountains via the Obsidian Pass
ECHO * * * Beware of snowbeasts, particularly down that track
ECHO
pause
move go ridge
move n
move ne
move nw
move n
move n
move ne
move ne
move n
move ne
move n
move ne
move n
move ne
move n
move ne
move ne
move e
move e
move n
move n
move ne
move n
move ne
move n
move ne
move e
move ne
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move ne
move ne
move n
move n
move ne
move ne
ECHO
ECHO
ECHO * * * Now nearing the Endrus Forest, home to Leth Deriel.
ECHO
UNDERGONDOLA-LETH:
pause
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move ne
move n
move n
move n
move n
move ne
move ne
move ne
move n
move n
move ne
move ne
move n
move n
ECHO
ECHO
ECHO * * * Passing by the the manor of Lasarhhtha Oshu'ehhrsk the Bone Dancer
ECHO * * * Home to bone wolves, zombies, germish'din, and kartais
ECHO
move ne
move ne
move n
move ne
move go gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
ECHO
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Constructed around the sacred Sana'ati Dyaus tree 
ECHO ===================
ECHO
goto %1

LET-ACE:
pause
move ne
move ne
move ne
move ne
move ne
move ne
move ne
move go e'erdream gate
move ne
move e
move ne
move se
move ne
move ne
move go sequoia tunnel
move go eastern opening
move ne
move e
move ne
move n
move ne
move ne
move e
move go rope bridge
move go north face
move e
move go crevice
move e
move ne
move go cavern opening
move n
move ne
move e
move ne
move ne
move ne
move e
move ne
move ne
move ne
move ne
move ne
move ne
move e
move down
move down
move down
move down
move e
move e
move e
move go pier
pause
ECHO
ECHO *** ACENAMACRA PIER - GATEWAY TO M'RISS
ECHO *** On the Bay of Nemethyo
ECHO
goto %1

ACE-LET:
pause
move go beach
move w
move w
move w
move go cliff trail
move up
move up
move up
move w
move sw
move sw
move sw
move sw
move sw
move sw
move w
move sw
move sw
move sw
move w
move sw
move s
move go cave
move sw
move w
move go opening
move w
move go rope bridge
move go south face
move w
move sw
move sw
move s
move sw
move w
move sw
move go sequoia tunnel
move go western opening
move sw
move sw
move nw
move sw
move w
move sw
move sw
move go e'erdream gate
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move sw
ECHO
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Created by the Forest and Celestial Elves 
ECHO ===================
ECHO
goto %1

LET-CRO:
SAVE PAS-CRO
CHECKGUILD2:
match GROUPCHECK5 Guild: Thief
match MONEYCHECK5 Gender:
put info
matchwait

GROUPCHECK5:
pause
match BURDENCHECK5 You have no group
match BURDENCHECK5 You must be visible
match MONEYCHECK5 You whisper
put whisper group ...
matchwait

BURDENCHECK5:
pause
match SWIMCHECK5A Encumbrance : none
match SWIMCHECK5A Encumbrance : light
match SWIMCHECK5B Encumbrance : somewhat
match SWIMCHECK5C Encumbrance : Burdened
match SWIMCHECK5D Encumbrance : Heavy
match SWIMCHECK5E Encumbrance : Very Heavy
match SWIMCHECK5F Overburdened
match SWIMCHECK5G Encumbrance : Tottering
match SWIMCHECK5H even able to move?
match SWIMCHECK5I amazing you aren't squashed!
put info
matchwait

SWIMCHECK5A:
pause
match LET-CRO-CONT Swimming:
match MONEYCHECK5 EXP HELP
put experience survival 25
matchwait

SWIMCHECK5B:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 40
matchwait

SWIMCHECK5C:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 75
matchwait

SWIMCHECK5D:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 110
matchwait

SWIMCHECK5E:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 140
matchwait

SWIMCHECK5F:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 175
matchwait

SWIMCHECK5G:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 210
matchwait

SWIMCHECK5H:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 240
matchwait

SWIMCHECK5I:
pause
match LET-CRO-CONT Swimming:
match OVERBURDENED5 EXP HELP
put experience survival 275
matchwait

OVERBURDENED5:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY
ECHO
GOTO MONEYCHECK5

MONEYCHECK5:
pause
SAVE FER-CRO
match LET-CRO-CONT I don't know who you are referring to.
match LET-CRO-CONT But no one can see you.
match GETMONEYLETH But you don't have that much!
match GETMONEYLETH You consider the offer and then realize
put tip zzzzzz 35 kronar
matchwait

GETMONEYLETH:
pause
move e
move e
move go ebony door
move u
put withdraw 35 copper
pause
put withdraw 35 copper
move d
move out
move w
move w
goto LET-CRO-CONT

let-alf:
SAVE toalfren
goto LET-CRO-CONT

LET-CRO-CONT:
pause
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move go bower gate
move nw
move n
move n
move nw
move nw
move n
move n
move nw
move nw
move ne
move n
move ne
move ne
move ne

WEBNORTH1:
match NOWEBNORTH Along the north, the trees and shrubs
match WEBNORTH2 Roundtime
match WEBNORTH2 You can't do that while
match WEBNORTH2 ...wait
put ne
MATCHWAIT

WEBNORTH2:
pause
ECHO
ECHO *** You are stuck in a spider's web.  Be patient.
ECHO
match WEBNORTH1 Using your escape
match WEBNORTH1 The webs break apart and fall away, releasing you.
matchwait

NOWEBNORTH:
move nw
move nw
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Passing the Forest of Night, created by mad mage Sithsia
ECHO * * * Home to nyads, dryads, and death spirits
ECHO
move ne
move nw
move n
move ne
move ne
move ne
move n
move n
move nw
move nw
move n
move ne
move ne
move ne
move ne
move n
GOTO %s

toalfren:
ECHO
ECHO
ECHO * * * Leaving the Endrus Forest and entering the flood plains of the Segoltha
ECHO 
pause
move n
move n
move n
ECHO
ECHO *** ALFREN'S FERRY
ECHO
goto %1

FER-CRO:
ECHO
ECHO
ECHO * * * Leaving the Endrus Forest and entering the flood plains of the Segoltha
ECHO 
pause
move n
move n
move n
goto FERRY-CRO

CROSSINGFERRYNORTH:
put stand
pause
put go ferry
match WAITFORCROSSINGFERRYNORTH wait for the next one.
match WAITFORCROSSINGFERRYNORTH until the next one arrives.
match WAITFORCROSSINGFERRYNORTH I could not find what you were referring to.
match WAITFORCROSSINGFERRYNORTH What were you referring to?
match WAITFORCROSSINGFERRYNORTH There is no ferry here to go aboard.
match WAITONCROSSINGFERRYNORTH You hand him your
match WAITONCROSSINGFERRYNORTH The Captain gives you a little nod
match WAITONCROSSINGFERRYNORTH You silently slip aboard,
match WAITONCROSSINGFERRYNORTH But I see you're pretty young
match GETMONEYCROSSINGFERRYNORTH You haven't got enough
matchwait

WAITFORCROSSINGFERRYNORTH:
;put hide
ECHO
ECHO ============================
ECHO *** WAITING FOR THE FERRY TO ARRIVE
ECHO *** It costs 35 Kronars to ride (unless you are a citizen of Zoluren)
ECHO *** If you don't have enough it's time to start begging
ECHO ============================
ECHO
put wealth kronar
waitfor pulls into the
goto CROSSINGFERRYNORTH

GETMONEYCROSSINGFERRYNORTH:
ECHO
ECHO *** NOT ENOUGH KRONARS FOR THE FERRY! ***
ECHO
EXIT

WAITONCROSSINGFERRYNORTH:
;put hide
pause
ECHO
ECHO *** Riding the ferry north across the mighty Segoltha River toward The Crossing, heart of the Five Provinces
ECHO
pause 45
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 5
ECHO
ECHO * * * The Crossing is also known as River Crossing because it is the site where the Oxenwaithe River crosses the mighty Segoltha River
ECHO * * * The Segoltha River runs from the Himineldar Shel Mountains near Ain Ghazal all the way to the Reshal Sea
ECHO * * * It is large enough for galleons to sail upon all the way upriver to Ain Ghazal
ECHO ====================================
ECHO
pause 60
ECHO
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 5
ECHO
ECHO * * * The Crossing is the heart of the Five Provinces and has seen many wars
ECHO
ECHO * * * Akroeg led the Ram Clan in gathering and conquering most of the continent under one banner.
ECHO * * * When Akroeg died his son Verek created the Seven Starred Empire from the Ram Clan.
ECHO
ECHO * * * When the Empire collapsed Lanival The Reedemer fought Teiro
ECHO * * *  in the Resistance Wars and divided the continent into Five Provinces.
ECHO
ECHO * * * Lanival was known as the Dragon and so the lands became known as the Dragon's Realms.
ECHO * * * At the end of the war, Lanival founded The Crossing at the center of the former Empire.
ECHO
ECHO * * * The 10 months of the calendar are named for great figures in history, particularly in the time of Lanival.
ECHO * * * You can read more in "Human Histories: Lanival's Tale" at the Asemath Academy in The Crossing
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 3 of 5
ECHO
ECHO * * * In more recent days The Crossing has seen war with the Gorbesh, Lord Sorrow, and the Outcasts
ECHO
ECHO * * * The Gorbesh hail from the continent of Albaria.  During their invasion
ECHO * * * they destroyed the gweth mines of Zoluren and the Crossing temple.
ECHO * * * Gorbesh fortresses can still be found throughout the provinces
ECHO ====================================
ECHO
pause 30
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 4 of 5
ECHO
ECHO * * * Lord Sorrow lived in the Reach east of Kaerna and Stone Clan among the S'lai who fought for him
ECHO * * * He was a Moon Mage of immense powers whose life was magically lengthened, he was once offered a seat on the Moon Mage council
ECHO * * * Lord Sorrow brought war in 359 AV with the help of Shartug, Darkensi, Prayk, and Parnore
ECHO * * * He died while trying to harness the power of the Zaulfung Stones near Riverhaven
ECHO ====================================
ECHO
pause 30
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 5 of 5
ECHO
ECHO * * * The Outcasts are named because they were thrown out of Shard many years ago
ECHO * * * Around 375 AV the Outcasts, led by King Raenilar, marched from the deserts north of Therengia down to Shard
ECHO * * * They brought war to all the provinces with help from Goblin Prince Tnok, Grishnok, the Shark Clan, Jomay, Naarg, and others
ECHO * * * The Outcasts murdered Ferdahl Kukalakai and occupied Ilithi until one day with little warning they left Ilithi in peace
ECHO ====================================
ECHO 
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
move go square
move ne
move e
move e
move e
move e
move ne
move go bridge
move ne
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO *** Capitol of the province of Zoluren
ECHO *** Located where the Oxenwaithe River crosses the mighty Segoltha River.
ECHO ===================
ECHO
goto %1

FERRY-CRO:
CHECKGUILD10:
match GROUPCHECK10 Guild: Thief
match cro-exp1 Gender:
put info
matchwait

cro-exp1:
match seg-cro Swimming:
match CROSSINGFERRYNORTH EXP HELP
put exp survival 300
matchwait

seg-cro:
move s
move go foot
move w
move w
move w
move w
move w
move n
move n

seg-north:
match seg-north You wade
match roomcheck You can't swim in that direction.
match seg-north You swim
match seg-north You slap
match seg-north You struggle
match seg-north You flounder
match seg-north make much headway
match seg-north ...wait
match seg-north type ahead
put swim north 
matchwait

roomcheck:
match seg-north-current Obvious paths: east, west
match seg-north-end Obvious paths: east, southeast, south, southwest, west.
put look
matchwait

seg-north-current:
put swim west
waitfor Roundtime
goto seg-north

seg-north-end:
move climb bank
move nw
move go grass
move ne
move n
move ne
move n
move nw
move n
goto %1


GROUPCHECK10:
pause
match BURDENCHECK10 You have no group
match BURDENCHECK10 You must be visible
match CROSSINGFERRYNORTH You whisper
put whisper group ...
matchwait

BURDENCHECK10:
pause
match SWIMCHECK10A Encumbrance : None
match SWIMCHECK10B Encumbrance : light
match SWIMCHECK10C Encumbrance : Somewhat
match SWIMCHECK10D Encumbrance : Burdened
match SWIMCHECK10E Encumbrance : Heavy
match SWIMCHECK10E Encumbrance : Very Heavy
match SWIMCHECK10F Overburdened
match SWIMCHECK10G Encumbrance : Tottering
match SWIMCHECK10H even able to move?
match SWIMCHECK10I amazing you aren't squashed!
put info
matchwait

SWIMCHECK10A:
pause
match PAS-CRO1 Swimming:
match CROSSINGFERRYNORTH EXP HELP
put experience survival 25
matchwait

SWIMCHECK10B:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 40
matchwait

SWIMCHECK10C:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 70
matchwait

SWIMCHECK10D:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 120
matchwait

SWIMCHECK10E:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 150
matchwait

SWIMCHECK10F:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 200
matchwait

SWIMCHECK10G:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 250
matchwait

SWIMCHECK10H:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 300
matchwait

SWIMCHECK10I:
pause
match PAS-CRO1 Swimming:
match OVERBURDENED10 EXP HELP
put experience survival 350
matchwait

OVERBURDENED10:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY  NORTH
ECHO
GOTO CROSSINGFERRYNORTH

PAS-CRO1:
move s
move s
move s
goto PAS-CRO

PAS-CRO:
match FER-CRO I could not find
match FER-CRO What were you referring to?
match PASNORTH You duck quietly
put go boulder
matchwait

PASNORTH:
move go root
move ne
move e
move ne
move down
ECHO
ECHO
ECHO * * * You have entered the fabled 5th Passage of which many Thieves spent years trying to find
ECHO
MPN:
pause
put n
match MPN1 You wade north
match MPN You slap
match MPN You struggle
match MPN You flounder
match MPN make much headway
match MPN ...wait
match MPN type ahead
matchwait

MPN1:
pause
put ne
match MPN2 You swim northeast
match MPN1 You slap
match MPN1 You struggle
match MPN1 You flounder
match MPN1 make much headway
match MPN1 ...wait
match MPN1 type ahead
matchwait

MPN2:
pause
put ne
match MPN3 You swim northeast
match MPN2 You slap
match MPN2 You struggle
match MPN2 You flounder
match MPN2 make much headway
match MPN2 ...wait
match MPN2 type ahead
matchwait

MPN3:
pause
put n
match MPN4 You swim north
match MPN3 You slap
match MPN3 You struggle
match MPN3 You flounder
match MPN3 make much headway
match MPN3 ...wait
match MPN3 type ahead
matchwait

MPN4:
pause
put up
match MPN5 You swim up
match MPN4 You slap
match MPN4 You struggle
match MPN4 You flounder
match MPN4 make much headway
match MPN4 ...wait
match MPN4 type ahead
matchwait

MPN5:
pause
put ne
match MPN6 You swim northeast
match MPN5 You slap
match MPN5 You struggle
match MPN5 You flounder
match MPN5 make much headway
match MPN5 ...wait
match MPN5 type ahead
matchwait

MPN6:
pause
put ne
match MPN7 You wade northeast
match MPN6 You slap
match MPN6 You struggle
match MPN6 You flounder
match MPN6 make much headway
match MPN6 ...wait
match MPN6 type ahead
matchwait

MPN7:
pause
put north
match MPN8 You splash north
match MPN7 You slap
match MPN7 You struggle
match MPN7 You flounder
match MPN7 make much headway
match MPN7 ...wait
match MPN7 type ahead
matchwait

MPN8:
pause
put north
match MPN9 You splash north
match MPN8 You slap
match MPN8 You struggle
match MPN8 You flounder
match MPN8 make much headway
match MPN8 ...wait
match MPN8 type ahead
matchwait

MPN9:
pause
move climb step
move out
move s
move e
move go ware
move up
move n
move out
move s
move s
move go bridge
move ne
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO *** Capitol of the province of Zoluren
ECHO *** Located where the Oxenwaithe River crosses the mighty Segoltha River.
ECHO ===================
ECHO
GOTO %1

GETCROSSINGDOKORA:
pause
match leth-exp2 I don't know who you are referring to.
match leth-exp2 But no one can see you.
match GETCROSSING2 But you don't have that much!
match GETCROSSING2 You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GETCROSSING2:
pause
move go bank
move go window
put withdraw 3 silver
pause
move out
move go booth
put exchange 3 silver kronar to dokora
pause
move out
move out
goto leth-exp2

GETCROSSINGMONEYNORTH:
pause
match CRO-CAR I don't know who you are referring to.
match CRO-CAR But no one can see you.
match GETMONEY2 But you don't have that much!
match GETMONEY2 You consider the offer and then realize
put tip zzzzzz 30 lirum
matchwait

GETMONEY2:
pause
move go bank
move go window
put withdraw 1 silver
pause
move out
move go booth
put exchange 1 silver kronar to lirum
pause
move out
move out
goto CRO-CAR

CRO-ART:
pause
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union since 366!
ECHO
move n
move n
move n
move e
move e
move n
move w
move n
move w
move n
move w
move w
move go crumbling archway
move n
move ne
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO 
move ne
move e
move ne
move go birch copse
move se
move e
move e
move ne
move ne
move e
move nw
move n
move n
move ne
move nw
move n
move n
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO *** A Halfling village, founded by Daffleberry Tanglefoot
ECHO *** Patron god is Glythtide the ram, god of joy, wine, song, and fellowship, and patron to Bards, gourmands, and drunks
ECHO ===================
ECHO
GOTO %1

ART-KAE:
pause
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
move n
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO *** Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO *** Westward is the Journelai Route towards the Journelai mountains, inhabited by rock trolls
ECHO ===================
ECHO
goto finish

ART-STO:
pause
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO *** Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO *** Westward is the Journelai Route towards the Journelai mountains, inhabited by rock trolls
ECHO ===================
ECHO
pause
move n
move ne
move go town gate
move nw
move nw
move n
move e
move e
ECHO
ECHO ===================
ECHO *** STONE CLAN aka STAAN STOK (in Dwarven Haakish)
ECHO *** Home to the Stone Clan Militia, led by Paragon Redarch
ECHO *** Site of the book of power which was sought by Lord Sorrow and which could remove the wards on the Zaulfung Stones.
ECHO ===================
ECHO
GOTO %1

STO-DIR:
pause
move n
move n
move ne
move n
move e
move e
move ne
ECHO
ECHO
ECHO * * * Passing a wilderness path where leucros, vipers, geni, and rock guardians dwell
ECHO
move ne
move nw
move n
move n
move n
move n
move n
move n
move go wood bridge
move n
move n
move ne
move n
move nw
move nw
move n
move n
ECHO
ECHO
ECHO * * * This copse holds a Dark Temple with skeletons, zombies, and other undead.
ECHO
move ne
ECHO
ECHO
ECHO * * * Passing the Silverwater Mines and Silverwater Lake, inhabited by faenrae reavers and wind hounds.
ECHO
move ne
move ne
move n
move n
move ne
move nw
move n
move n
move n
move ne
move ne
move ne
move ne
move n
move nw
move nw
move nw
move nw
ECHO
ECHO ===================
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO ===================
ECHO
GOTO %1

CRO-CAR:
pause
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union since 366!
ECHO
move n
move n
move n
move e
move e
move n
move w
move n
move w
move n
move w
move w
move go crumbling archway
move n
move ne
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO 
move ne
move e
move ne
move go birch copse
move se
move e
move e
move ne
move ne
move e
move nw
move n
move n
move ne
move nw
move n
move n
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO ===================
ECHO
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO ===================
ECHO
move n
move ne
move go town gate
move nw
move nw
move n
move e
move e
ECHO
ECHO ===================
ECHO *** STONE CLAN
ECHO ===================
ECHO
move n
move n
move ne
move n
move e
move e
move ne
ECHO
ECHO
ECHO * * * Wilderness path: where leucros, vipers, geni, and rock guardians dwell
ECHO
move ne
move nw
move n
move n
move n
move n
move n
move n
move go wood bridge
move n
move n
move ne
move n
move nw
move nw
move n
move n
ECHO
ECHO
ECHO * * * Dark Temple: skeletons, zombies, and other undead.
ECHO
move ne
ECHO
ECHO
ECHO * * * Silverwater Mines: inhabited by faenrae reavers and wind hounds.
ECHO
move ne
move ne
move n
move n
move ne
move nw
move n
move n
move n
move ne
move ne
move ne
move ne
move n
move nw
move nw
move nw
move nw
ECHO
ECHO ===================
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO ===================
ECHO
GOTO %1

DIR-CAR:
pause
move s
move s
move s
move e
move ne
move se
move e
move sw
move w
move sw
move w
move go faint roadway
GOTO %1

TODIRGE2:
pause
move go narrow track
move e
move ne
move e
move ne
move w
move nw
move sw
move w
move n
move n
move n
ECHO
ECHO ===================
ECHO *** DIRGE, formely known as DARKSTONE
ECHO *** Nestled beneath the shadow of the Greater Fist of Heaven,
ECHO *** a volcano which has smothered Dirge in lava and ash.
ECHO ===================
ECHO
GOTO %1

DIR-RIV:
GROUPCHECK3:
pause
match BURDENCHECK3 You have no group
match BURDENCHECK3 You must be visible
match GROUP3 You whisper
put whisper group ...
matchwait

GROUP3:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY INSTEAD OF SWIMMING THE FALDESU
ECHO
GOTO MONEYCHECK3

BURDENCHECK3:
match BURDENCHECK3A Encumbrance : None
match BURDENCHECK3A Encumbrance : Light
match BURDENCHECK3B Encumbrance : Somewhat
match BURDENCHECK3C Encumbrance : Burdened
match BURDENCHECK3D Encumbrance : Heavy
match BURDENCHECK3E Encumbrance : Very Heavy
match BURDENCHECK3F Overburdened
match BURDENCHECK3G Encumbrance : Tottering
match BURDENCHECK3H even able to move?
match BURDENCHECK3I amazing you aren't squashed!
put info
matchwait

CANTSWIM3:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY
ECHO
goto MONEYCHECK3

BURDENCHECK3A:
pause
match DIR-RIV3 Swimming:
match CANTSWIM3 EXP HELP
put experience survival 120
matchwait

BURDENCHECK3B:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 170
matchwait

BURDENCHECK3C:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 210
matchwait

BURDENCHECK3D:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 250
matchwait

BURDENCHECK3E:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 290
matchwait

BURDENCHECK3F:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 330
matchwait

BURDENCHECK3G:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 370
matchwait

BURDENCHECK3H:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 410
matchwait

BURDENCHECK3I:
pause
match DIR-RIV3 Swimming:
match OVERBURDENED3 EXP HELP
put experience survival 450
matchwait

OVERBURDENED3:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY
ECHO
GOTO MONEYCHECK3

MONEYCHECK3:
save DIR-FER
match DIR-RIV-CONT I don't know who you are referring to.
match DIR-RIV-CONT But no one can see you.
match GETMONEYDIRGE But you don't have that much!
match DIR-RIV-CONT You consider the offer and then realize
put tip zzzzzz 30 lirum
matchwait

GETMONEYDIRGE:
pause
move go narrow track
move e
move ne
move e
move ne
move w
move nw
move sw
move w
move n
move n
move n
move go ruined gate
move n
move go traveller bank
match GOTDIRGEMONEY The clerk counts out
match NODIRGEMONEY You don't have that much money
match NODIRGEMONEY you do not seem to have an account
put withdraw 50 copper
matchwait

NODIRGEMONEY:
pause
move out
move s
move go ruined gate
ECHO 
ECHO =========================================
ECHO *** You need 30 Lirums for the Riverhaven ferry
ECHO *** Get coins from The Crossing - I can't do everything for you!
ECHO =========================================
ECHO
EXIT

GOTDIRGEMONEY:
pause
put withdraw 50 copper
put exchange 50 copper kronar to lirum
pause
put exchange 50 copper kronar to lirum
move out
move s
move go ruined gate
move s
move s
move s
move e
move ne
move se
move e
move sw
move w
move sw
move w
move go faint roadway
goto DIR-RIV-CONT

DIR-FALDESU:
save CROC-FALDESU
goto DIR-RIV-CONT

DIR-RIV3:
save CROC-RIV
goto DIR-RIV-CONT

CAR-NORTHROAD:
SAVE DIR-NORTHROAD
goto DIR-RIV-CONT

DIR-RIV-CONT:
pause
move n
ECHO
ECHO ===================
ECHO *** Entering the Royal Province of Therengia
ECHO *** Governed by Lord Baron Gyfford of the Theren family
ECHO ===================
ECHO 
pause

LAVA01:
match LAVA02 Heat rises in palpable waves
match LAVAP01 You must be standing to do that.
match LAVAP01 You can't do that while lying down.
put n
matchwait

LAVAP01:
put stand
pause
goto LAVA01

LAVA02:
match LAVA03 The land about you is still and lifeless.
match LAVAP02 You must be standing to do that.
match LAVAP02 You can't do that while lying down.
put n
matchwait

LAVAP02:
put stand
pause
goto LAVA02

LAVA03:
match LAVA04 [North Road, Canyon Rim]
match LAVAP03 You must be standing to do that.
match LAVAP03 You can't do that while lying down.
put nw
matchwait

LAVAP03:
put stand
pause
goto LAVA03

LAVA04:
match LAVA05 [North Rim, Canyon]
match LAVAP04 You must be standing to do that.
match LAVAP04 You can't do that while lying down.
put go trail
matchwait

LAVAP04:
put stand
pause
goto LAVA04

LAVA05:
match LAVA06 [North Road, Canyon]
match LAVAP05 You must be standing to do that.
match LAVAP05 You can't do that while lying down.
put w
matchwait

LAVAP05:
put stand
pause
goto LAVA05

LAVA06:
match LAVA07 To the north, the road wends
match LAVAP06 You must be standing to do that.
match LAVAP06 You can't do that while lying down.
put go switchback trail
matchwait

LAVAP06:
put stand
pause
goto LAVA06

LAVA07:
match LAVA08 As the road crosses a low point
match LAVAP07 You must be standing to do that.
match LAVAP07 You can't do that while lying down.
put n
matchwait

LAVAP07:
put stand
pause
goto LAVA07

LAVA08:
pause
match LAVANORTH1 You have no group
MATCH LAVANORTH1 You must be visible
match LAVANORTH2 You whisper
match LAVA08 ...wait
match LAVA08 type ahead
put whisper group ...
matchwait

LAVANORTH1:
PAUSE
put stand
put ne
match DIGNORTH1 feeble attempt
match DIGNORTH1 falling short of your goal.
match DIGNORTH1 holds you tightly, preventing
match WALKNORTH1 You easily navigate
match WALKNORTH1 is difficult, but manageable...
match WALKNORTH1 succeeding only with effort
match LAVANORTH1 fails to keep up with you through the
match LAVANORTH1 ...wait
matchwait

DIGNORTH1:
pause
put stand
put dig
match LAVANORTH1 You manage to dig enough
match DIGNORTH1 You struggle to dig
match WALKNORTH1 You will have to kneel
match DIGNORTH1 ...wait
matchwait


LAVANORTH2:
PAUSE
put stand
put ne
match DIGNORTH2 feeble attempt
match DIGNORTH2 falling short of your goal.
match DIGNORTH2 holds you tightly, preventing
match WALKNORTH2 You easily navigate
match WALKNORTH2 is difficult, but manageable...
match WALKNORTH2 succeeding only with effort
matchwait

DIGNORTH2:
pause
put stand
put dig
match LAVANORTH2 You manage to dig enough
match WALKNORTH2 You struggle to dig
match LAVANORTH2 You will have to kneel
match DIGNORTH2 ...wait
matchwait

WALKNORTH2:
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto WALKNORTH1

WALKNORTH1:
pause

LAVA09:
match LAVA10 A tongue of molten lava
match LAVAP09 You must be standing to do that.
match LAVAP09 You can't do that while lying down.
put ne
matchwait

LAVAP09:
put stand
pause
goto LAVA09

LAVA10:
match LAVA11 Occasional flashes of red light
match LAVAP10 You must be standing to do that.
match LAVAP10 You can't do that while lying down.
put go lava flow
matchwait

LAVAP10:
put stand
pause
goto LAVA10

LAVA11:
match LAVA12 The route descends into the dust
match LAVAP11 You must be standing to do that.
match LAVAP11 You can't do that while lying down.
put ne
matchwait

LAVAP11:
put stand
pause
goto LAVA11

LAVA12:
ECHO
ECHO
ECHO * * * Passing the ruined town of Skeleton's Crook and the Gate of Souls
ECHO * * * Inhabited by fire sprites, firecats, atik'et, and westanuryns
ECHO 
match LAVA13 Your view north is partially blocked
match LAVAP12 You must be standing to do that.
match LAVAP12 You can't do that while lying down.
put n
matchwait

LAVAP12:
put stand
pause
goto LAVA12

LAVA13:
match LAVA14 Your footsteps echo off the glassy
match LAVAP13 You must be standing to do that.
match LAVAP13 You can't do that while lying down.
put go tunnel
matchwait

LAVAP13:
put stand
pause
goto LAVA13

LAVA14:
match LAVA15 Turning your back to the massive obsidian
match LAVAP14 You must be standing to do that.
match LAVAP14 You can't do that while lying down.
put n
matchwait

LAVAP14:
put stand
pause
goto LAVA14

LAVA15:
match LAVA16 two monstrous volcanoes
match LAVAP15 You must be standing to do that.
match LAVAP15 You can't do that while lying down.
put n
matchwait

LAVAP15:
put stand
pause
goto LAVA15

LAVA16:
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO
move n
move ne
move ne
move n
move nw
ECHO
ECHO
ECHO * * * The ruins of Sicle Grove, destroyed by the eruption of the Greater Fist caused by the fire mage Mibgluc
ECHO * * * Previously a medical community and home to Timothy, now inhabited by fire maidens
ECHO
ECHO
move n
move go bridge
move n
move n
move nw
move w
move w
move w
move w
move w
move w
move w
move w
move w
goto %s

CROC-FALDESU:
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
move nw
move n
move nw
move n
move n
move n
move nw
pause
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto finish

DIR-northroad:
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
ECHO
ECHO *** NORTH ROAD FERRY
ECHO
goto %1

DIR-FER:
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
ECHO
ECHO *** NORTH ROAD FERRY
ECHO
goto HAVENFERRYNORTH

GROUPCHECK11:
pause
match BURDENCHECK11 You have no group
match BURDENCHECK11 You must be visible
match GROUP11 You whisper
put whisper group ...
matchwait

GROUP11:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY INSTEAD OF SWIMMING THE FALDESU
ECHO
GOTO HAVENFERRYNORTH

BURDENCHECK11:
match BURDENCHECK11A Encumbrance : None
match BURDENCHECK11A Encumbrance : Light
match BURDENCHECK11B Encumbrance : Somewhat
match BURDENCHECK11C Encumbrance : Burdened
match BURDENCHECK11D Encumbrance : Heavy
match BURDENCHECK11E Encumbrance : Very Heavy
match BURDENCHECK11F Overburdened
match BURDENCHECK11G Encumbrance : Tottering
match BURDENCHECK11H even able to move?
match BURDENCHECK11I amazing you aren't squashed!
put info
matchwait

BURDENCHECK11A:
pause
match FER-RIV11 Swimming:
match CANTSWIM11 EXP HELP
put experience survival 120
matchwait

BURDENCHECK11B:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 170
matchwait

BURDENCHECK11C:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 220
matchwait

BURDENCHECK11D:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 270
matchwait

BURDENCHECK11E:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 320
matchwait

BURDENCHECK11F:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 370
matchwait

BURDENCHECK11G:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 420
matchwait

BURDENCHECK11H:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 470
matchwait

BURDENCHECK11I:
pause
match FER-RIV11 Swimming:
match OVERBURDENED11 EXP HELP
put experience survival 520
matchwait

OVERBURDENED11:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY TO RIVERHAVEN
ECHO
GOTO HAVENFERRYNORTH

CANTSWIM11:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY TO RIVERHAVEN
ECHO
goto HAVENFERRYNORTH

HAVENFERRYNORTH:
put stand
pause
put go ferry
match WAITFORHAVENFERRYNORTH wait for the next one.
match WAITFORHAVENFERRYNORTH until the next one arrives.
match WAITFORHAVENFERRYNORTH I could not find what you were referring to.
match WAITFORHAVENFERRYNORTH What were you referring to?
match WAITONHAVENFERRYNORTH You hand him your lirums and climb aboard.
match WAITONHAVENFERRYNORTH The Captain gives you a little nod
match NOMONEY You haven't got enough lirums
matchwait

WAITFORHAVENFERRYNORTH:
;put hide
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls up to the dock
goto HAVENFERRYNORTH

WAITONHAVENFERRYNORTH:
pause
;put hide
ECHO
ECHO *** RIDING THE FERRY
ECHO *** Crossing the Faldesu River to the port city of Riverhaven, governed by Mayor Bressail
ECHO
pause 40
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * This ferry is operated by House Shillat, one of the 16 Therengian great houses (or Morzindaen)
ECHO ====================================
ECHO
pause 40
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Outside Riverhaven's east gate are the Warding Stones,
ECHO * * * raised by Farn's Company during the days of the Empire
ECHO * * * to protect Riverhaven from the "nameless evils" of the Zaulfung Swamp.
ECHO * * * Perhaps that evil is the recently discovered lair of the demon or demi-god Maelshyve
ECHO * * * and her cinder beasts, basilisks, and hierophants.
ECHO
ECHO * * * More information may be found in the book "A Study of the
ECHO * * * Zaulfung Stones" at the Gealeranendae College Library in Therenborough
ECHO ====================================
ECHO
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
move go ramp
move go wooden archway
move ne
move w
goto %1

FER-FALDESU:
pause
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
move nw
move n
move nw
move n
move n
move n
move nw
pause
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto finish

FER-RIV11:
pause
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
goto CROC-RIV

CROC-RIV:
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
pause
move nw
move n
move nw
move n
move n
move n
move nw
move dive river
ECHO
ECHO
ECHO * * * Now swimming across the Faldesu River to the port city of Riverhaven, governed by Mayor Bressail 
ECHO
move ne
NSN:
pause
put n
pause
match NSN A high, rocky bank supports
match NSN You peer south but see nothing of interest.
match NSNEAST1 The swift waters of the river
match NSN ...wait
put peer south
matchwait

NSNEAST1:
put ne
pause
put peer north
match NSNEAST1 The swift waters of the river
match NSN2 An enormous slab of rock
match NSNEAST1 ...wait
matchwait

NSN2:
pause
put n
match NSNWEST You can't swim
match NSN2 [
match NSN2 You swim
match NSN2 ...wait
matchwait

NSNWEST:
pause
put nw
match NSNWEST You struggle
match NSNWEST You work
match NSNWEST You blunder
match NSNWEST You slap
match NSNWEST You flounder
MATCH NSWIMEAST You swim
match NSNWEST ...wait
matchwait

NSWIMEAST:
pause
put ne
match NSWIMEAST You swim
match NCLIMBBRIDGE You can't swim
match NSWIMEAST ...wait
matchwait

NCLIMBBRIDGE:
pause

move climb stone bridge
move go east gate
move w
move w
move w
move w
move w
move w
move w
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO *** Port city on the Faldesu River, governed by Mayor Bressail
ECHO *** Home to the Standing Stones, which protect the town from the evils of the Zaulfung Swamp 
ECHO ===================
ECHO
GOTO %1

THR-RIV:
GLORYWEST:
put stand
pause
match THRONEBARGEWEST You hand him your Lirums
match THRONEBARGEEAST Imperial Glory
match RIVERHAWKWEST You can't do that right now.
match RIVERHAWKWEST I could not find what you
match RIVERHAWKWEST What were you referring to?
match GETMONEYTHRONEWEST You haven't got enough Lirums to pay
match GLORYWEST ...wait
put go glory
matchwait

RIVERHAWKWEST:
pause
match THRONEBARGEWEST You hand him your Lirums
match THRONEBARGEWEST ["The Riverhawk"]
match WAITTHRONEBARGEWEST You can't do that right now.
match WAITTHRONEBARGEWEST I could not find what you
match WAITTHRONEBARGEWEST What were you referring to?
match GETMONEYTHRONEWEST You haven't got enough Lirums to pay
match RIVERHAWKWEST ...wait
put go riverhawk
matchwait

GETMONEYTHRONEWEST:
pause
move s
move se
move se
move climb slope
move go gate
move s
move sw
move up
move n
move nw
move go bank
move e
move e
match GOTTHRONEMONEY The clerk counts out
match NOTHRONEMONEY You don't have that much money
match NOTHRONEMONEY you do not seem to have an account
put withdraw 120 copper lirum
matchwait

NOTHRONEMONEY:
pause
ECHO
ECHO *** YOU NEED 120 LIRUMS TO RIDE THE BARGE TO RIVERHAVEN
ECHO *** BUT YOU HAVE NO MONEY IN THRONE CITY
ECHO
ECHO *** START BEGGING
ECHO
EXIT

GOTTHRONEMONEY:
pause
move w
move w
move out
move se
move s
move down
move ne
move n
move go gate
move climb slope
move nw
move nw
move n
goto thr-riv

WAITTHRONEBARGEWEST:
pause
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE
ECHO
put hide
waitfor A barge pulls into the
goto GLORYWEST

THRONEBARGEWEST:
pause
ECHO
ECHO *** Riding the barge up the Faldesu River towards Riverhaven
ECHO
put hide
pause
waitfor crew quickly ties the barge off.
put stand
pause
move go dock
move n
move n
move nw
move ne
move out
move w
move w
move w
move w
move w
move w
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO *** Port city on the Faldesu River, governed by Mayor Bressail
ECHO *** Home to the Standing Stones, which protect the town from the evils of the Zaulfung Swamp
ECHO ===================
ECHO
GOTO %1

RIV-THR:
pause
move e
move e
move e
move e
move e
move e
move go gate
move sw
move se
move s
move s
GLORYEAST:
put stand
pause
match THRONEBARGEEAST You hand him your Lirums
match THRONEBARGEEAST Imperial Glory
match RIVERHAWKEAST You can't do that right now.
match RIVERHAWKEAST I could not find what you
match RIVERHAWKEAST What were you referring to?
match GETMONEYTHRONEEAST You haven't got enough Lirums to pay
match GLORYEAST ...wait
put go glory
matchwait

RIVERHAWKEAST:
pause
match THRONEBARGEEAST You hand him your Lirums
match THRONEBARGEEAST ["The Riverhawk"]
match WAITTHRONEBARGEEAST You can't do that right now.
match WAITTHRONEBARGEEAST I could not find what you
match WAITTHRONEBARGEEAST What were you referring to?
match GETMONEYTHRONEEAST You haven't got enough Lirums to pay
match RIVERHAWKEAST ...wait
put go riverhawk
matchwait

GETMONEYTHRONEEAST:
ECHO
ECHO *** YOU NEED 120 LIRUMS TO RIDE THIS BARGE
ECHO *** CHECKING THE BANK NOW
ECHO
move n
move n
move nw
move ne
move out
move w
move w
move w
move w
move w
move nw
move n
move n
move go bank
move go arch
put withdraw 120 copper lirum
pause
put withdraw 120 copper lirum
move go arch
move out
move s
move s
move s
goto RIV-THR

WAITTHRONEBARGEEAST:
pause
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE
ECHO
put hide
match THRONEBARGEEASTDISCOVERED discovers your hiding place!
match GLORYEAST A barge pulls into the
matchwait

THRONEBARGEEASTDISCOVERED:
ECHO
ECHO ===========================
ECHO
ECHO *** Crabs and Rats in this area - PAY ATTENTION ! !
ECHO
ECHO ===========================
ECHO
put retreat
put hide
pause
put retreat
put hide
goto WAITTHRONEBARGEEAST

THRONEBARGEEAST:
pause
ECHO
ECHO *** Riding the barge down the Faldesu River towards Throne City, capitol of the former Seven-Starred Empire
ECHO
put hide
pause
waitfor crew quickly ties the barge off.
put stand
pause
move go dock
ECHO
ECHO *** THRONE CITY
ECHO *** The ancient capitol of the Seven-Pointed Star Empire, on the banks of the Faldesu Delta
ECHO *** Protected by the powerful magics of the Y'Shai Guardians
ECHO *** Constructed by the Dwarven Axe Clan, among others
ECHO *** First Emperor was Verek, son of Akroeg the Ram who united all clans
ECHO
GOTO %1

RIV-ROS:
GROUPCHECK01:
pause
match HEALTHCHECK01 You have no group
match HEALTHCHECK01 You must be visible
match RIV-BAR You whisper
put whisper group ...
matchwait

HEALTHCHECK01:
pause
match PERCEPTIONCHECK01B head
match PERCEPTIONCHECK01A Encumbrance :
match HEALTHCHECK01 ...wait
match HEALTHCHECK01 type ahead
#put health
put info
matchwait

PERCEPTIONCHECK01A:
save PERCEPTIONCHECK01A
match CLIMBCHECK01 Perception:
match RIV-BAR EXP HELP
match pause ...wait
match pause type ahead
put experience survival 120
matchwait

PERCEPTIONCHECK01B:
save PERCEPTIONCHECK01B
match CLIMBCHECK01 Perception:
match RIV-BAR EXP HELP
match pause ...wait
match pause type ahead
put experience survival 140
matchwait

CLIMBCHECK01:
pause
match BURDENCHECK01 Climbing:
match RIV-BAR EXP HELP
match CLIMBCHECK01 ...wait
match CLIMBCHECK01 type ahead
put experience survival 100
matchwait

BURDENCHECK01:
save BURDENCHECK01
match BURDENCHECK01A Encumbrance : None
match BURDENCHECK01A Encumbrance : Light
match BURDENCHECK01B Encumbrance : Somewhat
match BURDENCHECK01C Encumbrance : Burdened
match BURDENCHECK01D Encumbrance : Heavy
match BURDENCHECK01E Encumbrance : Very Heavy
match BURDENCHECK01F Overburdened
match BURDENCHECK01G Encumbrance : Tottering
match BURDENCHECK01H even able to move?
match BURDENCHECK01I amazing you aren't squashed!
match pause ...wait
match pause type ahead
put info
matchwait

BURDENCHECK01A:
pause
match RIV-ROS-NORTH Swimming:
match RIV-BAR EXP HELP
put experience survival 140
matchwait

BURDENCHECK01B:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 190
matchwait

BURDENCHECK01C:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 230
matchwait

BURDENCHECK01D:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 270
matchwait

BURDENCHECK01E:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 310
matchwait

BURDENCHECK01F:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 350
matchwait

BURDENCHECK01G:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 390
matchwait

BURDENCHECK01H:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 430
matchwait

BURDENCHECK01I:
pause
match RIV-ROS-NORTH Swimming:
match OVERBURDENED01 EXP HELP
put experience survival 470
matchwait


OVERBURDENED01:
ECHO
ECHO ==============================================
ECHO *** You are too burdened to swim the Rossman's route with your current swimming skill.
ECHO *** With no burden you need 140 swimming ranks for the Rossman's route.
ECHO ==============================================
ECHO
pause
GOTO RIV-BAR

RIV-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group, are too burdened, OR
ECHO *** You need more perception (140+), climbing (100+), or swimming (140+)
ECHO
ECHO    ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause
move w
move go municipal pier
move go wooden archway
move w
move n
move w
NORTHBARGE:
put stand
pause
put go barge
match WAITFORNORTHBARGE wait for the next one.
match WAITFORNORTHBARGE until the next one arrives.
match WAITFORNORTHBARGE There is no ferry
match WAITONNORTHBARGE You hand him your lirums and climb aboard.
match WAITONNORTHBARGE The Captain gives you a little nod
match GETMONEYNORTHBARGE You haven't got enough lirums
matchwait

WAITFORNORTHBARGE:
;put hide
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE ***
ECHO
waitfor pulls into the
goto NORTHBARGE

GETMONEYNORTHBARGE:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
move e
move s
move e
move go wooden archway
move ne
move nw
move n
move n
move go bank
move go arch
put withdraw 13 bronze
pause
move go arch
move out
move s
move s
move se
move go municipal pier
move go wooden archway
move w
move n
move w
pause
put go barge
match WAITFORNORTHBARGE wait for the next one.
match WAITFORNORTHBARGE until the next one arrives.
match WAITFORNORTHBARGE There is no ferry
match WAITONNORTHBARGE You hand him your lirums and climb aboard.
match WAITONNORTHBARGE The Captain gives you a little nod
match NONORTHBARGE You haven't got enough lirums
matchwait

NONORTHBARGE:
pause
ECHO
ECHO *** You do not have enough Lirums in Riverhaven to ride the barge to Langenfirth.  Find some money and try again.
ECHO
EXIT

WAITONNORTHBARGE:
pause
;put hide
ECHO
ECHO *** Riding the barge west across Lake Gwenalion to the Ranger town of Langenfirth
ECHO *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
ECHO
pause 90
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Langenfirth is named for a monk named Langen who lived in the firth.
ECHO * * * Langen came to the fishing village on Lake Gwenalion in 240 AV, almost 150 years ago.
ECHO
ECHO * * * Though at first shunned by the villagers, Langen won them over by brewing
ECHO * * * one of the finest ales ever made, crafted from the waters of Lake Gwenalion.
ECHO * * * Langen Ale is now known throughout the world.
ECHO
ECHO * * * Langen's Feast is celebrated in all the villages around
ECHO * * * Lake Gwenalion on the 3rd day of Ka'Len the Sea Drake each year.
ECHO ====================================
ECHO
pause
waitfor crew ties the barge off.
put stand
pause
move go wharf
move w
move s
move w
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale. 
ECHO ===================
ECHO
goto %1

RIV-ROS-NORTH:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
pause
move w
move w
move w
move w
move w
move w
move w
move go narrow gate
move nw
ECHO
ECHO
ECHO * * * The western Riverhaven meadows, creeks, and woods
ECHO * * * Inhabited by goblin shamans, crayfish, eels, rams, bears, arbelogs, ogres, and wolf spiders
ECHO
ECHO
move n
move n
move n
move nw
ECHO
ECHO
ECHO * * * Passing a pasture grazed in by barghests
ECHO
move ne
move n
move ne
move nw
move n
move ne
move w
move nw
move n
ECHO
ECHO
ECHO * * * Entering the Mistwood Forest, home to the poisonous nightreaver unyns
ECHO
move ne
move n
move nw
move ne
SEARCHOUTCROP1A:
save SEARCHOUTCROP1A
match SEARCHOUTCROP1B irregular handholds!
match SEARCHOUTCROP1A don't find anything of interest.
match pause ...wait
match pause type ahead
put search outcrop
matchwait

SEARCHOUTCROP1B:
move climb handhold
move climb rock wall
move n

SEARCHOUTCROP2A:
save SEARCHOUTCROP2A
match SEARCHOUTCROP2B shrubs clinging to the rock face!
match SEARCHOUTCROP2A don't find anything of interest.
match pause ...wait
match pause type ahead
put search rocky ledge
matchwait

SEARCHOUTCROP2B:
move climb shrub
pause
match 1SW head southwest.
match 1W head west.
match 1NW head northwest.
match 1N head north.
match 1NE head northeast.
match 1E head east.
match 1SE head southeast.
put peer path
matchwait

1SW:
move d
move sw
goto 1CONTINUE
1W:
move d
move w
goto 1CONTINUE
1NW:
move d
move nw
goto 1CONTINUE
1N:
move d
move n
goto 1CONTINUE
1NE:
move d
move ne
goto 1CONTINUE
1E:
move d
move e
goto 1CONTINUE
1SE:
move d
move se
goto 1CONTINUE

1CONTINUE:
put nw
move n
move nw
move n
move ne
move go river
ECHO
ECHO
ECHO * * * Swimming up the swift-flowing Jantspyre River towards Rossman's Landing
ECHO

1SWIM1:
pause
put e
match 1SWIM2 You wade
match 1SWIM1 You struggle
match 1SWIM1 You work
match 1SWIM1 You slap
match 1SWIM1 You flounder
matchwait

1SWIM2:
pause
put ne
match 1SWIM3 You wade
match 1SWIM2 You struggle
match 1SWIM2 You work
match 1SWIM2 You slap
match 1SWIM2 You flounder
matchwait

1SWIM3:
pause
put ne
match 1SWIM4 You wade
match 1SWIM3 You struggle
match 1SWIM3 You work
match 1SWIM3 You slap
match 1SWIM3 You flounder
matchwait

1SWIM4:
pause
put e
match 1SWIM5 You wade
match 1SWIM4 You struggle
match 1SWIM4 You work
match 1SWIM4 You slap
match 1SWIM4 You flounder
matchwait

1SWIM5:
pause

move go bank
move go path
move nw
move n
move nw
move w
move nw
move w
ECHO
ECHO ===================
ECHO *** ROSSMAN'S LANDING
ECHO *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion 
ECHO ===================
ECHO
GOTO %1

ROS-THE:
put stow left
pause
put stow right
move east
move se
move e
move se
move ne
move go rose thicket
move e
move sw
move s
move ne
move go gap
move nw
move ne
move nw
move ne
move nw
ROPEN:
put climb rope
match SHUFFLEN You climb
match WAITN is already on the rope.
matchwait

WAITN:
put hide
ECHO
ECHO *** Waiting for someone to get off the ropes.
ECHO
match ROPEN finally arriving
match ROPEN finally reaching
matchwait

SHUFFLEN:
ECHO
ECHO *** Travelling north on a dangerous rope bridge over a deep ravine inhabited by sky giants
ECHO
pause
pause
put shuffle north
pause
pause
put shuffle north
pause
pause
put shuffle north
pause
ECHO
ECHO * * * In this ravine sky giants roam
ECHO
totheren1:
pause
move nw
move w
move nw
move sw
move nw
move w
move sw
move n
move e
move ne
move n
move nw
move sw
move n
move go north road
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO *** Protected by Theren Keep
ECHO *** Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO *** Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren
ECHO ===================
ECHO
GOTO %1

THE-LAN:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
ELB-2LAN:
move se
move sw
ECHO
ECHO
ECHO * * * The Danduwen Forest
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale. 
ECHO ===================
ECHO
GOTO FINISH

ELB-LAN:
pause
move go main road
move w
goto ELB-2LAN

THE-FOR:
pause
match GROUPPASSPORTCHECK1 You see
match GROUPPASSPORTCHECK1 The folded piece of paper bears
match GETPASSPORT I could not find
match GETPASSPORT What were you referring to?
match GETPASSPORT passport has expired
put look my passport
matchwait

GROUPPASSPORTCHECK1:
pause
match GOTPASSPORT You have no group
match GOTPASSPORT You must be visible
match GETPASSPORT You whisper
match GROUPPASSPORTCHECK1 ...wait
match GROUPPASSPORTCHECK1 type ahead
put whisper group ...
matchwait

GETPASSPORT:
pause
move go town gate
move n
move e
move e
move n
move n
move ne
move ne
move n
move ne
move go alabaster arch
move nw
move nw
move nw
move w
move w
move ne
move ne
move go lancet arch
move n
move n
move n
move go gold arch
move ne
GET-PASSPORT:
pause
match GROUPPASSPORT1 licenser takes some of the papers
match INV-GET-PASSPORT how do you expect to do that?
match DESK-PASSPORT doesn't look like you have a free
match GET-PASSPORT passport will allow you
match GET-PASSPORT ...wait
match GET-PASSPORT type ahead
put ask licenser for passport
matchwait

INV-GET-PASSPORT:
pause
ECHO
ECHO *** You cannot get a passport while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto GET-PASSPORT

DESK-PASSPORT:
pause
ECHO
ECHO *** You don't have a free hand so your passport is on the desk.  Get your passport and type GLANCE to continue
ECHO
pause
goto GROUPPASSPORT1

GROUPPASSPORT1:
pause
match LEAVEPASSPORT1 You have no group
match LEAVEPASSPORT1 You must be visible
match GETGROUPPASSPORT1 You whisper
match GROUPPASSPORT1 ...wait
match GROUPPASSPORT1 type ahead
put whisper group Get a passport! ASK LICENSER FOR PASSPORT two times.  We will all need them. Let me know when you have one.
matchwait

GETGROUPPASSPORT1:
pause
pause
ECHO
ECHO
ECHO *** WHEN EVERYONE HAS A PASSPORT TYPE "GLANCE" TO CONTINUE
ECHO
ECHO
pause
waitfor You glance
put whisper group Now stow your passport away!
goto LEAVEPASSPORT1

LEAVEPASSPORT1:
pause
put stow my passport
move sw
move go gold arch
move go black arch
move s
move s
move go oak doors
move sw
move sw
move e
move e
move se
move se
move se
move go alabaster arch
move sw
move s
move sw
move sw
move s
move s
move w
move w
move s
move go town gate
goto GOTPASSPORT

GOTPASSPORT:
pause
move go stone wall
goto THERENROADWEST1

THERENROADWEST1:
pause
match THERENROADWESTNOGROUP You have no group
match THERENROADWESTNOGROUP You must be visible
match THERENROADWESTGROUP You whisper
match THERENROADWEST1 ...wait
match THERENROADWEST1 type ahead
put whisper group GO WEST RIGHT NOW and Join me fast on the other side!
matchwait

THERENROADWESTGROUP:
pause
pause
put w
waitfor [Ker'Leor, Deep Forest Path]
ECHO
ECHO
ECHO *** GRAB YOUR GROUP AND TYPE "GLANCE" WHEN YOU ARE READY TO MOVE
ECHO *** CAUTION: Creatures roam this area!
ECHO
ECHO
waitfor You glance
GOTO THERENROADWESTDONE

THERENROADWESTNOGROUP:
pause
put w
waitfor [Ker'Leor, Deep Forest Path]
ECHO
ECHO
ECHO * * * Entering the Ker'Leor Forest at the base of the Ker'Leor mountain range, home to roving gypsies led by King Talorc
ECHO
pause
THERENROADWESTDONE:
move n
move nw
move n
move nw
move ne
move n
move ne
move ne
move nw
move ne
move n
move go road
move n
move ne
move nw
ECHO
ECHO
ECHO * * * Laakmir, site of the Suur Pillar, which houses Firulf's staff
ECHO * * * and which created the electrical creatures called seordmaors
ECHO
move nw
move n
move n
move nw
move n
move climb rocky path
ECHO
ECHO
ECHO * * * Now ascending the Ker'Leor mountains - Beware of scaly seordmaors!
ECHO
move up
move up
move up
move up
move up
move ne
move ne
move n
move nw
move climb rocky path
move climb stone ramp
move go steel bridge
move w
move w
ECHO
ECHO ===================
ECHO *** FORNSTED
ECHO *** Located in the Ke'Leor Forest atop the Ker'Leor mountains
ECHO *** Governed by Lord Paragon Larohald of the House Trigomas (one of the great Human houses of Therengia)
ECHO *** Protected by Arnshal Keep, named for the Arncharn Shel Mountains that divide Therengia and Forfedhdar
ECHO ===================
ECHO 
GOTO %1

FOR-HVA:
pause
move go gate
move w
move go wooden doors
move w
put get my passport

GROUPPASSPORT2:
pause
match LEAVEPASSPORT2 You have no group
match LEAVEPASSPORT2 You must be visible
match WAITPASSPORT2 You whisper
match GROUPPASSPORT2 ...wait
match GROUPPASSPORT2 type ahead
put whisper group Get your passport out and put it in your right hand, we are about to go through a checkpoint.
matchwait

WAITPASSPORT2:
pause
ECHO
ECHO
ECHO *** WAIT FOR EVERYONE TO GET THEIR PASSPORTS OUT AND PUT THEM IN THEIR RIGHT HANDS, THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
GOTO LEAVEPASSPORT2

LEAVEPASSPORT2:
pause
move go gateway
put stow my passport
ECHO
ECHO
ECHO * * * Descending the Ker'Leor mountains towards Hvaral by way of Arnshal Road, named for the Arncharn Shel Mountains
ECHO
pause
move w
move w
move sw
move sw
move s
move s
move s
move sw
move sw
move nw
move nw
move n
move n
move n
move n
move nw
move nw
move w
move sw
move sw
move s
move s
move s
move s
move sw
move nw
move nw
move nw
move n
move n
move n
move nw
move nw
move sw
move s
move s
move s
move sw
move sw
move w
move up
move w
ECHO
ECHO ===================
ECHO *** HVARAL
ECHO * * * A small town in the Gemfire Mountains on the edge of the Velaka Desert
ECHO * * * Governed by Lord Elbaeryn of House Dacawla from within the Neristan Keep
ECHO * * * Formerly a Dwarven town of the Kwarlog Kingdom, since occupied by the Human Therengians
ECHO * * * An important trade route between Therengia, Muspar'I, and Kwarlog (a Dwarven city and kingdom)
ECHO ===================
ECHO
pause
goto %1

HVA-MUS:
pause
move go narrow gateway
move w
move s
move w
move sw
move nw
move go ramp
move w

GoDesertWest:
put whisper group GO BARGE! We can not get on the barge together as a group. You have to get on yourself.
pause
match WAITFORBARGEWEST I could not find what
match WAITFORBARGEWEST What were you referring to?
match WAITFORBARGEWEST You can't do that right now.
match INV-GoDesertWest they can't see you?
match WAITONBARGEWEST ["The Desert Wind"]
match WAITONBARGEWEST ["The Suncatcher"]
put go barge
matchwait

INV-GoDesertWest:
pause
ECHO
ECHO *** You cannot board the barge while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto GoDesertWest

WAITFORBARGEWEST:
;put hide
ECHO
ECHO *** WAITING FOR SAND BARGE TO ARRIVE ***
ECHO
match GoDesertWest barge pulls into the
match WAITFORBARGEWEST YOU HAVE BEEN IDLE
matchwait 

WAITONBARGEWEST:
pause
put whisper group GO PLATFORM when we dock! We can not leave the barge together. You will have to get off the barge yourself.
;put hide
pause
ECHO
ECHO *** Riding west across the Velaka Desert to Muspar'i, the Desert Jewel
ECHO * * * Riding aboard a sand barge pulled by packbeasts called yeehars.
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 5
ECHO
ECHO * * * The currency of the Therengian province is the Lirum.
ECHO * * * The Lirum is named after the wife of Akroeg the Ram.
ECHO
ECHO * * * Akroeg had united all the races under the banner of the Ram Clan.
ECHO * * * After Akroeg's death his wife and sons along with the scholar Moliko
ECHO * * * ended the Ram Clan and formed the Seven Pointed Star Empire.
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 5
ECHO
ECHO * * * The lake in the Velaka Desert was originally inhabited by Sand Elves.
ECHO * * * After the fall of the Seven Starred Empire the S'kra Mur, led by Shorka the Cobra,
ECHO * * * settled at the lake and built Muspar'i over protests of the Sand Elves.
ECHO * * * Shorka was a friend of Lanival and fought with Lanival against Teiro in the Resistance Wars
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 3 of 5
ECHO
ECHO * * * The Sand Elves and S'kra settled their differences and now live together in Muspar'i
ECHO * * * Muspar'i has become a major trade city between Kwarlog and Therengia
ECHO * * * It is known for its fine crafts: healing poultices, perfumes, dyes, spices, poisons, jewelry, weapons, silks, pottery...
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 4 of 5
ECHO
ECHO * * * Muspar'i was first ruled by Shorka the Cobra, who was made queen
ECHO * * * Modern rulers and nobility of Muspar'i are known as "The Blood of Shorka",
ECHO * * * though they are not necessarily true descendents of Shorka
ECHO
ECHO * * * More can be read in "The History of Muspar'i" at the Royal Library of Muspar'i
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 5 of 5
ECHO
ECHO * * * The S'kra of Muspar'i believe they were led to Velaka by the S'kra Mur god Hav'roth, the Cobra
ECHO * * * Hav'roth is god of the spirits of rock, stone, earth, and deserts and is creator of precious metals and gems
ECHO * * * Hav'roth's light aspect is Peri'el the King Snake and dark aspect Ushnish the Viper
ECHO
ECHO * * * More about the gods can be read in "The Immortals" at the Riverhaven Academy or Crossing temple
ECHO ====================================
ECHO
pause
match LEAVEBARGEWEST The sand barge pulls into
match WAITONBARGEWEST YOU HAVE BEEN IDLE
matchwait

LEAVEBARGEWEST:
put whisper group GO PLATFORM! Then go ramp and go gate. We can not leave the barge together. You will have to get off the barge yourself.
move go platform
move go ramp
move go gate
ECHO
ECHO ====================================
ECHO *** MUSPAR'I ***
ECHO * * * A S'kra Mur city, built on a lake in the Velaka Desert
ECHO * * * Also called the Desert Jewel or the Sun's Egg by the S'kra
ECHO * * * Built by Shorka the Cobra, a S'kra who fought with Lanival against Teiro in the Resistance Wars
ECHO * * * Governed by monarchy whose ruling class and nobility are known as the "Blood of Shorka" (though not necessarily true descendents of Shorka)
ECHO * * * Patron god is Hav'roth the cobra, god of the S'kra Mur and deserts
ECHO * * * Known for its artistry in weapon forging, silks, dyes, ceramics, and jewelry
ECHO ====================================
ECHO
goto FINISH

MUS-BARGE:
move go ramp
GoDesertEast:
put whisper group GO BARGE! We can not get on the barge together as a group. You have to get on yourself.
pause
match WAITFORBARGEEast I could not find what
match WAITFORBARGEEast What were you referring to?
match WAITFORBARGEEast You can't do that right now.
match INV-GoDesertEast they can't see you?
match WAITONBARGEEast ["The Desert Wind"]
match WAITONBARGEEast ["The Suncatcher"]
put go barge
matchwait

INV-GoDesertEast:
pause
ECHO
ECHO *** You cannot board the barge while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto GoDesertEast

WAITFORBARGEEast:
;put hide
ECHO
ECHO *** WAITING FOR SAND BARGE TO ARRIVE ***
ECHO
waitfor barge pulls into the
goto GoDesertEast

WAITONBARGEEast:
pause
;put hide
pause
put whisper group GO DOCK when we arrive! We can not get off the barge together as a group. You have to get off the barge yourself.
pause
ECHO
ECHO ====================================
ECHO *** Riding aboard a sand barge pulled by yeehar.
ECHO *** Traveling east across the Velaka Desert towards Hvaral,
ECHO *** built into the Gemfire Mountains north of the Arncharn Shel Mountains.
ECHO ====================================
ECHO 
pause 90
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * Hvaral was built by the Dwarves of the Kwarlog Empire
ECHO * * * after the Humans and Dwarves won the Elven-Human War.
ECHO
ECHO * * * The Humans and Dwarves later used Hvaral as a base of
ECHO * * * operations against the Dragon Priests and D'zree.
ECHO
ECHO * * * After the Dragon Priests were defeated the Dwarves and
ECHO * * * Humans fell into conflict, sparking the Therengia-Kwarlog War.
ECHO
ECHO * * * The Dwarves withdrew from the destroyed outpost of Hvaral
ECHO * * * and the Therengians rebuilt the town in a Therengian style,
ECHO * * * including a keep that houses Hvaral's rulers, the Neristan Keep.
ECHO * * * Hvaral is a unique clash of Dwarven and Human architecture.
ECHO ====================================
ECHO 
pause 90
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Hvaral is currently governed by Lord Elbaeryn
ECHO * * * Despite its name the Gemfire Mountains have few gems, or ores or salt.
ECHO * * * Muspar'i was built and settled by the S'kra Mur in recent times, after the Therengia-Kwarlog War
ECHO * * * Hvaral survives upon interprovincial trade, being the gateway to the Velaka Desert
ECHO 
ECHO * * * More can be learned about Hvaral by reading "A History of Hvaral" located in the Neristan Keep of Hvaral.
ECHO ====================================
ECHO
pause 90
waitfor The sand barge pulls into
pause
match LEAVEBARGEEASTNOGROUP You have no group
match LEAVEBARGEEASTNOGROUP You must be visible
match LEAVEBARGEEASTGROUP You whisper
put whisper group GO DOCK! We can not get off the barge together as a group. You have to get off the barge yourself.
matchwait

LEAVEBARGEEASTGROUP:
pause
move go dock
pause
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING ***
ECHO
ECHO
waitfor You glance
goto %1

LEAVEBARGEEASTNOGROUP:
pause
move go dock
goto %1

MUS-HVA:
pause
move e
move go ramp
move se
move ne
move e
move n
move e
move go narrow gateway
ECHO
ECHO ===================
ECHO *** HVARAL
ECHO * * * A small town in the Gemfire Mountains on the edge of the Velaka Desert
ECHO * * * Governed by Lord Elbaeryn of House Dacawla from within the Neristan Keep
ECHO * * * Formerly a Dwarven town of the Kwarlog Kingdom, since occupied by the Human Therengians
ECHO * * * An important trade route between Therengia, Muspar'i, and Kwarlog (a Dwarven city and kingdom)
ECHO ===================
ECHO
pause
goto %1

HVA-FOR:
ECHO
ECHO
ECHO * * * Entering the territory of House Macwe, one of the great Therengian houses
ECHO
pause
move e
move down
move e
move ne
move ne
move n
move n
move n
move ne
move se
move se
move s
move s
move s
move se
move se
move se
move ne
move n
move n
move n
move n
move ne
move ne
move e
move se
move se
move s
move s
move s
move s
move se
move se
move ne
move ne
move n
move n
move n
move ne
move ne
move e
move go stone causeway
move go small gateway
move e
move go ironwood doors
move e
move go gate
ECHO
ECHO ===================
ECHO *** FORNSTED
ECHO * * * Located in the Ke'Leor Forest atop the Ker'Leor mountains
ECHO * * * Governed by Lord Paragon Larohald of the House Trigomas (one of the great Human houses of Therengia)
ECHO * * * Protected by Arnshal Keep, named for the Arncharn Shel Mountains that divide Therengia and Forfedhdar 
ECHO ===================
ECHO 
GOTO %1


FOR-THE:
pause
move go steel bridge
move e
move e
move down
move climb rocky path
move se
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Descending to the base of the Ker'Leor mountains, homeland of the gypsies led by King Talorc
ECHO
ECHO
move down
move down
move down
move down
move down
move climb rocky path
move s
move se
move s
move s
move se
ECHO
ECHO
ECHO * * * Passing by Laakmir, site of the Suur Pillar, which houses Firulf's staff and which created the electrical creatures called seordmaors
ECHO
ECHO
move se
move sw
move s
move w
move s
move sw
move se
move sw
move sw
move s
move sw
move se

move s
move se
move s
goto THERENROADEAST1

THERENROADEAST1:
pause
match THERENROADEASTNOGROUP You have no group
match THERENROADEASTNOGROUP You must be visible
match THERENROADEASTGROUP You whisper
match THERENROADEAST1 ...wait
match THERENROADEAST1 type ahead
put whisper group Go EAST right now and join me on the other side!
matchwait


THERENROADEASTGROUP:
pause
pause
put e
waitfor [Theren Road]
ECHO
ECHO
ECHO *** GRAB YOUR GROUP AND TYPE "GLANCE" WHEN YOU ARE READY TO MOVE
ECHO
ECHO
waitfor You glance
GOTO THERENROADEASTDONE

THERENROADEASTNOGROUP:
pause
put e
waitfor [Theren Road]
GOTO THERENROADEASTDONE

THERENROADEASTDONE:
pause
move go stone wall
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren 
ECHO ===================
ECHO
GOTO %1

LAN-THE:
pause
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River by bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
move n
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Entering the apple orchards and fertile farmlands of upper Therengia
ECHO 
move n
move ne
move ne
move nw
move ne
move ne
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren 
ECHO ===================
ECHO
GOTO %1

SKILLCHECK7:
pause
match THE-ROS-CONT Climbing:
match NOROSSMAN EXP HELP
put exp survival 50
matchwait

THE-ROS:
GROUPCHECK7:
pause
match HEALTHCHECK7 You have no group
match HEALTHCHECK7 You must be visible
match THE-BAR You whisper
put whisper group ...
matchwait

HEALTHCHECK7:
pause
match PERCEPTIONCHECK7B head
match PERCEPTIONCHECK7A Encumbrance :
match HEALTHCHECK7 ...wait
match HEALTHCHECK7 type ahead
#put health
put info
matchwait

PERCEPTIONCHECK7A:
save PERCEPTIONCHECK7A
match CLIMBCHECK7 Perception:
match THE-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 120
matchwait

PERCEPTIONCHECK7B:
save PERCEPTIONCHECK7B
match CLIMBCHECK7 Perception:
match THE-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 140
matchwait

CLIMBCHECK7:
pause
match SWIMCHECK7 Climbing:
match THE-BAR EXP HELP
match CLIMBCHECK7 ...wait
match CLIMBCHECK7 type ahead
put exp survival 100
matchwait

SWIMCHECK7:
pause
match GREATSURVIVAL7 Swimming:
match THE-BAR EXP HELP
put experience survival 30
matchwait

GREATSURVIVAL7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto THE-ROS-CONT

THE-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause
match THE-BAR-CONT I don't know who you are referring to.
match THE-BAR-CONT But no one can see you.
match GETMONEYSOUTHBARGE But you don't have that much!
match GETMONEYSOUTHBARGE You consider the offer and then realize
put tip zzzzzz 65 lirum
matchwait

GETMONEYSOUTHBARGE:
ECHO
ECHO *** GETTING LIRUMS FROM THEREN BANK ***
ECHO
pause
move go town gate
move n
move e
move e
move n
move n
move ne
move go marble entrance
move n
put withdraw 13 bronze lirum
pause
move s
move out
move sw
move s
move s
move w
move w
move s
move go town gate
goto THE-BAR-CONT

THE-BAR-CONT:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO 
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause 
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
move se
move sw
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale.
ECHO * * (Langen's Feast is celebrated on the 3rd day of Ka'Len each year) 
ECHO ===================
ECHO
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

elb-riv:
GROUPCheckElbain7:
pause
match HEALTHCheckElbain7 You have no group
match HEALTHCheckElbain7 You must be visible
match ELB-BAR You whisper
put whisper group ...
matchwait

HEALTHCheckElbain7:
pause
match PERCEPTIONCheckElbain7B head
match PERCEPTIONCheckElbain7A Encumbrance :
match HEALTHCheckElbain7 ...wait
match HEALTHCheckElbain7 type ahead
#put health
put info
matchwait

PERCEPTIONCheckElbain7A:
save PERCEPTIONCheckElbain7A
match CLIMBCheckElbain7 Perception:
match ELB-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 120
matchwait

PERCEPTIONCheckElbain7B:
save PERCEPTIONCheckElbain7B
match CLIMBCheckElbain7 Perception:
match ELB-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 140
matchwait

CLIMBCheckElbain7:
pause
match SWIMCheckElbain7 Climbing:
match ELB-BAR EXP HELP
match CLIMBCheckElbain7 ...wait
match CLIMBCheckElbain7 type ahead
put exp survival 100
matchwait

SWIMCheckElbain7:
pause
match GREATSURVIVALElbain7 Swimming:
match ELB-BAR EXP HELP
put experience survival 30
matchwait

GREATSURVIVALElbain7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto ELB-ROS-CONT

ELB-ROS-CONT:
pause
move go main road
move w
goto ELB-ROS-2CONT

ELB-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause
move go main road
move w
move se
move sw
ECHO
ECHO
ECHO * * * The Danduwen Forest
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO ===================
ECHO
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

lan-riv:
GROUPCheckLang7:
pause
match HEALTHCheckLang7 You have no group
match HEALTHCheckLang7 You must be visible
match LAN-BAR You whisper
put whisper group ...
matchwait

HEALTHCheckLang7:
pause
match PERCEPTIONCheckLang7B head
match PERCEPTIONCheckLang7A Encumbrance :
match HEALTHCheckLang7 ...wait
match HEALTHCheckLang7 type ahead
#put health
put info
matchwait

PERCEPTIONCheckLang7A:
save PERCEPTIONCheckLang7A
match CLIMBCheckLang7 Perception:
match LAN-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 120
matchwait

PERCEPTIONCheckLang7B:
save PERCEPTIONCheckLang7B
match CLIMBCheckLang7 Perception:
match LAN-BAR EXP HELP
match pause ...wait
match pause type ahead
put exp survival 140
matchwait

CLIMBCheckLang7:
pause
match SWIMCheckLang7 Climbing:
match LAN-BAR EXP HELP
match CLIMBCheckLang7 ...wait
match CLIMBCheckLang7 type ahead
put exp survival 100
matchwait

SWIMCheckLang7:
pause
match GREATSURVIVALLang7 Swimming:
match LAN-BAR EXP HELP
put experience survival 30
matchwait

GREATSURVIVALLang7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto LAN-ROS-CONT

LAN-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

SOUTHBARGE:
put stand
pause
put go barge
match WAITFORSOUTHBARGE wait for the next one.
match WAITFORSOUTHBARGE until the next one arrives.
match WAITFORSOUTHBARGE There is no ferry
match WAITONSOUTHBARGE You hand him your lirums and climb aboard.
match WAITONSOUTHBARGE The Captain gives you a little nod
match NOMONEY You haven't got enough lirums
matchwait

WAITFORSOUTHBARGE:
;put hide
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE ***
ECHO
waitfor pulls into the
GOTO SOUTHBARGE

WAITONSOUTHBARGE:
;put hide
pause
ECHO
ECHO *** Riding the barge across Lake Gwenalion to Riverhaven
ECHO *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
ECHO
pause 90
ECHO
ECHO =================================
echo *** Common Knowledge: 1 of 2
ECHO * * * The currency of the Therengian province is the Lirum.
ECHO * * * The Lirum is named after the wife of Akroeg the Ram.
ECHO
ECHO * * * Akroeg united all the races under the banner of the Ram Clan.
ECHO * * * After Akroeg's death his work was continued by his wife, his son Verek, Barbalas, and the scholar Moliko.
ECHO * * * This group ended the Ram Clan and formed the Seven Pointed Star Empire.
ECHO =================================
ECHO
pause 90
ECHO
ECHO =================================
echo *** Common Knowledge: 2 of 2
ECHO * * * Akroeg's son Verek was annointed the first emperor
ECHO * * * Vereklaath or Founding Day is celebrated on the 1st day of the month of Akroeg the Ram
ECHO * * * Vereklaath is celebrated by parades of soldiers in full armor and exchange of gifts among Therengians
ECHO =================================
ECHO
waitfor crew ties the barge off.
put stand
pause
move go pier
move e
move s
move e
move go wooden archway
move ne
move w
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO * * * Site of the Dunshade manor, where Byron Dunshade murdered his wife Tatia and daughter Laurel then killed himself.
ECHO * * * Home to the olvio from the badlands to the northwest, who built the Halfling Quarter in town.
ECHO ===================
ECHO
goto %1

LAN-ROS-CONT:
pause
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River by bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
ELB-ROS-2CONT:
move n
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Entering the apple orchards and fertile farmlands of upper Therengia
ECHO 
move n
move ne
move ne
move nw
move ne
move ne
ECHO
ECHO
ECHO * * * Entering the Mistwood Forest
ECHO
goto LAN-ROS-2CONT

THE-ROS-CONT:
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
LAN-ROS-2CONT:
move go forest road
move s
move ne
move se
move s
move sw
move w
move s
move ne
move e
move se
move ne
move se
move e
move se
put stow right
pause
put stow left
ECHO
ECHO
ECHO * * * In this ravine sky giants roam
ECHO
pause

ROPES:
put climb rope
match SHUFFLES You climb
match WAITS is already on the rope.
matchwait

WAITS:
put hide
ECHO
ECHO *** Waiting for someone to get off the ropes
ECHO
match ROPES finally arriving
match ROPES finally reaching
matchwait

SHUFFLES:
ECHO
ECHO *** Travelling south on a dangerous rope bridge over a deep ravine inhabited by sky giants
ECHO 
pause
pause
put shuffle south
ECHO
ECHO ================================
ECHO
ECHO *** Orcs and Warcats at the end of these ropes - PAY ATTENTION ! !
ECHO
ECHO ================================
ECHO
pause
pause
put shuffle south
pause
pause
put shuffle south
pause
put retreat
put retreat
pause
put retreat
move se
move sw
move se
move sw
move se
move go thicket
move south
move west
move west
move north
move go forest
move sw
move nw
move w
move nw
move w
ECHO
ECHO ===================
ECHO *** ROSSMAN'S LANDING
ECHO *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion
ECHO ===================
ECHO 
GOTO %1

ROS-RIV:
HEALTHCHECK8:
pause
match PERCEPTIONCHECK8B head
match PERCEPTIONCHECK8A Encumbrance :
match HEALTHCHECK8 ...wait
match HEALTHCHECK8 type ahead
#put health
put info
matchwait

PERCEPTIONCHECK8A:
save PERCEPTIONCHECK8A
match CLIMBCHECK8 Perception:
match SKILLCHECK8 EXP HELP
match pause ...wait
match pause type ahead
put exp survival 120
matchwait

PERCEPTIONCHECK8B:
save PERCEPTIONCHECK8B
match CLIMBCHECK8 Perception:
match SKILLCHECK8 EXP HELP
match pause ...wait
match pause type ahead
put exp survival 140
matchwait

CLIMBCHECK8:
pause
match SWIMCHECK8 Climbing:
match SKILLCHECK8 EXP HELP
match CLIMBCHECK8 ...wait
match CLIMBCHECK8 type ahead
put exp survival 100
matchwait

SWIMCHECK8:
pause
match ROS-TO-RIV Swimming:
match SKILLCHECK8 EXP HELP
match SWIMCHECK8 ...wait
match SWIMCHECK8 type ahead
put experience survival 30
matchwait

SKILLCHECK8:
pause
match ROS-LONGWAY Climbing:
match NOROSSMAN2 EXP HELP
match SKILLCHECK8 ...wait
match SKILLCHECK8 type ahead
put exp survival 50
matchwait

NOROSSMAN2:
ECHO
ECHO ==============================
ECHO *** You do not have enough perception (140), climbing (100), or swimming (30) which are all required to take the shortcut from Rossman's to Riverhaven, nor do you have the 50 ranks of climbing required to get from Rossman's to Therenborough.  You must rent a boat to sail on Lake Gwenalion, moongate out, or find someone to help you.
ECHO ==============================
ECHO
EXIT

ROS-LONGWAY:
pause
ECHO
ECHO ============================
ECHO *** You don't have enough perception (140), climbing (100), or swimming (30) to take the shortcut from Rossman's to Riverhaven.
ECHO *** You will be taken the long way using the barge from Langenfirth to Riverhaven.
ECHO =============================
ECHO
GOTO ROS-THE

ROS-TO-RIV:
pause
move e
move se
move e
move se
move s
move se
move s
move go river
ECHO
ECHO
ECHO * * * Swimming down the swift-flowing Jantspyre River towards Riverhaven
ECHO * * * Named the "Giant's Pyre" for a boulder formation in the river which resembles a massive corpse on a funeral pyre
ECHO
pause 
move w
pause 0.5
pause 0.5
move sw
pause 0.5
pause 0.5
move sw
pause 0.5
pause 0.5
move w
ECHO
ECHO
ECHO * * * Entering territory inhabited by poisonous nightreaver unyns
ECHO
pause 0.5
pause 0.5
move go bank
move sw
move s
move se
move s
move s
put s

SEARCHOUTCROP3A:
save SEARCHOUTCROP3A
match SEARCHOUTCROP3B irregular handholds!
match SEARCHOUTCROP3A don't find anything of interest.
match pause ...wait
match pause type ahead
put search outcrop
matchwait

SEARCHOUTCROP3B:
move climb handhold
move climb handhold
move sw
move se
move s
move sw
move s
move se
move e
ECHO
ECHO
ECHO * * * Passing a meadow where barghests graze
ECHO
move sw
move s
move se
move sw
move s
move sw
move se
move s
move s
ECHO
ECHO
ECHO * * * The western wilds of Riverhaven, inhabited by
ECHO * * * Goblin shamans, crayfish, eels, rams, bears, arbelogs, ogres, and wolf spiders
ECHO
move s
move se
move go gate
move e
move e
move e
move e
move e
move e
move e
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO * * * Site of the Dunshade manor, where Byron Dunshade murdered his wife Tatia and daughter Laurel then killed himself.
ECHO * * * Home to the olvio from the badlands to the northwest, who built the Halfling Quarter in town.
ECHO ===================
ECHO
GOTO %1

RIV-DIR:
GROUPCHECK2:
pause
match BURDENCHECK2 You have no group
match BURDENCHECK2 You must be visible
match GROUP2 You whisper
put whisper group ...
matchwait

GROUP2:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY
ECHO
GOTO RIV-FER

BURDENCHECK2:
save BURDENCHECK2
match BURDENCHECK2A Encumbrance : None
match BURDENCHECK2A Encumbrance : Light
match BURDENCHECK2B Encumbrance : Somewhat
match BURDENCHECK2C Encumbrance : Burdened
match BURDENCHECK2D Encumbrance : Heavy
match BURDENCHECK2E Encumbrance : Very Heavy
match BURDENCHECK2F Overburdened
match BURDENCHECK2G Encumbrance : Tottering
match BURDENCHECK2H even able to move?
match BURDENCHECK2I amazing you aren't squashed!
match PAUSE ...wait
match PAUSE type ahead
put info
matchwait

BURDENCHECK2A:
pause
match RIV-DIR-SOUTH Swimming:
match CANTSWIM2 EXP HELP
put experience survival 120
matchwait

BURDENCHECK2B:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 170
matchwait

BURDENCHECK2C:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 210
matchwait

BURDENCHECK2D:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 250
matchwait

BURDENCHECK2E:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 290
matchwait

BURDENCHECK2F:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 330
matchwait

BURDENCHECK2G:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 370
matchwait

BURDENCHECK2H:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 410
matchwait

BURDENCHECK2I:
pause
match RIV-DIR-SOUTH Swimming:
match OVERBURDENED2 EXP HELP
put experience survival 450
matchwait

CANTSWIM2:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY
ECHO
goto RIV-FER

OVERBURDENED2:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY
ECHO
GOTO RIV-FER

RIV-FER:
pause
move w
move go municipal pier
move go wooden archway
move go ramp
HAVENFERRYSOUTH:
put stand
pause
put go ferry
match WAITFORHAVENFERRYSOUTH wait for the next one.
match WAITFORHAVENFERRYSOUTH until the next one arrives.
match WAITFORHAVENFERRYSOUTH I could not find what you were referring to.
match WAITFORHAVENFERRYSOUTH What were you referring to?
match WAITONHAVENFERRYSOUTH You hand him your lirums and climb aboard.
match WAITONHAVENFERRYSOUTH The Captain gives you a little nod
match GETMONEYHAVENFERRYSOUTH You haven't got enough lirums
matchwait

WAITFORHAVENFERRYSOUTH:
;put hide
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls up to the dock
goto HAVENFERRYSOUTH

GETMONEYHAVENFERRYSOUTH:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
move go ramp
move go wooden archway
move ne
move nw
move n
move n
move go bank
move go arch
put withdraw 30 copper
pause
put withdraw 30 copper
move go arch
move out
move s
move s
move se
move go municipal pier
move go wooden archway
move go ramp
GOTO HAVENFERRYSOUTH

WAITONHAVENFERRYSOUTH:
;put hide
pause
ECHO
ECHO *** Riding the ferry south across the Faldesu River
ECHO *** This ferry is operated by House Shillat, one of the 16 Therengian great houses (or Morzindaen)
ECHO
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
goto %1

FER-DIR:
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO 
pause
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO 
pause
GOTO CROC-DIR

RIV-FALDESU:
pause
move e
move e
move e
move e
move e
move e
move e
move go gate
pause
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto finish

FAL-FER:
ECHO
ECHO
ECHO * * * Passing through swamplands where crocodiles and leeches reside
ECHO
pause
move se
move s
move s
move s
move se
move s
move se
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
goto %1


RIV-DIR-SOUTH:
pause
move e
move e
move e
move e
move e
move e
move e
move go gate
put dive river
ECHO
ECHO
ECHO * * * Now swimming south across the Faldesu River towards the farmlands of southern Therengia
ECHO 
put se
pause
put se
pause
put se
pause
put se
SSWIMROCK:
pause
put se
pause
match SSWIMSOUTHWEST but see nothing of interest
match SSWIMROCK You glance
match SSWIMROCK ...wait
put peer south
put glance
matchwait

SSWIMSOUTHWEST:
pause
put sw
match SSWIMSOUTHWEST You struggle
match SSWIMSOUTHWEST You blunder
match SSWIMSOUTHWEST You slap
match SSWIMSOUTHWEST You work
match SSWIMSOUTHWEST You flounder
match SSWIMSHORE [
match SSWIMSHORE You swim
match SSWIMSOUTHWEST ...wait
matchwait

SSWIMSHORE:
pause
put se
match SSWIMSHORE [
match SSWIMSHORE You swim
match SCLIMBBRIDGE You can't swim
match SSWIMSHORE ...wait
matchwait

SCLIMBBRIDGE:
pause
move climb bridge
ECHO
ECHO
ECHO * * * Passing through swamplands where crocodiles and leeches reside
ECHO
move se
move s
move s
move s
move se
move s
move se
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO 
CROC-DIR:
move e
move e
move e
move e
move e
move e
move e
move e
move e
move se
move s
move s
move go bridge
move s
ECHO
ECHO
ECHO * * * The ruins of Sicle Grove, destroyed by the eruption
ECHO * * * of the Greater Fist caused by the fire mage Mibgluc
ECHO * * * Previously a medical community and home to Timothy, now inhabited by fire maidens
ECHO
ECHO
move se
move s
move sw
move sw
move s
move s

LAVA19:
match LAVA20 [North Road, Tunnel]
match LAVAP19 You must be standing to do that.
match LAVAP19 You can't do that while lying down.
put go tunnel
matchwait

LAVAP19:
put stand
pause
goto LAVA19

LAVA20:
match LAVA21 Your view north is partially blocked
match LAVAP20 You must be standing to do that.
match LAVAP20 You can't do that while lying down.
put s
matchwait

LAVAP20:
put stand
pause
goto LAVA20

LAVA21:
match LAVA22 The route descends into the dust
match LAVAP21 You must be standing to do that.
match LAVAP21 You can't do that while lying down.
put s
matchwait

LAVAP21:
put stand
pause
goto LAVA21

LAVA22:
ECHO
ECHO
ECHO * * * Passing the ruined town of Skeleton's Crook and the Gate of Souls
ECHO * * * Inhabited by fire sprites, firecats, atik'et, and westanuryns
ECHO 
match LAVA23 Occasional flashes of red light
match LAVAP22 You must be standing to do that.
match LAVAP22 You can't do that while lying down.
put sw
matchwait

LAVAP22:
put stand
pause
goto LAVA22

LAVA23:
match LAVA24 A tongue of molten lava
match LAVAP23 You must be standing to do that.
match LAVAP23 You can't do that while lying down.
put go old flow
matchwait

LAVAP23:
put stand
pause
goto LAVA23

LAVA24:
match LAVA25 The wind rips a stream
match LAVAP24 You must be standing to do that.
match LAVAP24 You can't do that while lying down.
put sw
matchwait

LAVAP24:
put stand
pause
goto LAVA24

LAVA25:
match LAVA26 As the road crosses a low point
match LAVAP25 You must be standing to do that.
match LAVAP25 You can't do that while lying down.
put sw
matchwait

LAVAP25:
put stand
pause
goto LAVA25

LAVA26:
pause
match LAVASOUTH1 No one!
match LAVASOUTH2 You have:
put assess group
put wealth
matchwait

LAVASOUTH1:
PAUSE
put stand
put s
match DIGSOUTH1 feeble attempt
match DIGSOUTH1 falling short of your goal.
match DIGSOUTH1 holds you tightly, preventing
match LAVASOUTH1 fails to keep up with you through the
match WALKSOUTH1 You easily navigate
match WALKSOUTH1 is difficult, but manageable...
match WALKSOUTH1 succeeding only with effort
match LAVASOUTH1 ...wait
matchwait

DIGSOUTH1:
pause
put stand
put dig
match LAVASOUTH1 You manage to dig enough
match DIGSOUTH1 You struggle to dig
match WALKSOUTH1 You will have to kneel
match DIGSOUTH1 ...wait
matchwait

LAVASOUTH2:
PAUSE
put stand
put s
match DIGSOUTH2 feeble attempt
match DIGSOUTH2 falling short of your goal.
match DIGSOUTH2 holds you tightly, preventing
match WALKSOUTH2 You easily navigate
match WALKSOUTH2 is difficult, but manageable...
match WALKSOUTH2 succeeding only with effort
match LAVASOUTH2 ...wait
matchwait

DIGSOUTH2:
pause
put stand
put dig
match LAVASOUTH2 You manage to dig enough
match DIGSOUTH2 You struggle to dig
match WALKSOUTH2 You will have to kneel
match DIGSOUTH2 ...wait
matchwait

WALKSOUTH2:
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING ***
ECHO
ECHO
pause
waitfor You glance
goto WALKSOUTH1

WALKSOUTH1:
pause
LAVA27:
match LAVA28 The reek of the gasses
match LAVAP27 You must be standing to do that.
match LAVAP27 You can't do that while lying down.
put go narrow trail
matchwait

LAVAP27:
put stand
pause
goto LAVA27

LAVA28:
match LAVA29 [North Rim, Canyon]
match LAVAP28 You must be standing to do that.
match LAVAP28 You can't do that while lying down.
put e
matchwait

LAVAP28:
put stand
pause
goto LAVA28

LAVA29:
match LAVA30 The road north is blocked
match LAVAP29 You must be standing to do that.
match LAVAP29 You can't do that while lying down.
put go trail
matchwait

LAVAP29:
put stand
pause
goto LAVA29

LAVA30:
match LAVA31 The land about you is still and lifeless.
match LAVAP30 You must be standing to do that.
match LAVAP30 You can't do that while lying down.
put se
matchwait

LAVAP30:
put stand
pause
goto LAVA30

LAVA31:
match LAVA32 Heat rises in palpable waves
match LAVAP31 You must be standing to do that.
match LAVAP31 You can't do that while lying down.
put s
matchwait

LAVAP31:
put stand
pause
goto LAVA31

LAVA32:
match LAVA33 [North Road]
match LAVAP32 You must be standing to do that.
match LAVAP32 You can't do that while lying down.
put s
matchwait

LAVAP32:
put stand
pause
goto LAVA32

LAVA33:
match LAVA34 [North Roads Caravansary]
match LAVAP33 You must be standing to do that.
match LAVAP33 You can't do that while lying down.
put s
matchwait

LAVAP33:
put stand
pause
goto LAVA33

LAVA34:
ECHO
ECHO ===================
ECHO *** Entering the Province of Zoluren
ECHO *** Governed by Prince Vorclaf
ECHO *** Named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO ===================
ECHO 
pause
ECHO
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO 
GOTO %1

DIR-STO:
pause
move se
move se
move se
move se
move s
move sw
move sw
move sw
move sw
move s
move s
move s
move se
move sw
move s
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Passing the Silverwater Mines and Silverwater Lake, inhabited by faenrae reavers and wind hounds.
ECHO
move sw
ECHO
ECHO
ECHO * * * This copse holds a Dark Temple with skeletons, zombies, and other undead.
ECHO
move s
move s
move se
move se
move s
move sw
move s
move go wood bridge
move s
move s
move s
move s
move s
move s
move s
move se
move sw
ECHO
ECHO
ECHO * * * Passing a wilderness path where leucros, vipers, geni, and rock guardians dwell
ECHO 
move sw
move w
move w
move s
move sw
move s
move s
ECHO
ECHO ===================
ECHO *** STONE CLAN aka STAAN STOK (in Dwarven Haakish)
ECHO * * * Led by the clan elder, Cloudcrest
ECHO * * * Dwarves are said to be loathed by Elves because it was Dwarves who killed Keloryon, Father of all Elves, and because of the enslavement of many Wind Elves in the Dragonspine Mountains.
ECHO ===================
ECHO
GOTO %1

STO-KAE:
pause
move w
move w
move s
move se
move se
move go town gate
move sw
ECHO
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
goto finish

STO-ART:
pause
move w
move w
move s
move se
move se
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
pause
move sw
move s
move go town gate
move sw
move s
move s
move s
move s
move s
move s
move w
move w
move w
move sw
move sw
move sw
move s
move s
move s
move se
move se
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO * * * A Halfling village, founded by Daffleberry Tanglefoot
ECHO * * * Patron god is Glythtide the ram, god of joy, wine, song,
ECHO * * * and fellowship, and patron to Bards, gourmands, and drunks.
ECHO ===================
ECHO
GOTO %1

ART-CRO:
pause
move s
move s
move se
move sw
move s
move s
move se
move w
move sw
move sw
move w
move w
move go birch copse
move sw
move sw
move w
move sw
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO
move sw
move s
move go crumbling archway
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * Protected by Ulf'Hara Keep, home to Prince Vorclaf, leader of the province of Zoluren
ECHO * * * Heart of the Five Provinces, called The Dragon's Realms because they were formed by Lanival "the Dragon"
ECHO ===================
ECHO
GOTO %1

CAR-CRO:
pause
move se
move se
move se
move se
move s
move sw
move sw
move sw
move sw
move s
move s
move s
move se
move sw
move s
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Silverwater Mines: inhabited by faenrae reavers and wind hounds.
ECHO
move sw
ECHO
ECHO
ECHO * * * Dark Temple: skeletons, zombies, and other undead.
ECHO
move s
move s
move se
move se
move s
move sw
move s
move go wood bridge
move s
move s
move s
move s
move s
move s
move s
move se
move sw
ECHO
ECHO
ECHO * * * Wilderness path: where leucros, vipers, geni, and rock guardians dwell
ECHO 
move sw
move w
move w
move s
move sw
move s
move s
ECHO
ECHO ===================
ECHO *** STONE CLAN
ECHO ===================
ECHO
move w
move w
move s
move se
move se
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
move sw
move s
move go town gate
move sw
move s
move s
move s
move s
move s
move s
move w
move w
move w
move sw
move sw
move sw
move s
move s
move s
move se
move se
ECHO
ECHO ===================
ECHO *** ARTHE DALE, a Halfling village!
ECHO ===================
ECHO
move s
move s
move se
move sw
move s
move s
move se
move w
move sw
move sw
move w
move w
move go birch copse
move sw
move sw
move w
move sw
move sw
move s
move go crumbling archway
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * Protected by Ulf'Hara Keep, home to Prince Vorclaf, leader of the province of Zoluren
ECHO * * * Heart of the Five Provinces, called The Dragon's Realms because they were formed by Lanival "the Dragon"
ECHO ===================
ECHO
GOTO %1

leth-exp2:
match cro-tig Swimming:
match cro-let EXP HELP
put exp survival 300
matchwait

cro-let:
CHECKGUILD:
match GROUPCHECK4 Guild: Thief
match CRO-FER Gender:
put info
matchwait

GROUPCHECK4:
pause
match BURDENCHECK4 You have no group
match BURDENCHECK4 You must be visible
match CRO-FER You whisper
put whisper group ...
matchwait

BURDENCHECK4:
save BURDENCHECK4
match SWIMCHECK4A Encumbrance : none
match SWIMCHECK4A Encumbrance : light
match SWIMCHECK4B Encumbrance : somewhat
match SWIMCHECK4C Encumbrance : Burdened
match SWIMCHECK4D Encumbrance : Heavy
match SWIMCHECK4E Encumbrance : Very Heavy
match SWIMCHECK4F Overburdened
match SWIMCHECK4G Encumbrance : Tottering
match SWIMCHECK4H even able to move?
match SWIMCHECK4I amazing you aren't squashed!
match pause ...wait
match pause type ahead
put info
matchwait

SWIMCHECK4A:
pause
match PAS-LET Swimming:
match CRO-FER EXP HELP
put experience survival 25
matchwait

SWIMCHECK4B:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 40
matchwait

SWIMCHECK4C:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 75
matchwait

SWIMCHECK4D:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 110
matchwait

SWIMCHECK4E:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 140
matchwait

SWIMCHECK4F:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 175
matchwait

SWIMCHECK4G:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 210
matchwait

SWIMCHECK4H:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 240
matchwait

SWIMCHECK4I:
pause
match PAS-LET Swimming:
match OVERBURDENED4 EXP HELP
put experience survival 270
matchwait

OVERBURDENED4:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY
ECHO
GOTO CRO-FER

CRO-FER:
pause
move sw
move go Longbow Bridge
move sw
move w
move w
move w
move w
move sw
move go wooden pier

CROSSINGFERRYSOUTH:
put stand
pause
put go ferry
match WAITFORCROSSINGFERRYSOUTH wait for the next one.
match WAITFORCROSSINGFERRYSOUTH until the next one arrives.
match WAITFORCROSSINGFERRYSOUTH I could not find what you were referring to.
match WAITFORCROSSINGFERRYSOUTH What were you referring to?
match WAITFORCROSSINGFERRYSOUTH There is no ferry here to go aboard.
match WAITONCROSSINGFERRYSOUTH You hand him your
match WAITONCROSSINGFERRYSOUTH The Captain gives you a little nod
match WAITONCROSSINGFERRYSOUTH You silently slip aboard,
match WAITONCROSSINGFERRYSOUTH But I see you're pretty young
match GETMONEYCROSSINGFERRYSOUTH You haven't got enough
matchwait

WAITFORCROSSINGFERRYSOUTH:
;put hide
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls into the
goto CROSSINGFERRYSOUTH

GETMONEYCROSSINGFERRYSOUTH:
ECHO
ECHO *** GETTING KRONARS FROM THE BANK ***
ECHO
pause
move go Lemicus Square
move ne
move e
move e
move e
move e
move ne
move go Longbow Bridge
move ne
move go Provincial Bank
move go teller window
put withdraw 35 copper
pause
put withdraw 35 copper
pause
move out
move out
goto CRO-FER

WAITONCROSSINGFERRYSOUTH:
;put hide
pause
ECHO
ECHO *** Riding south across the mighty Segoltha River towards Leth Deriel, the ancient Elven stronghold.
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * Between Crossing and Leth is the Forest of Night, created by the mad mage Sithsia.
ECHO
ECHO * * * Lord Ellinton, Sithsia's employer, built her a keep in the Endrus Forest
ECHO * * * During a conflict with Ellinton's enemies his son was slain.
ECHO * * * Sithsia wept tears of blood and fell into madness.
ECHO * * * She called to the dead to rise and kill all, friend and foe.
ECHO
ECHO * * * Today magic and life are twisted and dark in the Forest of
ECHO * * * Night and Sithsia, if she lives, hides in her ever-moving keep
ECHO
ECHO * * * You can read more in "The Forest of Night" at the Izma University in Leth Deriel.
ECHO ====================================
ECHO
pause 60
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Sithsia, mage of the Forest, is credited with ending the Dragon Priest reign
ECHO
ECHO * * * Dzree sent 10,000 troops to conquer Leth Deriel, but only 1 returned.
ECHO * * * He spoke of a twisted forest of mist and darkness and mishappen fae
ECHO * * * Dzree sent more armies, but each time all perished but one survivor.
ECHO
ECHO * * * Then one day Sithsia appeared to Dzree before the Throne of Blood and 
ECHO * * * told Dzree she would never have Leth Deriel, then prophesied that Dzree
ECHO * * * and her empire would fall in one year, and so it did.
ECHO
ECHO * * * You can read more in "The Legend of the World Dragon" at The Crossing Temple
ECHO ====================================
ECHO
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
goto %1

FER-LET:
pause
move s
move s
move s
GOTO BOULDERSOUTH

PAS-LET:
pause
move sw
move go bridge
move n
move n
move go ware
move s
put open trap
move go trap
move go river
move w
move n
match PAS-LET-CONT2 You duck quietly 
match RETURN2CRO I could not find
match RETURN2CRO What were you referring to?
put go panel
matchwait

RETURN2CRO:
pause
move s
move e
move go ware
move u
move n
move out
move s
move s
move go bridge
move ne
goto CRO-FER

PAS-LET-CONT2:
move climb step
ECHO
ECHO
ECHO * * * You have entered the fabled 5th Passage of which many Thieves spent years trying to find
ECHO 
SMOVE:
pause
put s
match SMOVE1 You splash south, moving sideways to the current.
match SMOVE You slap
match SMOVE You struggle
match SMOVE You flounder
match SMOVE make much headway
match SMOVE ...wait
match SMOVE type ahead
matchwait

SMOVE1:
pause
put s
match SMOVE2 You splash south, moving sideways to the current.
match SMOVE1 You slap
match SMOVE1 You struggle
match SMOVE1 You flounder
match SMOVE1 make much headway
match SMOVE1 ...wait
match SMOVE1 type ahead
matchwait

SMOVE2:
PAUSE
put sw
match SMOVE3 You splash southwest
match SMOVE2 You slap
match SMOVE2 You struggle
match SMOVE2 You flounder
match SMOVE2 make much headway
match SMOVE2 ...wait
match SMOVE2 type ahead
matchwait

SMOVE3:
pause
put sw
match SMOVE4 You wade southwest
match SMOVE3 You slap
match SMOVE3 You struggle
match SMOVE3 You flounder
match SMOVE3 make much headway
match SMOVE3 ...wait
match SMOVE3 type ahead
matchwait

SMOVE4:
pause
put down
match SMOVE5 You swim down
match SMOVE4 You slap
match SMOVE4 You struggle
match SMOVE4 You flounder
match SMOVE4 make much headway
match SMOVE4 ...wait
match SMOVE4 type ahead
matchwait

SMOVE5:
pause
put s
match SMOVE6 You swim south
match SMOVE5 You slap
match SMOVE5 You struggle
match SMOVE5 You flounder
match SMOVE5 make much headway
match SMOVE5 ...wait
match SMOVE5 type ahead
matchwait

SMOVE6:
pause
put sw
match SMOVE7 You swim southwest
match SMOVE6 You slap
match SMOVE6 You struggle
match SMOVE6 You flounder
match SMOVE6 make much headway
match SMOVE6 ...wait
match SMOVE6 type ahead
matchwait

SMOVE7:
pause
put sw
match SMOVE8 You swim southwest
match SMOVE7 You slap
match SMOVE7 You struggle
match SMOVE7 You flounder
match SMOVE7 make much headway
match SMOVE7 ...wait
match SMOVE7 type ahead
matchwait

SMOVE8:
pause
put s
match SMOVE9 You swim south
match SMOVE8 You slap
match SMOVE8 You struggle
match SMOVE8 You flounder
match SMOVE8 make much headway
match SMOVE8 ...wait
match SMOVE8 type ahead
matchwait

SMOVE9:
pause
put up
match SMOVE10 You wade up
match SMOVE9 You slap
match SMOVE9 You struggle
match SMOVE9 You flounder
match SMOVE9 make much headway
match SMOVE9 ...wait
match SMOVE9 type ahead
matchwait

SMOVE10:
pause
move sw
move w
move sw
move climb ladder
move go gap
BOULDERSOUTH:
ECHO
ECHO * * * Now entering the Endrus Forest, home to Leth Deriel.
ECHO 
move s
move sw
move sw
move sw
move sw
move s
move se
move se
move s
move s
move sw
move sw
move sw
move s
move se
ECHO
ECHO
ECHO * * * Passing the Forest of Night, created by mad mage Sithsia
ECHO * * * Home to nyads, dryads, and death spirits
ECHO
move sw
move s
move sw
move s
move s
move se
move se
move sw

WEBSOUTH1:
match NOWEBSOUTH Thick trees line the route here,
match WEBSOUTH2 Roundtime
match WEBSOUTH2 You can't do that while
match WEBSOUTH2 ...wait
put sw
MATCHWAIT

WEBSOUTH2:
pause
ECHO
ECHO *** You are stuck in a spider's web.  Be patient.
ECHO
match WEBSOUTH1 Using your escape
match WEBSOUTH1 The webs break apart and fall away, releasing you.
matchwait

NOWEBSOUTH:
move sw
move sw
move s
move sw
move se
move se
move s
move s
move se
move se
move s
move s
move se
move go bower gate
move se
move se
move se
move se
move se
move se
move se
ECHO
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Protected by the mad mage Sithsia
ECHO ===================
ECHO 
GOTO %1

LET-GON:
pause
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Passing the manor of Lasarhhtha Oshu'ehhrsk the Bone Dancer
ECHO * * * Home to bone wolves, zombies, germish'din, and kartais
ECHO 
move s
move s
move sw
move sw
move s
move s
move sw
move sw
move sw
move s
move s
move s
move s
move sw
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move sw
move sw
move s
move s
move sw
move sw
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move w
move w
move sw
move sw
move s
move sw
move s
move sw
move s
move sw
move s
move sw
move sw
move s
move s
ECHO
ECHO
ECHO * * * Entering the Dragonspine Mountains via the Obsidian Pass
ECHO * * * Beware of snowbeasts, particularly down that track
ECHO
move se
move sw
move s
put stow left
pause
put stow right
move climb platform
goto %1

north-platform:
northgondolacheck:
ECHO *** Northern Gondola Platform
pause
match nsundergondola Climbing:
match 2north-platform EXP HELP
put experience 540
matchwait

2north-platform:
pause
match WAITONSOUTHGONDOLA [Gondola
match WAITFORSOUTHGONDOLA There is no
put go gondola
matchwait

WAITFORSOUTHGONDOLA:
pause
ECHO
ECHO *** WAITING FOR THE GONDOLA TO ARRIVE ***
ECHO * * * If you believe you can take the quick shortcut under the
ECHO * * * gondola (approximately 540 base ranks of climbing) type SHORTCUT1
ECHO
pause
put look gondola
match GETONSOUTHGONDOLA The gondola stops on the platform
match WAITFORSOUTHGONDOLA YOU HAVE BEEN IDLE
match nsundergondola SHORTCUT1
matchwait 

GETONSOUTHGONDOLA:
put stand
pause
move go gondola
goto WAITONSOUTHGONDOLA

nsundergondola:
pause
move go ridge
move n
goto CLIMB-BRANCH

CLIMB-BRANCH:
SAVE CLIMB-BRANCH
match CLIMB-NICHE A stand of tall trees comes into view
match FAIL-BRANCH1 steepness is intimidating
match FAIL-BRANCH1 can't seem to find purchase
match FAIL-BRANCH1 find it hard going.
match FAIL-BRANCH1 A wave of dizziness hits you
match FAIL-BRANCH1 Struck by vertigo
match FAIL-BRANCH1 your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb branch
matchwait

FAIL-BRANCH1:
SAVE FAIL-BRANCH1
pause
match CLIMB-NICHE A stand of tall trees comes into view
match FAIL-BRANCH2 steepness is intimidating
match FAIL-BRANCH2 can't seem to find purchase
match FAIL-BRANCH2 find it hard going.
match FAIL-BRANCH2 your footing is questionable
match FAIL-BRANCH2 A wave of dizziness hits you
match FAIL-BRANCH2 Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb branch
matchwait

FAIL-BRANCH2:
SAVE FAIL-BRANCH2
pause
match CLIMB-NICHE A stand of tall trees comes into view
match FAIL-BRANCH3 steepness is intimidating
match FAIL-BRANCH3 can't seem to find purchase
match FAIL-BRANCH3 find it hard going.
match FAIL-BRANCH3 your footing is questionable
match FAIL-BRANCH3 A wave of dizziness hits you
match FAIL-BRANCH3 Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb branch
matchwait

FAIL-BRANCH3:
SAVE FAIL-BRANCH3
pause
match CLIMB-NICHE A stand of tall trees comes into view
match LEAVE-BRANCH steepness is intimidating
match LEAVE-BRANCH can't seem to find purchase
match LEAVE-BRANCH find it hard going.
match LEAVE-BRANCH your footing is questionable
match LEAVE-BRANCH A wave of dizziness hits you
match LEAVE-BRANCH Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb branch
matchwait

LEAVE-BRANCH:
pause
put retreat
move south
move climb platform
goto failed-branch

FAILED-BRANCH:
pause
ECHO
ECHO *** You failed 4 attempts to climb under the gondola.
ECHO *** Maybe you should just stay put and wait like everyone else.
ECHO
goto 2north-platform

CLIMB-NICHE:
SAVE CLIMB-NICHE
match CLIMB-LEDGE The steep climb shows no signs
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
PUT climb craggy niche
matchwait

CLIMB-LEDGE:
pause
SAVE CLIMB-LEDGE
match CLIMB-WALL Vegetation creeps in and out
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
PUT climb narrow ledge
matchwait

CLIMB-WALL:
SAVE CLIMB-WALL
match CLIMBED-WALL Widening and flattening out, the steep climb
match CLIMBED-WALL The steep climb shows no signs
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
PUT climb stone wall
matchwait

CLIMBED-WALL:
move up
move n
move ne
goto CLIMB-EMBANKMENT

CLIMB-EMBANKMENT:
SAVE CLIMB-EMBANKMENT
match CLIMB-LOG Willowy branches reach out
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
put climb embankment
matchwait

CLIMB-LOG:
SAVE CLIMB-LOG
match CLIMBED-LOG Tamarisk bushes display their feathery
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
put climb fallen log
matchwait

CLIMBED-LOG:
move s
move s
move sw
move s
move sw
move sw
move go cleft
move go crack
move e
move e
move sw
move s
move se
move sw
move go trail
move n
move ne
move go door
move go frame
goto %1
===============

WAITONSOUTHGONDOLA:
put s
;put hide
pause
ECHO
ECHO ================================
ECHO *** Riding south over the great chasm of the Obsidian Pass towards Shard, the Crystal City
ECHO ================================
ECHO
pause 60
ECHO
ECHO ================================
ECHO *** Dragon Priests make their home in western Ilithi and southern Forfedhdar
ECHO *** Many of the deadly creatures that roam Ilithi were brought by the Dragon Priests
ECHO *** They summoned the Vykathi of the hive and the Frostweavers in the Dragonspine Mountains
ECHO *** They created the Adan'f from lizards
ECHO ================================
ECHO
pause 60
ECHO
ECHO ================================
ECHO *** Ferdahl Alec, son of Corik and father to Kukalakai, built the gondola to connect Ilithi to the Mountain Elves.
ECHO *** The Mountain Elves, led by Queen Morganae, were responsible for maintaining the gondola.
ECHO *** However, one day Morganae's only daughter, Princess Anlorahle, was slaughtered on the gondola by a snow beast sent by Necromancer Sidhlot.
ECHO *** Since that day the Mountain Elves have abandoned the gondola, yet it still slowly drifts between the platforms, as if pushed by some ghostly hand.
ECHO ================================
ECHO
pause 60
ECHO
ECHO ================================
ECHO *** A switchback trail outside the south platform leads beneath the gondola and to many creatures,
ECHO *** including snowbeasts, gargoyles, frostweavers, red leucros, blade spiders, and la'tami
ECHO ================================
ECHO
pause
match GETOFFSOUTHGONDOLA With a soft bump, the gondola
match WAITONSOUTHGONDOLA YOU HAVE BEEN IDLE
matchwait 

GETOFFSOUTHGONDOLA:
put south
move out
ECHO
ECHO *** SOUTHERN GONDOLA PLATFORM ***
ECHO
goto %1

on-gondola:
ECHO
ECHO *** You are aboard the gondola within the Obsidian Pass of the Dragonspine Mountains
ECHO *** If you want out and are able, you better do it now
ECHO *** Otherwise you will be taken off the gondola at the next landing and continue on to your destination.
ECHO
waitfor With a soft bump, the gondola
put n
put out
pause
put south
put out
pause
goto %1

gon-fay:
ECHO
ECHO ===================
ECHO *** Entering the province of Illithi
ECHO ===================
ECHO
pause
move go door frame
move go oak door
move sw
move s
move se
move go wooded path
move sw
move w
move w
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO * * * Inhabited by Wood Elves and Halflings
ECHO * * * Home to Marachek's Oak
ECHO ===================
echo
goto %1

fay-ste:
pause
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move sw
move sw
move s
move s
move sw
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO 
move sw
move s
move sw
move sw
move sw
move go bridle path
move w
ECHO
ECHO ===================
ECHO *** STEELCLAW CLAN
ECHO *** A clan of Elven warriors and barbarians
ECHO ===================
ECHO
goto %1

ste-sha:
pause
move e
move go dusky path
move s
ECHO
ECHO
ECHO * * * The Golden Grain Fields
ECHO * * * Over the stile are jackals, boggles, kobolds, and goblins
ECHO 
move w
move w
move sw
move w
move w
move s
move s
move se
move se
move sw
ECHO
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered then released by the Outcasts.
ECHO ===================
ECHO
goto %1

gon-sha:
ECHO
ECHO ===================
ECHO *** Entering the province of Illithi
ECHO * * * A province of Elotheans and Elves
ECHO * * * Home of the Dragon Spine Mountains, Lanival's last known location.
ECHO * * * Home of the Dragon Priests, enemy of the seven races, summoners
ECHO * * * of the Vykathi and Frostweavers, and creators of Adan'f from lizards.
ECHO ===================
ECHO
pause
move go door frame
move go oak door
move sw
move s
move se
move go wooded path
move sw
move w
move w
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO ===================
echo
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move sw
move sw
move s
move s
move sw
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO 
move sw
move s
move sw
move sw
move sw
move s
ECHO
ECHO
ECHO * * * The Golden Grain Fields: jackals, boggles, kobolds, and goblins
ECHO 
move w
move w
move sw
move w
move w
move s
move s
move se
move se
move sw
ECHO
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered then released by the Outcasts.
ECHO ===================
ECHO
goto %1

shard-directions:
ECHO
ECHO ===================
ECHO *** Go south to get to the North Gate.
ECHO *** Go trail towards the West Gate, or
ECHO *** Follow the long road eastward to the East Gate
ECHO ===================
ECHO
goto finish

sha-hor:
pause
move go muddy trail
move w
move sw
move sw
move s
ECHO
ECHO
ECHO * * * Passing Wyvern Mountain, home to a World Dragon shrine built by Sh'kial
ECHO
move w
move nw
move n
move nw
move w
move n
move nw
move n
move nw
move nw
move n
move ne
move ne
move ne
move n
move ne
move n
move nw
move nw
move w
move nw
move w
move w
move sw
move nw
move w
move w
move w
move w
move w
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move sw
move w
move sw
move climb narrow path
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
move w
move nw
move w
move sw
move climb game trail
move nw
move s
move sw
move w
move nw
move w
move w
move w
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Under D'zree the Dragon Priests once conquered most of the 5 provinces
ECHO
pause
move sw
move se
move s
move w
move sw
move w
move sw
move w
move sw
move w
move nw
move w
move nw
move w
move nw
move w
move s
move go path
ECHO
ECHO ===================
ECHO *** HORSE CLAN aka Zaldi Taipa (in Elven)
ECHO *** A nomadic clan of Wind Elves
ECHO *** Governed by the Indar Taipan, Elven for "Strength of the Clan"
ECHO *** The wife of the chieften is called Carwu Taipen, Elven for "Heart of the Clan"
ECHO *** The eldest shaman is called the Jan Taipen, Elven for "Spirit of the Clan"
ECHO *** Home to the Sulde Taala, a special horse nearly worshipped by the clan, sometimes called Horse of the Huntress or the Sun-Horse.
ECHO ===================
echo
goto finish

hor-sha:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
pause
move go path
move n
move e
move se
move e
move se
move e
move se
move e
move ne
move e
move ne
move e
move ne
move e
move n
move nw
move ne
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Founded by a harmless priest named Sh'kial, turned wicked by his scheming student D'zree
ECHO
pause
move e
move e
move e
move se
move e
move ne
move n
move se
move climb bluff
move ne
move e
move se
move e
move climb narrow path
move ne
move e
move ne
move e
move se
move ne
move ne
move e
move e
move se
move ne
move ne
move e
move e
move se
move ne
move e
move e
move e
move e
move e
move se
move ne
move e
move e
move se
move e
move se
move se
move s
move sw
move s
move sw
move sw
move sw
move s
move se
move se
move s
move se
move s
move e
move se
move s
move se
move e
move go muddy trail
move ne
move ne
move e
move e
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation and home to Elves, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered by the Outcasts.
ECHO ===================
ECHO
goto %1

sha-n:
pause
move n
move n
move n
move n
move n
goto %1

sha-e:
pause
move e
move e
move e
move e
move e
move n
move n
move n
move n
move n
move n
move n
move n
move nw
move nw
move nw
move nw
move nw
move nw
move w
move w
move w
move w
move w
move w
move w
goto %1

sha-s:
pause
move go city gate
move e
move e
move ne
move ne
move ne
move n
move n
move nw
move nw
move nw
move w
move w
move go city gate
goto sha-n

sha-w:
pause
move w
move w
move w
move w
move go muddy trail
move ne
move ne
move e
move e
goto %1

sha-ste:
pause
move ne
move nw
move nw
move n
move n
move e
move e
move ne
move e
move e
ECHO
ECHO
ECHO * * * Passing through the Golden Grain Fields north of Shard.
ECHO * * * Over the stile are jackals, boggles, kobolds, and goblins
ECHO 
move n
move go bridle path
move w
ECHO
ECHO ===================
ECHO *** STEELCLAW CLAN
ECHO *** A clan of Elven warriors and barbarians
ECHO ===================
ECHO
goto %1

ste-fay:
pause
move e
move go dusky path
move ne
move ne
move ne
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Entering the Dragon's Breath Forest
ECHO
move n
move ne
move n
move ne
move n
move ne
move e
move ne
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO *** Inhabited by Wood Elves and Halflings
ECHO *** Home to Marachek's Oak
ECHO ===================
ECHO
goto %1

fay-gon:
pause
move e
move e
move ne
move go woodland path
move nw
move n
move ne
move go door
move go door frame
goto %1

sha-gon:
pause
move ne
move nw
move nw
move n
move n
move e
move e
move ne
move e
move e
ECHO
ECHO
ECHO * * * The Golden Grain Fields: jackals, boggles, kobolds, and goblins
ECHO 
move n
move ne
move ne
move ne
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Entering the Dragon's Breath Forest
ECHO
move n
move ne
move n
move ne
move n
move ne
move e
move ne
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO ===================
ECHO
move e
move e
move ne
move go woodland path
move nw
move n
move ne
move go door
move go door frame
goto %1

south-platform:
southgondolacheck:
ECHO *** Southern Gondola Platform
pause
match snundergondola Climbing:
match 2south-platform EXP HELP
put experience 540
matchwait

2south-platform:
pause
match WAITONNORTHGONDOLA [Gondola
match WAITFORNORTHGONDOLA There is no
put go gondola
matchwait

WAITFORNORTHGONDOLA:
pause
ECHO
ECHO *** WAITING FOR THE GONDOLA TO ARRIVE ***
ECHO
ECHO * * * If you believe you can take the slower shortcut under the
ECHO * * * gondola (apprxoimately 150 base ranks of climbing) type SHORTCUT1.
ECHO * * * WARNING: Shortcut1 will cause you to end up with a head wound.
ECHO
ECHO * * * If you believe you can take the quick shortcut under the
ECHO * * * gondola (approximately 540 base ranks of climbing) type SHORTCUT2
ECHO
pause
put look gondola
match GETONNORTHGONDOLA The gondola stops on the platform
match WAITFORNORTHGONDOLA YOU HAVE BEEN IDLE
match snundergondola SHORTCUT2
match longundergondola SHORTCUT1
matchwait 

GETONNORTHGONDOLA:
put stand
pause
move go gondola
goto WAITONNORTHGONDOLA

snundergondola:
pause
move go frame
move go door
move sw
move s
move go trail
move ne
move nw
move n
move ne
move w
move w
move go crevice
move go woodlands
move ne
move ne
move n
move ne
move n
move n

2CLIMB-LOG:
SAVE 2CLIMB-LOG
match 2CLIMB-EMBANKMENT Willowy branches reach out
match 2FAIL-LOG steepness is intimidating
match 2FAIL-LOG can't seem to find purchase
match 2FAIL-LOG find it hard going.
match 2FAIL-LOG your footing is questionable
match 2FAIL-LOG A wave of dizziness hits you
match 2FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

2FAIL-LOG:
SAVE 2FAIL-LOG
pause
match 2CLIMB-EMBANKMENT Willowy branches reach out
match 3FAIL-LOG steepness is intimidating
match 3FAIL-LOG can't seem to find purchase
match 3FAIL-LOG find it hard going.
match 3FAIL-LOG your footing is questionable
match 3FAIL-LOG A wave of dizziness hits you
match 3FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

3FAIL-LOG:
SAVE 3FAIL-LOG
pause
match 2CLIMB-EMBANKMENT Willowy branches reach out
match 4FAIL-LOG steepness is intimidating
match 4FAIL-LOG can't seem to find purchase
match 4FAIL-LOG find it hard going.
match 4FAIL-LOG your footing is questionable
match 4FAIL-LOG A wave of dizziness hits you
match 4FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

4FAIL-LOG:
SAVE 4FAIL-LOG
pause
match 2CLIMB-EMBANKMENT Willowy branches reach out
match 3CLIMBED-LOG steepness is intimidating
match 3CLIMBED-LOG can't seem to find purchase
match 3CLIMBED-LOG find it hard going.
match 3CLIMBED-LOG your footing is questionable
match 3CLIMBED-LOG A wave of dizziness hits you
match 3CLIMBED-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

2CLIMB-EMBANKMENT:
SAVE 2CLIMB-EMBANKMENT
match 2CLIMBED-EMBANKMENT Utter stillness and the grandiose play of nature
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb embankment
matchwait

2CLIMBED-EMBANKMENT:
move sw
move s
move down
goto 2CLIMB-WALL

2CLIMB-WALL:
SAVE 2CLIMB-WALL
match 2CLIMB-LEDGE Vegetation creeps in and out
match 2FAIL-WALL steepness is intimidating
match 2FAIL-WALL can't seem to find purchase
match 2FAIL-WALL find it hard going.
match 2FAIL-WALL your footing is questionable
match 2FAIL-WALL A wave of dizziness hits you
match 2FAIL-WALL Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb stone wall
matchwait

2FAIL-WALL:
SAVE 2FAIL-WALL
pause
match 2CLIMB-LEDGE Vegetation creeps in and out
match 3FAIL-WALL steepness is intimidating
match 3FAIL-WALL can't seem to find purchase
match 3FAIL-WALL find it hard going.
match 3FAIL-WALL your footing is questionable
match 3FAIL-WALL A wave of dizziness hits you
match 3FAIL-WALL Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb stone wall
matchwait

3FAIL-WALL:
SAVE 3FAIL-WALL
pause
match 2CLIMB-LEDGE Vegetation creeps in and out
match 4FAIL-WALL steepness is intimidating
match 4FAIL-WALL can't seem to find purchase
match 4FAIL-WALL find it hard going.
match 4FAIL-WALL your footing is questionable
match 4FAIL-WALL A wave of dizziness hits you
match 4FAIL-WALL Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb stone wall
matchwait

4FAIL-WALL:
SAVE 4FAIL-WALL
pause
match 2CLIMB-LEDGE Vegetation creeps in and out
match FAILED-WALL steepness is intimidating
match FAILED-WALL can't seem to find purchase
match FAILED-WALL find it hard going.
match FAILED-WALL your footing is questionable
match FAILED-WALL A wave of dizziness hits you
match FAILED-WALL Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb stone wall
matchwait

FAILED-WALL:
pause
put retreat
move up
move n
move ne
goto 3CLIMB-EMBANKMENT

3CLIMB-EMBANKMENT:
SAVE 3CLIMB-EMBANKMENT
match 3CLIMB-LOG Willowy branches reach out
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
put climb embankment
matchwait

3CLIMB-LOG:
SAVE 3CLIMB-LOG
match 3CLIMBED-LOG Tamarisk bushes display their feathery
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match PAUSE ...wait
put climb fallen log
matchwait

3CLIMBED-LOG:
move s
move s
move sw
move s
move sw
move sw
move go cleft
move go crack
move e
move e
move sw
move s
move se
move sw
move go trail
move n
move ne
move go door
move go frame
pause
ECHO
ECHO *** You have failed 4 attempts to climb under the gondola.
ECHO *** Maybe you should just wait for the gondola like everyone else?
ECHO
goto 2south-platform

2CLIMB-LEDGE:
SAVE 2CLIMB-LEDGE
match 2CLIMB-NICHE The steep climb shows no signs
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb narrow ledge
matchwait

2CLIMB-NICHE:
SAVE 2CLIMB-NICHE
pause
match 2CLIMB-BRANCH A stand of tall trees comes into view
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb craggy niche
matchwait

2CLIMB-BRANCH:
SAVE 2CLIMB-BRANCH
match 2CLIMBED-BRANCH Cracks in the sides of the pass
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb branch
matchwait

2CLIMBED-BRANCH:
move s
move climb platform
goto %1

LONGUNDERGONDOLA:
move go frame
move go door
move sw
move s
move go trail
move ne
move nw
move n
move ne
move w
move w
move go crevice
move go woodlands
move ne
move ne
move n
move ne
move n
move n

5CLIMB-LOG:
SAVE 5CLIMB-LOG
match 5CLIMBED-LOG Willowy branches reach out
match 6FAIL-LOG steepness is intimidating
match 6FAIL-LOG can't seem to find purchase
match 6FAIL-LOG find it hard going.
match 6FAIL-LOG your footing is questionable
match 6FAIL-LOG A wave of dizziness hits you
match 6FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

6FAIL-LOG:
SAVE 6FAIL-LOG
pause
match 5CLIMBED-LOG Willowy branches reach out
match 7FAIL-LOG steepness is intimidating
match 7FAIL-LOG can't seem to find purchase
match 7FAIL-LOG find it hard going.
match 7FAIL-LOG your footing is questionable
match 7FAIL-LOG A wave of dizziness hits you
match 7FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

7FAIL-LOG:
SAVE 7FAIL-LOG
pause
match 5CLIMBED-LOG Willowy branches reach out
match 8FAIL-LOG steepness is intimidating
match 8FAIL-LOG can't seem to find purchase
match 8FAIL-LOG find it hard going.
match 8FAIL-LOG your footing is questionable
match 8FAIL-LOG A wave of dizziness hits you
match 8FAIL-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

8FAIL-LOG:
SAVE 8FAIL-LOG
pause
match 5CLIMBED-LOG Willowy branches reach out
match 3CLIMBED-LOG steepness is intimidating
match 3CLIMBED-LOG can't seem to find purchase
match 3CLIMBED-LOG find it hard going.
match 3CLIMBED-LOG your footing is questionable
match 3CLIMBED-LOG A wave of dizziness hits you
match 3CLIMBED-LOG Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb fallen log
matchwait

5CLIMBED-LOG:
move e
goto 5CLIMB-SHELF

5CLIMB-SHELF:
SAVE 5CLIMB-SHELF
match 5CLIMBED-SHELF Clusters of silverwood and spruce trees
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
put climb rock shelf
matchwait

5CLIMBED-SHELF:
move n
goto 5CLIMB-RAMP

5CLIMB-RAMP:
save 5CLIMB-RAMP
match 5CLIMBED-RAMP Any traveler desiring to avoid
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb ramp
matchwait

5CLIMBED-RAMP:
move e
goto 5CLIMB-STEP

5CLIMB-STEP:
SAVE 5CLIMB-STEP
match 5CLIMBED-STEP Clusters of chicory crop up
match PAUSE steepness is intimidating
match PAUSE can't seem to find purchase
match PAUSE find it hard going.
match PAUSE your footing is questionable
match PAUSE A wave of dizziness hits you
match PAUSE Struck by vertigo
match FALLEN slip after a few feet
match FALLEN Stand up first.
match FALLEN You must be standing
match retreat engaged
match PAUSE ...wait
PUT climb stepping-stones
matchwait

5CLIMBED-STEP:
move n
put go gap
waitfor [Southern Trade Route, Alongside the Forest]
ECHO
ECHO *** You now have a head wound. When you awake from your stun you should eat some nemoih root.
ECHO *** This is a very long stun. Please be patient.
ECHO
pause 40
goto CHECK-STUN

CHECK-STUN:
pause 10
match CHECK-STUN You're stunned
match UNSTUNNED You glance
put health
put glance
matchwait

UNSTUNNED:
ECHO *** YOU'RE NO LONGER STUNNED
save UNDERGONDOLA-LETH
goto FALLEN

WAITONNORTHGONDOLA:
pause
put n
;put hide
pause
ECHO
ECHO ================================
ECHO *** Riding north over the great chasm of the Obsidian Pass towards the ancient Elven stronghold of Leth Deriel
ECHO ================================
ECHO
pause 60
ECHO
ECHO ================================
ECHO *** Ferdahl Alec, son of Corik and father to Kukalakai, built the gondola to connect Ilithi to the Mountain Elves.
ECHO *** The Mountain Elves, led by Queen Morganae, were responsible for maintaining the gondola.
ECHO *** However, one day Morganae's only daughter, Princess Anlorahle, was slaughtered on the gondola by a snow beast sent by Necromancer Sidhlot.
ECHO *** Since that day the Mountain Elves have abandoned the gondola, yet it still slowly drifts between the platforms, as if pushed by some ghostly hand.
ECHO ================================
ECHO
pause 60
ECHO
ECHO ================================
ECHO *** North of the gondola is the Province of Zoluren, governed by Prince Vorclaf
ECHO *** Zoluren is named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO ================================
ECHO
PAUSE 60
ECHO
ECHO ================================
ECHO *** A little known fact: The gondola only takes 6 roisaen to travel across the chasm, but if a caravan gets on the trip doubles to just over 12 roisaen.
ECHO ================================
ECHO
match GETOFFNORTHGONDOLA With a soft bump, the gondola
match WAITONNORTHGONDOLA YOU HAVE BEEN IDLE
matchwait

GETOFFNORTHGONDOLA:
put north
move out
ECHO
ECHO *** NORTHERN GONDOLA PLATFORM ***
ECHO
goto %1

cro-tig:
pause
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move n
move n
move n
move w
move w
move w
move w
move go Oxenwaithe Bridge
move w
move w
move w
move w
move go western gate
ECHO
ECHO
ECHO * * * Northwesterly lies the Siergelde cliffs and ruins and the Lake of Dreams
ECHO * * * Inhabited by sprites, lipopods, trolls, goblins, cougars, jackals, and bobcats
ECHO
move go path
ECHO
ECHO
ECHO * * * Entering farmlands infested by goblins and hogs
ECHO
move w
move w
move nw
move w
move w
move nw
move w
move w
move sw
move w
move w
move nw
move nw
move w
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO
GOTO %1

tig-wol:
pause
move go village gate
move w
move nw
move w
move w
move go shallow brook
move w
ECHO
ECHO
ECHO * * * Entering the Widulf Woods, home to the Wolf and Knife Clans as well as ogres and other forest creatures.
ECHO
pause
move w
pause
move w
move sw
move w
move sw
move s
move s
move e
move go dense bushes
move s
move sw
move s
ECHO
ECHO ===================
ECHO *** WOLF CLAN aka TREFAN ULF
ECHO * * * A clan of Human Barbarians
ECHO * * * Nomadic for centuries, finally settled earlier this century in Widulf Woods
ECHO * * * Led by Chieftan Wolfjaw Ironbeard and his wife Suza Cormyn
ECHO ===================
ECHO
GOTO FINISH

tig-kni:
pause
move go village gate
move w
move nw
move w
move w
move go shallow brook
move w
ECHO
ECHO
ECHO * * * Entering the Widulf Woods, home to the Wolf and Knife Clans as well as ogres and other forest creatures.
ECHO
pause
move w
pause
move w
move sw
move w
move nw
move go brambles
move ne
move ne
move n
move ne
move climb felled tree
move nw
move nw
move nw
move down
move e
move ne
move climb tree roots
move n
move ne
move ne
move n
move go wilted bush
move nw
move n
move nw
move go large outcropping
move ne
move ne
move ne
move nw
move nw
move n
move nw
move go half-open gate
move w
move nw
move n
move go rope bridge
move n
ECHO
ECHO ===================
ECHO *** KNIFE CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Led by Trog, the stupid and aggressive Gor'tog brother of Ortug (leader of Tiger Clan)
ECHO * * * Patron god is Botolf the goshawk, dark aspect of Chadatru, god of dishonesty and deceipt and patron of thieves guilds and fallen paladins.
ECHO ===================
ECHO
GOTO FINISH

wol-tig:
pause
move n
move ne
move n
move go dense bushes
move w
move n
move n
move ne
move e
move ne
move e
move go shallow brook
move e
pause
move e
pause
move e
move e
move se
move e
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO
GOTO %1

kni-tig:
pause
move go rope bridge
move s
move s
move se
move e
move go half-open gate
move se
move s
move se
move se
move sw
move sw
move sw
move go large outcropping
move se
move s
move se
move go wilted bush
move s
move sw
move sw
move s
move climb tree roots
move sw
move w
move up
move se
move se
move se
move climb felled tree
move sw
move s
move sw
move go bramble patch
move s
move se
move e
move ne
move e
move go shallow brook
move e
pause
move e
pause
move e
move e
move se
move e
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO 
GOTO %1

leth-exp1:
match tig-leth Swimming:
match tig-cro EXP HELP
put exp survival 300
matchwait

tig-cro:
ECHO
ECHO
ECHO * * * Entering meadows and farmlands infested with goblins and hogs
ECHO 
pause
move go gate
move e
move se
move se
move e
move e
move ne
move e
move e
move se
move e
move e
move se
move e
move e
move go path
ECHO
ECHO
ECHO * * * Northwesterly lies the Siergelde cliffs and ruins and the Lake of Dreams
ECHO * * * Inhabited by sprites, lipopods, trolls, goblins, cougars, jackals, and bobcats
ECHO
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * The geographic center of the former Seven-Pointed Star Empire
ECHO * * * A port city, home to all 9 guildhalls and the Asemath Academy
ECHO ===================
ECHO
GOTO %1

tig-leth:
move s
move se
move s
move sw
move go green
move sw

tig-leth2:
match tig-leth2 You don't find anything of interest here.
match tig-leth2 You find some interesting signs something is here.
match tig-leth3 You find a very faint trail through the grass.
put search
matchwait

tig-leth3:
move go trail
move se
move climb trail

seg-south1:
match seg-let You wade
match current [Segoltha River, North Bank
match current You can't swim
match seg-south1 You swim
match seg-south1 You slap
match seg-south1 You struggle
match seg-south1 You flounder
match seg-south1 make much headway
match seg-south1 ...wait
match seg-south1 type ahead
put swim south 
matchwait


current:
put swim west
waitfor Roundtime
goto seg-south1

seg-let:
move e
move e
move e
move e
move e
move go trail
move n
goto %1

THE-ELB:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
move e
move go small path
ECHO
ECHO
ECHO *** EL'BAIN'S ***
ECHO
GOTO FINISH

LAN-ELB:
pause
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River on a white stone bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
move e
move go small path
ECHO
ECHO
ECHO *** EL'BAIN'S ***
ECHO
GOTO FINISH

ELB-THE:
move go main road
move w
move n
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
move n
move ne
move ne
move nw
move ne
move ne
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru,
ECHO * * * god of truth and justice and patron of paladins and House Theren
ECHO ===================
ECHO
GOTO %1

GETLETHDOKORA:
pause
match LET-ILA I don't know who you are referring to.
match LET-ILA But no one can see you.
match GETLETHDOK2 But you don't have that much!
match GETLETHDOK2 You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GETLETHDOK2:
pause
move e
move e
move go deposit
move u
put withdraw 3 silver
pause
move up
put exchange 3 silver kronar to dokora
pause
move d
move d
move out
move w
move w
goto let-ila

let-ila:
groupcheck-let-ila:
pause
match cont-let-ila You have no group
match cont-let-ila You must be visible
match group-let-ila You whisper
match groupcheck-let-ila ...wait
match groupcheck-let-ila type ahead
put whisper group ...
matchwait

cont-let-ila:
pause
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move nw
move nw
move n
pause 4
01-let-ila:
put nw
match 02-let-ila Roundtime
match 03-let-ila [Old Crank's Road, Field]
matchwait
02-let-ila:
pause
put stand
match 02-let-ila cannot manage to stand.
match 02-let-ila The weight of all your possessions
match 02-let-ila type ahead
match 02-let-ila ...wait
match 01-let-ila You stand
match 01-let-ila You are already
matchwait
03-let-ila:
move n
move sw
move sw
move sw
move sw
move s
move s
move s
move s
move se
04-let-ila:
pause
put sw
match 05-let-ila filtering through the branches
match Dig04-let-ila falling short of your goal.
match Dig04-let-ila You make no progress in the mud
match Dig04-let-ila The mud holds you
match Dig04-let-ila stuck in the mud,
match Dig04-let-ila You fall into
match Dig04-let-ila You can't do that while lying down.
matchwait

Dig04-let-ila:
pause
put stand
put dig
match 04-let-ila You manage to dig
match Dig04-let-ila You struggle to dig
match Dig04-let-ila Maybe you can reach better
match Dig04-let-ila cannot manage to stand.
match Dig04-let-ila The weight of all your possessions
match Dig04-let-ila ...wait
match Dig04-let-ila type ahead
matchwait

05-let-ila:
pause
put s
match 06-let-ila Thick planks of wood
match Dig05-let-ila falling short of your goal.
match Dig05-let-ila You make no progress in the mud
match Dig05-let-ila The mud holds you
match Dig05-let-ila stuck in the mud,
match Dig05-let-ila You fall into
match Dig05-let-ila You can't do that while lying down.
matchwait

Dig05-let-ila:
pause

put stand
put dig
match 05-let-ila You manage to dig
match Dig05-let-ila You struggle to dig
match Dig05-let-ila Maybe you can reach better
match Dig05-let-ila cannot manage to stand.
match Dig05-let-ila The weight of all your possessions
match Dig05-let-ila ...wait
match Dig05-let-ila type ahead
matchwait

06-let-ila:
pause
put s
match 07-let-ila Mud and water make sucking sounds
match Dig06-let-ila falling short of your goal.
match Dig06-let-ila You make no progress in the mud
match Dig06-let-ila The mud holds you
match Dig06-let-ila stuck in the mud,
match Dig06-let-ila You fall into
match Dig06-let-ila You can't do that while lying down.
matchwait

Dig06-let-ila:
pause

put stand
put dig
match 06-let-ila You manage to dig
match Dig06-let-ila You struggle to dig
match Dig06-let-ila Maybe you can reach better
match Dig06-let-ila cannot manage to stand.
match Dig06-let-ila The weight of all your possessions
match Dig06-let-ila ...wait
match Dig06-let-ila type ahead
matchwait

07-let-ila:
pause
put s
match 08-let-ila The dark soil is damper to the north
match Dig07-let-ila falling short of your goal.
match Dig07-let-ila You make no progress in the mud
match Dig07-let-ila The mud holds you
match Dig07-let-ila stuck in the mud,
match Dig07-let-ila You fall into
match Dig07-let-ila You can't do that while lying down.
matchwait

Dig07-let-ila:
pause

put stand
put dig
match 07-let-ila You manage to dig
match Dig07-let-ila You struggle to dig
match Dig07-let-ila Maybe you can reach better
match Dig07-let-ila cannot manage to stand.
match Dig07-let-ila The weight of all your possessions
match Dig07-let-ila ...wait
match Dig07-let-ila type ahead
matchwait

08-let-ila:
pause
move sw
move w
move w
move s
move sw
move sw

09-let-ila:
pause
put w
match 10-let-ila large puddles of muck
match Dig09-let-ila falling short of your goal.
match Dig09-let-ila You make no progress in the mud
match Dig09-let-ila The mud holds you
match Dig09-let-ila stuck in the mud,
match Dig09-let-ila You fall into
match Dig09-let-ila You can't do that while lying down.
matchwait

Dig09-let-ila:
pause
put stand
put dig
match 09-let-ila You manage to dig
match Dig09-let-ila You struggle to dig
match Dig09-let-ila Maybe you can reach better
match Dig09-let-ila cannot manage to stand.
match Dig09-let-ila The weight of all your possessions
match Dig09-let-ila ...wait
match Dig09-let-ila type ahead
matchwait

10-let-ila:
pause
put w
match 11-let-ila grasses lining the
match Dig10-let-ila falling short of your goal.
match Dig10-let-ila You make no progress in the mud
match Dig10-let-ila The mud holds you
match Dig10-let-ila stuck in the mud,
match Dig10-let-ila You fall into
match Dig10-let-ila You can't do that while lying down.
matchwait

Dig10-let-ila:
pause
put stand
put dig
match 10-let-ila You manage to dig
match Dig10-let-ila You struggle to dig
match Dig10-let-ila Maybe you can reach better
match Dig10-let-ila cannot manage to stand.
match Dig10-let-ila The weight of all your possessions
match Dig10-let-ila ...wait
match Dig10-let-ila type ahead
matchwait

11-let-ila:
pause
move nw
move go break
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO *** Features are the harbor, skiffs to Ain Ghazal, a fish shop, a pearl shop
ECHO *** Area creatures include storm bulls and forest bandits
ECHO ===================
ECHO
goto checkmites

group-let-ila:
pause
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move nw
move nw
move n
pause 4
group-01-let-ila:
put nw
match group-02-let-ila Roundtime
match group-03-let-ila [Old Crank's Road, Field]
matchwait
group-02-let-ila:
pause
put stand
match group-02-let-ila cannot manage to stand.
match group-02-let-ila The weight of all your possessions
match group-02-let-ila type ahead
match group-02-let-ila ...wait
match group-01-let-ila You stand
match group-01-let-ila You are already
matchwait
group-03-let-ila:
move n
move sw
move sw
move sw
move sw
move s
move s
move s
move s
move se
pause
put WHISPER GROUP We're passing through swamps.  From here SW, S, S, S and join me again.  If you fall then DIG your way out.
put disband
group-04-let-ila:
pause
put sw
match group-05-let-ila wind filtering through the branches sings
match group-Dig04-let-ila falling short of your goal.
match group-Dig04-let-ila You make no progress in the mud
match group-Dig04-let-ila The mud holds you
match group-Dig04-let-ila stuck in the mud,
match group-Dig04-let-ila You fall into
match group-Dig04-let-ila You can't do that while lying down.
matchwait

group-Dig04-let-ila:
pause
put stand
put dig
match group-04-let-ila You manage to dig
match group-Dig04-let-ila You struggle to dig
match group-Dig04-let-ila Maybe you can reach better
match group-Dig04-let-ila cannot manage to stand.
match group-Dig04-let-ila The weight of all your possessions
match group-Dig04-let-ila ...wait
match group-Dig04-let-ila type ahead
matchwait

group-05-let-ila:
pause
put s
match group-06-let-ila Thick planks of wood
match group-Dig05-let-ila falling short of your goal.
match group-Dig05-let-ila You make no progress in the mud
match group-Dig05-let-ila The mud holds you
match group-Dig05-let-ila stuck in the mud,
match group-Dig05-let-ila You fall into
match group-Dig05-let-ila You can't do that while lying down.
matchwait

group-Dig05-let-ila:
pause
put stand
put dig
match group-05-let-ila You manage to dig
match group-Dig05-let-ila You struggle to dig
match group-Dig05-let-ila Maybe you can reach better
match group-Dig05-let-ila cannot manage to stand.
match group-Dig05-let-ila The weight of all your possessions
match group-Dig05-let-ila ...wait
match group-Dig05-let-ila type ahead
matchwait

group-06-let-ila:
pause
put s
match group-07-let-ila Mud and water make sucking sounds
match group-Dig06-let-ila falling short of your goal.
match group-Dig06-let-ila You make no progress in the mud
match group-Dig06-let-ila The mud holds you
match group-Dig06-let-ila stuck in the mud,
match group-Dig06-let-ila You fall into
match group-Dig06-let-ila You can't do that while lying down.
matchwait

group-Dig06-let-ila:
pause

put stand
put dig
match group-06-let-ila You manage to dig
match group-Dig06-let-ila You struggle to dig
match group-Dig06-let-ila Maybe you can reach better
match group-Dig06-let-ila cannot manage to stand.
match group-Dig06-let-ila The weight of all your possessions
match group-Dig06-let-ila ...wait
match group-Dig06-let-ila type ahead
matchwait

group-07-let-ila:
pause
put s
match group-08-let-ila The dark soil is damper to the north
match group-Dig07-let-ila falling short of your goal.
match group-Dig07-let-ila You make no progress in the mud
match group-Dig07-let-ila The mud holds you
match group-Dig07-let-ila stuck in the mud,
match group-Dig07-let-ila You fall into
match group-Dig07-let-ila You can't do that while lying down.
matchwait

group-Dig07-let-ila:
pause

put stand
put dig
match group-07-let-ila You manage to dig
match group-Dig07-let-ila You struggle to dig
match group-Dig07-let-ila Maybe you can reach better
match group-Dig07-let-ila cannot manage to stand.
match group-Dig07-let-ila The weight of all your possessions
match group-Dig07-let-ila ...wait
match group-Dig07-let-ila type ahead
matchwait

group-08-let-ila:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move sw
move w
move w
move s
move sw
move sw
pause
put WHISPER GROUP We're passing through more swamps.  From here go W, W and join me again.  If you fall then DIG your way out.
put disband

group-09-let-ila:
pause
put w
match group-10-let-ila large puddles of muck
match group-Dig09-let-ila falling short of your goal.
match group-Dig09-let-ila You make no progress in the mud
match group-Dig09-let-ila The mud holds you
match group-Dig09-let-ila stuck in the mud,
match group-Dig09-let-ila You fall into
match group-Dig09-let-ila You can't do that while lying down.
matchwait

group-Dig09-let-ila:
pause
put stand
put dig
match group-09-let-ila You manage to dig
match group-Dig09-let-ila You struggle to dig
match group-Dig09-let-ila Maybe you can reach better
match group-Dig09-let-ila cannot manage to stand.
match group-Dig09-let-ila The weight of all your possessions
match group-Dig09-let-ila ...wait
match group-Dig09-let-ila type ahead
matchwait

group-10-let-ila:
pause
put w
match group-11-let-ila grasses lining the
match group-Dig10-let-ila falling short of your goal.
match group-Dig10-let-ila You make no progress in the mud
match group-Dig10-let-ila The mud holds you
match group-Dig10-let-ila stuck in the mud,
match group-Dig10-let-ila You fall into
match group-Dig10-let-ila You can't do that while lying down.
matchwait

group-Dig10-let-ila:
pause
put stand
put dig
match group-10-let-ila You manage to dig
match group-Dig10-let-ila You struggle to dig
match group-Dig10-let-ila Maybe you can reach better
match group-Dig10-let-ila cannot manage to stand.
match group-Dig10-let-ila The weight of all your possessions
match group-Dig10-let-ila ...wait
match group-Dig10-let-ila type ahead
matchwait

group-11-let-ila:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move nw
move go break
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO *** Features are the harbor, skiffs to Ain Ghazal, a fish shop, a pearl shop
ECHO *** Area creatures include storm bulls and forest bandits
ECHO ===================
ECHO
goto checkmites

CHECKMITES:
ECHO
ECHO *** Checking now for blood mites from the swamp
ECHO
pause
put health
put glance
match GOTMITES blood mite
match NOMITES You glance
matchwait

NOMITES:
ECHO
ECHO *** You have no blood mites on you right now, but they could show up in the next couple minutes.
ECHO *** If you get them on your eyes do not tend them off with less than 150 first aid.
ECHO
pause
goto %1

GOTMITES:
ECHO
ECHO ****************************
ECHO *** You acquired blood mites in the marsh!
ECHO *** Tend them off, but don't tend the eyes unless you have 150 first aid
ECHO ****************************
pause 3
goto %1

ila-let:
groupcheck-ila-let:
pause
match groupcheck-ila-let ...wait
match groupcheck-ila-let type ahead
match cont-ila-let You have no group
match cont-ila-let You must be visible
match group-ila-let You whisper
put whisper group ...
matchwait

cont-ila-let:
pause
move go break
move se
move e

20-let-ila:
pause
put e
match 21-let-ila the trees and thorny bushes,
match Dig20-let-ila falling short of your goal.
match Dig20-let-ila You make no progress in the mud
match Dig20-let-ila The mud holds you
match Dig20-let-ila stuck in the mud,
match Dig20-let-ila You fall into
match Dig20-let-ila You can't do that while lying down.
matchwait

Dig20-let-ila:
pause
put stand
put dig
match 20-let-ila You manage to dig
match Dig20-let-ila You struggle to dig
match Dig20-let-ila Maybe you can reach better
match Dig20-let-ila cannot manage to stand.
match Dig20-let-ila The weight of all your possessions
match Dig20-let-ila ...wait
match Dig20-let-ila type ahead
matchwait

21-let-ila:
pause
put ne
match 22-let-ila fragrant tang
match Dig21-let-ila falling short of your goal.
match Dig21-let-ila You make no progress in the mud
match Dig21-let-ila The mud holds you
match Dig21-let-ila stuck in the mud,
match Dig21-let-ila You fall into
match Dig21-let-ila You can't do that while lying down.
matchwait

Dig21-let-ila:
pause
put stand
put dig
match 21-let-ila You manage to dig
match Dig21-let-ila You struggle to dig
match Dig21-let-ila Maybe you can reach better
match Dig21-let-ila cannot manage to stand.
match Dig21-let-ila The weight of all your possessions
match Dig21-let-ila ...wait
match Dig21-let-ila type ahead
matchwait

22-let-ila:
pause
move ne
move n
move e
move e
move ne
move n
goto 23-let-ila

23-let-ila:
pause
put n
match 24-let-ila Thick planks of wood
match Dig23-let-ila falling short of your goal.
match Dig23-let-ila You make no progress in the mud
match Dig23-let-ila The mud holds you
match Dig23-let-ila stuck in the mud,
match Dig23-let-ila You fall into
match Dig23-let-ila You can't do that while lying down.
matchwait

Dig23-let-ila:
pause
put stand
put dig
match 23-let-ila You manage to dig
match Dig23-let-ila You struggle to dig
match Dig23-let-ila Maybe you can reach better
match Dig23-let-ila cannot manage to stand.
match Dig23-let-ila The weight of all your possessions
match Dig23-let-ila ...wait
match Dig23-let-ila type ahead
matchwait

24-let-ila:
pause
put n
match 25-let-ila filtering through the branches
match Dig24-let-ila falling short of your goal.
match Dig24-let-ila You make no progress in the mud
match Dig24-let-ila The mud holds you
match Dig24-let-ila stuck in the mud,
match Dig24-let-ila You fall into
match Dig24-let-ila You can't do that while lying down.
matchwait

Dig24-let-ila:
pause
put stand
put dig
match 24-let-ila You manage to dig
match Dig24-let-ila You struggle to dig
match Dig24-let-ila Maybe you can reach better
match Dig24-let-ila cannot manage to stand.
match Dig24-let-ila The weight of all your possessions
match Dig24-let-ila ...wait
match Dig24-let-ila type ahead
matchwait

25-let-ila:
pause
put ne
match 26-let-ila Sloping downward to the southwest,
match Dig25-let-ila falling short of your goal.
match Dig25-let-ila You make no progress in the mud
match Dig25-let-ila The mud holds you
match Dig25-let-ila stuck in the mud,
match Dig25-let-ila You fall into
match Dig25-let-ila You can't do that while lying down.
matchwait

Dig25-let-ila:
pause
put stand
put dig
match 25-let-ila You manage to dig
match Dig25-let-ila You struggle to dig
match Dig25-let-ila Maybe you can reach better
match Dig25-let-ila cannot manage to stand.
match Dig25-let-ila The weight of all your possessions
match Dig25-let-ila ...wait
match Dig25-let-ila type ahead
matchwait

26-let-ila:
pause
put nw
match 27-let-ila a sparse forest.
match Dig26-let-ila falling short of your goal.
match Dig26-let-ila You make no progress in the mud
match Dig26-let-ila The mud holds you
match Dig26-let-ila stuck in the mud,
match Dig26-let-ila You fall into
match Dig26-let-ila You can't do that while lying down.
matchwait

Dig26-let-ila:
pause
put stand
put dig
match 26-let-ila You manage to dig
match Dig26-let-ila You struggle to dig
match Dig26-let-ila Maybe you can reach better
match Dig26-let-ila cannot manage to stand.
match Dig26-let-ila The weight of all your possessions
match Dig26-let-ila ...wait
match Dig26-let-ila type ahead
matchwait

27-let-ila:
pause
move n
move n
move n
move n
move ne
move ne
move ne
move ne
move s
move se
pause 4
28-let-ila:
put s
match 29-let-ila Roundtime
match 30-let-ila The carter's track winds northward,
matchwait
29-let-ila:
pause
put stand
match 29-let-ila cannot manage to stand.
match 29-let-ila The weight of all your possessions
match 29-let-ila type ahead
match 29-let-ila ...wait
match 28-let-ila You stand
match 28-let-ila You are already
matchwait

30-let-ila:
pause
move se
move se
move ne
move go bower gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto checkmites

group-ila-let:
move go break
move se
move e
pause
put WHISPER GROUP We're passing through swamps.  From here go E, NE and join me again.  If you fall then DIG your way out.
put disband
group-20-let-ila:
pause
put e
match group-21-let-ila the trees and thorny bushes,
match group-Dig20-let-ila falling short of your goal.
match group-Dig20-let-ila You make no progress in the mud
match group-Dig20-let-ila The mud holds you
match group-Dig20-let-ila stuck in the mud,
match group-Dig20-let-ila You fall into
match group-Dig20-let-ila You can't do that while lying down.
matchwait

group-Dig20-let-ila:
pause
put stand
put dig
match group-20-let-ila You manage to dig
match group-Dig20-let-ila You struggle to dig
match group-Dig20-let-ila Maybe you can reach better
match group-Dig20-let-ila cannot manage to stand.
match group-Dig20-let-ila The weight of all your possessions
match group-Dig20-let-ila ...wait
match group-Dig20-let-ila type ahead
matchwait

group-21-let-ila:
pause
put ne
match group-22-let-ila fragrant tang
match group-Dig21-let-ila falling short of your goal.
match group-Dig21-let-ila You make no progress in the mud
match group-Dig21-let-ila The mud holds you
match group-Dig21-let-ila stuck in the mud,
match group-Dig21-let-ila You fall into
match group-Dig21-let-ila You can't do that while lying down.
matchwait

group-Dig21-let-ila:
pause
put stand
put dig
match group-21-let-ila You manage to dig
match group-Dig21-let-ila You struggle to dig
match group-Dig21-let-ila Maybe you can reach better
match group-Dig21-let-ila cannot manage to stand.
match group-Dig21-let-ila The weight of all your possessions
match group-Dig21-let-ila ...wait
match group-Dig21-let-ila type ahead
matchwait

group-22-let-ila:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move ne
move n
move e
move e
move ne
move n
pause
put WHISPER GROUP We're passing through more swamps.  From here go N, N, NE, NW and join me again.  If you fall then DIG your way out.
put disband

group-23-let-ila:
pause
put n
match group-24-let-ila Thick planks of wood
match group-Dig23-let-ila falling short of your goal.
match group-Dig23-let-ila You make no progress in the mud
match group-Dig23-let-ila The mud holds you
match group-Dig23-let-ila stuck in the mud,
match group-Dig23-let-ila You fall into
match group-Dig23-let-ila You can't do that while lying down.
matchwait

group-Dig23-let-ila:
pause

put stand
put dig
match group-23-let-ila You manage to dig
match group-Dig23-let-ila You struggle to dig
match group-Dig23-let-ila Maybe you can reach better
match group-Dig23-let-ila cannot manage to stand.
match group-Dig23-let-ila The weight of all your possessions
match group-Dig23-let-ila ...wait
match group-Dig23-let-ila type ahead
matchwait

group-24-let-ila:
pause
put n
match group-25-let-ila filtering through the branches
match group-Dig24-let-ila falling short of your goal.
match group-Dig24-let-ila You make no progress in the mud
match group-Dig24-let-ila The mud holds you
match group-Dig24-let-ila stuck in the mud,
match group-Dig24-let-ila You fall into
match group-Dig24-let-ila You can't do that while lying down.
matchwait

group-Dig24-let-ila:
pause
put stand
put dig
match group-24-let-ila You manage to dig
match group-Dig24-let-ila You struggle to dig
match group-Dig24-let-ila Maybe you can reach better
match group-Dig24-let-ila cannot manage to stand.
match group-Dig24-let-ila The weight of all your possessions
match group-Dig24-let-ila ...wait
match group-Dig24-let-ila type ahead
matchwait

group-25-let-ila:
pause
put ne
match group-26-let-ila Sloping downward to the southwest,
match group-Dig25-let-ila falling short of your goal.
match group-Dig25-let-ila You make no progress in the mud
match group-Dig25-let-ila The mud holds you
match group-Dig25-let-ila stuck in the mud,
match group-Dig25-let-ila You fall into
match group-Dig25-let-ila You can't do that while lying down.
matchwait

group-Dig25-let-ila:
pause
put stand
put dig
match group-25-let-ila You manage to dig
match group-Dig25-let-ila You struggle to dig
match group-Dig25-let-ila Maybe you can reach better
match group-Dig25-let-ila cannot manage to stand.
match group-Dig25-let-ila The weight of all your possessions
match group-Dig25-let-ila ...wait
match group-Dig25-let-ila type ahead
matchwait

group-26-let-ila:
pause
put nw
match group-27-let-ila a sparse forest.
match group-Dig26-let-ila falling short of your goal.
match group-Dig26-let-ila You make no progress in the mud
match group-Dig26-let-ila The mud holds you
match group-Dig26-let-ila stuck in the mud,
match group-Dig26-let-ila You fall into
match group-Dig26-let-ila You can't do that while lying down.
matchwait

group-Dig26-let-ila:
pause
put stand
put dig
match group-26-let-ila You manage to dig
match group-Dig26-let-ila You struggle to dig
match group-Dig26-let-ila Maybe you can reach better
match group-Dig26-let-ila cannot manage to stand.
match group-Dig26-let-ila The weight of all your possessions
match group-Dig26-let-ila ...wait
match group-Dig26-let-ila type ahead
matchwait

group-27-let-ila:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move n
move n
move n
move n
move ne
move ne
move ne
move ne
move s
move se
pause 4
group-28-let-ila:
put s
match group-29-let-ila Roundtime
match group-30-let-ila The carter's track winds northward,
matchwait
group-29-let-ila:
pause
put stand
match group-29-let-ila cannot manage to stand.
match group-29-let-ila The weight of all your possessions
match group-29-let-ila type ahead
match group-29-let-ila ...wait
match group-28-let-ila You stand
match group-28-let-ila You are already
matchwait

group-30-let-ila:
pause
move se
move se
move ne
move go bower gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto checkmites


ila-ain:
pause
move go southwest gate
move nw
move nw
move n
move n
move ne
move go harbor tower
move go stone ramp
move climb iron staircase
move ne
move ne
move ne
move ne
move climb iron staircase
move go stone ramp
move out
move ne
move go oak doors
SKIFF1:
pause
put go skiff
match WAITFORSKIFF1 You will be able to board soon.
match WAITFORSKIFF1 What were you referring to?
match WAITFORSKIFF1 You will have to wait for the next skiff.
match WAITFORSKIFF1 I could not find what you were referring to.
match WAITONSKIFF1 Skiff]
match INV-SKIFF1 they can't see you?
match NOMONEYSKIFF1 You haven't got enough dokoras
matchwait

INV-SKIFF1:
pause
ECHO
ECHO *** You cannot board the skiff while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto SKIFF1

WAITFORSKIFF1:
ECHO
ECHO *****************************
ECHO *** WAITING FOR THE SKIFF TO ARRIVE
ECHO *** The fare is 58 Dokoras and you cannot withdraw from the bank in Ilaya Taipa.
ECHO *** There is a gem buyer and tanner in the building with the bank and you can convert Kronars to Dokoras at the COUNTER in the bank.
ECHO *****************************
ECHO
ECHO
ECHO *****************************
ECHO *** GO GET 58 DOKORAS NOW!!!
ECHO *** (if you don't already have them)
ECHO *****************************
ECHO
put wealth dokora
waitfor pulls into the
goto SKIFF1

NOMONEYSKIFF1:
ECHO
ECHO *** You do not have enough Dokoras for the skiff.
ECHO *** The fare is 58 Dokoras and you cannot withdraw from the bank in Ilaya Taipa.
ECHO *** There is a gem buyer and tanner in the building with the bank and you can convert Kronars to Dokoras at the COUNTER in the bank.
ECHO
ECHO *** Good Luck!
ECHO
EXIT

WAITONSKIFF1:
pause
ECHO
ECHO *** Riding a River Elf skiff up the mighty Segoltha River to Ain Ghazal, built on a towering rock in the middle of the Segoltha River
ECHO *** The Journelai Mountains loom to the north while the Himineldar Shel Mountains shade the south
ECHO
pause 90
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Ain Ghazal is ruled by the Sisterhood of the Rose
ECHO * * * The leader of the Sisters is called the Lyba Khalo
ECHO * * * The Ain Ghazal chateau holds the chamber where there are meetings of the provincial government, called the Forfedhdar Enclave
ECHO ====================================
ECHO
pause 90
ECHO
ECHO *** Entering the Dwarven province of Forfedhdar
ECHO *** "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
pause
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
ECHO
ECHO ===================
ECHO *** AIN GHAZAL
ECHO *** Far into the sky is the castle chateau upon the towering Ain Ghazal rock in the middle of the Segoltha
ECHO *** The only creatures to hunt are cave trolls, a bit tougher than orcs
ECHO *** Features include a makeup shop, locksmith shop, Trader guild, and deposit-only and exchange bank
ECHO ===================
ECHO
goto %1

ain-ila:
SKIFF2:
pause
put go skiff
match WAITFORSKIFF2 You will be able to board soon.
match WAITFORSKIFF2 What were you referring to?
match WAITFORSKIFF2 You will have to wait for the next skiff.
match WAITFORSKIFF2 I could not find what you were referring to.
match WAITONSKIFF2 Skiff]
match INV-SKIFF2 they can't see you?
match NOMONEYSKIFF2 You haven't got enough dokoras
matchwait

INV-SKIFF2:
pause
ECHO
ECHO *** You cannot board the skiff while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto SKIFF2


WAITFORSKIFF2:
ECHO
ECHO *****************************
ECHO *** WAITING FOR THE SKIFF TO ARRIVE
ECHO *** The fare is 58 Dokoras!
ECHO *****************************
ECHO
put wealth dokora
waitfor pulls into the
goto SKIFF2

NOMONEYSKIFF2:
ECHO
ECHO *** You do not have enough Dokoras for the skiff.
ECHO *** Good Luck finding 58 Dokoras!
ECHO
EXIT

WAITONSKIFF2:
pause
ECHO
ECHO *** Riding a River Elf skiff east down the mighty Segoltha River to Ilaya Taipa aka River Clan
ECHO *** The Journelai Mountains loom to the north while the Himineldar Shel Mountains shade the south
ECHO
pause 200
ECHO *** Entering the Province of Zoluren
ECHO *** Governed by Prince Vorclaf
ECHO *** Named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
SKIFF-ILA:
pause
move go oak doors
move sw
move go harbor tower
move go stone ramp
move climb iron staircase
move sw
move sw
move sw
move sw
move climb iron staircase
move go stone ramp
move out
move sw
move s
move s
move se
move se
move go southwest gate
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO ===================
ECHO
goto %1

ain-forf:
pause
move w
move sw
pause
move s
goto AINFERRY1

AINFERRY1:
pause
put go ferry
match WAITFORAINFERRY1 you'll have to wait
match WAITFORAINFERRY1 you can board as soon as
match WAITFORAINFERRY1 cannot take any more passengers
match WAITFORAINFERRY1 What were you referring to?
match WAITFORAINFERRY1 I could not find what you were referring to.
match WAITONAINFERRY1 [The "Damaris's Kiss"]
match WAITONAINFERRY1 [The "Evening Star"]
match NOMONEYAINFERRY1 You haven't got enough dokoras
match INV-AINFERRY1 they can't see you?
matchwait

INV-AINFERRY1:
pause
ECHO
ECHO *** You cannot board this ferry while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
ECHO *** Warning: Don't go invisible on the ferry either because you cannot leave these ferries while invisible.
ECHO
pause
waitfor You glance
goto AINFERRY1

WAITFORAINFERRY1:
;put hide
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO *** The fare is 31 Dokoras
ECHO
put wealth dokora
waitfor landing at the dock
goto AINFERRY1

NOMONEYAINFERRY1:
ECHO
ECHO *** You do not have enough Dokoras for the ferry
ECHO *** Good luck finding 31 Dokoras around here!
ECHO
EXIT

WAITONAINFERRY1:
;put hide
pause
ECHO
ECHO ***
ECHO *** Riding a ferry towards the Haalikshal Highway to Hibarnhvidar
ECHO *** Haalikshal translates to "sacred mountain"
ECHO *** The highway is lined with Dwarven totem pillars that each tell the life of a Dwarf.
ECHO *** 
ECHO
pause
waitfor ferry reaches the dock.
put stand
pause
move go dock
AINFERRY1-FORF:
ECHO
ECHO *** Entering the well-paved Haalikshal Highway
ECHO
move w
move sw
move sw
move nw
move sw
move sw
goto %1

forf-ain:
pause
move ne
move ne
move se
move ne
move ne
move e
goto AINFERRY2

AINFERRY2:
pause
put go ferry
match WAITFORAINFERRY2 you'll have to wait
match WAITFORAINFERRY2 you can board as soon as
match WAITFORAINFERRY2 cannot take any more passengers
match WAITFORAINFERRY2 What were you referring to?
match WAITFORAINFERRY2 I could not find what you were referring to.
match WAITONAINFERRY2 [The "Damaris's Kiss"]
match WAITONAINFERRY2 [The "Evening Star"]
match NOMONEYAINFERRY2 You haven't got enough dokoras
match INV-AINFERRY2 they can't see you?
matchwait

INV-AINFERRY2:
pause
ECHO
ECHO *** You cannot board this ferry while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
ECHO *** Warning: Don't go invisible on the ferry either because you cannot leave these ferries while invisible.
ECHO
pause
waitfor You glance
goto AINFERRY2

WAITFORAINFERRY2:
;put hide
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO *** The fare is 31 Dokoras
ECHO
put wealth dokora
waitfor landing at the dock
goto AINFERRY2

NOMONEYAINFERRY2:
ECHO
ECHO *** You do not have enough Dokoras for the ferry to Ain Ghazal
ECHO *** Good luck finding 31 Dokoras around here!
ECHO
EXIT

WAITONAINFERRY2:
;put hide
pause
ECHO
ECHO ***
ECHO *** Riding a ferry towards Ain Ghazal, built on a towering rock in the middle of the Segoltha River
ECHO *** 
ECHO
pause 90
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Ain Ghazal is ruled by the Sisterhood of the Rose
ECHO * * * The leader of the Sisters is called the Lyba Khalo
ECHO * * * The Ain Ghazal chateau holds the chamber where there are meetings of the provincial government, called the Forfedhdar Enclave
ECHO ====================================
ECHO
pause
waitfor ferry reaches the dock.
put stand
pause
move go dock
AINFERRY-AIN:
pause
move n
move ne
pause
move e
ECHO
ECHO ===================
ECHO *** AIN GHAZAL
ECHO *** Far into the sky is the castle chateau upon the towering Ain Ghazal rock in the middle of the Segoltha
ECHO *** The only creatures to hunt are cave trolls, a bit tougher than orcs
ECHO *** Features include a makeup shop, locksmith shop, Trader guild, and deposit-only and exchange bank
ECHO ===================
ECHO
goto %1

forf-hib:
pause
move nw
move sw
move go gates
ECHO
ECHO * * * Traveling beneath the mountains
ECHO
move sw
move se
move sw
move w
move s
move w
move w
move w
move w
move w
move go gates
move go ford
ECHO
ECHO * * * Ascending the Sky Road, climbing high into the Himineldar Shel mountains
ECHO
move nw
pause 3
pause
move nw
move nw
move ne
move ne
move w
move nw
move nw
move nw
move go gate
move go west gate
move sw
move sw
move n
move sw
move w
move w
move w
move go raven gate
ECHO
ECHO * * * Entering the wintry city of Hibarnhvidar
ECHO
pause
move w
move w
move w
move s
move se
move se
move se
move go double gate
ECHO
ECHO ===================
ECHO *** HIBARNHVIDAR
ECHO * * * Dwarven city in the soaring Himineldar Shel Mountains
ECHO * * * Home of the famous power-generating waterwheel system
ECHO * * * Captain Grutan of the Hibarnhvidar Guard leads the city's defense
ECHO ===================
ECHO
goto %1

HIBFINISH:
ECHO
ECHO ================================
ECHO * * * Outer Hibarnhvidar: GO STONE GATE
ECHO * * * Inner Hibarnhvidar: GO IRON GATE
ECHO ================================
ECHO
ECHO
goto finish

GetHibDokora:
pause
match hib-forf I don't know who you are referring to.
match hib-forf But no one can see you.
match GetHibDok2 But you don't have that much!
match GetHibDok2 You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GetHibDok2:
pause
move go iron gate
move sw
move s
move go arch
move nw
put withdraw 2 silver
move se
move go arch
move n
move ne
move go arch
goto hib-forf

hib-forf:
pause
move go stone gate
move nw
move nw
move nw
move n
move e
move e
move e
move go raven gate
move e
move e
move e
move ne
move s
move ne
move ne
move go gate
move go east gate
ECHO
ECHO * * * Descending via the Sky Road from high atop the Himineldar Shel mountains
ECHO
move se
move se
move se
move e
move sw
move sw
move se
move se
move go ford
move e
ECHO
ECHO * * * Entering the road beneath the mountain
ECHO
pause 3
pause
move go gates
move e
move e
move e
move e
move e
move n
move e
move ne
move nw
move ne
move go gates
move ne
move se
goto %1

hib-boa:
BURDENCHECK12:
pause
match BURDENCHECK12A Encumbrance : None
match BURDENCHECK12A Encumbrance : Light
match BURDENCHECK12B Encumbrance : Somewhat
match BURDENCHECK12C Encumbrance : Burdened
match BURDENCHECK12D Encumbrance : Heavy
match BURDENCHECK12E Encumbrance : Very Heavy
match BURDENCHECK12F Overburdened
match BURDENCHECK12G Encumbrance : Tottering
match BURDENCHECK12H even able to move?
match BURDENCHECK12I amazing you aren't squashed!
match BURDENCHECK12 ...wait
match BURDENCHECK12 type ahead
put info
matchwait

BURDENCHECK12A:
pause
match cont-hib-boa Swimming:
match STRENGTHCHECK12 EXP HELP
put experience survival 20
matchwait

STRENGTHCHECK12:
pause
match cantswim12 (5)
match cantswim12 (6)
match cantswim12 (7)
match cantswim12 (8)
match cantswim12 (9)
match cantswim12 (10)
match cantswim12 (11)
match cantswim12 (12)
match cantswim12 (13)
match cantswim12 (14)
match cantswim12 (15)
match cont-hib-boa (16)
match cont-hib-boa (17)
match cont-hib-boa (18)
match cont-hib-boa (19)
match cont-hib-boa (2
match cont-hib-boa (3
match cont-hib-boa (4
put strength
matchwait

BURDENCHECK12B:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 50
matchwait

BURDENCHECK12C:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 90
matchwait

BURDENCHECK12D:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 130
matchwait

BURDENCHECK12E:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 170
matchwait

BURDENCHECK12F:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 210
matchwait

BURDENCHECK12G:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 250
matchwait

BURDENCHECK12H:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 290
matchwait

BURDENCHECK12I:
pause
match cont-hib-boa Swimming:
match OVERBURDENED12 EXP HELP
put experience survival 330
matchwait

OVERBURDENED12:
ECHO
ECHO *** You do not have enough swimming with your current burden to pass through Archer's Ford to Boar Clan.  Lose some weight and try again!
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells, then you can continue on to Boar Clan by typing GLANCE now.
ECHO
match cont-hib-boa You glance
matchwait

CANTSWIM12:
ECHO
ECHO *** You do not have enough swimming (20) or Strength (16) to pass through Archer's Ford to Boar Clan.  Find someone to drag you or cast some swimming spells.
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormaly high strength or spells, then you can continue on to Boar Clan by typing GLANCE now.  If you can make it to Boar Clan and back to Hibarnhvidar let me know what your swimming and strength are (kraelyst@hotmail.com)!
match cont-hib-boa You glance
ECHO
match cont-hib-boa You glance
matchwait

cont-hib-boa:
pause
move go stone gate
move nw
move nw
move nw
move n
move w
move w
move nw
move w
move w
move w
move w
move w
move w
move go northwest gate
move n
move n
move n
move n
move n
move n
move n
move n
move nw
move nw
move n
move n
move n
move nw
move nw
move n
move n
move n
move ne
move ne
move n
move n
move ne
move nw
move n
move ne
move n
move ne
move ne
move ne
move nw
move nw
move nw
move n
move ne
move n
move nw
move n
move nw
ECHO
ECHO * * * Now wading across Archer's Ford in the Biiskbowr River, which flows from the Journelai Mountains to Sawstwar Lake.
ECHO
hib-boa-groupcheck:
pause
match hib-boa-nogroup You have no group
match hib-boa-nogroup You must be visible
match hib-boa-group You whisper
put whisper group ...
matchwait

hib-boa-nogroup:
save swim-hib-boa2
goto swim-hib-boa1

hib-boa-group:
save hib-boa-cont-group
pause
put say If we get separated in the ford go as far NW as you can, don't go north. I will meet you on the other side of the ford.
goto swim-hib-boa1

swim-hib-boa1:
pause
put nw
match %s The evergreens begin to close in again
match %s You can't go there
match swim-hib-boa1 Obvious paths:
match swim-hib-boa1 Obvious exits:
match swim-hib-boa1 but can't get anywhere.
match swim-hib-boa1 can't seem to make much headway.
match swim-hib-boa1 ...wait
match swim-hib-boa1 type ahead
matchwait

hib-boa-cont-group:
pause
ECHO
ECHO *** When your group arrives from the ford, rejoin and then type GLANCE to continue.  Make sure their roundtime is done.
ECHO
waitfor You glance
swim-hib-boa2:
pause
move n
move nw
move w
move w
move w
move nw
move w
move w
move nw
move n
move n
move n
move n
move n
move n
climb-hib-boa1:
save climb-hib-boa1
match climb-hib-boa3 The roadway cuts its way
match climb-hib-boa2 slip after a few feet
match climb-hib-boa2 You must be standing
match climb-hib-boa2 Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb log stair
matchwait

climb-hib-boa2:
pause
match climb-hib-boa1 You stand
match climb-hib-boa1 You are already standing
match climb-hib-boa2 cannot manage to stand.
match climb-hib-boa2 ...wait
match climb-hib-boa2 type ahead
put StAND
matchwait

climb-hib-boa3:
move nw
move nw
move nw
move nw
move nw
move go stone bridge
move nw
move ne
move w
ECHO
ECHO ===================
ECHO *** BOAR CLAN
ECHO *** A Gor'Tog settlement on the banks of the Liirewsag River
ECHO *** Patron god is Everild, the boar
ECHO *** Features are the Ranger Guild, Togball Field, Everild favor alter, leather repair, and reflex training
ECHO *** Boar Clan is governed by Ranger Guildleader, currently Paglar
ECHO ===================
ECHO
goto %1

BOA-HIB:
BURDENCHECK13:
pause
match BURDENCHECK13A Encumbrance : None
match BURDENCHECK13A Encumbrance : Light
match BURDENCHECK13B Encumbrance : Somewhat
match BURDENCHECK13C Encumbrance : Burdened
match BURDENCHECK13D Encumbrance : Heavy
match BURDENCHECK13E Encumbrance : Very Heavy
match BURDENCHECK13F Overburdened
match BURDENCHECK13G Encumbrance : Tottering
match BURDENCHECK13H even able to move?
match BURDENCHECK13I amazing you aren't squashed!
match BURDENCHECK13 ...wait
match BURDENCHECK13 type ahead
put info
matchwait

STRENGTHCHECK13:
pause
match cantswim13 (5)
match cantswim13 (6)
match cantswim13 (7)
match cantswim13 (8)
match cantswim13 (9)
match cantswim13 (10)
match cantswim13 (11)
match cantswim13 (12)
match cantswim13 (13)
match cantswim13 (14)
match cantswim13 (15)
match cont-boa-hib (16)
match cont-boa-hib (17)
match cont-boa-hib (18)
match cont-boa-hib (19)
match cont-boa-hib (2
match cont-boa-hib (3
match cont-boa-hib (4
put strength
matchwait

BURDENCHECK13A:
pause
match cont-boa-hib Swimming:
match strengthcheck13 EXP HELP
put experience survival 20
matchwait

BURDENCHECK13B:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 50
matchwait

BURDENCHECK13C:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 90
matchwait

BURDENCHECK13D:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 130
matchwait

BURDENCHECK13E:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 170
matchwait

BURDENCHECK13F:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 210
matchwait

BURDENCHECK13G:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 250
matchwait

BURDENCHECK13H:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 290
matchwait

BURDENCHECK13I:
pause
match cont-boa-hib Swimming:
match OVERBURDENED13 EXP HELP
put experience survival 330
matchwait

OVERBURDENED13:
ECHO
ECHO *** You do not have enough swimming with your current burden to pass through Archer's Ford to Boar Clan.  Lose some weight and try again!
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells then you can try to make the swim by typing GLANCE now.
ECHO * * * If you can make it through Archer's Ford please let me know what your swimming and strength are (kraelyst@hotmail.com)!
ECHO
match cont-boa-hib You glance
matchwait

CANTSWIM13:
ECHO
ECHO *** You do not have enough swimming (20) or Strength (16) to pass through Archer's Ford south of Boar Clan.  Find someone to drag you or cast some swimming spells.
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells then you can try to make the swim through Archer's Ford by typing GLANCE now.  
ECHO
match cont-boa-hib You glance
matchwait

cont-boa-hib:
pause
move e
move sw
move se
move go stone bridge
move se
move se
move se
move se
move se

climb-boa-hib1:
save climb-boa-hib1
match climb-boa-hib3 Although there is packed dirt
match pause slip after a few feet
match climb-boa-hib2 You must be standing
match climb-boa-hib2 Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb log stair
matchwait

climb-boa-hib2:
pause
match climb-boa-hib1 You stand
match climb-boa-hib1 You are already standing
match climb-boa-hib2 cannot manage to stand.
match climb-boa-hib2 ...wait
match climb-boa-hib2 type ahead
put StAND
matchwait

climb-boa-hib3:
move s
move s
move s
move s
move s
move s
move se
move e
move e
move se
move e
move e
move e
move se
move s
move se
move se
ECHO
ECHO * * * Now wading across Archer's Ford, so named for local Boar Clan Rangers using nearby trees for archery practice
ECHO
boa-hib-groupcheck:
pause
match boa-hib-nogroup You have no group
match boa-hib-nogroup You must be visible
match boa-hib-group You whisper
put whisper group ...
matchwait

boa-hib-nogroup:
save swim-boa-hib2
goto swim-boa-hib1

boa-hib-group:
save boa-hib-cont-group
pause
put say If we get separated in the ford go as far SE as you can, don't go south. I will meet you on the other side of the ford.
goto swim-boa-hib1

swim-boa-hib1:
pause
put se
match %s Flowing gently at this point, the Biiskbowr River
match %s You can't go there
match swim-boa-hib1 Obvious paths:
match swim-boa-hib1 Obvious exits:
match swim-boa-hib1 but can't get anywhere.
match swim-boa-hib1 can't seem to make much headway.
match swim-boa-hib1 ...wait
match swim-boa-hib1 type ahead
matchwait

boa-hib-cont-group:
pause
ECHO
ECHO *** When your group arrives from the ford, rejoin and then type GLANCE to continue.  Make sure their roundtime is done.
ECHO
waitfor You glance
swim-boa-hib2:
pause
move s
move se
move s
move sw
move sw
move se
move se
move se
move sw
move sw
move sw
move s
move sw
move s
move se
move sw
move s
move s
move sw
move sw
move s
move s
move s
move se
move se
move s
move s
move s
move se
move se
move s
move s
move s
move s
move s
move s
move s
move s
move go hibarnhvidar gate
ECHO
ECHO * * * Entering the wintry city of Hibarnhvidar
ECHO
pause
move e
move e
move e
move e
move e
move e
move se
move e
move e
move s
move se
move se
move se
move go double gate
ECHO
ECHO ===================
ECHO *** HIBARNHVIDAR
ECHO * * * Dwarven city in the soaring Himineldar Shel Mountains
ECHO * * * Home of the famous power-generating waterwheel system
ECHO * * * Patron god is Kertigen, creator of Elanthia and god of Dwarves, metal-working, and gems
ECHO ===================
ECHO
goto %1

forf-rav:
pause
move go narrow road
move se
move se
move e
ECHO
ECHO * * * Within the abandoned mine are tommyknockers and retch fiends
ECHO
move e
move e
ECHO
ECHO * * * Mountain Giants roam upon that trail
ECHO
move se
move e
move ne
move se
ECHO
ECHO * * * Enter the cave to face angiswaerd
ECHO
pause
move e
move e
move s
move se
move s
move se
move sw
move w
move w
move sw
move nw
move sw
move w
move sw
move se
move se
move se
ECHO
ECHO *** Now moving VERY SLOWLY to avoid falling on this icy trail along the bitterly cold wind-swept cliffs of the Himineldar Shel
ECHO
pause 10
move e
pause 10
move e
ECHO
ECHO * * * A tropical mist-covered jungle fills the gorge that must be leagues beneath this mammoth mountain
pause 10
move ne
pause 10
move se
ECHO
ECHO * * * The Dwarves settled the Himineldar Shel because it contains the most precious gemstones and ores in all Elanthia
ECHO 
pause 10
move sw
pause 10
move sw
ECHO
ECHO * * * Approaching the Crystalline Gorge where black stone cliffs are encased in solid ice
ECHO 
pause 10
move sw
pause 10
move w
ECHO
ECHO * * * Within the Crystalline Gorge is the Raven's Point outpost, a gathering of sturdy warriors that protect Forfedhdar from the Dragon Priests of the Black Spire and all who would invade
ECHO 
pause 10
move sw
ECHO
ECHO * * * General Bazrid has spent many years commanding the warriors of Raven's Point, who are the front line of Forfedhdar's homeland defense
ECHO
pause 10
move sw
ECHO
ECHO * * * Frostweyr Bears roam the mountainside nearby, even right up to the Raven's Point gates. Beware!
ECHO
pause 10
move se
pause
move go rope bridge
move se
move e
move e
move s
move se
move se
move se
move se
move s
move sw
move se
move sw
move se
move sw
move s
move go iron gate
move se
ECHO
ECHO ===================
ECHO *** RAVEN'S POINT
ECHO * * * A Forfedhdar warrior outpost at the base of the Himineldar Shel mountains
ECHO * * * General Bazrid leads the Raven's Point warriors, who defend Forfedhdar from the Dragon Priests of the Black Spire
ECHO * * * Other nearby creatures are frostweyr bears, armored shalswar, forest gryphons, plague wraiths, and pivuh
ECHO * * * Features Smoky Bandit's tobacco shop and a bank, furrier, gem shop, general store, and homes
ECHO ===================
ECHO
goto %1

GetRavenDokora:
pause
match rav-forf I don't know who you are referring to.
match rav-forf But no one can see you.
match GetRavenDok2 But you don't have that much!
match GetRavenDok2 You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GetRavenDok2:
pause
move w
move go stone bank
move w
put withdraw 2 silver
pause
move e
move go doorway
move e
goto rav-forf

rav-forf:
pause
move nw
move go iron gate
move n
move ne
move nw
move ne
move nw
move ne
move n
move nw
move nw
move nw
move nw
move n
move w
move w
move go rope bridge
move nw
move nw
ECHO
ECHO *** Moving VERY SLOWLY to avoid falling on this icy trail along the bitterly cold wind-swept cliffs of the Himineldar Shel
ECHO
pause 10
move ne
pause 10
ECHO
ECHO * * * In this blizzard you probably wish you were back in Raven's Point with tobacco from Smoky Bandit's in one hand and a Dwarven ale in the other.
ECHO * * * Did you know each Dwarf clan brews its own special ale?
ECHO
move ne
pause 10
move e
pause 10
move ne
ECHO
ECHO * * * The Dwarves settled the Himineldar Shel because it contains the most precious gemstones and ores in all Elanthia
ECHO
pause 10
move ne
pause 10
move ne
ECHO
ECHO * * * The village of Nenav Dalar was lost in the year 157.  Perhaps you'll find it beneath one of these snowdrifts.
ECHO 
pause 10
move nw
pause 10
move sw
ECHO
ECHO * * * Centuries ago the Dwarves ruled the entire western and southern parts of the continent and the Himineldar Shel was part of the Kwarlog kingdom
pause 10
move w
pause 10
move w
pause 10
move nw
ECHO
ECHO * * * Just ahead is the Haalikshal Highway, which in Haakish means "sacred mountain"
ECHO * * * The highway is lined with the totem pillars of Dwarves whose families do not have their own totem groves
ECHO
pause 10
move nw
move nw
move ne
move e
move ne
move se
move ne
move e
move e
move ne
move nw
move n
move nw
move n
move w
move w
ECHO
ECHO * * * In the cave are angiswaerd
ECHO
move nw
move sw
move w
move nw
ECHO
ECHO * * * Mountain Giants roam upon that trail
ECHO
move w
move w
ECHO
ECHO * * * Enter this abandoned mine to face tommyknockers and retch fiends
ECHO
pause
move w
move nw
move nw
move go narrow road
ECHO
ECHO * * * Entering the Haalikshal Highway
ECHO
goto %1

sha-rav:
pause
move go muddy trail
move w
move sw
move sw
move s
ECHO
ECHO
ECHO * * * Passing beside Wyvern Mountain which contains a shrine to the World Dragon, built by Sh'kial
ECHO
pause
move w
move nw
move n
move nw
move w
move n
move nw
move n
move nw
move nw
move n
move ne
move ne
move ne
move n
move ne
move n
move nw
move nw
move w
move nw
move w
move w
move sw
move nw
move w
move w
move w
move w
move w
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move sw
move w
move sw
move climb narrow path
PATH-RAV:
move nw
move nw
move w
move w
move nw
move w
move nw
move ne
move nw
move w
move w
move w
move nw
move w
pause
match swim-path-rav1 You have no group
match swim-path-rav1 You must be visible
match swim-path-rav-group1 You whisper
put whisper group If we get split up keep going northward until you see the Gear Gate.
matchwait

swim-path-rav-group1:
save swim-path-rav-group1
pause
put n
match swim-path-rav-group2 The road joins the streambed
match swim-path-rav-group2 The mud of a lower bank
match swim-path-rav-group1 but can't get anywhere.
match swim-path-rav-group1 can't seem to make much headway.
match swim-path-rav-group1 ...wait
match swim-path-rav-group1 type ahead
match retreat engaged
matchwait

swim-path-rav-group2:
save swim-path-rav-group2
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
put w
match swim-path-rav-group3 [The Western Road, Stream Bank]
match swim-path-rav-group2 but can't get anywhere.
match swim-path-rav-group2 can't seem to make much headway.
match swim-path-rav-group2 ...wait
match swim-path-rav-group2 type ahead
match retreat engaged
matchwait

swim-path-rav-group3:
save swim-path-rav-group3
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
put nw
match swim-path-rav-group4 [The Western Road, Atop the Ridge]
match swim-path-rav-group3 ...wait
match swim-path-rav-group3 type ahead
match retreat engaged
matchwait

swim-path-rav-group4:
ECHO
ECHO * * * Entering the Dwarven province of Forfedhdar
ECHO * * * "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
pause
move nw
move n
move n
move ne
move ne
move e
move e
move ne
move ne
ECHO
ECHO * * * The Crystalline Gorge: black stone rises on all sides covered with ice crystals
ECHO
move up
move ne
move n
move nw
pause
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto raven-arrived

swim-path-rav1:
save swim-path-rav1
pause
put n
match swim-path-rav2 The road joins the streambed
match swim-path-rav2 The mud of a lower bank
match swim-path-rav1 but can't get anywhere.
match swim-path-rav1 can't seem to make much headway.
match swim-path-rav1 ...wait
match swim-path-rav1 type ahead
match retreat engaged
matchwait

swim-path-rav2:
save swim-path-rav2
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
put w
match swim-path-rav3 [The Western Road, Stream Bank]
match swim-path-rav2 but can't get anywhere.
match swim-path-rav2 can't seem to make much headway.
match swim-path-rav2 ...wait
match swim-path-rav2 type ahead
match retreat engaged
matchwait

swim-path-rav3:
save swim-path-rav3
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
put nw
match swim-path-rav4 [The Western Road, Atop the Ridge]
match swim-path-rav3 ...wait
match swim-path-rav3 type ahead
match retreat engaged
matchwait

swim-path-rav4:
ECHO
ECHO * * * Entering the Dwarven province of Forfedhdar
ECHO * * * "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
pause
move nw
move n
move n
move ne
move ne
move e
move e
move ne
move ne
ECHO
ECHO * * * The Crystalline Gorge: black stone rises on all sides covered with ice crystals
ECHO
move up
move ne
move n
move nw
raven-arrived:
ECHO
ECHO ===================
ECHO *** RAVEN'S POINT
ECHO * * * A Forfedhdar warrior outpost at the base of the Himineldar Shel mountains
ECHO * * * General Bazrid leads the Raven's Point warriors, who defend Forfedhdar from the Dragon Priests of the Black Spire
ECHO * * * Other nearby creatures are frostweyr bears, armored shalswar, forest gryphons, plague wraiths, and pivuh
ECHO * * * Features Smoky Bandit's tobacco shop and a bank, furrier, gem shop, general store, and homes
ECHO ===================
ECHO
goto %1

rav-sha:
pause
move sw
move se
move sw
move se
move down
move sw
move sw
move w
move w
move sw
move sw
move s
ECHO
ECHO * * * Entering the province of Ilithi
ECHO
move s
move se
move se
move e
pause
match swim-rav-sha1 You have no group
match swim-rav-sha1 You must be visible
match swim-rav-sha-group1 You whisper
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
matchwait

swim-rav-sha-group1:
save swim-rav-sha-group1
pause
put s
match swim-rav-sha-group2 The comfortable current and
match swim-rav-sha-group1 but can't get anywhere.
match swim-rav-sha-group1 can't seem to make much headway.
match swim-rav-sha-group1 ...wait
match swim-rav-sha-group1 type ahead
match retreat engaged
matchwait

swim-rav-sha-group2:
save swim-rav-sha-group2
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
pause
put e
match swim-rav-sha-group3 [The Western Road, Stream Bank]
match swim-rav-sha-group2 but can't get anywhere.
match swim-rav-sha-group2 can't seem to make much headway.
match swim-rav-sha-group2 ...wait
match swim-rav-sha-group2 type ahead
match retreat engaged
matchwait

swim-rav-sha-group3:
save swim-rav-sha-group3
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
pause
put se
match swim-rav-sha-group4 [The Western Road, Big Meadow]
match swim-rav-sha-group3 ...wait
match swim-rav-sha-group3 type ahead
match retreat engaged
matchwait

swim-rav-sha-group4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto rav-sha-cont

swim-rav-sha1:
save swim-rav-sha1
pause
put s
match swim-rav-sha2 The comfortable current and
match swim-rav-sha1 but can't get anywhere.
match swim-rav-sha1 can't seem to make much headway.
match swim-rav-sha1 ...wait
match swim-rav-sha1 type ahead
match retreat engaged
matchwait

swim-rav-sha2:
save swim-rav-sha2
pause
put e
match swim-rav-sha3 [The Western Road, Stream Bank]
match swim-rav-sha2 but can't get anywhere.
match swim-rav-sha2 can't seem to make much headway.
match swim-rav-sha2 ...wait
match swim-rav-sha2 type ahead
match retreat engaged
matchwait

swim-rav-sha3:
save swim-rav-sha3
pause
put se
match swim-rav-sha4 [The Western Road, Big Meadow]
match swim-rav-sha3 ...wait
match swim-rav-sha3 type ahead
match retreat engaged
matchwait

swim-rav-sha4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
goto rav-sha-cont

rav-sha-cont:
move climb narrow path
move ne
move e
move ne
move e
move se
move ne
move ne
move e
move e
move se
move ne
move ne
move e
move e
move se
move ne
move e
move e
move e
move e
move e
move se
move ne
move e
move e
move se
move e
move se
move se
move s
move sw
move s
move sw
move sw
move sw
move s
move se
move se
move s
move se
move s
move e
move se
move s
move se
move e
move go muddy trail
move ne
move ne
move e
move e
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO *** Capitol of Ilithi and the Elothean nation and home to Elves, governed by an Elothean Ferdahl
ECHO *** Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO *** Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered by the Outcasts.
ECHO ===================
ECHO
goto %1

hor-rav:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
pause
move go path
move n
move e
move se
move e
move se
move e
move se
move e
move ne
move e
move ne
move e
move ne
move e
move n
move nw
move ne
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Founded by a harmless priest named Sh'kial, turned wicked by his scheming student D'zree
ECHO
pause
move e
move e
move e
move se
move e
move ne
move n
move se
move climb bluff
move ne
move e
move se
move e
goto path-rav

rav-hor:
pause
move sw
move se
move sw
move se
move down
move sw
move sw
move w
move w
move sw
move sw
move s
ECHO
ECHO * * * Entering the province of Ilithi
ECHO
move s
move se
move se
move e
pause
match swim-rav-hor1 You have no group
match swim-rav-hor1 You must be visible
match swim-rav-hor-group1 You whisper
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
matchwait

swim-rav-hor-group1:
save swim-rav-hor-group1
pause
put s
match swim-rav-hor-group2 The comfortable current and
match swim-rav-hor-group1 but can't get anywhere.
match swim-rav-hor-group1 can't seem to make much headway.
match swim-rav-hor-group1 ...wait
match swim-rav-hor-group1 type ahead
match retreat engaged
matchwait

swim-rav-hor-group2:
save swim-rav-hor-group2
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
pause
put e
match swim-rav-hor-group3 [The Western Road, Stream Bank]
match swim-rav-hor-group2 but can't get anywhere.
match swim-rav-hor-group2 can't seem to make much headway.
match swim-rav-hor-group2 ...wait
match swim-rav-hor-group2 type ahead
match retreat engaged
matchwait

swim-rav-hor-group3:
save swim-rav-hor-group3
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
pause
put se
match swim-rav-hor-group4 [The Western Road, Big Meadow]
match swim-rav-hor-group3 ...wait
match swim-rav-hor-group3 type ahead
match retreat engaged
matchwait

swim-rav-hor-group4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto rav-hor-cont

swim-rav-hor1:
save swim-rav-hor1
pause
put s
match swim-rav-hor2 The comfortable current and
match swim-rav-hor1 but can't get anywhere.
match swim-rav-hor1 can't seem to make much headway.
match swim-rav-hor1 ...wait
match swim-rav-hor1 type ahead
match retreat engaged
matchwait

swim-rav-hor2:
save swim-rav-hor2
pause
put e
match swim-rav-hor3 [The Western Road, Stream Bank]
match swim-rav-hor2 but can't get anywhere.
match swim-rav-hor2 can't seem to make much headway.
match swim-rav-hor2 ...wait
match swim-rav-hor2 type ahead
match retreat engaged
matchwait

swim-rav-hor3:
save swim-rav-hor3
pause
put se
match swim-rav-hor4 [The Western Road, Big Meadow]
match swim-rav-hor3 ...wait
match swim-rav-hor3 type ahead
match retreat engaged
matchwait

swim-rav-hor4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
goto rav-hor-cont

rav-hor-cont:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
move w
move nw
move w
move sw
move climb game trail
move nw
move s
move sw
move w
move nw
move w
move w
move w
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Under D'zree the Dragon Priests once conquered most of the 5 provinces
ECHO
pause
move sw
move se
move s
move w
move sw
move w
move sw
move w
move sw
move w
move nw
move w
move nw
move w
move nw
move w
move s
move go path
ECHO
ECHO ===================
ECHO *** HORSE CLAN aka Zaldi Taipa (in Elven)
ECHO *** A nomadic clan of Wind Elves
ECHO *** Governed by the Indar Taipan, Elven for "Strength of the Clan"
ECHO *** Home to the Sulde Taala, a special horse nearly worshipped by the clan, sometimes called Horse of the Huntress or the Sun-Horse.
ECHO ===================
echo
goto finish

raven1-raven2:
raven1climbcheck:
pause
match raven1groupcheck Climbing:
match raven1NoClimb EXP HELP
put experience survival 25
matchwait

raven1NoClimb:
pause
put go gate
match GearGateClosed1 sealed for the night!
match waitgate3 The gear gate is closed.
match waitgate3 Wait until the gear gate has opened
match waitgate3 Open the gear gate!
match %1 [Raven's Point, Gear Gate]
match raven1NoClimb ...wait
match raven1NoClimb type ahead
matchwait

waitgate3:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for entry to Raven's Point
ECHO
match raven1NoClimb slides to a fully open position
match raven1NoClimb sealing the passage both in
matchwait

GearGateClosed1:
pause
ECHO
ECHO *** The Gear Gate is closed for the night and you do not have enough climbing skill (25) to bypass the gate.  You'll have to wait until day, learn more climbing, or get some help.
ECHO
ECHO * * * If you think you might be able to make it because of higher than normal strength, spells, or other tricks then type GLANCE now to try the gate bypass.
ECHO
match raven1groupcheck You glance
matchwait

raven1groupcheck:
pause
match checkgate1 You have no group
match checkgate1 You must be visible
match checkravengate3 You whisper
put whisper group ...
matchwait

checkravengate3:
pause
put go gate
match groupraven1-raven2 sealed for the night!
match groupraven1-raven2 The gear gate is closed.
match waitgate1 Wait until the gear gate has opened
match waitgate1 Open the gear gate!
match %1 [Raven's Point, Gear Gate]
match checkravengate3 ...wait
match checkravengate3 type ahead
matchwait

groupraven1-raven2:
move se
move s
put whisper group GO HOLE right now and join me on the other side, then stand.  Hurry!
pause
move go hole
raven3stand:
pause
match waitraven3 You stand
match waitraven3 You are already standing
match raven3stand cannot manage to stand.
match raven3stand ...wait
match raven3stand type ahead
put StAND
matchwait

waitraven3:
ECHO
ECHO *** Wait for your group to rejoin and stand up and then type GLANCE
ECHO
pause
waitfor You glance
goto turnbasin3

turnbasin3:
pause
put turn basin
match gowall3 stone wall opens up.
match turnbasin3 stone wall closes.
match turnbasin3 ...wait
match turnbasin3 type ahead
matchwait

gowall3:
pause
move go stone wall
move go opening
move e
move e
move go rock road
move nw
move nw
move go barrier
move sw

ravclimb1A:
save ravclimb1A
match ravclimb3A a rain-washed gully
match ravclimb2A slip after a few feet
match ravclimb2A You must be standing
match ravclimb2A Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb sharp gully
matchwait

ravclimb2A:
pause
match ravclimb1A You stand
match ravclimb1A You are already standing
match ravclimb2A cannot manage to stand.
match ravclimb2A ...wait
match ravclimb2A type ahead
put StAND
matchwait

ravclimb3A:
move sw

ravclimb1B:
save ravclimb1B
match ravclimb3B while a jagged rockslide blocks the
match ravclimb2B slip after a few feet
match ravclimb2B You must be standing
match ravclimb2B Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rockslide
matchwait

ravclimb2B:
pause
match ravclimb1B You stand
match ravclimb1B You are already standing
match ravclimb2B cannot manage to stand.
match ravclimb2B ...wait
match ravclimb2B type ahead
put StAND
matchwait

ravclimb3B:
move sw
move w
put whisper group GO ROCK SHARD and join me on the other side!  Hurry!  Watch out for bears!
move go rock shard
pause
ECHO
ECHO *** Wait for your group to rejoin and stand up and then type GLANCE
ECHO
pause
waitfor You glance
move sw
move se
move sw
move s
move go gate
move se
goto %1

checkgate1:
pause
put go gate
match goraven1-raven2 sealed for the night!
match goraven1-raven2 The gear gate is closed.
match goraven1-raven2 Wait until the gear gate has opened
match goraven1-raven2 Open the gear gate!
match %1 [Raven's Point, Gear Gate]
match checkgate1 ...wait
match checkgate1 type ahead
matchwait

waitgate1:
pause
put go gate
ECHO
ECHO *** Waiting for the Gear Gate to open for entry to Raven's Point
ECHO
match checkgate1 slides to a fully open position
match waitgate1 sealing the passage both in
matchwait

goraven1-raven2:
move se
move s
move go hole
raven1stand:
pause
match turnbasin1 You stand
match turnbasin1 You are already standing
match raven1stand cannot manage to stand.
match raven1stand ...wait
match raven1stand type ahead
put StAND
matchwait

turnbasin1:
pause
put turn basin
match gowall1 stone wall opens up.
match turnbasin1 stone wall closes.
match turnbasin1 ...wait
match turnbasin1 type ahead
matchwait

gowall1:
pause
move go stone wall
move go opening
move e
move e
move go rock road
move nw
move nw
move go barrier
move sw
ravclimb1C:
save ravclimb1C
match ravclimb3C a rain-washed gully
match ravclimb2C slip after a few feet
match ravclimb2C You must be standing
match ravclimb2C Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb sharp gully
matchwait

ravclimb2C:
pause
match ravclimb1C You stand
match ravclimb1C You are already standing
match ravclimb2C cannot manage to stand.
match ravclimb2C ...wait
match ravclimb2C type ahead
put StAND
matchwait

ravclimb3C:
move sw

ravclimb1D:
save ravclimb1D
match ravclimb3D while a jagged rockslide blocks the
match ravclimb2D slip after a few feet
match ravclimb2D You must be standing
match ravclimb2D Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rockslide
matchwait

ravclimb2D:
pause
match ravclimb1D You stand
match ravclimb1D You are already standing
match ravclimb2D cannot manage to stand.
match ravclimb2D ...wait
match ravclimb2D type ahead
put StAND
matchwait

ravclimb3D:
move sw
move w
move go rock shard
move sw
move se
move sw
move s
move go gate
move se
goto %1

raven2-raven1:
raven2climbcheck:
pause
match raven2groupcheck Climbing:
match raven2NoClimb EXP HELP
put experience survival 25
matchwait

raven2NoClimb:
pause
put go gate
match GearGateClosed2 sealed for the night!
match waitgate4 The gear gate is closed.
match waitgate4 Wait until the gear gate has opened
match waitgate4 Open the gear gate!
match %1 [Seord Kerwaith, Gear Gate]
match raven2NoClimb ...wait
match raven2NoClimb type ahead
matchwait

GearGateClosed2:
pause
ECHO
ECHO *** The Gear Gate is closed for the night and you do not have enough climbing skill (25) to bypass the gate.  You'll have to wait until day, learn more climbing, or get some help.
ECHO
ECHO * * * If you think you might be able to make it because of higher than normal strength, spells, or other tricks then type GLANCE now to try the gate bypass.
ECHO
match raven2groupcheck You glance
matchwait

waitgate4:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for exit from Raven's Point
ECHO
match raven2NoClimb slides to a fully open position
match raven2NoClimb sealing the passage both in
matchwait

raven2groupcheck:
pause
match gocheckgate2 You have no group
match gocheckgate2 You must be visible
match checkravengate4 You whisper
put whisper group ...
matchwait

checkravengate4:
pause
put go gate
match groupraven2-raven1 sealed for the night!
match groupraven2-raven1 The gear gate is closed.
match waitgate2 Wait until the gear gate has opened
match waitgate2 Open the gear gate!
match %1 [Seord Kerwaith, Gear Gate]
match checkravengate4 ...wait
match checkravengate4 type ahead
matchwait

groupraven2-raven1:
move nw
move go gate
move n
move ne
move nw
move ne
put whisper group GO ROCK WALL and join me on the other side! 
move go rock wall
pause
ECHO
ECHO *** Wait for your group to rejoin and stand up and then type GLANCE
ECHO
pause
waitfor You glance
move e
move ne

ravclimb1F:
save ravclimb1F
match ravclimb3F The forest rises to the north
match ravclimb2F slip after a few feet
match ravclimb2F You must be standing
match ravclimb2F Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rockslide
matchwait

ravclimb2F:
pause
match ravclimb1F You stand
match ravclimb1F You are already standing
match ravclimb2F cannot manage to stand.
match ravclimb2F ...wait
match ravclimb2F type ahead
put StAND
matchwait

ravclimb3F:
move ne

ravclimb1G:
save ravclimb1G
match ravclimb3G The forest crowds the road
match ravclimb2G slip after a few feet
match ravclimb2G You must be standing
match ravclimb2G Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rain gully
matchwait

ravclimb2G:
pause
match ravclimb1G You stand
match ravclimb1G You are already standing
match ravclimb2G cannot manage to stand.
match ravclimb2G ...wait
match ravclimb2G type ahead
put StAND
matchwait

ravclimb3G:
move ne
move go crushed fence
move se
move se
move go narrow canyon
move w
move w
move go tunnel mouth
turntorch4:
pause
put turn torch
match gowall4 stone wall opens up.
match turntorch4 stone wall closes.
match turntorch4 ...wait
match turntorch4 type ahead
matchwait

gowall4:
move go stone wall
pause
put whisper group GO HOLE right now, then STAND and go NORTH, NORTHWEST.  Hurry!
pause
move go hole
raven4stand:
pause
match raven4stood You stand
match raven4stood You are already standing
match raven4stand cannot manage to stand.
match raven4stand ...wait
match raven4stand type ahead
put StAND
matchwait

raven4stood:
move n
move nw
pause
ECHO
ECHO *** Wait for your group to rejoin then type GLANCE
ECHO
waitfor You glance
goto %1


gocheckgate2:
checkgate2:
pause
put go gate
match goraven2-raven1 sealed for the night!
match goraven2-raven1 The gear gate is closed.
match goraven2-raven1 Wait until the gear gate has opened
match goraven2-raven1 Open the gear gate!
match %1 [Seord Kerwaith, Gear Gate]
match checkgate2 ...wait
match checkgate2 type ahead
matchwait

waitgate2:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for exit from Raven's Point
ECHO
match checkgate2 slides to a fully open position
match waitgate2 sealing the passage both in
matchwait

goraven2-raven1:
move nw
move go gate
move n
move ne
move nw
move ne
move go rock wall
move e
move ne
ravclimb1H:
save ravclimb1H
match ravclimb3H The forest rises to the north
match ravclimb2H slip after a few feet
match ravclimb2H You must be standing
match ravclimb2H Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rockslide
matchwait

ravclimb2H:
pause
match ravclimb1H You stand
match ravclimb1H You are already standing
match ravclimb2H cannot manage to stand.
match ravclimb2H ...wait
match ravclimb2H type ahead
put StAND
matchwait

ravclimb3H:
move ne

ravclimb1I:
save ravclimb1I
match ravclimb3I The forest crowds the road
match ravclimb2I slip after a few feet
match ravclimb2I You must be standing
match ravclimb2I Stand up first.
match pause steepness is intimidating
match pause can't seem to find purchase
match pause find it hard going.
match pause your footing is questionable
match pause A wave of dizziness hits you
match pause Struck by vertigo
match pause ...wait
match pause type ahead
put climb rain gully
matchwait

ravclimb2I:
pause
match ravclimb1I You stand
match ravclimb1I You are already standing
match ravclimb2I cannot manage to stand.
match ravclimb2I ...wait
match ravclimb2I type ahead
put StAND
matchwait

ravclimb3I:
move ne
move go crushed fence
move se
move se
move go narrow canyon
move w
move w
move go tunnel mouth
turntorch2:
pause
put turn torch
match gowall2 stone wall opens up.
match turntorch2 stone wall closes.
match turntorch2 ...wait
match turntorch2 type ahead
matchwait

gowall2:
move go stone wall
move go hole
raven2stand:
pause
match raven2stood You stand
match raven2stood You are already standing
match raven2stand cannot manage to stand.
match raven2stand ...wait
match raven2stand type ahead
put StAND
matchwait

raven2stood:
move n
move nw
goto %1

NOSTART:
ECHO
ECHO ==========================================
ECHO *** You are not at a valid starting location for the MAINLAND TRAVEL SCRIPT
ECHO
ECHO * * * Start Outside any Town Gate
ECHO * * * Start on any public transport (ferry, barge, gondola, skiff)
ECHO * * * Start at any public transport dock 
ECHO
ECHO *** Additional starting locations:
ECHO  * * Crossing - outside bank; outside Moon Mage guild
ECHO  * * Riverhaven - Town Square
ECHO  * * On the broken bridge south of the Faldesu
ECHO  * * Langenfirth - Outside Wharf area
ECHO  * * El'Bain's - Picnic Area
ECHO  * * Leth Deriel - center of town
ECHO  * * Fayrin's Rest - Anloraten Crossing
ECHO  * * Wolf Clan - outside Trader outpost
ECHO  * * Knife Clan - North side of bridge
ECHO  * * Raven's Point - Inside gear gate
ECHO  * * Hibarnhvidar - Gateway between Inner and Outer Hibarnhvidar
ECHO ==========================================
ECHO
EXIT

NODESTINATION:
ECHO
ECHO =================================================
ECHO *** You did not enter a valid destination
ECHO *** To use this script type .{scriptname} {destination}
ECHO *** For example, to go to Crossing type  .travel crossing
ECHO =================================================
ECHO ========================================================
ECHO *** List of possible destinations:
ECHO
ECHO *** ILITHI:
ECHO * * * Horse Clan, Shard, Steelclaw Clan, Fayrin's Rest, Gondola
ECHO
ECHO *** FORFEDHDAR
ECHO * * * Ain Ghazal, Hibarnhvidar, Boar Clan, Raven's Point, Nenav Dalar
ECHO
ECHO *** ZOLUREN:
ECHO * * * Ilaya Taipa, Leth, Acenamacra, Alfren's Ferry, Crossing, Arthe Dale
ECHO * * * Kaerna, Caravansary, Dirge, and Tiger, Wolf, Knife, and Stone Clans
ECHO
ECHO *** THERENGIA:
ECHO * * * Faldesu River, North Road Ferry, Riverhaven, Throne City, Rossman's,
ECHO * * * Therenborough, El'Bain's, Langenfirth, Fornsted, Hvaral, Muspari
ECHO
ECHO
ECHO *** VALID STARTING LOCATIONS:
ECHO * * * Start Outside any Town Gate
ECHO * * * Start on any public transport (ferry, barge, gondola, skiff)
ECHO * * * Start at any public transport dock 
ECHO
ECHO *** Additional starting locations:
ECHO  * * Crossing - outside bank; outside Moon Mage guild
ECHO  * * Riverhaven - Town Square
ECHO  * * On the broken bridge south of the Faldesu
ECHO  * * Langenfirth - Outside Wharf area
ECHO  * * El'Bain's - Picnic Area
ECHO  * * Leth Deriel - center of town
ECHO  * * Fayrin's Rest - Anloraten Crossing
ECHO  * * Wolf Clan - outside Trader outpost
ECHO  * * Knife Clan - North side of bridge
ECHO  * * Raven's Point - Inside gear gate
ECHO  * * Hibarnhvidar - Gateway between Inner and Outer Hibarnhvidar
ECHO ========================================================
pause
ECHO =================================================
ECHO *** You did not enter a destination
ECHO *** To use this script type .{scriptname} {destination}
ECHO *** For example, to go to Crossing type  .travel crossing
ECHO =================================================
EXIT

NOMONEY:
ECHO
ECHO ============================
ECHO *** YOU ARE BROKE!
ECHO *** GET SOME MONEY!
ECHO ============================
ECHO
EXIT

NOROSSMAN:
ECHO
ECHO ==============================
ECHO *** You do not have the 50 ranks of climbing required to get to Rossman's.
ECHO *** You must take a boat from Lang or Haven or have someone take you.
ECHO ==============================
ECHO
EXIT

LEAVEALLFERRIES:
pause
ECHO
ECHO ****************************************************************
ECHO *** YOU ARE ABOARD A PUBLIC TRANSPORT!
ECHO
ECHO *** If you are at a dock and want off you must get off now and restart your script,
ECHO *** otherwise you will be let off at the next dock and taken to your final destination.
ECHO ****************************************************************
ECHO
match ALLFERRYDOCK the ferry reaches the dock.
match ALLFERRYDOCK reaches the dock and its crew ties the ferry off.
match ALLFERRYDOCK reaches the dock and its crew ties the ferry off.
match ALLFERRYWHARFPIER reaches its dock and its crew ties the barge off.
match ALLFERRYMuspari The sand barge pulls into dock and its crew quickly ties the barge off.
match ALLFERRYDOCK The barge pulls into dock and its crew quickly ties the barge off.
match ALLFERRYDOCK The skiff lightly taps the dock and the skilled River Elf crew quickly secure the skiff to the pilings.
match ALLFERRYDOCK You come to a very soft stop as the ferry reaches the dock.
match ALLFERRYDOCK The ferrymaster mumbles a few quick words of thanks as he and his crew move to unload the supplies.
matchwait

ALLFERRYDOCK:
pause
put go dock
pause
goto %1

ALLFERRYWHARFPIER:
pause
put go wharf
put go pier
pause
goto %1

ALLFERRYMUSPARI:
pause
put go platform
put go dock
pause
goto %1

leaveskiff:
pause
ECHO
ECHO ****************************************************************
ECHO *** You are aboard a River Elf skiff that travels between Ilaya Taipa and Ain Ghazal.
ECHO
ECHO *** If you are at a dock and want off you must get off now and restart your script,
ECHO *** otherwise you will be let off at the next dock and taken to your final destination.
ECHO ****************************************************************
ECHO
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
goto %1

RETREAT:
match retreat You retreat back to pole range.
match retreat still stunned
match %s You retreat from combat.
match pause ...wait
match pause type ahead
put retreat
matchwait

pause:
pause
goto %s

FALLEN:
pause
match STOOD You stand
match STOOD You are already standing
match FALLEN cannot manage to stand.
match FALLEN The weight of all your possessions
match FALLEN ...wait
put StAND
matchwait

STOOD:
goto %s

FINISH:
put set Description
pause
put #parse YOU HAVE ARRIVED
ECHO
ECHO *** YOU HAVE ARRIVED ***
ECHO
ECHO Signup to be automatically notified when this script is updated. Go to: 
ECHO http://groups.yahoo.com/group/TravelScripts/join
ECHO
put look
EXIT

