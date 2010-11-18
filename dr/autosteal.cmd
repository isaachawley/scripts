ECHO
ECHO
ECHO
ECHO ***********************************************
ECHO ***
ECHO ***                   Progressive Stealing v1.57
ECHO ***                  By:  Kalic & Challeirra
ECHO ***
ECHO ***********************************************
ECHO
ECHO http://elanthipedia.com/wiki/Progressive_Stealing_(script)
ECHO
ECHO
IF_1 GOTO SKIPREMINDER
ECHO *** Don't forget you can run this script with the modifiers EASY, HARD, LESS, or MORE!
ECHO *** For the full list of command line options, try HELP!
SKIPREMINDER:
ECHO
ECHO

    pause 2

##################################################################
#####                                                        #####
#####              VARIABLES FOR USER TO SET                 #####
#####                                                        #####
##################################################################

# Due to the frequency of updates and user request, variables have
# been consolidated here for ease of replacement, and their
# explanations follow. Variables in CAPS must match the available
# toggles or the script will break.

    setVariable name Nilks
    setVariable largeitem1
    setVariable largeitem2
    setVariable DropOrStow STOW
    setVariable container1 backpack
    setVariable container2 backpack
    setVariable action STEAL
    setVariable clanoption NO
    setVariable flee NO
    setVariable shardpass gibberish
    setVariable riverpass gibberish
    setVariable PutOrSlip PUT
    setVariable skulk noskulk
    setVariable sneak NO

# Name:
# What is your name? This will be used to retrieve your item sack if
# you are arrested and fined.

# Large Items:
# Are you wearing any large items that can't be stored and are worn,
# such as a parry stick, quarterstaff, or lance? If so, input these
# here or the script will fail after an arrest due to being unable
# to retrieve them from your sack.

# DropOrStow:
# Would you like the script to simply DROP all the items you steal, 
# or STOW them to pawn off as many as possible, and dump the rest in
# the thief bin (or a bucket if you're not actually a thief)? Item
# protection safeguards are in place to ensure only the items you
# steal during the script will be sold/binned.

# Containers:
# If stowing items to pawn and bin, which containers will you use
# for your pilfered goods? If you only want to use one, set both
# variables to the same container. These containers will be checked
# at the start for any items that could be mistaken for ones you are
# going to be stealing and pawning.

# Action:
# If you are an empath or magic user, you can turn on
# perceiving health or power perception by replacing STEAL
# with PERC or POWER here. Or, if you are a thief, put MARK
# to mark items. Switch back to STEAL to toggle these off.

# ClanOption:
# Would you like to steal from clans like Tiger Clan or Steel Claw
# Clan and risk getting your hand cut off? The script will do its
# best to get you healed and continue where you left off if so.

# Flee:
# Do you want the script to automatically exit from the game if you
# are dead or get stunned for some reason other than clan justice?

# Shardpass, Riverpass:
# If you are a thief, enter your guild passwords here.

# PutOrSlip:
# If you are a thief who will be stowing items to pawn/bin and prefer
# to SLIP items into your containers, replace PUT with SLIP here.

# Skulk:
# If you are a thief and want to use Khri Skulk, put SKULK here.
# Alternately, you may replace it with any other khri you would
# like to run in addition to the defaults (focus, plunder, hasten,
# guile, darken, calm, and dampen).
# SKULK is the only khri which may also be added by command line.

# Sneak:
# YES or NO here toggles whether or not you will hide and sneak
# into and out of shops rather than just walking in and out of
# them. You may override this by entering SNEAK or NOSNEAK (one
# word) in the command line.

##################################################################
#####                                                        #####
#####                    INTERNAL SETUP                      #####
#####                  *** DO NOT EDIT ***                   #####
#####                                                        #####
##################################################################


    setVariable startlocation waitandsee
    setVariable itemlocation  
    setVariable Difficulty 0
    setVariable Quantity 0
    setVariable DiffMod false
    setVariable QuantMod false
    setVariable MRS shopcheck1
    setVariable LorM leave
    setVariable TravelOrShop travel
    setVariable BinOrBucket bucket
    setVariable percentsign %
    setVariable Profit normal
    setVariable npcoption yes
    setVariable update 1.57
    setVariable labelerr help
    setVariable arrest false
    setVariable swap 1
    setVariable stealsettings %0%
    GOTO %stealinghelp%

    NOTFIRSTRUN:
    if_1 GOTO %1%
    setVariable labelerr realerror
    put set !roombrief
    waitfor Ok.
    GOTO SETTINGS.REPORT


##################################################################
#####                                                        #####
#####         SOFT TOGGLE AND DIFFICULTY ADJUSTMENTS         #####
#####                                                        #####
##################################################################


    EASY:
        SHIFT
        setVariable DiffMod true
        counter set %Difficulty%
        counter subtract 1
        setVariable Difficulty %c%
        GOTO NOTFIRSTRUN

    HARD:
        SHIFT
        setVariable DiffMod true
        counter set %Difficulty%
        counter add 1
        setVariable Difficulty %c%
        GOTO NOTFIRSTRUN

    LESS:
        SHIFT
        setVariable QuantMod true
        counter set %Quantity%
        counter subtract 1
        setVariable Quantity %c%
        GOTO NOTFIRSTRUN

    MORE:
        SHIFT
        setVariable QuantMod true
        counter set %Quantity%
        counter add 1
        setVariable Quantity %c%
        GOTO NOTFIRSTRUN

    FOR:
        SHIFT
        GOTO NOTFIRSTRUN

    STOW:
        SHIFT
        setVariable DropOrStow stow
        GOTO NOTFIRSTRUN

    DROP:
        SHIFT
        setVariable DropOrStow drop
        GOTO NOTFIRSTRUN

    MARK:
        SHIFT
        setVariable action mark
        GOTO NOTFIRSTRUN

    POWER:
        SHIFT
        setVariable action power
        GOTO NOTFIRSTRUN

    PERC:
        SHIFT
        setVariable action perc
        GOTO NOTFIRSTRUN

    STEAL:
        SHIFT
        setVariable action steal
        GOTO NOTFIRSTRUN

    PAUSE:
        SHIFT
        setVariable action pause
        GOTO NOTFIRSTRUN

    PUT:
        SHIFT
        setVariable PutOrSlip put
        GOTO NOTFIRSTRUN

    SLIP:
        SHIFT
        setVariable PutOrSlip slip
        GOTO NOTFIRSTRUN

    SKULK:
        SHIFT
        setVariable skulk skulk
        GOTO NOTFIRSTRUN

    SNEAK:
        SHIFT
        setVariable sneak YES
        GOTO NOTFIRSTRUN

    NOSNEAK:
        SHIFT
        setVariable sneak NO
        GOTO NOTFIRSTRUN

    PROFIT:
        SHIFT
        setVariable Profit profit
        GOTO PROFIT.%DropOrStow%
    PROFIT.DROP:
        setVariable DropOrStow stow
        ECHO ***********************************************
        ECHO *** You have selected to run this script for profit. Your
        ECHO *** drop/stow toggle has been overridden and changed to STOW.
        ECHO ***********************************************
        pause 3
    PROFIT.STOW:
        GOTO NOTFIRSTRUN


##################################################################
#####                                                        #####
#####                     SETTINGS REPORT                    #####
#####                                                        #####
##################################################################


    SETTINGS.REPORT:
        put echocolumn /on
        waitfor EchoColumn
        ECHO
        ECHO
        ECHO ***********************************************
        ECHO *** You current user settings are:
        ECHO ***
        GOTO REPORT.NAME

    REPORT.NAME:
        ECHO *** NAME:       Your name is %name%.

    REPORT.LARGEITEMS:
        ECHO *** ITEMS:      If arrested (and applicable), script will try to retrieve the following items from your sack:
        ECHO ***                %largeitem1%        %largeitem2%
        GOTO REPORT.DIFFMOD.%DiffMod%

    REPORT.DIFFMOD.FALSE:
        ECHO *** DIFFICULTY: NORMAL - You have not modified difficulty settings.
        GOTO REPORT.QUANTMOD.%QuantMod%
    REPORT.DIFFMOD.TRUE:
        ECHO *** DIFFICULTY: %Difficulty% added to your skill bracket.
        GOTO REPORT.QUANTMOD.%QuantMod%

    REPORT.QUANTMOD.FALSE:
        ECHO *** QUANTITY:   NORMAL - You have not modified quantity settings.
        GOTO REPORT.%DropOrStow%.%Profit%
    REPORT.QUANTMOD.TRUE:
        ECHO *** QUANTITY:   %Quantity% added to the number of items you steal (min attempts 1, max attempts 6).
        GOTO REPORT.%DropOrStow%.%Profit%

    REPORT.DROP.NORMAL:
    REPORT.DROP.PROFIT:
        ECHO *** DROP:       You will drop stolen items.
        GOTO REPORT.ACTION.%action%
    REPORT.STOW.PROFIT:
        ECHO *** PROFIT:     The items you steal will be selected for their pawning profitability if possible.
    REPORT.STOW.NORMAL:
        ECHO *** STOW:       You will %PutOrSlip% stolen items to pawn and/or bin in the following containers:
        ECHO ***                %container1%        %container2%
        GOTO REPORT.ACTION.%action%

    REPORT.ACTION.MARK:
        ECHO *** MARK:       You will mark items before attempting to steal them.
        GOTO REPORT.SNEAK.%sneak%
    REPORT.ACTION.POWER:
        ECHO *** POWER:      You will perceive power before stealing in each shop.
        GOTO REPORT.SNEAK.%sneak%
    REPORT.ACTION.PERC:
        ECHO *** PERC:       You will perceive health before stealing in each shop.
        GOTO REPORT.SNEAK.%sneak%
    REPORT.ACTION.STEAL:
        ECHO *** NO EXTRAS:  You are not set to mark or use power perception or perceive health.
        GOTO REPORT.SNEAK.%sneak%
    REPORT.ACTION.PAUSE:
        ECHO *** PAUSE:      You will wait in each shop for user confirmation before stealing.
        GOTO REPORT.SNEAK.%sneak%

    REPORT.SNEAK.YES:
    REPORT.SNEAK.SNEAK:
        ECHO *** SNEAKING:   YES - You WILL hide and sneak in and out of shops.
        GOTO REPORT.CLANS.%clanoption%
    REPORT.SNEAK.NO:
    REPORT.SNEAK.NOSNEAK:
        ECHO *** SNEAKING:   NO - You will NOT hide and sneak in and out of shops.
        GOTO REPORT.CLANS.%clanoption%

    REPORT.CLANS.YES:
        ECHO *** CLANS:      YES - Clans, if any, WILL be included in your stealing route.
        GOTO REPORT.FLEE.%flee%
    REPORT.CLANS.NO:
        ECHO *** CLANS:      NO - Clans will NOT be included in your stealing route.
        GOTO REPORT.FLEE.%flee%

    REPORT.FLEE.YES:
        ECHO *** AUTO-EXIT:  YES - You WILL automatically exit the game if killed or inexplicably stunned.
        GOTO REPORT.PASSWORDS
    REPORT.FLEE.NO:
        ECHO *** AUTO-EXIT:  NO - You will NOT automatically exit the game due to death or stun.
        GOTO REPORT.PASSWORDS

    REPORT.PASSWORDS:
        ECHO *** PASSWORDS:  If you are a thief, you will use the following guild passwords:
        ECHO ***                SHARD: %shardpass%        HAVEN: %riverpass%

    SETTINGS.REPORT.END:
        ECHO ***********************************************
        ECHO
        ECHO
        pause 1
        put echocolumn /off
        waitfor EchoColumn
        pause 2
        GOTO CONTAINER.COMPARE

    CONTAINER.COMPARE:
        match CONTAINER.IDENTICAL %container2%
        match CONTAINER.DIFFERENT notidentical
        put echo %container1% notidentical
        GOTO UniversalMatch
    CONTAINER.IDENTICAL:
        setVariable swap 3
    CONTAINER.DIFFERENT:
        GOTO LOWERCASE.%PutOrSlip%

    LOWERCASE.PUT:
        setVariable PutOrSlip put
        GOTO CITYCHECKER
    LOWERCASE.SLIP:
        setVariable PutOrSlip slip
        GOTO CITYCHECKER


##################################################################
#####                                                        #####
#####              CHECKING PROVINCE AND CITY                #####
#####                                                        #####
##################################################################


    CITYCHECKER:
        matchre SETCROSSING /The Crossing|Cormyn|Falken|Chizili|Mauriga|Talmai|Orielda|Herilo/
        matchre SETCROSSING /Milgrym|Tembeg|Berolt|Grisgonda|Marcipur|Durantine|The True Bard|Ragge|Orem|Brisson|Guard House/
        matchre SETARTHE /Arthe Dale|Barley Bulrush|Tanglefoot|Woodcock|Quellia|Bobba|Feta|Yulugri|Thipbeet/
        matchre SETTIGER /Tiger Clan Home/
        matchre SETAESRY /Aesry|Taernen|Miakoda|Nakuge|Raeloka|Tilaya|Shoiya|Zenastara|Teshi/
        matchre SETAESRY /Woodbyne|Joirin|Bayanzi|Field of Shields|Kilora|Martrem|Rummeltum|Erianthe/
        matchre SETLETH /Leth Deriel|Morikai|Madame Orris|Alberdeen|Yerui|Ongadine/
        matchre SETLETH /Sinjian|Blanca|Yithye|Huyelm|Origami Boutique/
        matchre SETRATHA /Ratha|Paedraig|Truffenyi's Green|Chabalu|Hotagi'rath/
        matchre SETRATHA /Drorg|Namazzi|Ktzini|Krrikt'k's|Elepaio|Krelpit|Redwing|Amorand|Veraclese|Ssivo|Kalazashi|Svra'an/
        matchre SETSHARD /Shard|Aelik|Zerek|Fiona|Meek|Zieq|Idizieq|Sierack|Malik|Kilam|Demiciil|Bonime|Budd|Avlea|Genevive/
        matchre SETSHARD /Coin of the Realm|Tokens of Affection|Little Frills|Travel Tours|Toy Box|Budd|Scholar's Museum/
        matchre SETSHARD /Froissart|Survivalist Supplies|Marachek|Windawn|Enescu|Imadrail/
        matchre SETSTEEL /Quintan|Struan|Steelclaw/
        matchre SETHAVEN /Riverhaven|Alayle|Enfermine|Noel Razoreye|Cecelia|Zanthron|Ss'Thran|Smaragdaus/
        matchre SETHAVEN /Beeanna|Adaerna|Thringol|Tibvaov|Crin's Herbal|City Togs|Friar Othorp|Bantheld|Seli's/
        match SETHORSE Zaldi Taipa
        match BADLOCATION Obvious
        put look
        GOTO UniversalMatch

    SETCROSSING:
        setVariable citycode CROSS
        setVariable provcode ZOL
        setVariable lethcross CROSS
        GOTO CLASS

    SETARTHE:
        setVariable citycode ARTHE
        setVariable provcode ZOL
        setVariable lethcross CROSS
        GOTO CLASS

    SETTIGER:
        setVariable citycode TIGER
        setVariable provcode ZOL
        setVariable lethcross CROSS
        GOTO CLASS

    SETLETH:
        setVariable citycode LETH
        setVariable provcode ZOL
        setVariable lethcross LETH
        GOTO CLASS

    SETHAVEN:
        setVariable citycode HAVEN
        setVariable provcode THG
        GOTO CLASS

    SETRATHA:
        setVariable citycode RATHA
        setVariable provcode QIR
        GOTO CLASS

    SETAESRY:
        setVariable citycode AESRY
        setVariable provcode QIR
        GOTO CLASS

    SETSHARD:
        setVariable citycode SHARD
        setVariable provcode ILI
        GOTO CLASS

    SETSTEEL:
        setVariable citycode STEEL
        setVariable provcode ILI
        GOTO CLASS

    SETHORSE:
        setVariable citycode HORSE
        setVariable provcode ILI
        GOTO CLASS

    BADLOCATION:
        ECHO
        ECHO ***********************************************
        ECHO ***
        ECHO *** Could not locate you. Please enter your province
        ECHO *** code for a list of valid starting locations.
        ECHO ***
        ECHO *** Zoluren = ZOL
        ECHO *** Therengia = THG
        ECHO *** Ilithi = ILI
        ECHO *** Qi'Reshalia = QIR
        ECHO *** Forfedhdar = FRF
        ECHO ***
        ECHO ***********************************************
        ECHO
        match ZOL.BADLOCATION zol
        match THG.BADLOCATION thg
        match ILI.BADLOCATION ili
        match QIR.BADLOCATION qir
        match FRF.BADLOCATION frf
        GOTO UniversalMatch

    FRF.BADLOCATION:
        ECHO
        ECHO ***********************************************
        ECHO ***
        ECHO *** Sorry, just a teaser!
        ECHO ***
        ECHO *** Forfedhdar has not been implemented yet.
        ECHO ***
        ECHO ***********************************************
        ECHO
        GOTO END

##################################################################
#####                                                        #####
#####             CLASS, HAND, AND ARMOR CHECKS              #####
#####                                                        #####
##################################################################


    CLASS:
        match THIEF Guild: Thief
        match EMPATH Guild: Empath
        match NONTHIEF Encumbrance
        match CLASS ...wait
        put info
        GOTO UniversalMatch

    THIEF:
        setVariable class thief
        setVariable BinOrBucket bin
        GOTO HANDCHECK

    NONTHIEF:
        setVariable class nonthief
        GOTO HANDCHECK

    EMPATH:
        setVariable class empath
        GOTO HANDCHECK

    HANDCHECK:
        match STOWHANDS You glance down to see
        match ARMORCHECK You glance down at your empty
        put glance
        GOTO UniversalMatch

    STOWHANDS:
        put stow left
        wait
        put stow right
        wait
        match HANDWARN You glance down to see
        match ARMORCHECK You glance down at your empty
        put glance
        GOTO UniversalMatch

    HANDWARN:
        ECHO ***********************************************
        ECHO *** WARNING: You are holding something that
        ECHO *** can't be stowed. Fix and type "CONT".
        ECHO ***********************************************
        match ARMORCHECK CONT
        GOTO UniversalMatch

    ARMORCHECK:
        match ARMORWARN All of your armor
        match SKILLCHECK You aren't wearing
        put inv armor
        GOTO UniversalMatch

    ARMORWARN:
        ECHO ***********************************************
        ECHO *** WARNING: You are wearing armor. Fix and type "CONT".
        ECHO ***********************************************
        match ARMORCHECK CONT
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####            SKILL AND ITEM-BASED BAG CHECKS             #####
#####                                                        #####
##################################################################
# First, SKILLCHECK checks your stealing skill and assigns you to a
# bracket based on your stealing ranks, currently as RANK1-RANK8.
# The counter is set to this number (1-8) and then RANKADJUSTER
# modifies it with %Difficulty, which if applicable is set by EASY
# or HARD to add or subtract 1 or 2 from the initial rank bracket.

# Once the adjusted rank is determined, it then routes to each
# province's item lists, so that these can be retrieved and checked
# against the contents of the user's containers to ensure nothing
# will be mistakenly pawned. The BAGCHECK labels are in each province
# section, since they are province-based, but the BAGWARN labels
# are universal and so kept here. 

    SKILLCHECK:
        matchre BEGGAR /g:      |g:     1/
        matchre RANK1 /g:     [2-3][0-9] /
        matchre RANK2 /g:     [4-5]/
        matchre RANK3 /g:     [6-9]/
        matchre RANK4 /g:    1[0-4]/
        matchre RANK5 /g:    1[5-9]/
        matchre RANK6 /g:    2[0-4]/
        matchre RANK7 /g:    2[5-9]/
        matchre RANK8 /g:    3[0-4]/
        matchre RANK9 /g:    3[5-9]/
        matchre RANK10 /g:    [4-9]|g:   [1-9]/
        counter set 0
        put skill steal
        GOTO UniversalMatch

    RANK10:
        counter add 1
    RANK9:
        counter add 1
    RANK8:
        counter add 1
    RANK7:
        counter add 1
    RANK6:
        counter add 1
    RANK5:
        counter add 1
    RANK4:
        counter add 1
    RANK3:
        counter add 1
    RANK2:
        counter add 1
    RANK1:
        counter add 1
        GOTO RANKADJUSTER

    RANKADJUSTER:
        pause 1
        counter add %Difficulty%
        GOTO %provcode%.RANK.%c%

    RANKREPORT:
        ECHO
        ECHO
        ECHO ***********************************************
        ECHO ***                  %skillrange%: Altering course...
        ECHO ***********************************************
        ECHO
        pause 2
        counter set 0
        GOTO BAGS.%DropOrStow%

    BAGS.STOW:
        matchre COUNTTOOHIGH /Sell[0-9][0-9][0-9]|Bin[0-9][0-9][0-9]|Bin[5-9][0-9]/
        put echo Sell%SellItemCount% Bin%BinItemCount%
    BAGS.STOW.1:
        counter add 1
        setVariable container %percentsign%container%c%
        match BAGFULL lot of other stuff
        matchre BAGWARN /%SellItem1%|%SellItem2%|%SellItem3%|%SellItem4%|%SellItem5%|%SellItem16%|%SellItem7%|%SellItem8%/
        matchre BAGWARN /%SellItem9%|%SellItem10%|%SellItem11%|%SellItem12%|%SellItem13%|%SellItem14%|%SellItem15%|%SellItem16%/
        matchre BAGWARN /%SellItem17%|%SellItem18%|%SellItem19%|%SellItem20%|%SellItem21%|%SellItem22%|%SellItem23%/
        matchre BAGWARN /%SellItem24%|%SellItem25%|%SellItem26%|%SellItem27%|%SellItem28%|%SellItem29%|%SellItem30%/
        matchre BAGWARN /%SellItem31%|%SellItem32%|%SellItem33%|%SellItem34%|%SellItem35%|%SellItem36%|%SellItem37%/
        matchre BAGWARN /%SellItem38%|%SellItem39%|%SellItem40%|%SellItem41%|%SellItem42%|%SellItem43%|%SellItem44%/
        matchre BAGWARN /%SellItem45%|%SellItem46%|%SellItem47%|%SellItem48%|%SellItem49%|%SellItem50%|%SellItem51%/
        matchre BAGWARN /%SellItem52%|%SellItem53%|%SellItem54%|%SellItem55%|%SellItem56%|%SellItem57%|%SellItem58%/
        matchre BAGWARN /%SellItem59%|%SellItem60%|%SellItem61%|%SellItem62%|%SellItem63%|%SellItem64%|%SellItem65%/
        matchre BAGWARN /%SellItem66%|%SellItem67%|%SellItem68%|%SellItem69%|%SellItem70%|%SellItem71%|%SellItem72%/
        matchre BAGWARN /%SellItem73%|%SellItem74%|%SellItem75%|%SellItem76%|%SellItem77%|%SellItem78%|%SellItem79%/
        matchre BAGWARN /%SellItem80%|%SellItem81%|%SellItem82%|%SellItem83%|%SellItem84%|%SellItem85%|%SellItem86%/
        matchre BAGWARN /%SellItem87%|%SellItem88%|%SellItem89%|%SellItem90%|%SellItem91%|%SellItem92%|%SellItem93%/
        matchre BAGWARN /%SellItem94%|%SellItem95%|%SellItem96%|%SellItem97%|%SellItem98%|%SellItem99%/
        matchre BAGWARN /%BinItem1%|%BinItem2%|%BinItem3%|%BinItem4%|%BinItem5%|%BinItem16%|%BinItem7%/
        matchre BAGWARN /%BinItem8%|%BinItem9%|%BinItem10%|%BinItem11%|%BinItem12%|%BinItem13%|%BinItem14%/
        matchre BAGWARN /%BinItem15%|%BinItem16%|%BinItem17%|%BinItem18%|%BinItem19%|%BinItem20%|%BinItem21%/
        matchre BAGWARN /%BinItem22%|%BinItem23%|%BinItem24%|%BinItem25%|%BinItem26%|%BinItem27%|%BinItem28%/
        matchre BAGWARN /%BinItem29%|%BinItem30%|%BinItem31%|%BinItem32%|%BinItem33%|%BinItem34%|%BinItem35%/
        matchre BAGWARN /%BinItem36%|%BinItem37%|%BinItem38%|%BinItem39%|%BinItem40%|%BinItem41%|%BinItem42%/
        matchre BAGWARN /%BinItem43%|%BinItem44%|%BinItem45%|%BinItem46%|%BinItem47%|%BinItem48%|%BinItem49%/
        GOTO %provcode%.BAGCHECK

    BAGS.STOW.2:
        setVariable container %container1%
        GOTO SNEAK.%sneak%

    BAGS.DROP:
        GOTO SNEAK.%sneak%

    BEGGAR:
        pause 1
        ECHO ***********************************************
        ECHO *** You aren't worthy yet. Hit the beggar or steal
        ECHO *** some water until you have at least 20 ranks.
        ECHO ***********************************************
        GOTO END

    BEGGAR.MOD:
        pause 1
        ECHO ***********************************************
        ECHO *** Sorry, but using the EASY command to modify your rank
        ECHO *** bracket below the 20-39 bracket is not possible.
        ECHO ***********************************************
        GOTO END

    BAGWARN:
        ECHO ***********************************************
        ECHO *** WARNING: Your %container% appears to contain items
        ECHO *** that will be pawned or binned.  This MAY include items
        ECHO *** saved from previous runs that did not reach the pawn
        ECHO *** shop or thief bin. If you are SURE nothing important to 
        ECHO *** you is in danger by being in this container, type YES.
        ECHO ***
        ECHO *** Note: This can also be a false alarm if your bag contains
        ECHO *** a partial match, like a "pine strongbox" for a "pin,"
        ECHO *** but we are trying to be extra careful with your items.
        ECHO ***********************************************
        match BAGS.STOW.%c% good positive attitude
        GOTO UniversalMatch

    BAGFULL:
        ECHO ***********************************************
        ECHO *** Your bags are too full for the script to check them
        ECHO *** to ensure nothing will be mistakenly pawned. Please
        ECHO *** clean them out if you want to use the stow option.
        ECHO ***********************************************
        GOTO END

    COUNTTOOHIGH:
        setVariable BinItemCount 0
        setVariable SellItemCount 0
        ECHO ***********************************************
        ECHO *** Due to lack of pawning/binning, the script has accumulated
        ECHO *** too many item variables for it to match against the contents
        ECHO *** of your containers. Your counters have been reset to 0 and you
        ECHO *** will need to manually get rid of any items left over from
        ECHO *** previous stealing runs. Continuing in 5 seconds.
        ECHO ***********************************************
        pause 5
        GOTO BAGS.STOW


##################################################################
#####                                                        #####
#####             KHRI CHECK AND SNEAK SETTINGS              #####
#####                                                        #####
##################################################################


    SNEAK.SNEAK:
    SNEAK.YES:
        setVariable sneak sneak
        GOTO KHRICHECK.%class%

    SNEAK.NOSNEAK:
    SNEAK.NO:
        setVariable sneak nosneak
        GOTO KHRICHECK.%class%

    KHRICHECK.NONTHIEF:
    KHRICHECK.EMPATH:
        GOTO %citycode%

    KHRICHECK.THIEF:
        wait
        match KHRISTART you are not
        match KHRISTOP you are under
        match %citycode% Please rephrase
        put khri check
        GOTO UniversalMatch

    KHRISTOP:
        put khri stop
        wait
        counter set 0
        matchre KHRISTART /n: +[2-9][0-9][0-9] /
        matchre KHRISTART /n: +[1][2-9][0-9] /
        matchre KHRI100 /n: +[1][0-1][0-9] /
        matchre KHRI80 /n: +[8-9][0-9] /
        matchre KHRI60 /n: +[6-7][0-9] /
        matchre KHRI40 /n: +[4-5][0-9] /
        matchre KHRI20 /n: +[1-3][0-9] /
        matchre KHRI0 /n: +[0-9] /
        put focus
        GOTO UniversalMatch

    KHRI0:
        counter add 30
    KHRI20:
        counter add 30
    KHRI40:
        counter add 30
    KHRI60:
        counter add 30
    KHRI80:
        counter add 30
    KHRI100:
        counter add 30
        ECHO ***********************************************
        ECHO *** Pausing %c% seconds for concentration
        ECHO ***********************************************
        pause %c%
        GOTO KHRISTART

    KHRISTART:
        put khri start %skulk%
        wait
        put khri start focus
        wait
        put khri start plunder
        wait
        put khri start hasten
        wait
        put khri start guile
        wait
        put khri start darken
        wait
        put khri start calm
        wait
        put khri start dampen
        wait
        GOTO SLIPCHECK.%sneak%

    SLIPCHECK.SNEAK:
        pause 1
        match SLIP2 SNEAK
        match %citycode% noslip
        put slip help
        put echo noslip
        GOTO UniversalMatch

    SLIPCHECK.NOSNEAK:
        GOTO %citycode%

    SLIP2:
        setVariable sneak sneak
        GOTO %citycode%


##################################################################
#####                                                        #####
#####            PRIMARY SHOP STEALING ENGINE                #####
#####                                                        #####
##################################################################


    SETSTORE:
        setVariable shopdiff %percentsign%%storecode%Quant
        match FIXSTART waitandsee
        match SETSTORE.%Profit% okstart
        put echo %startlocation% okstart
        GOTO UniversalMatch

    SETSTORE.PROFIT:
        setVariable item %percentsign%%storecode%P
        deleteVariable %storecode%P
        match SETSTORE.NORMAL %storecode%P
        match %MRS% nonprofit
        put echo %item% nonprofit
        GOTO UniversalMatch

    SETSTORE.NORMAL:
        setVariable item %percentsign%%storecode%
        GOTO %MRS%

# Outside every shop, we run %MRS, which is set to SHOPCHECK
# unless we are under MOVEON or RESUME circumstances. SHOPCHECK
# checks to see if there is a reason to activate MOVEON,
# prioritizing health (having your hand chopped off by clan justice)
# followed by exp (being mind locked). The echo checks for two
# other conditions: 1) if we match the shop that we started in and 
# therefore want to move on, or 2) if we are set to steal "nothing"
# from the shop and should skip it.

    SHOPCHECK1:
        setvariable MRS shopcheck
        GOTO SHOPCHECK2

    SHOPCHECK:
        GOTO SHOP.%TravelOrShop%
      SHOP.TRAVEL:
        setVariable TravelOrShop shop
      SHOP.SHOP:
        match MOVEON.STARTLOC %startlocation%
    SHOPCHECK2:
        match MOVEON.HEALTH hand which appears completely useless
        match LEAVE nothing
        match GOODSHOP.%DropOrStow% Time Development
        match MOVEON.EXP mind lock
        put health
        put echo %storecode% %item% %update%
        put skill steal
        GOTO UniversalMatch

# Before entering the shop, here we set the counter which we will
# use with the STEALCOUNT labels to see how many times the person
# should steal and has stolen in each shop. %Quantity% adds or
# subtracts if applicable based on the use of MORE or LESS.
# Here, it will be further modified by %shopdiff as set by each
# shop's quantity adjustment. The result is multiplied by 100, and
# then each time you steal, 1 is added to this number, and this
# allows us to make STEALCOUNT labels which account for both the
# number of times you SHOULD steal, and the number you actually
# have stolen per shop. 

    GOODSHOP.STOW:
        counter set %SellItemCount%
        counter add 1
        setVariable SellItemCount %c
        setVariable SellItem%c% %item%
    GOODSHOP.DROP:
        counter set %Quantity%
        counter add %shopdiff%
        counter multiply 100
        setVariable StealCount %c%
        GOTO ENTER.%sneak%

    ENTER.SNEAK:
        pause 1
        matchre ENTER.SNEAK /...wait|had time to find another/
        matchre ENTER.SLIP /You melt|You slip|You blend|But you/
        matchre ENTER.NOSNEAK /ruining your|Behind what/
        match HUMSTOP too busy performing
        put hide
        GOTO UniversalMatch

    ENTER.SLIP:
        pause 1
        match ENTER.SLIP ...wait
        match ENTER.SNEAK Sneaking is an
        match ENTER.NOSNEAK You can't sneak
        matchre ACTION.%action% /You sneak|In which direction/
        put sneak %entrance%
        GOTO UniversalMatch

    ENTER.NOSNEAK:
        pause 1
        matchre MOVEERROR /You can't go there|referring/
        match HIDE Obvious
        put go %entrance%
        GOTO UniversalMatch

    HIDE:
        pause 1
        matchre HIDE /...wait|had time to find another/
        matchre ACTION.%action% /ruining your|Behind what|You melt|You slip|You blend|But you|You look around/
        put hide
        GOTO UniversalMatch

    ACTION.STEAL:
        pause 1
        counter set 0
        setVariable StowStatus 1
        setVariable StealOrNext next
        match ACTION.STEAL ...wait
        match ENTER.NOSNEAK nailed to the ground
        matchre %DropOrStow%.ITEM /Guards!|begins to shout|trivial|should back off/
        matchre NEXT /You haven't picked|You can't steal/
        match HANDSFULL You need at least one
        match STEALCOUNT Roundtime
        put steal %item% %itemlocation%
        GOTO UniversalMatch

    STEALCOUNT:
        counter set %StealCount%
        counter add 1
        setVariable StealCount %c%
        GOTO STEALCOUNT%c%

# Has completed 1st/3rd/5th steal, is about to attempt again before double stow
    STEALCOUNT201:
    STEALCOUNT301:
    STEALCOUNT401:
    STEALCOUNT501:
    STEALCOUNT601:
    STEALCOUNT403:
    STEALCOUNT503:
    STEALCOUNT603:
    STEALCOUNT605:
        GOTO ACTION.STEAL

# Has completed 2nd or 4th steal and is about to attempt again after double stow
    STEALCOUNT302:
    STEALCOUNT402:
    STEALCOUNT502:
    STEALCOUNT602:
    STEALCOUNT504:
    STEALCOUNT604:
        counter set 2
        setVariable StowStatus 2
        setVariable StealOrNext rehide
        GOTO %DropOrStow%.ITEM

# Has completed 1st/3rd/5th steal, is finished, and is about to stow the odd item
    STEALCOUNT-599:
    STEALCOUNT-499:
    STEALCOUNT-399:
    STEALCOUNT-299:
    STEALCOUNT-199:
    STEALCOUNT-99:
    STEALCOUNT1:
    STEALCOUNT101:
    STEALCOUNT303:
    STEALCOUNT505:
        counter set 1
        setVariable StowStatus 1
        GOTO %DropOrStow%.ITEM

# Has completed 2nd/4th/6th steal, is finished, and is about to double stow
    STEALCOUNT202:
    STEALCOUNT404:
    STEALCOUNT606:
        counter set 2
        setVariable StowStatus 2
        setVariable StealOrNext next
        GOTO %DropOrStow%.ITEM

    STEALCOUNT1301:
        counter subtract 100
    STEALCOUNT1201:
        counter subtract 100
    STEALCOUNT1101:
        counter subtract 100
    STEALCOUNT1001:
        counter subtract 100
    STEALCOUNT901:
        counter subtract 100
    STEALCOUNT801:
        counter subtract 100
    STEALCOUNT701:
        counter subtract 100
        GOTO STEALCOUNT%c%

    STOW.REPEAT:
        counter add 1
    STOW.ITEM:
    STOW.2:
    STOW.1:
        pause 1
        counter subtract 1
        matchre STOW.REPEAT /...wait|You silently slip out/
        matchre STOW.%c% /You put|Perhaps you should|into your/
        match SLIPTOPUT Slipping and falling 
        matchre CONTAINER.SWAP /any more room|no matter how you|to fit in the/
        matchre DROP.ITEM /referring|Slip how|capable|You need a/
        put %PutOrSlip% my %item% in my %container%
        GOTO UniversalMatch
    STOW.0:
    STOW.-1:
        GOTO %StealOrNext%

    CONTAINER.SWAP:
        GOTO CONTAINER.%swap%
    CONTAINER.1:
        setVariable swap 2
        setVariable container %container2%
        counter set %StowStatus%
        GOTO STOW.ITEM
    CONTAINER.2:
        setVariable swap 1
        setVariable container %container1%
    CONTAINER.3:
        GOTO DROP.ITEM

    DROP.ITEM:
        match DROP.ITEM ...wait
        match %StealOrNext% empty hands
        match EMPTYRIGHT right hand and nothing
        matchre EMPTYBOTH /right hand and a|right hand and some/
        match EMPTYLEFT in your left hand.
        put glance
        GOTO UniversalMatch

    EMPTYBOTH:
        match LOWER If you still wish
        match EMPTYRIGHT You drop
        put empty left
        GOTO UniversalMatch

    EMPTYRIGHT:
        match LOWER If you still wish
        match %StealOrNext% You drop
        put empty right
        GOTO UniversalMatch

    EMPTYLEFT:
        match LOWER If you still wish
        match %StealOrNext% You drop
        put empty left
        GOTO UniversalMatch

    HANDSFULL:
        setVariable StealOrNext action.steal
        counter add 1
        GOTO %DropOrStow%.ITEM

    LOWER:
        put lower my %item%
        wait
        GOTO DROP.ITEM

    SLIPTOPUT:
        setVariable PutOrSlip put
        GOTO STOW.REPEAT

    REHIDE:
        pause 1
        matchre REHIDE /...wait|had time to find another/
        matchre JAILCHECK.REHIDE /Maybe you should|You look around/
        matchre ACTION.STEAL /You melt|You slip|You blend|But you|ruining your/
        put hide
        GOTO UniversalMatch

    NEXT:
        GOTO NEXT.%sneak%

    NEXT.SNEAK:
        pause 1
        matchre NEXT.SNEAK /...wait|had time to find another/
        matchre NEXT.SLIP /You melt|You slip|You blend|But you/
        matchre JAILCHECK.NEXT /Maybe you should|You look around/
        match RUNTONEXT ruining your
        put hide
        GOTO UniversalMatch

    NEXT.SLIP:
        pause 1
        match NEXT.SLIP ...wait
        match NEXT.SNEAK Sneaking is an
        matchre JAILCHECK.NEXT /Maybe you should|You look around/
        matchre ALTLEAVE /You can't sneak|Sneaking isn't allowed|In which direction/
        match LEAVE Obvious
        put sneak out
        GOTO UniversalMatch

    NEXT.NOSNEAK:
        GOTO RUNTONEXT

    LEAVE:
    LEAVE.MOVEON:
    LEAVE.SHOPCHECK:
    LEAVE.SHOPCHECK1:
        setVariable itemlocation  
        GOTO LEAVE.%storecode%

    ALTLEAVE:
        setVariable itemlocation  
        GOTO ALTLEAVE.%storecode%


##################################################################
#####                                                        #####
#####              OPTIONAL ACTIONS PER SHOP                 #####
#####                                                        #####
##################################################################


    ACTION.PAUSE:
        ECHO
        ECHO ***********************************************
        ECHO *** Script pausing before stealing. When you are ready, type YES.
        ECHO ***********************************************
        ECHO
        waitfor good positive attitude
        GOTO ACTION.STEAL

    ACTION.MARK:
        pause 1
        match ACTION.MARK ...wait
        matchre NEXT.%sneak% /Mark what|you are being watched|reason to call the guards|beyond foolish|pretty sure you'll be caught|likely be futile|gavel echoes through|taste of bitter failure|a long shot|chances to lift it|quite the struggle|looks your way suspiciously|Guards!/
        matchre ACTION.STEAL /Roundtime|You trace|You can not|to take unwanted notice of you/
        put mark %item% %itemlocation%
        GOTO UniversalMatch

    PREPERC:
        pause 2
    ACTION.PERC:
        pause 1
        match ACTION.PERC ...wait
        match PREPERC You're not ready to
        matchre NOPERC /You aren't trained|USAGE/
        matchre ACTION.STEAL /You close your eyes|interfering|stops you from being able/
        put perc health
        GOTO UniversalMatch
    NOPERC:
        ECHO ***********************************************
        ECHO ***       Not able to perceive health.
        ECHO ***     Trying power perception instead.
        ECHO ***********************************************
        pause 1
        setVariable action power
        GOTO ACTION.POWER

    ACTION.POWER:
        pause 1
        match ACTION.POWER ...wait
        matchre MMPOWER.SET /Xibar|Yavash|Katamba/
        matchre NOPOWER /You aren't trained|USAGE/
        matchre ACTION.STEAL /Roundtime|stops you from being able/i
        put power
        GOTO UniversalMatch
    NOPOWER:
        ECHO ***********************************************
        ECHO ***    Non-magic user set to perceive power.
        ECHO ***       De-activating power perception.
        ECHO ***********************************************
        pause 1
        setVariable action steal
        GOTO ACTION.STEAL

    MMPOWER.SET:
        ECHO ***********************************************
        ECHO ***     Moon mage detected. Switching to
        ECHO ***        moon mage power perception.
        ECHO ***********************************************
        pause 1
        setVariable action mmpower
        setVariable mmanalyze predict analyze
        setVariable mmpower %mmanalyze%
        setVariable mmrotate 0
        GOTO ACTION.STEAL

    ACTION.MMPOWER:
        pause 1
        match ACTION.MMPOWER ...wait
        match MMANALYZEOFF but you detect no active predictions.
        match MMUNHIDE You will have to reveal yourself
        match MMROTATE Roundtime
        put %mmpower%
        GOTO UniversalMatch

    MMROTATE:
        setVariable counthold %c%
        counter set %mmrotate%
        counter add 1
        setVariable mmrotate %c%
        counter set %counthold%
        GOTO MM%mmrotate%

    MMUNHIDE:
        put unhide
        GOTO ACTION.MMPOWER
    MMHIDE:
        matchre MMHIDE /...wait|had time to find another/
        matchre ACTION.STEAL /ruining your|Behind what|You melt|You slip|You blend|But you|You look around/
        put hide
        GOTO UniversalMatch

    MMANALYZEOFF:
        setVariable mmanalyze perc planet
        setVariable mmpower %mmanalyze%
        GOTO ACTION.MMPOWER

    MM1:
        setVariable mmpower perc moonlight
        GOTO MMHIDE
    MM2:
        setVariable mmpower perc psychic
        GOTO ACTION.MMPOWER
    MM3:
        setVariable mmpower perc perception
        GOTO ACTION.MMPOWER
    MM4:
        setVariable mmpower perc transduction
        GOTO ACTION.MMPOWER
    MM5:
        setVariable mmpower perc stellar
        GOTO ACTION.MMPOWER
    MM6:
        setVariable mmpower perc xibar
        GOTO ACTION.STEAL
    MM7:
        setVariable mmpower perc yavash
        GOTO ACTION.MMPOWER
    MM8:
        setVariable mmpower perc katamba
        GOTO ACTION.MMPOWER
    MM9:
        setVariable mmpower %mmanalyze%
        setVariable mmrotate 0
        GOTO ACTION.STEAL


##################################################################
#####                                                        #####
#####                 MOBILE NPC STEALING                    #####
#####                                                        #####
##################################################################
# Adding more NPCs is easy! Just add a label here and a match for
# them in the TRAVEL label.


    CROSS.BEGGAR:
        setVariable npcname beggar
        GOTO NPC.%npcoption%
    CROSS.MINSTREL:
        setVariable npcname minstrel
        GOTO NPC.%npcoption%
    CROSS.VETERAN:
        setVariable npcname veteran
        GOTO NPC.%npcoption%
    RATHA.SAILOR:
        setVariable npcname sailor
        GOTO NPC.%npcoption%

    NPC.NO:
        GOTO %citycode%.%c%

    NPC.YES:
    NPC.1:
        matchre NPC.1 /...wait|had time to find another/
        match NPC.2 Roundtime
        match %citycode%.%c% You look around
        put hide
        GOTO UniversalMatch

    NPC.2:
        match NPC.2 ...wait
        match %citycode%.%c% Roundtime
        match NPC.STAND you go sprawling
        matchre %citycode%.%c% /You can't steal|alas, it is empty|You haven't picked|begins to shout/
        put steal %npcname%
        GOTO UniversalMatch

    NPC.STAND:
        match %citycode%.%c% You stand
        matchre NPC.STAND /...wait|type ahead|Roundtime/i
        put kneel
        put stand
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####           CENTRALIZED CONTROL FUNCTIONS                #####
#####                                                        #####
##################################################################


    START:
        setVariable startlocation %storecode%
        GOTO %citycode%.%c%

    FIXSTART:
        setVariable startlocation %storecode%
        GOTO SETSTORE

    HUMSTOP:
        put stop hum
        GOTO HIDE

    JAILCHECK.ACTION:
        matchre JAILWAIT /jail|heavily barred door|Holding Cell|Guardhouse|Great Tower, Cell|Gallows Tree, Cell/i
        matchre ENTER.NOSNEAK /It appears to be the local tobacco shop|a Halfling-sized burrow/
        matchre PREPLEA /Justice/
        match ACTION.%action% Obvious
        put look
        GOTO UniversalMatch

    JAILCHECK.REHIDE:
        matchre JAILWAIT /jail|heavily barred door|Holding Cell|Guardhouse|Great Tower, Cell|Gallows Tree, Cell/i
        matchre PREPLEA /Justice/
        match ACTION.STEAL Obvious
        put look
        GOTO UniversalMatch

    JAILCHECK.NEXT:
        matchre JAILWAIT /jail|heavily barred door|Holding Cell|Guardhouse|Great Tower, Cell|Gallows Tree, Cell/i
        matchre ALTLEAVE.%storecode% /Shaefferty|Chabalu|Froissart|Windawn|Marachek|Beeanna|Feta|Yulugri|Sklaar'ishht|Woodbyne|Enescu/
        matchre PREPLEA /Justice/
        match NEXT.%sneak% Obvious
        put look
        GOTO UniversalMatch

    JAILWAIT:
        setVariable ResumeStore %storecode%
        setVariable MRS resume
        setVariable CountdownType resume
        GOTO UniversalMatch

    PREPLEA:
        setVariable ResumeStore %storecode%
        setVariable MRS resume
        setVariable CountdownType resume
    PLEA:
        setVariable arrest true
        match %citycode%.FREE You plead for forgiveness!
        match %citycode%.DEBT you do not have
        matchre %citycode%.FREE /You are free to go|Your things are dumped on the ground/
        put plead innocent
        GOTO UniversalMatch

# The TRAVEL label is run almost every time you move. It adds 1
# to the counter, and if you successfully move and no other
# factors interfere, you will match "Obvious" paths and go to the
# next travel label based on the count and your current city. If
# you fail to move, this will match for various reasons why (being
# stunned, engaged in combat, stuck in RT, or being in the wrong
# location) and respond to those issues, then go to BACKTRACK to
# subtract 1 from the counter and retry the previous movement. In
# addition, if you move successfully, this will also match for any
# stealable NPCs that appear before "Obvious" exits and cause you
# to stop and steal from them before moving on. 

    TRAVEL:
        GOTO TRAVEL.%TravelOrShop%
    TRAVEL.SHOP:
        setVariable TravelOrShop travel
    TRAVEL.TRAVEL:
        counter add 1
        match MOVEERROR You can't go there.
        match BACKTRACK ...wait
        match GUARDSTOP Although tempted to move
        match CROSS.BEGGAR an old blind beggar
        match CROSS.MINSTREL a wandering minstrel
        match CROSS.VETERAN a grizzled old war veteran
        match RATHA.SAILOR an old sailor
        match RATHA.SAILOR a peg-legged sailor
        matchre %citycode%.%c% /Obvious|It's pitch dark/
        GOTO UniversalMatch

    FATIGUE:
        ECHO ***********************************************
        ECHO *** Pausing 10 seconds for fatigue to recover
        ECHO ***********************************************
        pause 10
        GOTO FATIGUE.%TravelOrShop%
    FATIGUE.TRAVEL:
        GOTO BACKTRACK
    FATIGUE.SHOP:
        GOTO %MRS%

    GUARDSTOP:
        put guard stop
        GOTO BACKTRACK

    BACKTRACK:
        counter subtract 1
        pause 1
        GOTO %citycode%.%c%

    RETREAT.TRAVEL:
        matchre RETREAT.TRAVEL /...wait|You retreat back to pole|type ahead|Roundtime/i
        match BACKTRACK You retreat from combat
        match %citycode%.%c% already as far away
        put retreat
        GOTO UniversalMatch

    RETREAT.SHOP:
        matchre RETREAT.SHOP /...wait|You retreat back to pole|type ahead|Roundtime/i
        matchre RUNTONEXT /You retreat from combat|already as far away/
        put retreat
        GOTO UniversalMatch

    RUNTONEXT:
        put out
        match RUNTONEXT ...wait
        matchre RETREAT.SHOP /pole weapon range|melee range/
        match LEAVE Obvious
        match ALTLEAVE.%storecode% You can't go there.
        GOTO UniversalMatch

    HEALTHCHECK:
        match CLANCHOP hand which appears completely useless
        match EMERGENCY.FLEE.%flee% You glance
        match EMERGENCY.FLEE.%flee% still stunned
        put health
        put glance
        GOTO UniversalMatch

    CLANCHOP:
        setVariable MRS moveon
        setVariable LorM moveon
        setVariable MoveOnReason HEALTH
        setVariable npcoption no
        pause 10
        GOTO STAND

    STAND:
        match STAND roundtime
        match HEALTHCHECK You are still stunned
        matchre STAND.%TravelOrShop% /You stand|You are already standing/
        put stand
        GOTO UniversalMatch

    STAND.TRAVEL:
        setVariable ResumeStore %storecode%
        GOTO BACKTRACK

    STAND.SHOP:
        setVariable ResumeStore %storecode%
        GOTO %DropOrStow%.ITEM

    SHORTSTAND:
        counter subtract 1
        match STAND roundtime
        matchre %storecode%.SHORT /You stand|You are already standing/
        put stand
        GOTO UniversalMatch

# Every match in the script is routed through this variable which
# contains the one and only matchwait. This allows us to add
# matches to continuously check for being dead, arrested, or for
# trying to go into a shop that is closed which can happen in
# several different circumstances.

    UNIVERSALMATCH:
        match HEALTHCHECK You are still stunned
        match HEALTHCHECK do that while kneeling
        matchre RETREAT.%TravelOrShop% /pole weapon range|melee range|you are engaged/
        match FATIGUE too tired to
        matchre LEAVE.%MRS% /You stop as you realize|is locked|You realize the shop is closed|You smash your nose/
        matchre EMERGENCY.FLEE.%flee% /You are a ghost/
        matchre JAILCHECK.ACTION /Maybe you should|You look around|Stop right there|do that while lying|You can't do that/
        matchre PREPLEA /You don't seem to be able to move/
        match PLEA PLEAD INNOCENT or PLEAD GUILTY
        matchwait

    MOVEERROR:
        matchre JAILWAIT /jail|heavily barred door|Holding Cell|Guardhouse|Great Tower, Cell|Gallows Tree, Cell/i
        matchre HIDE /Thipbeet|Skrawt Stal|Shaefferty|Chabalu|Froissart|Marachek|vendor's cart with a vial/
        matchre HIDE /Feta|Yulugri Wala, Smok|Sklaar'ishht|Woodbyne|Enescu|Posimur|Bandicoot|Yithye|Kilam|Beeanna/
        match MOVEERROR2 Obvious
        put look
        GOTO UniversalMatch

    MOVEERROR2:
        counter subtract 1
        ECHO
        ECHO *************************************************
        ECHO *** You don’t seem to be where you are supposed to be. You were at
        ECHO *** %citycode%.%c%, version %update%. Please note this and submit
        ECHO ***       a brief log of how you got here for debugging.
        ECHO *************************************************
        ECHO
        GOTO END

    EMERGENCY.FLEE.YES:
        put quit
    EMERGENCY.FLEE.NO:
        ECHO
        ECHO
        ECHO
        ECHO ***********************************************
        ECHO ***
        ECHO ***         Something has gone terribly wrong!
        ECHO ***
        ECHO ***********************************************
        ECHO
        ECHO
        ECHO
        GOTO END

    COUNTDOWN:
    50:
    49:
    48:
    47:
    46:
    45:
    44:
    43:
    42:
    41:
    40:
    39:
    38:
    37:
    36:
    35:
    34:
    33:
    32:
    31:
    30:
    29:
    28:
    27:
    26:
    25:
    24:
    23:
    22:
    21:
    20:
    19:
    18:
    17:
    16:
    15:
    14:
    13:
    12:
    11:
    10:
    9:
    8:
    7:
    6:
    5:
    4:
    3:
    2:
    1:
        GOTO COUNTDOWN.%CountdownType%.CONTINUE

    0:
        GOTO COUNTDOWN.%CountdownType%.DONE

    -1:
    -2:
    -3:
    -4:
    -5:
    -6:
    -7:
    -8:
    -9:
    -10:
        match BINCOUNTFIX BinItemCount-
        match SELLCOUNTFIX SellItemCount-
        put echo SellItemCount%SellItemCount% BinItemCount%BinItemCount%
        GOTO UniversalMatch

    BINCOUNTFIX:
        setVariable BinItemCount 0
        GOTO COUNTDOWN.%CountdownType%.DONE

    SELLCOUNTFIX:
        setVariable SellItemCount 0
        GOTO COUNTDOWN.%CountdownType%.DONE

##################################################################
#####                                                        #####
#####             RESUME AND MOVEON FUNCTIONS                #####
#####                                                        #####
##################################################################
# If we have been arrested or had a hand chopped off and need to
# go back to the store we left off at, %MRS will be set to RESUME
# and use the counter to count down as we make our way through the
# loop back to where we left off. Each province has a resume list
# which increments a counter based on which shop we were at. Here,
# we retrieve the Countdown variable, subtract 1, and either keep
# going or, if we reach 1 or 0, different things happen. At 1, we
# actually reach the store we last stole from, which we don't want
# to visit again, so we continue to move on but we reinstate the
# startlocation, so that if the next shop is the one we started at,
# we will MOVEON fully. At 0, we have reached the shop after the
# one where we had the problem, and are ready to revert to MRS as
# SHOPCHECK. 

    RESUME:
    LEAVE.RESUME:
        counter set %Countdown%
        counter subtract 1
        setVariable Countdown %c%
        GOTO %Countdown%

    COUNTDOWN.RESUME.CONTINUE:
        GOTO LEAVE

    COUNTDOWN.RESUME.DONE:
        setVariable MRS shopcheck
        setVariable LorM leave
        setVariable npcoption yes
        GOTO %MRS%

    MOVEON.STARTLOC:
        setVariable MoveOnReason LOC
        ECHO *************************************************
        ECHO *** Activated MOVEON.%storecode% based on startlocation:
        ECHO *** %startlocation%
        ECHO *************************************************
        GOTO MOVEON.SET

    MOVEON.EXP:
        setVariable MoveOnReason EXP
        setVariable npcoption no
        ECHO *************************************************
        ECHO *** Activated MOVEON.%storecode% due to mind lock
        ECHO *************************************************
        GOTO MOVEON.SET

    MOVEON.HEALTH:
        setVariable MoveOnReason HEALTH
        setVariable ResumeStore %storecode%
        setVariable npcoption no
        ECHO *************************************************
        ECHO *** Activated MOVEON.%storecode% based on health
        ECHO *************************************************
        GOTO MOVEON.SET

# If MOVEON is activated, here is where we set the variables. MRS
# will be used outside every shop to determine whether to run
# SHOPCHECK, to go to RESUME and keep counting down, or to MOVEON
# and simply leave each shop because there is an issue we need to
# deal with (loop completed, experience full, or hand chopped
# off). LorM, set to either LEAVE or MOVEON, is used only at
# specific spots where we want to branch out of the loop. 

    MOVEON.SET:
        setVariable MRS moveon
        setVariable LorM moveon
    MOVEON:
        GOTO LEAVE


##################################################################
#####                                                        #####
#####                   PAWNING SYSTEM                       #####
#####                                                        #####
##################################################################


    PAWN:
        setVariable labelerr realerror
        GOTO PAWN.STOW

    PAWN.DROP:
        GOTO END

    PAWN.STOW:
        setVariable CountdownType pawn
        setVariable sellorbin sellget
        GOTO COUNTDOWN.PAWN.CONTINUE

    COUNTDOWN.PAWN.CONTINUE:
        setVariable sellitem %percentsign%SellItem%SellItemCount%
        GOTO %sellorbin%
    COUNTDOWN.PAWN.DONE:
        GOTO %citycode%.PAWNFINISH.%class

    SELLGET:
        match SELLGET ...wait
        match SELLING You get
        matchre SELLGET2 /referring|Please rephrase/
        put get my %sellitem% from my %container1%
        GOTO UniversalMatch

    SELLGET2:
        match SELLGET2 ...wait
        match SELLING2 You get
        matchre SELLCYCLE /referring|Please rephrase/
        put get my %sellitem% from my %container2%
        GOTO UniversalMatch

    SELLING:
        match SELLGET takes your
        matchre TRASH.%class% /worth|idiots|Waste all|no need|scowls and says/
        match SELLING ...wait
        put sell my %sellitem%
        GOTO UniversalMatch

    SELLING2:
        match SELLGET2 takes your
        matchre TRASH.%class% /worth|idiots|Waste all|no need|scowls and says/
        match SELLING2 ...wait
        put sell my %sellitem%
        GOTO UniversalMatch

    TRASH.NONTHIEF:
    TRASH.EMPATH:
        match TRASH.NONTHIEF.REPEAT1 bucket
        match NOBUCKET referring
        put put my %sellitem% in bucket
        GOTO UniversalMatch

    TRASH.NONTHIEF2:
        match TRASH.NONTHIEF.REPEAT2 bucket
        match NOBUCKET referring
        put put my %sellitem% in bucket
        GOTO UniversalMatch

    NOBUCKET:
        GOTO TRASH.THIEF

    TRASH.NONTHIEF.REPEAT1:
        match TRASH.NONTHIEF You get
        match TRASH.NONTHIEF.REPEAT1 ...wait
        match TRASH.NONTHIEF.REPEAT2 referring
        put get my %sellitem% from my %container1%
        GOTO UniversalMatch

    TRASH.NONTHIEF.REPEAT2:
        match TRASH.NONTHIEF2 You get
        match TRASH.NONTHIEF.REPEAT2 ...wait
        match SELLCYCLE referring
        put get my %sellitem% from my %container2%
        GOTO UniversalMatch

    SELLCYCLE:
        counter set %SellItemCount%
        deleteVariable SellItem%c%
        counter subtract 1
        setVariable SellItemCount %c%
        put echo sellcycle%c% continue
        match SELLCOUNTFIX sellcycle-
        match COUNTDOWN.%CountdownType%.DONE sellcycle0
        match COUNTDOWN.%CountdownType%.CONTINUE continue
        GOTO UniversalMatch

    TRASH.THIEF:
        match TRASH.THIEF ...wait
        matchre TRASH.THIEF2 /any more room in|no matter how you|to fit in the/
        match ADDTOBINLIST You put
        put put my %sellitem% in my %container1%
        GOTO UniversalMatch

    TRASH.THIEF2:
        match TRASH.THIEF2 ...wait
        matchre TRASH.NONTHIEF2 /any more room in|no matter how you|to fit in the/
        match ADDTOBINLIST You put
        put put my %sellitem% in my %container2%
        GOTO UniversalMatch

    ADDTOBINLIST:
        counter set %BinItemCount%
        counter add 1
        setVariable BinItemCount %c%
        setVariable BinItem%c% %sellitem%
        GOTO SELLCYCLE


##################################################################
#####                                                        #####
#####                   BINNING SYSTEM                       #####
#####                                                        #####
##################################################################


    BIN:
        setVariable CountdownType bin
        setVariable labelerr realerror
        setVariable sellorbin binget
        setVariable contact true
        matchre BINCOUNTSET /bin 0|BinItemCount/
        match COUNTDOWN.BIN.CONTINUE binready
        put echo bin %BinItemCount% binready
        GOTO UniversalMatch

    BINCOUNTSET:
        setVariable BinItemCount %SellItemCount%
        GOTO COUNTDOWN.BIN.CONTINUE

    PAWN.BIN:
        setVariable CountdownType bin
        setVariable sellorbin binget
        setVariable contact true
        GOTO COUNTDOWN.BIN.CONTINUE

    COUNTDOWN.BIN.CONTINUE:
        setVariable sellitem %percentsign%BinItem%BinItemCount%
        GOTO %sellorbin%
    COUNTDOWN.BIN.DONE:
        GOTO %citycode%.BINFINISH.%class%

    BINGET:
        match BINDROP You get
        match BINGET2 referring
        match BINGET ...wait
        put get my %sellitem% from my %container1%
        GOTO UniversalMatch

    BINGET2:
        match BINDROP2 You get
        match BINCYCLE referring
        match BINGET2 ...wait
        put get my %sellitem% from my %container2%
        GOTO UniversalMatch

    BINDROP:
        matchre BINGET /falls into the|You drop/
        match THIEFSTOW not fooling anyone
        match BINDROP ...wait
        match BINTYPE.%BinOrBucket% referring
        put put my %sellitem% in %BinOrBucket%
        GOTO UniversalMatch

    BINDROP2:
        matchre BINGET2 /falls into the|You drop/
        match THIEFSTOW not fooling anyone
        match BINDROP2 ...wait
        match BINTYPE.%BinOrBucket% referring
        put put my %sellitem% in %BinOrBucket%
        GOTO UniversalMatch

    THIEFSTOW:
        put empty right
        wait
        put empty left
        GOTO BINCYCLE

    BINCYCLE:
        counter set %BinItemCount%
        deleteVariable BinItem%c%
        counter subtract 1
        setVariable BinItemCount %c%
        put echo bincycle%c% continue
        match BINCOUNTFIX bincycle-
        match COUNTDOWN.%CountdownType%.DONE bincycle0
        match COUNTDOWN.%CountdownType%.CONTINUE continue
        GOTO UniversalMatch

    BINTYPE.BUCKET:
        setVariable BinOrBucket bin
        GOTO BINDROP
    BINTYPE.BIN:
        setVariable BinOrBucket basket
        GOTO BINDROP
    BINTYPE.BASKET:
        setVariable BinOrBucket recept
        GOTO BINDROP
    BINTYPE.RECEPT:
        setVariable BinOrBucket hole
        GOTO BINDROP
    BINTYPE.HOLE:
        ECHO
        ECHO ***********************************************
        ECHO *** Script was unable to find a receptacle for you unpawnable goods.
        ECHO ***********************************************
        ECHO
        pause 2
        GOTO %citycode%.BINFINISH.%class%


##################################################################
#####                                                        #####
#####             ITEM RETRIEVAL AFTER ARREST                #####
#####                                                        #####
##################################################################


    GETSACK:
        put get %name% sack
        matchre SACKCHECK1 /referring|You reach|You realize/
        GOTO UniversalMatch

    SACKCHECK1:
        match %citycode%.ITEMCHECK referring
        match SACKCHECK2 You open
        put open my small sack
        GOTO UniversalMatch

    SACKCHECK2:
        match %citycode%.ITEMCHECK There is nothing in there.
        match SACKJUNK1 %item%
        match SACKCHECK3 you see
        put look in my small sack
        GOTO UniversalMatch

    SACKCHECK3:
        match SACKWEAR1 You get
        match SACKCHECK4 referring
        put get my %largeitem1% from my small sack
        GOTO UniversalMatch

    SACKCHECK4:
        match SACKWEAR2 You get
        match SACKCHECK5 referring
        put get my %largeitem2% from my small sack
        GOTO UniversalMatch

    SACKCHECK5:
        match %citycode%.ITEMCHECK There is nothing in there.
        match SACKJUNK1 %item%
        match SACKSCREWED you see
        put look in my small sack
        GOTO UniversalMatch

    SACKJUNK1:
        match SACKJUNK2 You get
        match SACKSCREWED referring
        put get my %item% in my small sack
        GOTO UniversalMatch

    SACKJUNK2:
        match SACKCHECK2 You put
        match SACKCHECK2 referring
        matchre SACKDROP /any more room|no matter how you/
        put put my %item% in my %container1%
        put put my %item% in my %container2%
        GOTO UniversalMatch

    SACKDROP:
        matchre SACKCHECK2 /You drop|referring/
        put drop my %item%
        GOTO UniversalMatch

    SACKWEAR1:
        put wear my %largeitem1%
        wait
        match SACKCHECK4 nothing in your
        match SACKCHECK4 You glance down to see a small sack in your left hand.
        matchre SACKSTOW1 /hand and a|hand and some/
        put glance
        GOTO UniversalMatch

    SACKWEAR2:
        put wear my %largeitem2%
        wait
        match SACKCHECK5 nothing in your
        match SACKCHECK5 You glance down to see a small sack in your left hand.
        matchre SACKSTOW2 /hand and a|hand and some/
        put glance
        GOTO UniversalMatch

    SACKSTOW1:
        put stow my %largeitem1%
        wait
        match SACKCHECK4 nothing in your
        match SACKCHECK4 You glance down to see a small sack in your left hand.
        matchre SACKSCREWED /hand and a|hand and some/
        put glance
        GOTO UniversalMatch

    SACKSTOW2:
        put stow my %largeitem2%
        wait
        match SACKCHECK5 nothing in your
        match SACKCHECK5 You glance down to see a small sack in your left hand.
        matchre SACKSCREWED /hand and a|hand and some/
        put glance
        GOTO UniversalMatch

    SACKSCREWED:
        ECHO
        ECHO ***********************************************
        ECHO ***    Script was unable to retrieve your items after arrest.
        ECHO ***            When you have fixed this, type YES.
        ECHO ***********************************************
        ECHO
        waitfor good positive attitude
        GOTO %citycode%.ITEMCHECK


##################################################################
#####                                                        #####
#####                  EMPATH SELF-HEALING                   #####
#####                                                        #####
##################################################################

    EMPATH.HEALSELF:

    RH:
        setVariable TargetWound Right Hand
        GOTO HEALWOUNDS

    WOUNDCHECK:
        put health
        match H head
        match N neck
        match RA right arm
        match LA left arm
        match RL right leg
        match LL left leg
        match RH right hand
        match LH left hand
        match C chest
        match A abdomen
        match B back
        match RE right eye
        match LE left eye
        matchre S /skin|rash|twitching|numbness|paralysis|difficulty/
        match %citycode%.EMPATH.TO.RESUME.FROM.%SelfHealLoc% You have no significant injuries.
        GOTO UniversalMatch

    H:
        setVariable TargetWound Head
        GOTO HEALWOUNDS
    N:
        setVariable TargetWound Neck
        GOTO HEALWOUNDS
    RA:
        setVariable TargetWound Right Arm
        GOTO HEALWOUNDS
    LA:
        setVariable TargetWound Left Arm
        GOTO HEALWOUNDS
    RL:
        setVariable TargetWound Right Leg
        GOTO HEALWOUNDS
    LL:
        setVariable TargetWound Left Leg
        GOTO HEALWOUNDS
    LH:
        setVariable TargetWound Left Hand
        GOTO HEALWOUNDS
    C:
        setVariable TargetWound Chest
        GOTO HEALWOUNDS
    B:
        setVariable TargetWound Back
        GOTO HEALWOUNDS
    A:
        setVariable TargetWound Abdomen
        GOTO HEALWOUNDS
    RE:
        setVariable TargetWound Right Eye
        GOTO HEALWOUNDS
    LE:
        setVariable TargetWound Left Eye
        GOTO HEALWOUNDS
    S:
        setVariable TargetWound Skin
        GOTO HEALWOUNDS

    HEALWOUNDS:
        setVariable HealSpell hw
        GOTO PREPSPELL

    HEALSCARS:
        setVariable HealSpell hs
        GOTO PREPSPELL

    PREPSPELL:
        put prep %HealSpell%
        match PREPSPELL ...wait
        match HARNESS1 attunement
        match NOMANA You have to strain
        GOTO UniversalMatch

    HARNESSWAIT:
        pause 10
    HARNESS1:
        put har 4
        match HARNESS1 wait
        match HARNESS2 Roundtime
        match NOMANA You strain
        GOTO UniversalMatch

    HARNESS2:
        put har 4
        match HARNESS2 wait
        match CASTSPELL Roundtime
        match NOMANA You strain
        GOTO UniversalMatch

    CASTSPELL:
        pause 5
        put cast %TargetWound%
        match CASTSPELL ...wait
        match HEALSCARS wounds, but it cannot
        match HEALSCARS The internal wounds on your %TargetWound% appears completely healed.
        match WOUNDCHECK scars, but it cannot
        match WOUNDCHECK The internal scars on your %TargetWound% appears completely healed.
        matchre PREPSPELL /ineffective|almost|improved|better|You don't have/
        GOTO UniversalMatch

    NOMANA:
        pause 60
        GOTO PREPSPELL


##################################################################################
#############                                                        #############
#############                       ZOLUREN                          #############
#############                                                        #############
#############                  SKILL DETERMINATION                   #############
#############      (tweak the items you steal here if desired)       #############
#############                                                        #############
##################################################################################


    ZOL.RANK.1:
        setVariable skillrange 20-39
        setVariable ADbard <nothing>
        setVariable ADbardQuant 1
        setVariable ADodd <nothing>
        setVariable ADoddQuant 1
        setVariable ADthread <nothing>
        setVariable ADthreadQuant 1
        setVariable ADfash <nothing>
        setVariable ADfashQuant 1
        setVariable ADweap <nothing>
        setVariable ADweapQuant 1
        setVariable ADtartE <nothing>
        setVariable ADtartEQuant 1
        setVariable ADtartC <nothing>
        setVariable ADtartCQuant 1
        setVariable ADtartM <nothing>
        setVariable ADtartMQuant 1
        setVariable ADtartL <nothing>
        setVariable ADtartLQuant 1
        setVariable ADtartF <nothing>
        setVariable ADtartFQuant 1
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok <nothing>
        setVariable ADsmokQuant 1
        setVariable ADfeta biscuit
        setVariable ADfetaQuant 1
        setVariable Ctann <nothing>
        setVariable CtannQuant 1
        setVariable Cstit <nothing>
        setVariable CstitQuant 1
        setVariable Cbath reed
        setVariable CbathItemLoc  
        setVariable CbathQuant 1
        setVariable Chab <nothing>
        setVariable ChabQuant 1
        setVariable Ccobb <nothing>
        setVariable CcobbQuant 1
        setVariable Calch water
        setVariable CalchQuant 2
        setVariable Cbota <nothing>
        setVariable CbotaQuant 1
        setVariable Cbloss rose
        setVariable CblossQuant 1
        setVariable Cgen bark
        setVariable CgenQuant 1
        setVariable Cgem hairpin
        setVariable CgemQuant 1
        setVariable Cweap sling
        setVariable CweapQuant 1
        setVariable Carm gloves
        setVariable CarmQuant 1
        setVariable Clock slim lockpick
        setVariable ClockQuant 1
        setVariable Carti <nothing>
        setVariable CartiQuant 1
        setVariable Cbard pick
        setVariable CbardQuant 1
        setVariable Ccleric chamomile
        setVariable CclericQuant 1
        setVariable Lmorik <nothing>
        setVariable LmorikQuant 1
        setVariable Lperf <nothing>
        setVariable LperfQuant 1
        setVariable Lgen <nothing>
        setVariable LgenQuant 1
        setVariable Lbow flights
        setVariable LbowQuant 1
        setVariable Lweap <nothing>
        setVariable LweapQuant 1
        setVariable Lwick <nothing>
        setVariable LwickQuant 1
        setVariable Lcloth <nothing>
        setVariable LclothQuant 1
        setVariable Lbard <nothing>
        setVariable LbardQuant 1
        setVariable Lwood <nothing>
        setVariable LwoodQuant 1
        setVariable Lgami <nothing>
        setVariable LgamiQuant 1
        setVariable TCweap <nothing>
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 1
        setVariable TCpedd <nothing>
        setVariable TCpeddQuant 1
        setVariable TCherb <nothing>
        setVariable TCherbQuant 1
        GOTO RANKREPORT

    ZOL.RANK.2:
        setVariable skillrange 40-59
        setVariable ADbard <nothing>
        setVariable ADbardQuant 2
        setVariable ADodd <nothing>
        setVariable ADoddQuant 2
        setVariable ADthread pouch
        setVariable ADthreadQuant 2
        setVariable ADfash <nothing>
        setVariable ADfashQuant 2
        setVariable ADweap butcher's knife
        setVariable ADweapQuant 2
        setVariable ADtartE <nothing>
        setVariable ADtartEQuant 1
        setVariable ADtartC <nothing>
        setVariable ADtartCQuant 1
        setVariable ADtartM <nothing>
        setVariable ADtartMQuant 1
        setVariable ADtartL <nothing>
        setVariable ADtartLQuant 1
        setVariable ADtartF <nothing>
        setVariable ADtartFQuant 1
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok <nothing>
        setVariable ADsmokQuant 1
        setVariable ADfeta yogurt
        setVariable ADfetaQuant 2
        setVariable Ctann <nothing>
        setVariable CtannQuant 2
        setVariable Cstit beret
        setVariable CstitQuant 1
        setVariable Cbath soap
        setVariable CbathItemLoc in basin
        setVariable CbathQuant 1
        setVariable Chab hood
        setVariable ChabQuant 2
        setVariable Ccobb anklets
        setVariable CcobbQuant 1
        setVariable Calch alcohol
        setVariable CalchQuant 2
        setVariable Cbota <nothing>
        setVariable CbotaQuant 2
        setVariable Cbloss rose
        setVariable CblossQuant 2
        setVariable Cgen purse
        setVariable CgenQuant 2
        setVariable Cgem hairpin
        setVariable CgemQuant 2
        setVariable Cweap sling
        setVariable CweapQuant 2
        setVariable Carm leather gloves
        setVariable CarmQuant 2
        setVariable Clock slim lockpick
        setVariable ClockQuant 2
        setVariable Carti <nothing>
        setVariable CartiQuant 2
        setVariable Cbard pick
        setVariable CbardQuant 2
        setVariable Ccleric chalice
        setVariable CclericQuant 2
        setVariable Lmorik <nothing>
        setVariable LmorikQuant 2
        setVariable Lperf <nothing>
        setVariable LperfQuant 2
        setVariable Lgen <nothing>
        setVariable LgenQuant 2
        setVariable Lbow arrowhead
        setVariable LbowQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lwick <nothing>
        setVariable LwickQuant 2
        setVariable Lcloth <nothing>
        setVariable LclothQuant 2
        setVariable Lbard <nothing>
        setVariable LbardQuant 2
        setVariable Lwood <nothing>
        setVariable LwoodQuant 2
        setVariable Lgami <nothing>
        setVariable LgamiQuant 2
        setVariable TCweap <nothing>
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 2
        setVariable TCpedd <nothing>
        setVariable TCpeddQuant 2
        setVariable TCherb <nothing>
        setVariable TCherbQuant 2
        GOTO RANKREPORT

    ZOL.RANK.3:
        setVariable skillrange 60-99
        setVariable ADbard rag
        setVariable ADbardQuant 2
        setVariable ADodd <nothing>
        setVariable ADoddQuant 2
        setVariable ADthread needle
        setVariable ADthreadQuant 2
        setVariable ADfash snood
        setVariable ADfashQuant 2
        setVariable ADweap hood
        setVariable ADweapQuant 2
        setVariable ADtartE <nothing>
        setVariable ADtartEQuant 1
        setVariable ADtartC tart
        setVariable ADtartCQuant 1
        setVariable ADtartM tart
        setVariable ADtartMQuant 1
        setVariable ADtartL <nothing>
        setVariable ADtartLQuant 1
        setVariable ADtartF tart
        setVariable ADtartFQuant 1
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok sungrown cigar
        setVariable ADsmokQuant 2
        setVariable ADfeta herb cheese
        setVariable ADfetaQuant 1
        setVariable Ctann thread
        setVariable CtannQuant 2
        setVariable Cstit cloche
        setVariable CstitQuant 2
        setVariable Cbath soap
        setVariable CbathItemLoc in basin
        setVariable CbathQuant 2
        setVariable Chab skullcap
        setVariable ChabQuant 2
        setVariable Ccobb moccasins
        setVariable CcobbQuant 2
        setVariable Calch pestle
        setVariable CalchQuant 2
        setVariable Cbota <nothing>
        setVariable CbotaQuant 2
        setVariable Cbloss <nothing>
        setVariable CblossQuant 2
        setVariable Cgen flint
        setVariable CgenQuant 2
        setVariable Cgem anklet
        setVariable CgemQuant 2
        setVariable Cweap dagger
        setVariable CweapQuant 2
        setVariable Carm leather aventail
        setVariable CarmP leather gloves
        setVariable CarmQuant 2
        setVariable Clock stout lockpick
        setVariable ClockQuant 2
        setVariable Carti <nothing>
        setVariable CartiQuant 2
        setVariable Cbard rag
        setVariable CbardQuant 2
        setVariable Ccleric wine
        setVariable CclericP chalice
        setVariable CclericQuant 2
        setVariable Lmorik <nothing>
        setVariable LmorikQuant 2
        setVariable Lperf <nothing>
        setVariable LperfQuant 2
        setVariable Lgen <nothing>
        setVariable LgenQuant 2
        setVariable Lbow <nothing>
        setVariable LbowQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lwick <nothing>
        setVariable LwickQuant 2
        setVariable Lcloth <nothing>
        setVariable LclothQuant 2
        setVariable Lbard <nothing>
        setVariable LbardQuant 2
        setVariable Lwood <nothing>
        setVariable LwoodQuant 2
        setVariable Lgami white paper
        setVariable LgamiQuant 2
        setVariable TCweap <nothing>
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 2
        setVariable TCpedd <nothing>
        setVariable TCpeddQuant 2
        setVariable TCherb <nothing>
        setVariable TCherbQuant 2
        GOTO RANKREPORT

    ZOL.RANK.4:
        setVariable skillrange 100-149
        setVariable ADbard tambourine skin
        setVariable ADbardQuant 2
        setVariable ADodd fan
        setVariable ADoddQuant 2
        setVariable ADthread bobbin
        setVariable ADthreadQuant 2
        setVariable ADfash vest
        setVariable ADfashQuant 2
        setVariable ADweap sling
        setVariable ADweapQuant 2
        setVariable ADtartE tart
        setVariable ADtartEQuant 1
        setVariable ADtartC tart
        setVariable ADtartCQuant 2
        setVariable ADtartM tart
        setVariable ADtartMQuant 2
        setVariable ADtartL tart
        setVariable ADtartLQuant 1
        setVariable ADtartF tart
        setVariable ADtartFQuant 2
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok telgi cigar
        setVariable ADsmokQuant 1
        setVariable ADfeta herb cheese
        setVariable ADfetaQuant 2
        setVariable Ctann bodkin
        setVariable CtannQuant 2
        setVariable Cstit muff
        setVariable CstitQuant 2
        setVariable Cbath towel
        setVariable CbathItemLoc on stand
        setVariable CbathQuant 2
        setVariable Chab vest
        setVariable ChabQuant 2
        setVariable Ccobb tights
        setVariable CcobbQuant 2
        setVariable Calch large jar
        setVariable CalchQuant 2
        setVariable Cbota jadice flower
        setVariable CbotaQuant 1
        setVariable Cbloss <nothing>
        setVariable CblossQuant 2
        setVariable Cgen scabbard
        setVariable CgenQuant 2
        setVariable Cgem clasp
        setVariable CgemQuant 2
        setVariable Cweap gauntlet
        setVariable CweapP dagger
        setVariable CweapQuant 2
        setVariable Carm reinforced greaves
        setVariable CarmQuant 2
        setVariable Clock stout lockpick
        setVariable ClockQuant 2
        setVariable Carti <nothing>
        setVariable CartiQuant 2
        setVariable Cbard ocarina
        setVariable CbardQuant 2
        setVariable Ccleric vial
        setVariable CclericQuant 2
        setVariable Lmorik buckskin pelt
        setVariable LmorikQuant 1
        setVariable Lperf <nothing>
        setVariable LperfQuant 0
        setVariable Lgen dice
        setVariable LgenQuant 1
        setVariable Lgami silver paper
        setVariable LgamiQuant 2
        setVariable Lcloth moufles
        setVariable LclothQuant 1
        setVariable Lwood <nothing>
        setVariable LwoodQuant 0
        setVariable Lbard ocarina
        setVariable LbardQuant 1
        setVariable Lwick wicker quiver
        setVariable LwickQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lbow bolts
        setVariable LbowQuant 1
        setVariable TCweap <nothing>
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 1
        setVariable TCpedd knapsack
        setVariable TCpeddQuant 1
        setVariable TCherb cebi root
        setVariable TCherbQuant 1
        GOTO RANKREPORT

    ZOL.RANK.5:
        setVariable skillrange 150-199
        setVariable ADbard bodhran skin
        setVariable ADbardQuant 2
        setVariable ADodd fan
        setVariable ADoddQuant 2
        setVariable ADthread bobbin
        setVariable ADthreadQuant 2
        setVariable ADfash cape
        setVariable ADfashQuant 2
        setVariable ADweap short sword
        setVariable ADweapQuant 2
        setVariable ADtartE tart
        setVariable ADtartEQuant 2
        setVariable ADtartC tart
        setVariable ADtartCQuant 3
        setVariable ADtartM tart
        setVariable ADtartMQuant 3
        setVariable ADtartL tart
        setVariable ADtartLQuant 2
        setVariable ADtartF tart
        setVariable ADtartFQuant 3
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok telgi cigar
        setVariable ADsmokQuant 2
        setVariable ADfeta wayfarer cheese
        setVariable ADfetaQuant 2
        setVariable Ctann scraper
        setVariable CtannQuant 2
        setVariable Cstit shawl
        setVariable CstitQuant 2
        setVariable Cbath towel
        setVariable CbathItemLoc on stand
        setVariable CbathQuant 2
        setVariable Chab kilt
        setVariable ChabQuant 2
        setVariable Ccobb jack boots
        setVariable CcobbQuant 2
        setVariable Calch large bowl
        setVariable CalchQuant 2
        setVariable Cbota georin salve
        setVariable CbotaQuant 2
        setVariable Cbloss wreath
        setVariable CblossQuant 1
        setVariable Cgen quiver
        setVariable CgenQuant 2
        setVariable Cgem engagement ring
        setVariable CgemQuant 2
        setVariable Cweap cutlass
        setVariable CweapQuant 2
        setVariable Carm mail gloves
        setVariable CarmQuant 2
        setVariable Clock <nothing>
        setVariable ClockQuant 2
        setVariable Carti talisman
        setVariable CartiQuant 1
        setVariable Cbard lyre
        setVariable CbardQuant 2
        setVariable Ccleric basin
        setVariable CclericQuant 2
        setVariable Lmorik deer skin
        setVariable LmorikQuant 2
        setVariable Lperf <nothing>
        setVariable LperfQuant 0
        setVariable Lgen dice
        setVariable LgenQuant 1
        setVariable Lgami leather case
        setVariable LgamiQuant 1
        setVariable Lcloth tunic
        setVariable LclothQuant 2
        setVariable Lwood <nothing>
        setVariable LwoodQuant 0
        setVariable Lbard ocarina
        setVariable LbardQuant 1
        setVariable Lwick wicker quiver
        setVariable LwickQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lbow long arrows
        setVariable LbowQuant 1
        setVariable TCweap short sword
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 1
        setVariable TCpedd knapsack
        setVariable TCpeddQuant 2
        setVariable TCherb cebi root
        setVariable TCherbQuant 2
        GOTO RANKREPORT

    ZOL.RANK.6:
        setVariable skillrange 200-249
        setVariable ADbard itharr's
        setVariable ADbardQuant 2
        setVariable ADodd earring
        setVariable ADoddQuant 2
        setVariable ADthread pattern
        setVariable ADthreadQuant 2
        setVariable ADfash trousers
        setVariable ADfashQuant 2
        setVariable ADweap wooden shield
        setVariable ADweapQuant 2
        setVariable ADtartE tart
        setVariable ADtartEQuant 3
        setVariable ADtartC <nothing>
        setVariable ADtartCQuant 3
        setVariable ADtartM <nothing>
        setVariable ADtartMQuant 3
        setVariable ADtartL tart
        setVariable ADtartLQuant 3
        setVariable ADtartF <nothing>
        setVariable ADtartFQuant 3
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok cigarillo
        setVariable ADsmokQuant 2
        setVariable ADfeta butter cheese
        setVariable ADfetaQuant 2
        setVariable Ctann shears
        setVariable CtannQuant 2
        setVariable Cstit blouse
        setVariable CstitQuant 2
        setVariable Cbath bathrobe
        setVariable CbathItemLoc on counter
        setVariable CbathQuant 1
        setVariable Chab trousers
        setVariable ChabQuant 2
        setVariable Ccobb thigh boots
        setVariable CcobbQuant 2
        setVariable Calch large bowl
        setVariable CalchQuant 2
        setVariable Cbota riolur leaf
        setVariable CbotaQuant 2
        setVariable Cbloss corsage
        setVariable CblossQuant 2
        setVariable Cgen backpack
        setVariable CgenQuant 2
        setVariable Cgem coral hairpin
        setVariable CgemQuant 2
        setVariable Cweap rapier
        setVariable CweapQuant 2
        setVariable Carm chain aventail
        setVariable CarmQuant 2
        setVariable Clock <nothing>
        setVariable ClockQuant 2
        setVariable Carti talisman
        setVariable CartiQuant 2
        setVariable Cbard bodhran skin
        setVariable CbardQuant 2
        setVariable Ccleric coffer
        setVariable CclericQuant 2
        setVariable Lmorik sluagh hide
        setVariable LmorikQuant 2
        setVariable Lperf panther perfume
        setVariable LperfQuant 1
        setVariable Lgen dice
        setVariable LgenQuant 2
        setVariable Lbow leather quiver
        setVariable LbowQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lwick mesh sack
        setVariable LwickQuant 2
        setVariable Lcloth doublet
        setVariable LclothQuant 2
        setVariable Lbard case
        setVariable LbardQuant 2
        setVariable Lwood applewood log
        setVariable LwoodQuant 1
        setVariable Lgami oak case
        setVariable LgamiQuant 2
        setVariable TCweap short sword
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 2
        setVariable TCpedd hood
        setVariable TCpeddQuant 2
        setVariable TCherb hulij elixir
        setVariable TCherbQuant 2
        GOTO RANKREPORT

    ZOL.RANK.7:
        setVariable skillrange 250-299
        setVariable ADbard silverlock
        setVariable ADbardQuant 2
        setVariable ADodd earring
        setVariable ADoddQuant 2
        setVariable ADthread pattern
        setVariable ADthreadQuant 2
        setVariable ADfash trousers
        setVariable ADfashQuant 2
        setVariable ADweap vest
        setVariable ADweapQuant 2
        setVariable ADtartE <nothing>
        setVariable ADtartEQuant 1
        setVariable ADtartC <nothing>
        setVariable ADtartCQuant 1
        setVariable ADtartM <nothing>
        setVariable ADtartMQuant 1
        setVariable ADtartL <nothing>
        setVariable ADtartLQuant 1
        setVariable ADtartF <nothing>
        setVariable ADtartFQuant 1
        setVariable ADmap <nothing>
        setVariable ADmapQuant 1
        setVariable ADsmok silver cigar
        setVariable ADsmokQuant 2
        setVariable ADfeta kirm cheese
        setVariable ADfetaQuant 2
        setVariable Ctann pattern
        setVariable CtannQuant 2
        setVariable Cstit leggings
        setVariable CstitQuant 2
        setVariable Cbath bathrobe
        setVariable CbathItemLoc on counter
        setVariable CbathQuant 2
        setVariable Chab doublet
        setVariable ChabQuant 2
        setVariable Ccobb hip boots
        setVariable CcobbQuant 2
        setVariable Calch tincture jar
        setVariable CalchQuant 1
        setVariable Cbota ithor potion
        setVariable CbotaQuant 2
        setVariable Cbloss corsage
        setVariable CblossQuant 2
        setVariable Cgen backpack
        setVariable CgenQuant 2
        setVariable Cgem bloodstone hairpin
        setVariable CgemQuant 2
        setVariable Cweap war club
        setVariable CweapQuant 2
        setVariable Carm scale aventail
        setVariable CarmQuant 2
        setVariable Clock <nothing>
        setVariable ClockQuant 2
        setVariable Carti talisman
        setVariable CartiQuant 2
        setVariable Cbard refill
        setVariable CbardQuant 2
        setVariable Ccleric chasuble
        setVariable CclericQuant 2
        setVariable Lmorik cougar pelt
        setVariable LmorikQuant 2
        setVariable Lperf panther perfume
        setVariable LperfQuant 2
        setVariable Lgen dice
        setVariable LgenQuant 2
        setVariable Lbow leather quiver
        setVariable LbowQuant 2
        setVariable Lweap <nothing>
        setVariable LweapQuant 2
        setVariable Lwick mesh sack
        setVariable LwickQuant 2
        setVariable Lcloth jerkin
        setVariable LclothQuant 2
        setVariable Lbard mirliton
        setVariable LbardQuant 2
        setVariable Lwood hazelwood log
        setVariable LwoodQuant 2
        setVariable Lgami elm case
        setVariable LgamiQuant 2
        setVariable TCweap mace
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 2
        setVariable TCpedd hood
        setVariable TCpeddQuant 2
        setVariable TCherb hulij elixir
        setVariable TCherbQuant 2
        GOTO RANKREPORT

    ZOL.RANK.11:
    ZOL.RANK.12:
    ZOL.RANK.13:
    ZOL.RANK.14:
    ZOL.RANK.15:
        ECHO ***********************************************
        ECHO ***        Sorry, but there isn't anything harder yet!
        ECHO ***********************************************
    ZOL.RANK.10:
    ZOL.RANK.9:
    ZOL.RANK.8:
        setVariable skillrange 300+
        setVariable ADbard peri'el's
        setVariable ADbardQuant 2
        setVariable ADodd purse
        setVariable ADoddQuant 2
        setVariable ADthread pattern
        setVariable ADthreadQuant 2
        setVariable ADfash frock
        setVariable ADfashQuant 2
        setVariable ADweap cuirass
        setVariable ADweapQuant 2
        setVariable ADtartE <nothing>
        setVariable ADtartEQuant 1
        setVariable ADtartC <nothing>
        setVariable ADtartCQuant 1
        setVariable ADtartM <nothing>
        setVariable ADtartMQuant 1
        setVariable ADtartL <nothing>
        setVariable ADtartLQuant 1
        setVariable ADtartF anlibues cheese
        setVariable ADtartFQuant 2
        setVariable ADmap map
        setVariable ADmapQuant 1
        setVariable ADsmok whiskey cigar
        setVariable ADsmokQuant 2
        setVariable ADfeta <nothing>
        setVariable ADfetaQuant 1
        setVariable Ctann potion
        setVariable CtannQuant 1
        setVariable Cstit shirt
        setVariable CstitQuant 2
        setVariable Cbath bath towel
        setVariable CbathItemLoc on rack
        setVariable CbathQuant 2
        setVariable Chab tabard
        setVariable ChabQuant 2
        setVariable Ccobb <nothing>
        setVariable CcobbQuant 2
        setVariable Calch tincture jar
        setVariable CalchQuant 2
        setVariable Cbota ithor potion
        setVariable CbotaQuant 2
        setVariable Cbloss bouquet
        setVariable CblossQuant 2
        setVariable Cgen stove
        setVariable CgenQuant 2
        setVariable Cgem bloodstone hairpin
        setVariable CgemQuant 2
        setVariable Cweap longsword
        setVariable CweapQuant 2
        setVariable Carm chain helm
        setVariable CarmQuant 2
        setVariable Clock <nothing>
        setVariable ClockQuant 2
        setVariable Carti talisman
        setVariable CartiQuant 2
        setVariable Cbard mandolin
        setVariable CbardQuant 2
        setVariable Ccleric habit
        setVariable CclericQuant 2
        setVariable Lmorik reaver pelt
        setVariable LmorikQuant 2
        setVariable Lperf woodsmoke cologne
        setVariable LperfQuant 2
        setVariable Lgen quiver
        setVariable LgenQuant 2
        setVariable Lbow short bow
        setVariable LbowQuant 2
        setVariable Lweap wolf-tail shield
        setVariable LweapQuant 1
        setVariable Lwick mesh sack
        setVariable LwickQuant 2
        setVariable Lcloth mantle
        setVariable LclothQuant 2
        setVariable Lbard keyed flute
        setVariable LbardQuant 2
        setVariable Lwood ironwood log
        setVariable LwoodQuant 2
        setVariable Lgami enameled case
        setVariable LgamiQuant 2
        setVariable TCweap hammer
        setVariable TCweapItemLoc in catalog
        setVariable TCweapQuant 1
        setVariable TCpedd scabbard
        setVariable TCpeddQuant 1
        setVariable TCherb hulij elixir
        setVariable TCherbQuant 3
        GOTO RANKREPORT

    ZOL.RANK.-5:
    ZOL.RANK.-4:
    ZOL.RANK.-3:
    ZOL.RANK.-2:
    ZOL.RANK.-1:
    ZOL.RANK.0:
        GOTO BEGGAR.MOD

    ZOL.BAGCHECK:
        matchre BAGWARN /%Ctann%|%Cstit%|%Chab%|%Cbath%|%Ccobb%|%Calch%|%Cbota%|%Cbloss%/
        matchre BAGWARN /%Cgen%|%Cgem%|%Cweap%|%Carm%|%Cbard%|%Clock%|%Ccleric%|%Carti%/
        matchre BAGWARN /%ADodd%|%ADbard%|%ADthread%|%ADfash%|%ADweap%|%TCweap%|%TCpedd%|%TCherb%/
        matchre BAGWARN /%ADtartE%|%ADtartC%|%ADtartM%|%ADtartL%|%ADtartF%|%ADmap%|%ADsmok%|%ADfeta%/
        matchre BAGWARN /%Lmorik%|%Lperf%|%Lgen%|%Lbow%|%Lweap%|%Lwick%|%Lcloth%|%Lbard%|%Lwood%|%Lgami%/
        match BAGS.STOW.%c% You glance
        put look in my %container%
        put glance
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####             ZOLUREN STARTING POSITION                  #####
#####                                                        #####
##################################################################

    CROSS:
        match CROSS.START.NE [The Crossing, Northeast Customs]
        match CROSS.START.E [The Crossing, Eastern Gate]
        match CROSS.START.W [The Crossing, Western Gate]
        match CROSS.START.BANK a picture of a smiling Dwarf
        match CROSS.START.PAWN [Cormyn's House of Heirlooms]
        match CROSS.START.TANN [Falken's Tannery, Supply Room]
        match CROSS.START.ALCH [Chizili's Alchemical Goods, Salesroom]
        match CROSS.START.BOTA [Mauriga's Botanicals, Salesroom]
        match CROSS.START.COBB [Talmai's Cobblery, Salesroom]
        match CROSS.START.BLOSS [Orielda's Blossoms, Front Room]
        match CROSS.START.WEAP [Milgrym's Weapons, Showroom]
        match CROSS.START.ARM [Tembeg's Armory, Salesroom]
        match CROSS.START.GEN [Berolt's Dry Goods, Showroom]
        match CROSS.START.GEM [Grisgonda's Gems and Jewels]
        match CROSS.START.STIT [Marcipur's Stitchery, Workshop]
        match CROSS.START.CLERIC [Brother Durantine's Shop]
        match CROSS.START.BARD [The True Bard D'Or, Fine Instruments]
        match CROSS.START.LOCK [Ragge's Locksmithing, Salesroom]
        match CROSS.START.ARTI [Herilo's Artifacts, Showroom]
        match CROSS.START.BATH [Orem's Bathhouse, Lobby]
        match CROSS.START.HAB [Brisson's Haberdashery, Sales Salon]
        match CROSS.START.GUARD Like most towns, this one spared every expense when decorating the office
        match JAILWAIT [Guard House, Jail Cell]
        match PLEA [Guard House, Chamber of Justice]
        match ZOL.BADLOCATION Obvious
        put look
        GOTO UniversalMatch

    ARTHE:
        match ARTHE.START.GATE [Arthe Dale, Village Gate]
        match ARTHE.START.WEAP [Bobba's Arms and Armor]
        match ARTHE.START.BARD [Barley Bulrush, Bardic Ballads]
        match ARTHE.START.ODD [Odds 'n Ends, Sales Room]
        match ARTHE.START.FASH [Phoebe's Fashions, Sales Room]
        match ARTHE.START.THREAD [Quellia's Thread Shop, Sales Room]
#        match ARTHE.START.TART Thipbeet's Tart Boutique, Lobby
        match ARTHE.START.MAP Yulugri Wala, Lobby
        match ARTHE.START.SMOK Yulugri Wala, Smoking Room
        match ARTHE.START.FETA Feta's Kitchen
    TIGER:
        match TIGER.START.GATE A river-rock wall extends east to west, protecting the northern end
        match TIGER.START.WEAP Havor Foehammer
        match TIGER.START.PEDD Tiger Clan Home, Peddler's Wagon
        match TIGER.START.HERB the midwife Neesa
    LETH:
        match LETH.START.NW [Leth Deriel, Alder Bower Gate]
        match LETH.START.SW [Leth Deriel, Deobar Bower Gate]
        match LETH.START.TOWNCENTER [Leth Deriel, Sana'ati Dyaus Drui'tas]
        match LETH.START.MORIKAI [Morikai's, Salesroom]
        match LETH.START.PERFUME [Madame Orris' Perfumerie, Salon]
        match LETH.START.GENERAL [Alberdeen's Meats and Provisions, Front Room]
        match LETH.START.WOOD [Yerui's Woodcraft, Workshop]
        match LETH.START.CLOTH [Ongadine's Garb and Gear, Showroom]
        match LETH.START.BARD [Sinjian's Bardic Requisites, Sales Room]
        match LETH.START.WICKER [Blanca's Basketry and Wickerworks, Showroom]
        match LETH.START.WEAPON [Leth Deriel, Wooden Shack]
        match LETH.START.BOWYER [Huyelm's Trueflight Bow and Arrow Shop, Salesroom]
        match LETH.START.ORIGAMI [Origami Boutique]
        match ZOL.BADLOCATION Obvious
        put look
        GOTO UniversalMatch

    ZOL.BADLOCATION:
        put echocolumn /on
        waitfor EchoColumn
        ECHO *****************************************************************
        ECHO *** Not a valid starting location.
        ECHO *** Starting locations in Zoluren are:
        ECHO ***
        ECHO *** Crossing Inside Gates            Arthe Dale Inside Gate
        ECHO *** Crossing Outside Bank            Arthe Dale Arms and Armor
        ECHO *** Crossing Alchemist Shop          Arthe Dale Bard Shop
        ECHO *** Crossing Armory                  Arthe Dale Odds 'n Ends
        ECHO *** Crossing Artificer               Arthe Dale Fashion Shop
        ECHO *** Crossing Bard Shop               Arthe Dale Thread Shop
        ECHO *** Crossing Bath House              Arthe Dale Yulugri Wala
        ECHO *** Crossing Cleric Shop             Arthe Dale Feta's Kitchen
        ECHO *** Crossing Cobbler Shop            
        ECHO *** Crossing Florist                 
        ECHO *** Crossing Gem Shop                Tiger Clan Inside Gate
        ECHO *** Crossing General Store           Tiger Clan Forge
        ECHO *** Crossing Haberdashery            Tiger Clan Peddler's Wagon
        ECHO *** Crossing Herbalist               Tiger Clan Midwife's Herbs
        ECHO *** Crossing Locksmith               
        ECHO *** Crossing Pawn Shop               Leth Deriel Origami Tent
        ECHO *** Crossing Stitchery               Leth Deriel Bowyer's Shop
        ECHO *** Crossing Tannery Supply Room     Leth Deriel Morikai's Shop
        ECHO *** Crossing Weapon Shop             Leth Deriel Perfume Shop
        ECHO *** Crossing Guard House             Leth Deriel General Store
        ECHO *** Crossing Jail Cell               Leth Deriel Woodcraft Shop
        ECHO *** Crossing Chamber of Justice      Leth Deriel Clothing Shop
        ECHO ***                                  Leth Deriel Bard Shop
        ECHO *** Leth Deriel Inside Gates         Leth Deriel Wickerworks
        ECHO *** Leth Deriel Town Center          Leth Deriel Weapon Shop
        ECHO ***
        ECHO *****************************************************************
        put echocolumn /off
        waitfor EchoColumn
        GOTO END

    CROSS.START.TANN:
        counter set 291
        setVariable storecode Ctann
        GOTO START

    CROSS.START.ALCH:
        counter set 41
        setVariable storecode Calch
        put out
        GOTO START

    CROSS.START.BOTA:
        counter set 44
        setVariable storecode Cbota
        put out
        GOTO START

    CROSS.START.COBB:
        counter set 279
        setVariable storecode Ccobb
        put out
        GOTO START

    CROSS.START.BLOSS:
        counter set 59
        setVariable storecode Cbloss
        put out
        GOTO START

    CROSS.START.WEAP:
        counter set 64
        setVariable storecode Cweap
        put out
        GOTO START

    CROSS.START.ARM:
        counter set 66
        setVariable storecode Carm
        put out
        GOTO START

    CROSS.START.GEN:
        counter set 69
        setVariable storecode Cgen
        put out
        GOTO START

    CROSS.START.GEM:
        counter set 72
        setVariable storecode Cgem
        put out
        GOTO START

    CROSS.START.STIT:
        counter set 75
        setVariable storecode Cstit
        put out
        GOTO START

    CROSS.START.CLERIC:
        counter set 85
        setVariable storecode Ccleric
        put out
        GOTO START

    CROSS.START.BARD:
        counter set 89
        setVariable storecode Cbard
        put out
        GOTO START

    CROSS.START.BATH:
        counter set 93
        setVariable storecode Cbath
        put out
        GOTO START

    CROSS.START.LOCK:
        counter set 98
        setVariable storecode Clock
        put out
        GOTO START

    CROSS.START.ARTI:
        counter set 112
        setVariable storecode Carti
        put out
        GOTO START

    CROSS.START.HAB:
        counter set 115
        setVariable storecode Chab
        put out
        GOTO START

    TIGER.START.WEAP:
        counter set 18
        setVariable storecode TCweap
        put out
        GOTO START

    TIGER.START.PEDD:
        counter set 22
        setVariable storecode TCpedd
        put out
        GOTO START

    TIGER.START.HERB:
        counter set 26
        setVariable storecode TCherb
        put out
        GOTO START

    CROSS.START.NE:
        counter set 1
      CROSS.1:
        put w
        GOTO TRAVEL
      CROSS.2:
        put s
        GOTO TRAVEL
      CROSS.3:
        put s
        GOTO TRAVEL
      CROSS.4:
        put go shop
        GOTO TRAVEL
      CROSS.5:
        GOTO CROSS.START.COBB

    CROSS.START.W:
        counter set 6
      CROSS.6:
        put e
        GOTO TRAVEL
      CROSS.7:
        put e
        GOTO TRAVEL
      CROSS.8:
        put e
        GOTO TRAVEL
      CROSS.9:
        put s
        GOTO TRAVEL
    CROSS.START.W2:
      CROSS.26:
        counter set 10
      CROSS.10:
        put s
        GOTO TRAVEL
      CROSS.11:
        put s
        GOTO TRAVEL
      CROSS.12:
        put s
        GOTO TRAVEL
      CROSS.13:
        put s
        GOTO TRAVEL
      CROSS.14:
        put go shop
        GOTO TRAVEL
      CROSS.15:
        GOTO CROSS.START.ARTI

    CROSS.START.E:
        counter set 16
      CROSS.16:
        put w
        GOTO TRAVEL
      CROSS.17:
        put w
        GOTO TRAVEL
      CROSS.18:
        put w
        GOTO TRAVEL
      CROSS.19:
        put w
        GOTO TRAVEL
    CROSS.START.BANK:
        counter set 20
      CROSS.20:
        put nw
        GOTO TRAVEL
      CROSS.21:
        put w
        GOTO TRAVEL
      CROSS.22:
        put go shop
        GOTO TRAVEL
      CROSS.23:
        GOTO CROSS.START.CLERIC

    CROSS.START.PAWN:
        counter set 24
      CROSS.24:
        put out
        GOTO TRAVEL
      CROSS.25:
        put w
        GOTO TRAVEL

    CROSS.START.GUARD:
        counter set 27
      CROSS.27:
        put out
        GOTO TRAVEL
      CROSS.28:
        put n
        GOTO TRAVEL
      CROSS.29:
        put e
        GOTO TRAVEL
      CROSS.30:
        put go haber
        GOTO TRAVEL
      CROSS.31:
        GOTO CROSS.START.HAB

    TIGER.START.GATE:
        counter set 52
      TIGER.52:
        put s
        GOTO TRAVEL
      TIGER.53:
        put go building
        GOTO TRAVEL
      TIGER.54:
        GOTO TIGER.START.WEAP


##################################################################
#####                                                        #####
#####               CROSSING LEAVING SHOPS                   #####
#####                                                        #####
##################################################################


    ALTLEAVE.CTANN:
    LEAVE.CTANN:
        counter set 32
      CROSS.32:
        put e
        GOTO TRAVEL
      CROSS.33:
        put e
        GOTO TRAVEL
      CROSS.34:
        put out
        GOTO TRAVEL
      CROSS.35:
        put e
        GOTO TRAVEL
      CROSS.36:
        put s
        GOTO TRAVEL
      CROSS.37:
        put e
        GOTO TRAVEL
      CROSS.38:
        put e
        GOTO TRAVEL
      CROSS.39:
        put e
        GOTO TRAVEL
      CROSS.40:
        put n
        GOTO TRAVEL
      CROSS.41:
        setVariable storecode Calch
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CALCH:
        counter set 42
      CROSS.42:
        put e
        GOTO TRAVEL
      CROSS.43:
        put s
        GOTO TRAVEL
      CROSS.44:
        setVariable storecode Cbota
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CBOTA:
        GOTO %LorM%.CBOTA.1
    LEAVE.CBOTA.1:
        counter set 45
      CROSS.45:
        put e
        GOTO TRAVEL
      CROSS.46:
        put e
        GOTO TRAVEL
      CROSS.47:
        put e
        GOTO TRAVEL
      CROSS.48:
        put n
        GOTO TRAVEL
      CROSS.49:
        put e
        GOTO TRAVEL
      CROSS.50:
        counter set 153
      CROSS.153:
        put n
        GOTO TRAVEL
      CROSS.154:
        put e
        GOTO TRAVEL
      CROSS.155:
        put go gate
        GOTO TRAVEL

    MOVEON.CBOTA.1:
        GOTO MOVEON.CBOTA.%MoveOnReason%

    MOVEON.CBOTA.EXP:
    MOVEON.CBOTA.LOC:
        counter set 332
      CROSS.332:
        put e
        GOTO TRAVEL
      CROSS.333:
        put s
        GOTO TRAVEL
      CROSS.334:
        put w
        GOTO TRAVEL
      CROSS.335:
        put s
        GOTO TRAVEL
      CROSS.336:
        GOTO LEAVE.CBLOSS

    MOVEON.CBOTA.HEALTH:
        GOTO MOVEON.CBOTA.HEALTH.%class%

    MOVEON.CBOTA.HEALTH.THIEF:
    MOVEON.CBOTA.HEALTH.NONTHIEF:
        counter set 139
      CROSS.139:
        put e
        GOTO TRAVEL
      CROSS.140:
        put go arch
        GOTO TRAVEL
      CROSS.141:
        GOTO CROSS.HOSPITAL.%class%

    MOVEON.CBOTA.HEALTH.EMPATH:
        counter set 328
      CROSS.328:
        put n
        GOTO TRAVEL
      CROSS.329:
        setVariable SelfHealLoc Cbota
        GOTO EMPATH.HEALSELF

    CROSS.EMPATH.TO.RESUME.FROM.CBOTA:
        counter set 330
      CROSS.330:
        put s
        GOTO TRAVEL
      CROSS.331:
        GOTO MOVEON.CBOTA.HEALTH.NONTHIEF

    LEAVE.CCOBB:
        GOTO %LorM%.CCOBB.1
    MOVEON.CCOBB.EXP:
    MOVEON.CCOBB.LOC:
    LEAVE.CCOBB.1:
        counter set 52
      CROSS.52:
        put s
        GOTO TRAVEL
      CROSS.53:
        put w
        GOTO TRAVEL
      CROSS.54:
        put w
        GOTO TRAVEL
      CROSS.55:
        put w
        GOTO TRAVEL
      CROSS.56:
        put n
        GOTO TRAVEL
      CROSS.57:
        put w
        GOTO TRAVEL
      CROSS.58:
        put s
        GOTO TRAVEL
      CROSS.59:
        setVariable storecode Cbloss
        setVariable entrance shop
        GOTO SETSTORE

    MOVEON.CCOBB.1:
        GOTO MOVEON.CCOBB.%MoveOnReason%

    MOVEON.CCOBB.HEALTH:
        counter set 142
      CROSS.142:
        put n
        GOTO TRAVEL
      CROSS.143:
        put w
        GOTO TRAVEL
      CROSS.144:
        put s
        GOTO TRAVEL
      CROSS.145:
        put w
        GOTO TRAVEL
      CROSS.146:
        put w
        GOTO TRAVEL
      CROSS.147:
        put w
        GOTO TRAVEL
      CROSS.148:
        GOTO MOVEON.CBOTA.HEALTH.%class%

    LEAVE.CBLOSS:
        counter set 60
      CROSS.60:
        put s
        GOTO TRAVEL
      CROSS.61:
        put go bazaar
        GOTO TRAVEL
      CROSS.62:
        put go path
        GOTO TRAVEL
      CROSS.63:
        put w
        GOTO TRAVEL
      CROSS.64:
        setVariable storecode Cweap
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CWEAP:
        counter set 65
      CROSS.65:
        put w
        GOTO TRAVEL
      CROSS.66:
        setVariable storecode Carm
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CARM:
        counter set 67
      CROSS.67:
        put se
        GOTO TRAVEL
      CROSS.68:
        put s
        GOTO TRAVEL
      CROSS.69:
        setVariable storecode Cgen
        setVariable entrance store
        GOTO SETSTORE

    LEAVE.CGEN:
        counter set 70
      CROSS.70:
        put e
        GOTO TRAVEL
      CROSS.71:
        put e
        GOTO TRAVEL
      CROSS.72:
        setVariable storecode Cgem
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CGEM:
        counter set 73
      CROSS.73:
        put n
        GOTO TRAVEL
      CROSS.74:
        put e
        GOTO TRAVEL
      CROSS.75:
        setVariable storecode Cstit
        setVariable entrance stit
        GOTO SETSTORE

    LEAVE.CSTIT:
        counter set 76
      CROSS.76:
        put e
        GOTO TRAVEL
      CROSS.77:
        put s
        GOTO TRAVEL
      CROSS.78:
        put s
        GOTO TRAVEL
      CROSS.79:
        put s
        GOTO TRAVEL
      CROSS.80:
        put w
        GOTO TRAVEL
      CROSS.81:
        put w
        GOTO TRAVEL
      CROSS.82:
        put w
        GOTO TRAVEL
      CROSS.83:
        put nw
        GOTO TRAVEL
      CROSS.84:
        put w
        GOTO TRAVEL
      CROSS.85:
        setVariable storecode Ccleric
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CCLERIC:
        counter set 86
      CROSS.86:
        put w
        GOTO TRAVEL
      CROSS.87:
        put n
        GOTO TRAVEL
      CROSS.88:
        put n
        GOTO TRAVEL
      CROSS.89:
        setVariable storecode Cbard
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CBARD:
        counter set 90
      CROSS.90:
        put s
        GOTO TRAVEL
      CROSS.91:
        put s
        GOTO TRAVEL
      CROSS.92:
        put w
        GOTO TRAVEL
      CROSS.93:
        setVariable storecode Cbath
        setVariable entrance bath
        setVariable itemlocation %CbathItemLoc%
        GOTO SETSTORE

    LEAVE.CBATH:
        counter set 94
      CROSS.94:
        put w
        GOTO TRAVEL
      CROSS.95:
        put w
        GOTO TRAVEL
      CROSS.96:
        put n
        GOTO TRAVEL
      CROSS.97:
        put n
        GOTO TRAVEL
      CROSS.98:
        setVariable storecode Clock
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.CLOCK:
        counter set 99
      CROSS.99:
        put n
        GOTO TRAVEL
      CROSS.100:
        put e
        GOTO TRAVEL
      CROSS.101:
        put n
        GOTO TRAVEL
      CROSS.102:
        put n
        GOTO TRAVEL
      CROSS.103:
        put n
        GOTO TRAVEL
      CROSS.104:
        put w
        GOTO TRAVEL
      CROSS.105:
        put go bridge
        GOTO TRAVEL
      CROSS.106:
        put w
        GOTO TRAVEL
      CROSS.107:
        put s
        GOTO TRAVEL
      CROSS.108:
        put s
        GOTO TRAVEL
      CROSS.109:
        put s
        GOTO TRAVEL
      CROSS.110:
        put s
        GOTO TRAVEL
      CROSS.111:
        put s
        GOTO TRAVEL
      CROSS.112:
        setVariable storecode Carti
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.CARTI:
        counter set 113
      CROSS.113:
        put s
        GOTO TRAVEL
      CROSS.114:
        put e
        GOTO TRAVEL
      CROSS.115:
        setVariable storecode Chab
        setVariable entrance haber
        GOTO SETSTORE

    LEAVE.CHAB:
        GOTO %LorM%.CHAB.1
    LEAVE.CHAB.1:
        counter set 116
      CROSS.116:
        put n
        GOTO TRAVEL
      CROSS.117:
        put n
        GOTO TRAVEL
      CROSS.118:
        put n
        GOTO TRAVEL
      CROSS.119:
        put ne
        GOTO TRAVEL
      CROSS.120:
        put nw
        GOTO TRAVEL
      CROSS.121:
        put n
        GOTO TRAVEL
      CROSS.122:
        GOTO LEAVE.CHAB.CLAN.%clanoption%

    LEAVE.CHAB.CLAN.YES:
        put echo %TCherb% %TCpedd% %TCweap%
        put glance
        match LEAVE.CHAB.CLAN.NO nothing nothing nothing
        match LEAVE.CHAB.CLAN.YES.2 You glance
        GOTO UniversalMatch

    LEAVE.CHAB.CLAN.NO:
        setVariable clanoption NO
        GOTO LEAVE.CHAB.CLAN.NO.1
        
    LEAVE.CHAB.CLAN.YES.2:
        counter set 123
      CROSS.123:
        put w
        GOTO TRAVEL
      CROSS.124:
        put w
        GOTO TRAVEL
      CROSS.125:
        put w
        GOTO TRAVEL
      CROSS.126:
        put w
        GOTO TRAVEL
      CROSS.127:
        counter set 292
      CROSS.292:
        put go gate
        GOTO TRAVEL

      CROSS.293:
        counter set 1
        setVariable citycode TIGER
      TIGER.1:
        put go path
        GOTO TRAVEL
      TIGER.2:
        put w
        GOTO TRAVEL
      TIGER.3:
        put w
        GOTO TRAVEL
      TIGER.4:
        put nw
        GOTO TRAVEL
      TIGER.5:
        put w
        GOTO TRAVEL
      TIGER.6:
        put w
        GOTO TRAVEL
      TIGER.7:
        put nw
        GOTO TRAVEL
      TIGER.8:
        put w
        GOTO TRAVEL
      TIGER.9:
        put w
        GOTO TRAVEL
      TIGER.10:
        put sw
        GOTO TRAVEL
      TIGER.11:
        put w
        GOTO TRAVEL
      TIGER.12:
        put w
        GOTO TRAVEL
      TIGER.13:
        put nw
        GOTO TRAVEL
      TIGER.14:
        put nw
        GOTO TRAVEL
      TIGER.15:
        put w
        GOTO TRAVEL
      TIGER.16:
        put go gate
        GOTO TRAVEL
      TIGER.17:
        put s
        GOTO TRAVEL
      TIGER.18:
        setVariable storecode TCweap
        setVariable entrance building
        setVariable itemlocation %TCweapItemLoc%
        GOTO SETSTORE

    LEAVE.TCWEAP:
        counter set 19
      TIGER.19:
        put se
        GOTO TRAVEL
      TIGER.20:
        put s
        GOTO TRAVEL
      TIGER.21:
        put sw
        GOTO TRAVEL
      TIGER.22:
        counter set 57
      TIGER.57:
        put go wagon
        setVariable storecode TCpedd
        GOTO TRAVEL
      TIGER.58:
        setVariable entrance wagon
        GOTO SETSTORE

    ALTLEAVE.TCPEDD:
        counter set 55
      TIGER.55:
        put out
        GOTO TRAVEL
      TIGER.56:
    LEAVE.TCPEDD:
        counter set 23
      TIGER.23:
        match ALTLEAVE.TCPEDD referring
        put go green
        GOTO TRAVEL
      TIGER.24:
        put nw
        GOTO TRAVEL
      TIGER.25:
        put go toft
        GOTO TRAVEL
      TIGER.26:
        setVariable storecode TCherb
        setVariable entrance cottage
        GOTO SETSTORE

    LEAVE.TCHERB:
        counter set 27
      TIGER.27:
        put go path
        GOTO TRAVEL
      TIGER.28:
        put se
        GOTO TRAVEL
      TIGER.29:
        put n
        GOTO TRAVEL
      TIGER.30:
        put ne
        GOTO TRAVEL
      TIGER.31:
        put n
        GOTO TRAVEL
      TIGER.32:
        put nw
        GOTO TRAVEL
      TIGER.33:
        put n
        GOTO TRAVEL
      TIGER.34:
        put go gate
        GOTO TRAVEL
      TIGER.35:
        put e
        GOTO TRAVEL
      TIGER.36:
        put se
        GOTO TRAVEL
      TIGER.37:
        put se
        GOTO TRAVEL
      TIGER.38:
        put e
        GOTO TRAVEL
      TIGER.39:
        put e
        GOTO TRAVEL
      TIGER.40:
        put ne
        GOTO TRAVEL
      TIGER.41:
        put e
        GOTO TRAVEL
      TIGER.42:
        put e
        GOTO TRAVEL
      TIGER.43:
        put se
        GOTO TRAVEL
      TIGER.44:
        put e
        GOTO TRAVEL
      TIGER.45:
        put e
        GOTO TRAVEL
      TIGER.46:
        put se
        GOTO TRAVEL
      TIGER.47:
        put e
        GOTO TRAVEL
      TIGER.48:
        put e
        GOTO TRAVEL
      TIGER.49:
        put go path
        GOTO TRAVEL
      TIGER.50:
        put go gate
        GOTO TRAVEL
      TIGER.51:
        setVariable citycode CROSS
      CROSS.128:
        counter set 129
      CROSS.129:
        put e
        GOTO TRAVEL
      CROSS.130:
        put e
        GOTO TRAVEL
      CROSS.131:
        counter set 280
      CROSS.280:
        put e
        GOTO TRAVEL
      CROSS.281:
        put e
        GOTO TRAVEL
    LEAVE.CHAB.CLAN.NO.1:
        counter set 282
      CROSS.282:
        put e
        GOTO TRAVEL
      CROSS.283:
        put e
        GOTO TRAVEL
      CROSS.284:
        put e
        GOTO TRAVEL
      CROSS.285:
        put n
        GOTO TRAVEL
      CROSS.286:
        put n
        GOTO TRAVEL
      CROSS.287:
        put w
        GOTO TRAVEL
      CROSS.288:
        put go shed
        GOTO TRAVEL
      CROSS.289:
        put w
        GOTO TRAVEL
      CROSS.290:
        put w
        GOTO TRAVEL
      CROSS.291:
        setVariable storecode Ctann
        setVariable entrance shed
        GOTO SETSTORE

    MOVEON.CHAB.1:
        counter set 132
      CROSS.132:
        put n
        GOTO TRAVEL
      CROSS.133:
        put n
        GOTO TRAVEL
      CROSS.134:
        put n
        GOTO TRAVEL
      CROSS.135:
        put ne
        GOTO TRAVEL
      CROSS.136:
        setVariable storecode Cpawn
        put nw
        GOTO TRAVEL
      CROSS.137:
        put go shop
        GOTO TRAVEL
      CROSS.138:
        match CROSS.PAWN.TO.HOSPITAL hand which appears completely useless
        matchre PAWN.%DropOrStow% /mind lock|nearly locked/
        match LEAVE.CPAWN.%class% Time development
        put health
        put skill steal
        GOTO UniversalMatch

    LEAVE.CPAWN.THIEF:
        GOTO CROSSLETH.%lethcross%

    CROSSLETH.LETH:
    LEAVE.CPAWN.EMPATH:
    LEAVE.CPAWN.NONTHIEF:
        GOTO PAWN.%DropOrStow%

    CROSSLETH.CROSS:
        setVariable citycode LETH
        setVariable LorM leave
        setVariable MRS shopcheck1
        setVariable npcoption yes
        counter set 380
      LETH.380:
        put o
        GOTO TRAVEL
      LETH.381:
        put se
        GOTO TRAVEL
      LETH.382:
        put sw
        GOTO TRAVEL
      LETH.383:
        put s
        GOTO TRAVEL
      LETH.384:
        put s
        GOTO TRAVEL
      LETH.385:
        put s
        GOTO TRAVEL
      LETH.386:
        put s
        GOTO TRAVEL
      LETH.387:
        put e
        GOTO TRAVEL
      LETH.388:
        put e
        GOTO TRAVEL
      LETH.389:
        put e
        GOTO TRAVEL
      LETH.390:
        put se
        GOTO TRAVEL
      LETH.391:
        put e
        GOTO TRAVEL
      LETH.392:
        put go warehouse
        GOTO TRAVEL
      LETH.393:
        put s
        GOTO TRAVEL
      LETH.394:
        put go trap
        GOTO TRAVEL
      LETH.395:
        put go river
        GOTO TRAVEL
      LETH.396:
        put w
        GOTO TRAVEL
      LETH.397:
        put n
        GOTO TRAVEL
      LETH.398:
        put go panel
        GOTO TRAVEL
      LETH.399:
        put climb step
        GOTO TRAVEL
      LETH.400:
        put s
        GOTO TRAVEL
      LETH.401:
        put s
        GOTO TRAVEL
      LETH.402:
        put sw
        GOTO TRAVEL
      LETH.403:
        put sw
        GOTO TRAVEL
      LETH.404:
        put d
        GOTO TRAVEL
      LETH.405:
        put s
        GOTO TRAVEL
      LETH.406:
        put sw
        GOTO TRAVEL
      LETH.407:
        put sw
        GOTO TRAVEL
      LETH.408:
        put s
        GOTO TRAVEL
      LETH.409:
        put u
        GOTO TRAVEL
      LETH.410:
        put sw
        GOTO TRAVEL
      LETH.411:
        put w
        GOTO TRAVEL
      LETH.412:
        put sw
        GOTO TRAVEL
      LETH.413:
        put climb ladder
        GOTO TRAVEL
      LETH.414:
        put go gap
        GOTO TRAVEL
      LETH.415:
        put s
        GOTO TRAVEL
      LETH.416:
        put sw
        GOTO TRAVEL
      LETH.417:
        put sw
        GOTO TRAVEL
      LETH.418:
        put sw
        GOTO TRAVEL
      LETH.419:
        put sw
        GOTO TRAVEL
      LETH.420:
        put s
        GOTO TRAVEL
      LETH.421:
        put se
        GOTO TRAVEL
      LETH.422:
        put se
        GOTO TRAVEL
      LETH.423:
        put s
        GOTO TRAVEL
      LETH.424:
        put s
        GOTO TRAVEL
      LETH.425:
        put sw
        GOTO TRAVEL
      LETH.426:
        put sw
        GOTO TRAVEL
      LETH.427:
        put sw
        GOTO TRAVEL
      LETH.428:
        put s
        GOTO TRAVEL
      LETH.429:
        put se
        GOTO TRAVEL
      LETH.430:
        put sw
        GOTO TRAVEL
      LETH.431:
        put s
        GOTO TRAVEL
      LETH.432:
        put sw
        GOTO TRAVEL
      LETH.433:
        put s
        GOTO TRAVEL
      LETH.434:
        put s
        GOTO TRAVEL
      LETH.435:
        put se
        GOTO TRAVEL
      LETH.436:
        put se
        GOTO TRAVEL
      LETH.437:
        put sw
        GOTO TRAVEL
      LETH.438:
        put sw
        GOTO TRAVEL
      LETH.439:
        put sw
        GOTO TRAVEL
      LETH.440:
        put sw
        GOTO TRAVEL
      LETH.441:
        put s
        GOTO TRAVEL
      LETH.442:
        put sw
        GOTO TRAVEL
      LETH.443:
        put se
        GOTO TRAVEL
      LETH.444:
        put se
        GOTO TRAVEL
      LETH.445:
        put s
        GOTO TRAVEL
      LETH.446:
        put s
        GOTO TRAVEL
      LETH.447:
        put se
        GOTO TRAVEL
      LETH.448:
        put se
        GOTO TRAVEL
      LETH.449:
        put s
        GOTO TRAVEL
      LETH.450:
        put s
        GOTO TRAVEL
      LETH.451:
        put se
        GOTO TRAVEL
      LETH.452:
        put go gate
        GOTO TRAVEL
      LETH.453:
        GOTO LETH.START.NW

    CROSS.PAWN.TO.HOSPITAL:
        GOTO CROSS.PAWN.TO.HOSPITAL.%class%
    CROSS.PAWN.TO.HOSPITAL.THIEF:
    CROSS.PAWN.TO.HOSPITAL.NONTHIEF:
        counter set 294
      CROSS.294:
        put out
        GOTO TRAVEL
      CROSS.295:
        put n
        GOTO TRAVEL
      CROSS.296:
        put e
        GOTO TRAVEL
      CROSS.297:
        put e
        GOTO TRAVEL
      CROSS.298:
        put e
        GOTO TRAVEL
      CROSS.299:
        put e
        GOTO TRAVEL
      CROSS.300:
        put e
        GOTO TRAVEL
      CROSS.301:
        put e
        GOTO TRAVEL
      CROSS.302:
        put e
        GOTO TRAVEL
      CROSS.303:
        put n
        GOTO TRAVEL
      CROSS.304:
        put go arch
        GOTO TRAVEL
      CROSS.305:
        GOTO CROSS.HOSPITAL

    CROSS.HOSPITAL.TO.RESUME:
    CROSS.HOSPITAL.EMPATH:
        counter set 306
      CROSS.306:
        put go arch
        GOTO TRAVEL
      CROSS.307:
        put s
        GOTO TRAVEL
      CROSS.308:
        put w
        GOTO TRAVEL
      CROSS.309:
        put w
        GOTO TRAVEL
      CROSS.310:
        put w
        GOTO TRAVEL
      CROSS.311:
        put w
        GOTO TRAVEL
      CROSS.312:
        put w
        GOTO TRAVEL
      CROSS.313:
        put w
        GOTO TRAVEL
      CROSS.314:
        put go bridge
        GOTO TRAVEL
      CROSS.315:
        put w
        GOTO TRAVEL
      CROSS.316:
        put s
        GOTO TRAVEL
      CROSS.327:
        counter set 317
      CROSS.317:
        put s
        GOTO TRAVEL
      CROSS.318:
        put s
        GOTO TRAVEL
      CROSS.319:
        put s
        GOTO TRAVEL
      CROSS.320:
        put s
        GOTO TRAVEL
      CROSS.321:
        put s
        GOTO TRAVEL
      CROSS.322:
        put s
        GOTO TRAVEL
      CROSS.323:
        GOTO CROSS.HOSPITAL.%class%

    CROSS.HOSPITAL.THIEF:
    CROSS.HOSPITAL.NONTHIEF:
        put join list
        match CROSS.HOSPITAL.TO.RESUME crosses your name off the waiting list.
        GOTO UniversalMatch

    CROSS.PAWN.TO.HOSPITAL.EMPATH:
        counter set 324
      CROSS.324:
        put out
        GOTO TRAVEL
      CROSS.325:
        setVariable SelfHealLoc Cpawn
        GOTO EMPATH.HEALSELF

    CROSS.EMPATH.TO.RESUME.FROM.CPAWN:
        counter set 326
      CROSS.326:
        put w
        GOTO TRAVEL


##################################################################
#####                                                        #####
#####             ARTHE DALE STARTING POSITION               #####
#####                                                        #####
##################################################################


    ARTHE.START.WEAP:
        counter set 66
        setVariable storecode ADweap
        GOTO START

    ARTHE.START.BARD:
        counter set 16
        setVariable storecode ADbard
        put out
        GOTO START

    ARTHE.START.ODD:
        counter set 18
        setVariable storecode ADodd
        put out
        GOTO START

    ARTHE.START.FASH:
        counter set 20
        setVariable storecode ADfash
        put out
        GOTO START

    ARTHE.START.THREAD:
        counter set 21
        setVariable storecode ADthread
        put out
        GOTO START

    ARTHE.START.TART:
        counter set 41
        setVariable storecode ADtartE
        GOTO START

    ARTHE.START.MAP:
        counter set 56
        setVariable storecode ADmap
        put out
        GOTO START

    ARTHE.START.SMOK:
        counter set 60
        setVariable storecode ADsmok
        GOTO START

    ARTHE.START.FETA:
        counter set 67
        setVariable storecode ADfeta
        GOTO START

      CROSS.156:
        counter set 156
        put n
        GOTO TRAVEL
      CROSS.157:
        put n
        GOTO TRAVEL
      CROSS.158:
        put n
        GOTO TRAVEL
      CROSS.159:
        put ne
        GOTO TRAVEL
      CROSS.160:
        put ne
        GOTO TRAVEL
      CROSS.161:
        put n
        GOTO TRAVEL
      CROSS.162:
        put nw
        GOTO TRAVEL
      CROSS.163:
        put nw
        GOTO TRAVEL
      CROSS.164:
        put n
        GOTO TRAVEL
      CROSS.165:
        put n
        GOTO TRAVEL
      CROSS.166:
        put ne
        GOTO TRAVEL
      CROSS.167:
        put nw
        GOTO TRAVEL
      CROSS.168:
        put n
        GOTO TRAVEL
      CROSS.169:
        put n
        GOTO TRAVEL
      CROSS.170:
        counter set 1
        setVariable citycode ARTHE
      ARTHE.1:
        put e
        GOTO TRAVEL
      ARTHE.2:
        put down
        GOTO TRAVEL
      ARTHE.3:
        put down
        GOTO TRAVEL
      ARTHE.4:
        put go gate
        GOTO TRAVEL

    ARTHE.START.GATE:
        counter set 5
      ARTHE.5:
        put n
        GOTO TRAVEL
      ARTHE.6:
        put n
        GOTO TRAVEL
      ARTHE.7:
        put n
        GOTO TRAVEL
      ARTHE.8:
        put n
        GOTO TRAVEL
      ARTHE.9:
        put e
        GOTO TRAVEL
      ARTHE.10:
        put e
        GOTO TRAVEL
      ARTHE.11:
        put e
        GOTO TRAVEL
      ARTHE.12:
        put ne
        GOTO TRAVEL
      ARTHE.13:
        put ne
        GOTO TRAVEL
      ARTHE.14:
        counter set 100
      ARTHE.100:
        put e
        GOTO TRAVEL
      ARTHE.101:
        setVariable storecode ADmap
        setVariable entrance door
        GOTO SETSTORE

      ARTHE.35:
        put e
        GOTO TRAVEL
      ARTHE.36:
        put n
        GOTO TRAVEL
      ARTHE.37:
        put e
        GOTO TRAVEL
      ARTHE.38:
        put e
        GOTO TRAVEL
      ARTHE.39:
        put ne
        GOTO TRAVEL
      ARTHE.40:
        put go knoll
        GOTO TRAVEL
      ARTHE.41:
        setVariable storecode ADtartE
        setVariable entrance w
        GOTO SETSTORE


##################################################################
#####                                                        #####
#####              ARTHE DALE LEAVING SHOPS                  #####
#####                                                        #####
##################################################################


    LEAVE.ADTARTE:
        counter set 73
      ARTHE.73:
        put w
        GOTO TRAVEL
      ARTHE.74:
        put n
        GOTO TRAVEL
      ARTHE.75:
    ALTLEAVE.ADTARTE:
        setVariable storecode ADtartC
        setVariable entrance n
        GOTO SETSTORE

    LEAVE.ADTARTC:
        counter set 44
      ARTHE.44:
        put e
        GOTO TRAVEL
      ARTHE.45:
    ALTLEAVE.ADTARTC:
        setVariable storecode ADtartM
        setVariable entrance e
        GOTO SETSTORE

    LEAVE.ADTARTM:
        counter set 46
      ARTHE.46:
        put n
        GOTO TRAVEL
      ARTHE.47:
    ALTLEAVE.ADTARTM:
        setVariable storecode ADtartL
        setVariable entrance n
        GOTO SETSTORE

    LEAVE.ADTARTL:
        counter set 48
      ARTHE.48:
        put se
        GOTO TRAVEL
      ARTHE.49:
    ALTLEAVE.ADTARTL:
        setVariable storecode ADtartF
        setVariable entrance se
        GOTO SETSTORE

    ALTLEAVE.ADTARTF:
    LEAVE.ADTARTF:
        counter set 50
      ARTHE.50:
        put sw
        GOTO TRAVEL
      ARTHE.51:
        put go door
        GOTO TRAVEL
      ARTHE.52:
        put sw
        GOTO TRAVEL
      ARTHE.53:
        put w
        GOTO TRAVEL
      ARTHE.54:
        put w
        GOTO TRAVEL
      ARTHE.55:
        put s
        GOTO TRAVEL
      ARTHE.56:
        setVariable storecode ADmap
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.ADMAP:
        counter set 57
      ARTHE.57:
        put go door
        GOTO TRAVEL
      ARTHE.58:
        put w
        GOTO TRAVEL
      ARTHE.59:
        put climb stair
        GOTO TRAVEL
      ARTHE.60:
        setVariable storecode ADsmok
        setVariable entrance climb stair
        GOTO SETSTORE

    ALTLEAVE.ADSMOK:
    LEAVE.ADSMOK:
        counter set 62
      ARTHE.61:
        put climb stair
        GOTO TRAVEL
      ARTHE.63:
        put e
        GOTO TRAVEL
      ARTHE.64:
        put o
        GOTO TRAVEL
      ARTHE.65:
        put w
        GOTO TRAVEL
      ARTHE.66:
        put go shack
        GOTO TRAVEL
      ARTHE.67:
        setVariable storecode ADfeta
        setVariable entrance shack
        GOTO SETSTORE

    ALTLEAVE.ADFETA:
        counter set 68
      ARTHE.68:
        put out
        GOTO TRAVEL
      ARTHE.69:
    LEAVE.ADFETA:
        counter set 70
      ARTHE.70:
        put sw
        match ALTLEAVE.ADFETA You can't go
        GOTO TRAVEL
      ARTHE.71:
        setVariable storecode ADweap
        put go entry
        GOTO TRAVEL
      ARTHE.72:
        setVariable entrance entry
        GOTO SETSTORE

    ALTLEAVE.ADWEAP:
        counter set 32
      ARTHE.32:
        put out
        GOTO TRAVEL
      ARTHE.33:
    LEAVE.ADWEAP:
        counter set 15
      ARTHE.15:
        put sw
        match ALTLEAVE.ADWEAP You can't go
        GOTO TRAVEL
      ARTHE.16:
        setVariable storecode ADbard
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.ADBARD:
        counter set 17
      ARTHE.17:
        put w
        GOTO TRAVEL
      ARTHE.18:
        setVariable storecode ADodd
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.ADODD:
        counter set 19
      ARTHE.19:
        put w
        GOTO TRAVEL
      ARTHE.20:
        setVariable storecode ADthread
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.ADTHREAD:
      ARTHE.21:
        setVariable storecode ADfash
        setVariable entrance cottage
        GOTO SETSTORE

    LEAVE.ADFASH:
        counter set 22
      ARTHE.22:
        put w
        GOTO TRAVEL
      ARTHE.23:
        put s
        GOTO TRAVEL
      ARTHE.24:
        put s
        GOTO TRAVEL
      ARTHE.25:
        put s
        GOTO TRAVEL
      ARTHE.26:
        put s
        GOTO TRAVEL
      ARTHE.27:
        put go gate
        GOTO TRAVEL
      ARTHE.28:
        put up
        GOTO TRAVEL
      ARTHE.29:
        put up
        GOTO TRAVEL
      ARTHE.30:
        put w
        GOTO TRAVEL
      ARTHE.31:
        counter set 171
        setVariable citycode CROSS
      CROSS.171:
        put s
        GOTO TRAVEL
      CROSS.172:
        put s
        GOTO TRAVEL
      CROSS.173:
        put se
        GOTO TRAVEL
      CROSS.174:
        put sw
        GOTO TRAVEL
      CROSS.175:
        put s
        GOTO TRAVEL
      CROSS.176:
        put s
        GOTO TRAVEL
      CROSS.177:
        put se
        GOTO TRAVEL
      CROSS.178:
        put se
        GOTO TRAVEL
      CROSS.179:
        put s
        GOTO TRAVEL
      CROSS.180:
        put sw
        GOTO TRAVEL
      CROSS.181:
        put sw
        GOTO TRAVEL
      CROSS.182:
        put s
        GOTO TRAVEL
      CROSS.183:
        put s
        GOTO TRAVEL
      CROSS.184:
        put s
        GOTO TRAVEL
      CROSS.185:
        put go gate
        GOTO TRAVEL
      CROSS.186:
        counter set 276
      CROSS.276:
        put w
        GOTO TRAVEL
      CROSS.277:
        put s
        GOTO TRAVEL
      CROSS.278:
        put s
        GOTO TRAVEL
      CROSS.279:
        setVariable storecode Ccobb
        setVariable entrance shop
        GOTO SETSTORE


##################################################################
#####                                                        #####
#####            LETH DERIEL STARTING POSITION               #####
#####                                                        #####
##################################################################


    LETH.START.MORIKAI:
        counter set 95
        setVariable storecode Lmorik
        put out
        GOTO START

    LETH.START.PERFUME:
        counter set 26
        setVariable storecode Lperf
        put out
        GOTO START

    LETH.START.GENERAL:
        counter set 33
        setVariable storecode Lgen
        put out
        GOTO START

    LETH.START.BOWYER:
        counter set 89
        setVariable storecode Lbow
        put out
        GOTO START

    LETH.START.WEAPON:
        counter set 80
        setVariable storecode Lweap
        GOTO START

    LETH.START.WICKER:
        counter set 103
        setVariable storecode Lwick
        put out
        GOTO START

    LETH.START.CLOTH:
        counter set 47
        setVariable storecode Lcloth
        put out
        GOTO START

    LETH.START.BARD:
        counter set 71
        setVariable storecode Lbard
        put out
        GOTO START

    LETH.START.WOOD:
        counter set 67
        setVariable storecode Lwood
        put go door
        GOTO START

    LETH.START.ORIGAMI:
        counter set 42
        setVariable storecode Lgami
        put out
        GOTO START

    LETH.START.NW:
        counter set 1
      LETH.1:
        put se
        GOTO TRAVEL
      LETH.2:
        put sw
        GOTO TRAVEL
      LETH.3:
        put go hut
        GOTO TRAVEL
      LETH.4:
        GOTO LETH.START.MORIKAI

    LETH.START.SW:
        counter set 5
      LETH.5:
        put ne
        GOTO TRAVEL
      LETH.6:
        put se
        GOTO TRAVEL
      LETH.7:
        put se
        GOTO TRAVEL
      LETH.8:
        put go hut
        GOTO TRAVEL
      LETH.9:
        GOTO LETH.START.WICKER

    LETH.START.TOWNCENTER:
        counter set 10
      LETH.10:
        put s
        GOTO TRAVEL
      LETH.11:
        put s
        GOTO TRAVEL
      LETH.12:
        put go hole
        GOTO TRAVEL
      LETH.13:
        GOTO LETH.START.CLOTH


##################################################################
#####                                                        #####
#####             LETH DERIEL LEAVING SHOPS                  #####
#####                                                        #####
##################################################################


    LEAVE.LMORIK:
        GOTO %LorM%.LMORIK.1
    LEAVE.LMORIK.1:
        counter set 18
      LETH.18:
        put ne
        GOTO TRAVEL
      LETH.19:
        put se
        GOTO TRAVEL
      LETH.20:
        put se
        GOTO TRAVEL
      LETH.21:
        put se
        GOTO TRAVEL
      LETH.22:
        put se
        GOTO TRAVEL
      LETH.23:
        put se
        GOTO TRAVEL
      LETH.24:
        put ne
        GOTO TRAVEL
      LETH.25:
        put go path
        GOTO TRAVEL
      LETH.26:
        setVariable storecode Lperf
        setVariable entrance shack
        GOTO SETSTORE

    LEAVE.LPERF:
        counter set 27
      LETH.27:
        put go path
        GOTO TRAVEL
      LETH.28:
        put se
        GOTO TRAVEL
      LETH.29:
        put s
        GOTO TRAVEL
      LETH.30:
        put e
        GOTO TRAVEL
      LETH.31:
        put e
        GOTO TRAVEL
      LETH.32:
        put e
        GOTO TRAVEL
      LETH.33:
        setVariable storecode Lgen
        setVariable entrance stump
        GOTO SETSTORE

    LEAVE.LGEN:
        counter set 34
      LETH.34:
        put w
        GOTO TRAVEL
      LETH.35:
        put w
        GOTO TRAVEL
      LETH.36:
        put w
        GOTO TRAVEL
      LETH.37:
        put w
        GOTO TRAVEL
      LETH.38:
        put w
        GOTO TRAVEL
      LETH.39:
        put w
        GOTO TRAVEL
      LETH.40:
        put w
        GOTO TRAVEL
      LETH.41:
        put se
        GOTO TRAVEL
      LETH.42:
        setVariable storecode Lgami
        setVariable entrance tent
        GOTO SETSTORE

    LEAVE.LGAMI:
        counter set 43
      LETH.43:
        put se
        GOTO TRAVEL
      LETH.44:
        put se
        GOTO TRAVEL
      LETH.45:
        put se
        GOTO TRAVEL
      LETH.46:
        put n
        GOTO TRAVEL
      LETH.47:
        setVariable storecode Lcloth
        setVariable entrance hole
        GOTO SETSTORE

    LEAVE.LCLOTH:
        counter set 65
      LETH.65:
        put s
        GOTO TRAVEL
      LETH.66:
        put ne
        GOTO TRAVEL
      LETH.67:
        setVariable storecode Lwood
        setVariable entrance door
        GOTO SETSTORE

    ALTLEAVE.LWOOD:
        counter set 48
      LETH.48:
        put go door
        GOTO TRAVEL
      LETH.49:
    LEAVE.LWOOD:
        counter set 68
      LETH.68:
        put sw
        GOTO TRAVEL
      LETH.69:
        put s
        GOTO TRAVEL
      LETH.70:
        put s
        GOTO TRAVEL
      LETH.71:
        setVariable storecode Lbard
        setVariable entrance knot
        GOTO SETSTORE

    LEAVE.LBARD:
        counter set 100
      LETH.100:
        put s
        GOTO TRAVEL
      LETH.101:
        put w
        GOTO TRAVEL
      LETH.102:
        put nw
        GOTO TRAVEL
      LETH.103:
        setVariable storecode Lwick
        setVariable entrance hut
        GOTO SETSTORE

    LEAVE.LWICK:
        counter set 75
      LETH.75:
        put nw
        GOTO TRAVEL
      LETH.76:
        put nw
        GOTO TRAVEL
      LETH.77:
        put ne
        GOTO TRAVEL
      LETH.78:
        put climb stair
        GOTO TRAVEL
      LETH.79:
        put go shack
        GOTO TRAVEL
      LETH.80:
        setVariable storecode Lweap
        setVariable entrance shack
        GOTO SETSTORE

    ALTLEAVE.LWEAP:
        counter set 465
      LETH.465:
        put out
        GOTO TRAVEL
      LETH.466:
    LEAVE.LWEAP:
        counter set 81
      LETH.81:
        match ALTLEAVE.LWEAP referring
        put climb stair
        GOTO TRAVEL
      LETH.82:
        put sw
        GOTO TRAVEL
      LETH.83:
        put nw
        GOTO TRAVEL
      LETH.84:
        put nw
        GOTO TRAVEL
      LETH.85:
        put nw
        GOTO TRAVEL
      LETH.86:
        put n
        GOTO TRAVEL
      LETH.87:
        put e
        GOTO TRAVEL
      LETH.88:
        put go path
        GOTO TRAVEL
      LETH.89:
        setVariable storecode Lbow
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.LBOW:
        counter set 90
      LETH.90:
        put go path
        GOTO TRAVEL
      LETH.91:
        put w
        GOTO TRAVEL
      LETH.92:
        put n
        GOTO TRAVEL
      LETH.93:
        put ne
        GOTO TRAVEL
      LETH.94:
        put ne
        GOTO TRAVEL
      LETH.95:
        setVariable storecode Lmorik
        setVariable entrance hut
        GOTO SETSTORE

##################################################################
#####                                                        #####
#####              LETH DERIEL MOVEON COORDS                 #####
#####                                                        #####
##################################################################


    MOVEON.LMORIK.1:
        GOTO LETH.MOVEON.%class

    LETH.MOVEON.EMPATH:
    LETH.MOVEON.NONTHIEF:
        counter set 455
      LETH.455:
        put ne
        GOTO TRAVEL
      LETH.456:
        put se
        GOTO TRAVEL
      LETH.457:
        put se
        GOTO TRAVEL
      LETH.458:
        put se
        GOTO TRAVEL
      LETH.459:
        put se
        GOTO TRAVEL
      LETH.460:
        put se
        GOTO TRAVEL
      LETH.461:
        put se
        GOTO TRAVEL
      LETH.462:
        put e
        GOTO TRAVEL
      LETH.463:
        put go door
        GOTO TRAVEL
      LETH.464:
        GOTO PAWN.%DropOrStow%

    LETH.MOVEON.THIEF:
        counter set 298
      LETH.298:
        put ne
        GOTO TRAVEL
      LETH.299:
        put nw
        GOTO TRAVEL
      LETH.300:
        put go gate
        GOTO TRAVEL
      LETH.301:
        put nw
        GOTO TRAVEL
      LETH.302:
        put n
        GOTO TRAVEL
      LETH.303:
        put n
        GOTO TRAVEL
      LETH.304:
        put nw
        GOTO TRAVEL
      LETH.305:
        put nw
        GOTO TRAVEL
      LETH.306:
        put n
        GOTO TRAVEL
      LETH.307:
        put n
        GOTO TRAVEL
      LETH.308:
        put nw
        GOTO TRAVEL
      LETH.309:
        put nw
        GOTO TRAVEL
      LETH.310:
        put ne
        GOTO TRAVEL
      LETH.311:
        put n
        GOTO TRAVEL
      LETH.312:
        put ne
        GOTO TRAVEL
      LETH.313:
        put ne
        GOTO TRAVEL
      LETH.314:
        put ne
        GOTO TRAVEL
      LETH.315:
        put ne
        GOTO TRAVEL
      LETH.316:
        put nw
        GOTO TRAVEL
      LETH.317:
        put nw
        GOTO TRAVEL
      LETH.318:
        put n
        GOTO TRAVEL
      LETH.319:
        put n
        GOTO TRAVEL
      LETH.320:
        put ne
        GOTO TRAVEL
      LETH.321:
        put n
        GOTO TRAVEL
      LETH.322:
        put ne
        GOTO TRAVEL
      LETH.323:
        put nw
        GOTO TRAVEL
      LETH.324:
        put n
        GOTO TRAVEL
      LETH.325:
        put ne
        GOTO TRAVEL
      LETH.326:
        put ne
        GOTO TRAVEL
      LETH.327:
        put ne
        GOTO TRAVEL
      LETH.328:
        put n
        GOTO TRAVEL
      LETH.329:
        put n
        GOTO TRAVEL
      LETH.330:
        put nw
        GOTO TRAVEL
      LETH.331:
        put nw
        GOTO TRAVEL
      LETH.332:
        put n
        GOTO TRAVEL
      LETH.333:
        put ne
        GOTO TRAVEL
      LETH.334:
        put ne
        GOTO TRAVEL
      LETH.335:
        put ne
        GOTO TRAVEL
      LETH.336:
        put ne
        GOTO TRAVEL
      LETH.337:
        put n
        GOTO TRAVEL
      LETH.338:
##    Thief passage
        match END I could not find
        put go bould
        GOTO TRAVEL
      LETH.339:
        put go root
        GOTO TRAVEL
      LETH.340:
        put ne
        GOTO TRAVEL
      LETH.341:
        put e
        GOTO TRAVEL
      LETH.342:
        put ne
        GOTO TRAVEL
      LETH.343:
        put d
        GOTO TRAVEL
      LETH.344:
        put n
        GOTO TRAVEL
      LETH.345:
        put ne
        GOTO TRAVEL
      LETH.346:
        put ne
        GOTO TRAVEL
      LETH.347:
        put n
        GOTO TRAVEL
      LETH.348:
        put u
        GOTO TRAVEL
      LETH.349:
        put ne
        GOTO TRAVEL
      LETH.350:
        put ne
        GOTO TRAVEL
      LETH.351:
        put n
        GOTO TRAVEL
      LETH.352:
        put n
        GOTO TRAVEL
      LETH.353:
        put climb step
        GOTO TRAVEL
      LETH.354:
        put out
        GOTO TRAVEL
      LETH.355:
        put s
        GOTO TRAVEL
      LETH.356:
        put e
        GOTO TRAVEL
      LETH.357:
        put go ware
        GOTO TRAVEL
      LETH.358:
        put u
        GOTO TRAVEL
      LETH.359:
        put n
        GOTO TRAVEL
      LETH.360:
        put out
        GOTO TRAVEL
      LETH.361:
        put w
        GOTO TRAVEL
      LETH.362:
        put nw
        GOTO TRAVEL
      LETH.363:
        put w
        GOTO TRAVEL
      LETH.364:
        put w
        GOTO TRAVEL
      LETH.365:
        put w
        GOTO TRAVEL
      LETH.366:
        put w
        GOTO TRAVEL
      LETH.367:
        GOTO LETHCROSS.%lethcross

    LETHCROSS.LETH:
        counter set 378
      LETH.378:
        put go house
        GOTO TRAVEL
      LETH.379:
        setVariable MRS shopcheck1
        setVariable LorM leave
        setVariable npcoption yes
        setVariable citycode CROSS
        GOTO CROSS.START.GUARD

    LETHCROSS.CROSS:
        counter set 369
      LETH.369:
        put n
        GOTO TRAVEL
      LETH.370:
        put n
        GOTO TRAVEL
      LETH.371:
        put n
        GOTO TRAVEL
      LETH.372:
        put n
        GOTO TRAVEL
      LETH.373:
        put n
        GOTO TRAVEL
      LETH.374:
        put n
        GOTO TRAVEL
      LETH.375:
        put e
        GOTO TRAVEL
      LETH.376:
        put go shop
        GOTO TRAVEL
      LETH.377:
        setVariable citycode CROSS
        GOTO PAWN.%DropOrStow%


##################################################################
#####                                                        #####
#####                  ALTERNATE EXITS                       #####
#####                                                        #####
##################################################################


    ALTLEAVE.CCOBB:
    ALTLEAVE.CALCH:
    ALTLEAVE.CBOTA:
    ALTLEAVE.CBLOSS:
    ALTLEAVE.CGEN:
    ALTLEAVE.CGEM:
    ALTLEAVE.CWEAP:
    ALTLEAVE.CARM:
    ALTLEAVE.CBARD:
    ALTLEAVE.CLOCK:
    ALTLEAVE.CCLERIC:
    ALTLEAVE.CHAB:
    ALTLEAVE.CSTIT:
    ALTLEAVE.CBATH:
        GOTO MOVEERROR


##################################################################
#####                                                        #####
#####                   ZOLUREN BINNING                      #####
#####                                                        #####
##################################################################


    CROSS.PAWNFINISH.NONTHIEF:
    CROSS.PAWNFINISH.EMPATH:
    LETH.PAWNFINISH.NONTHIEF:
    LETH.PAWNFINISH.EMPATH:
    LETH.PAWN.EMPATH:
    LETH.PAWN.NONTHIEF:
        GOTO END

    CROSS.PAWNFINISH.THIEF:
        counter set 187
      CROSS.187:
        put out
        GOTO TRAVEL
      CROSS.188:
        put n
        GOTO TRAVEL
      CROSS.189:
        put w
        GOTO TRAVEL
      CROSS.190:
        put w
        GOTO TRAVEL
      CROSS.191:
        put w
        GOTO TRAVEL
      CROSS.192:
        put s
        GOTO TRAVEL
      CROSS.193:
        put s
        GOTO TRAVEL
      CROSS.194:
        put s
        GOTO TRAVEL
      CROSS.195:
        put s
        GOTO TRAVEL
      CROSS.196:
        put s
        GOTO TRAVEL
      CROSS.197:
        put s
        GOTO TRAVEL
      CROSS.198:
        put w
        GOTO TRAVEL
      CROSS.199:
        put w
        GOTO TRAVEL
      CROSS.200:
        put w
        GOTO TRAVEL
      CROSS.201:
        put go ruin
        GOTO TRAVEL
      CROSS.202:
        put w
        GOTO TRAVEL
      CROSS.203:
        put go space
        GOTO TRAVEL
      CROSS.204:
        GOTO PAWN.BIN

    CROSS.BINFINISH.THIEF:
        counter set 205
      CROSS.205:
        put go nich
        GOTO TRAVEL
      CROSS.206:
        put e
        GOTO TRAVEL
      CROSS.207:
        put go door
        GOTO TRAVEL
      CROSS.208:
        put e
        GOTO TRAVEL
      CROSS.209:
        put e
        GOTO TRAVEL
      CROSS.210:
        put e
        GOTO TRAVEL
      CROSS.211:
        put n
        GOTO TRAVEL
      CROSS.212:
        put n
        GOTO TRAVEL
      CROSS.213:
        put n
        GOTO TRAVEL
      CROSS.214:
        put n
        GOTO TRAVEL
      CROSS.215:
        put n
        GOTO TRAVEL
      CROSS.216:
        put n
        GOTO TRAVEL
      CROSS.217:
        put e
        GOTO TRAVEL
      CROSS.218:
        put e
        GOTO TRAVEL
      CROSS.219:
        put e
        GOTO TRAVEL
      CROSS.220:
        put s
        GOTO TRAVEL
      CROSS.221:
        put go shop
        GOTO TRAVEL
      CROSS.222:
        GOTO END

    ARTHE.BINFINISH.THIEF:
    ARTHE.BINFINISH.NONTHIEF:
    ARTHE.BINFINISH.EMPATH:
        GOTO END



##################################################################
#####                                                        #####
#####              ZOLUREN JUSTICE AND RESUMING              #####
#####                                                        #####
##################################################################


    CROSS.ITEMCHECK:
        put drop my small sack
        wait
        match CROSS.DEBT2 You have nothing
        match CROSS.FREE2 INVENTORY HELP
        put inv
        GOTO UniversalMatch

    ARTHE.DEBT:
        setVariable citycode CROSS
    CROSS.DEBT:
        counter set 223
      CROSS.223:
        put w
        GOTO TRAVEL
      CROSS.224:
        put w
        GOTO TRAVEL
    CROSS.DEBT2:
        counter set 225
      CROSS.225:
        put out
        GOTO TRAVEL
      CROSS.226:
        put e
        GOTO TRAVEL
      CROSS.227:
        put e
        GOTO TRAVEL
      CROSS.228:
        put e
        GOTO TRAVEL
      CROSS.229:
        put e
        GOTO TRAVEL
      CROSS.230:
        put se
        GOTO TRAVEL
      CROSS.231:
        put e
        GOTO TRAVEL
      CROSS.232:
        put s
        GOTO TRAVEL
      CROSS.233:
        put s
        GOTO TRAVEL
      CROSS.234:
        put go bridge
        GOTO TRAVEL
      CROSS.235:
        put ne
        GOTO TRAVEL
      CROSS.236:
        put go bank
        GOTO TRAVEL
      CROSS.237:
        put go win
        GOTO TRAVEL
      CROSS.238:
        put wit 500 bronze kronar
        wait
        counter set 239
      CROSS.239:
        put out
        GOTO TRAVEL
      CROSS.240:
        put out
        GOTO TRAVEL
      CROSS.241:
        put nw
        GOTO TRAVEL
      CROSS.242:
        put n
        GOTO TRAVEL
      CROSS.243:
        put e
        GOTO TRAVEL
      CROSS.244:
        put go hall
        GOTO TRAVEL
      CROSS.245:
        put go coll off
        GOTO TRAVEL
      CROSS.246:
        put pay 5000
        wait
        counter set 247
      CROSS.247:
        put out
        GOTO TRAVEL
      CROSS.248:
        put out
        GOTO TRAVEL
      CROSS.249:
        put w
        GOTO TRAVEL
      CROSS.250:
        put s
        GOTO TRAVEL
      CROSS.251:
        put se
        GOTO TRAVEL
      CROSS.252:
        put go bank
        GOTO TRAVEL
      CROSS.253:
        put go win
        GOTO TRAVEL
      CROSS.254:
        put dep all
        wait
        counter set 255
      CROSS.255:
        put out
        GOTO TRAVEL
      CROSS.256:
        put out
        GOTO TRAVEL
      CROSS.257:
        put sw
        GOTO TRAVEL
      CROSS.258:
        put go bridge
        GOTO TRAVEL
      CROSS.259:
        put n
        GOTO TRAVEL
      CROSS.260:
        put n
        GOTO TRAVEL
      CROSS.261:
        put w
        GOTO TRAVEL
      CROSS.262:
        put nw
        GOTO TRAVEL
      CROSS.263:
        put w
        GOTO TRAVEL
      CROSS.264:
        put w
        GOTO TRAVEL
      CROSS.265:
        put w
        GOTO TRAVEL
      CROSS.266:
        put w
        GOTO TRAVEL
      CROSS.267:
        put go house
        GOTO TRAVEL
      CROSS.268:
        GOTO GETSACK

    ARTHE.FREE:
        setVariable citycode CROSS
    CROSS.FREE:
        counter set 269
      CROSS.269:
        put w
        GOTO TRAVEL
      CROSS.270:
        put w
        GOTO TRAVEL
      CROSS.271:
        GOTO GETSACK

    CROSS.FREE2:
        pause 1
        match CROSS.MISSINGSTART waitandsee
        match CROSS.FREE3 okstart
        put echo %startlocation
        put echo okstart
        GOTO UniversalMatch

    CROSS.MISSINGSTART:
        setVariable startlocation Chab
        setVariable ResumeStore Chab
        GOTO CROSS.FREE3

    CROSS.FREE3:
        counter set 272
      CROSS.272:
        put out
        GOTO TRAVEL
      CROSS.273:
        put e
        GOTO TRAVEL
      CROSS.274:
        put n
        GOTO TRAVEL
      CROSS.275:
        counter set 1
        setVariable storecode Chab
        GOTO RESUME.%ResumeStore%

    RESUME.CARTI:
        counter add 1
    RESUME.CLOCK:
        counter add 1
    RESUME.CBATH:
        counter add 1
    RESUME.CBARD:
        counter add 1
    RESUME.CCLERIC:
        counter add 1
    RESUME.CSTIT:
        counter add 1
    RESUME.CGEM:
        counter add 1
    RESUME.CGEN:
        counter add 1
    RESUME.CARM:
        counter add 1
    RESUME.CWEAP:
        counter add 1
    RESUME.CBLOSS:
        counter add 1
    RESUME.CCOBB:
        counter add 1
    RESUME.ADFASH:
        counter add 1
    RESUME.ADTHREAD:
        counter add 1
    RESUME.ADODD:
        counter add 1
    RESUME.ADBARD:
        counter add 1
    RESUME.ADWEAP:
        counter add 1
    RESUME.ADFETA:
        counter add 1
    RESUME.ADSMOK:
        counter add 1
    RESUME.ADMAP:
        counter add 1
    RESUME.ADTARTF:
        counter add 1
    RESUME.ADTARTL:
        counter add 1
    RESUME.ADTARTM:
        counter add 1
    RESUME.ADTARTC:
        counter add 1
    RESUME.ADTARTE:
        counter add 1
    RESUME.CBOTA:
        counter add 1
    RESUME.CALCH:
        counter add 1
    RESUME.CTANN:
        counter add 1
        GOTO RESUME.ZOL.CLAN.%clanoption%

    RESUME.ZOL.CLAN.YES:
    RESUME.TCHERB:
        counter add 1
    RESUME.TCPEDD:
        counter add 1
    RESUME.TCWEAP:
        counter add 1
    RESUME.ZOL.CLAN.NO:
    RESUME.CHAB:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


##################################################################
#####                                                        #####
#####          LETH DERIEL JUSTICE AND RESUMING              #####
#####                                                        #####
##################################################################


    LETH.ITEMCHECK:
        put drop my small sack
        wait
        match LETH.DEBT2 You have nothing
        match LETH.FREE2 INVENTORY HELP
        put inv
        GOTO UniversalMatch

    LETH.DEBT:
        counter set 198
      LETH.198:
        put u
        GOTO TRAVEL
    LETH.DEBT2:
        counter set 199
      LETH.199:
        put out
        GOTO TRAVEL
      LETH.200:
        put se
        GOTO TRAVEL
      LETH.201:
        put se
        GOTO TRAVEL
      LETH.202:
        put se
        GOTO TRAVEL
      LETH.203:
        put se
        GOTO TRAVEL
      LETH.204:
        put se
        GOTO TRAVEL
      LETH.205:
        put e
        GOTO TRAVEL
      LETH.206:
        put e
        GOTO TRAVEL
      LETH.207:
        put go door
        GOTO TRAVEL
      LETH.208:
        put up
        GOTO TRAVEL
      LETH.209:
        put wit 500 bronze kronar
        wait
      LETH.210:
        put down
        GOTO TRAVEL
      LETH.211:
        put out
        GOTO TRAVEL
      LETH.212:
        put w
        GOTO TRAVEL
      LETH.213:
        put w
        GOTO TRAVEL
      LETH.214:
        put go burl
        GOTO TRAVEL
      LETH.215:
        put go door
        GOTO TRAVEL
      LETH.216:
        put up
        GOTO TRAVEL
      LETH.217:
        put up
        GOTO TRAVEL
      LETH.218:
        put pay 5000
        wait
      LETH.219:
        put d
        GOTO TRAVEL
      LETH.220:
        put d
        GOTO TRAVEL
      LETH.221:
        put climb ramp
        GOTO TRAVEL
      LETH.222:
        put go burl
        GOTO TRAVEL
      LETH.223:
        put e
        GOTO TRAVEL
      LETH.224:
        put e
        GOTO TRAVEL
      LETH.225:
        put go door
        GOTO TRAVEL
      LETH.226:
        put up
        GOTO TRAVEL
      LETH.227:
        put dep all
        wait
      LETH.228:
        put down
        GOTO TRAVEL
      LETH.229:
        put out
        GOTO TRAVEL
      LETH.230:
        put w
        GOTO TRAVEL
      LETH.231:
        put w
        GOTO TRAVEL
      LETH.232:
        put nw
        GOTO TRAVEL
      LETH.233:
        put nw
        GOTO TRAVEL
      LETH.234:
        put nw
        GOTO TRAVEL
      LETH.235:
        put nw
        GOTO TRAVEL
      LETH.236:
        put nw
        GOTO TRAVEL
      LETH.237:
        put go tree
        GOTO TRAVEL
      LETH.238:
        GOTO GETSACK

    LETH.FREE:
        counter set 245
      LETH.245:
        put u
        GOTO TRAVEL
      LETH.246:
        GOTO GETSACK

    LETH.FREE2:
        pause 1
        match LETH.MISSINGSTART waitandsee
        match LETH.FREE3 okstart
        put echo %startlocation%
        put echo okstart
        GOTO UniversalMatch

    LETH.MISSINGSTART:
        setVariable startlocation Lmorik
        setVariable ResumeStore Lmorik
        GOTO LETH.FREE3

    LETH.FREE3:
        counter set 241
      LETH.241:
        put out
        GOTO TRAVEL
      LETH.242:
        put nw
        GOTO TRAVEL
      LETH.243:
        put sw
        GOTO TRAVEL
      LETH.244:
        counter set 1
        setVariable storecode Lmorik
        GOTO RESUME.%ResumeStore%

    RESUME.LBOW:
        counter add 1
    RESUME.LWEAP:
        counter add 1
    RESUME.LWICK:
        counter add 1
    RESUME.LBARD:
        counter add 1
    RESUME.LWOOD:
        counter add 1
    RESUME.LCLOTH:
        counter add 1
    RESUME.LGAMI:
        counter add 1
    RESUME.LGEN:
        counter add 1
    RESUME.LPERF:
        counter add 1
    RESUME.LMORIK:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME



##################################################################################
#############                                                        #############
#############                        ILITHI                          #############
#############                                                        #############
#############                  SKILL DETERMINATION                   #############
#############      (tweak the items you steal here if desired)       #############
#############                                                        #############
##################################################################################


    ILI.RANK.1:
        setVariable skillrange 20-39
        setVariable Sgene charcoal
        setVariable SgeneQuant 1
        setVariable Sweap <nothing>
        setVariable SweapQuant 1
        setVariable Sstit gloves
        setVariable SstitQuant 1
        setVariable Scleric chamomile
        setVariable SclericQuant 1
        setVariable Salch water
        setVariable SalchQuant 2
        setVariable Sherb <nothing>
        setVariable SherbQuant 1
        setVariable Sreag <nothing>
        setVariable SreagQuant 1
        setVariable Sbard pick
        setVariable SbardQuant 2
        setVariable Slock <nothing>
        setVariable SlockQuant 1
        setVariable Sarmo leather gloves
        setVariable SarmoQuant 1
        setVariable Scoin <nothing>
        setVariable ScoinQuant 1
        setVariable Stoke <nothing>
        setVariable StokeQuant 1
        setVariable Sfril <nothing>
        setVariable SfrilQuant 1
        setVariable Shera <nothing>
        setVariable SheraQuant 1
        setVariable Stour <nothing>
        setVariable StourItemLoc  
        setVariable StourQuant 1
        setVariable Stoyb <nothing>
        setVariable StoybQuant 1
        setVariable Sbarb alcohol
        setVariable SbarbQuant 1
        setVariable Smuse <nothing>
        setVariable SmuseQuant 1
        setVariable Sbake swirl
        setVariable SbakeQuant 1
        setVariable Sbows flights
        setVariable SbowsQuant 1
        setVariable Stann <nothing>
        setVariable StannQuant 1
        setVariable Ssupb chicken flights
        setVariable SsupbQuant 1
        setVariable Ssupf <nothing>
        setVariable SsupfQuant 1
        setVariable Smarw <nothing>
        setVariable SmarwQuant 1
        setVariable Smarg charcoal
        setVariable SmargQuant 1
        setVariable Senes <nothing>
        setVariable SenesQuant 1
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 1
        setVariable SCCweap <nothing>
        setVariable SCCweapQuant 1
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 1
        setVariable HCequi <nothing>
        setVariable HCequiQuant 1
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 1
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 1
        setVariable HCcash <nothing>
        setVariable HCcashQuant 1
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 1
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.2:
        setVariable skillrange 40-59
        setVariable Sgene hairbrush
        setVariable SgeneQuant 2
        setVariable Sweap <nothing>
        setVariable SweapQuant 2
        setVariable Sstit gloves
        setVariable SstitQuant 2
        setVariable Scleric sirese flower
        setVariable SclericQuant 2
        setVariable Salch mixing stick
        setVariable SalchQuant 2
        setVariable Sherb <nothing>
        setVariable SherbQuant 2
        setVariable Sreag <nothing>
        setVariable SreagQuant 2
        setVariable Sbard rag
        setVariable SbardP pick
        setVariable SbardQuant 2
        setVariable Slock iron keyblank
        setVariable SlockQuant 1
        setVariable Sarmo leather gloves
        setVariable SarmoQuant 2
        setVariable Scoin <nothing>
        setVariable ScoinQuant 2
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril gloves
        setVariable SfrilQuant 2
        setVariable Shera <nothing>
        setVariable SheraQuant 2
        setVariable Stour <nothing>
        setVariable StourItemLoc  
        setVariable StourQuant 2
        setVariable Stoyb whistle
        setVariable StoybQuant 1
        setVariable Sbarb oil
        setVariable SbarbQuant 2
        setVariable Smuse <nothing>
        setVariable SmuseQuant 2
        setVariable Sbake cupcake
        setVariable SbakeQuant 2
        setVariable Sbows glue
        setVariable SbowsQuant 2
        setVariable Stann <nothing>
        setVariable StannQuant 2
        setVariable Ssupb glue
        setVariable SsupbP chicken flights
        setVariable SsupbQuant 2
        setVariable Ssupf oil
        setVariable SsupfQuant 2
        setVariable Smarw bolts
        setVariable SmarwQuant 1
        setVariable Smarg hairbrush
        setVariable SmargQuant 2
        setVariable Senes <nothing>
        setVariable SenesQuant 2
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 2
        setVariable SCCweap <nothing>
        setVariable SCCweapQuant 2
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash <nothing>
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.3:
        setVariable skillrange 60-99
        setVariable Sgene unguent
        setVariable SgeneQuant 2
        setVariable Sweap <nothing>
        setVariable SweapQuant 2
        setVariable Sstit hood
        setVariable SstitQuant 2
        setVariable Scleric incense
        setVariable SclericQuant 2
        setVariable Salch pestle
        setVariable SalchQuant 1
        setVariable Sherb <nothing>
        setVariable SherbQuant 2
        setVariable Sreag <nothing>
        setVariable SreagQuant 2
        setVariable Sbard cloth
        setVariable SbardQuant 2
        setVariable Slock iron keyblank
        setVariable SlockQuant 2
        setVariable Sarmo collar
        setVariable SarmoP leather gloves
        setVariable SarmoQuant 2
        setVariable Scoin <nothing>
        setVariable ScoinQuant 2
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril straw hat
        setVariable SfrilQuant 2
        setVariable Shera <nothing>
        setVariable SheraQuant 2
        setVariable Stour <nothing>
        setVariable StourItemLoc in black basket
        setVariable StourQuant 1
        setVariable Stoyb whistle
        setVariable StoybQuant 2
        setVariable Sbarb candle mold
        setVariable SbarbQuant 3
        setVariable Smuse <nothing>
        setVariable SmuseQuant 2
        setVariable Sbake box
        setVariable SbakeQuant 2
        setVariable Sbows arrowhead
        setVariable SbowsQuant 2
        setVariable Stann thread
        setVariable StannQuant 2
        setVariable Ssupb falcon flights
        setVariable SsupbQuant 2
        setVariable Ssupf wood pestle
        setVariable SsupfQuant 1
        setVariable Smarw bolts
        setVariable SmarwQuant 2
        setVariable Smarg bowl
        setVariable SmargQuant 2
        setVariable Senes <nothing>
        setVariable SenesQuant 2
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 2
        setVariable SCCweap <nothing>
        setVariable SCCweapQuant 2
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash <nothing>
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.4:
        setVariable skillrange 100-149
        setVariable Sgene razor
        setVariable SgeneQuant 2
        setVariable Sweap <nothing>
        setVariable SweapQuant 1
        setVariable Sstit shawl
        setVariable SstitQuant 2
        setVariable Scleric vial
        setVariable SclericQuant 2
        setVariable Salch oil
        setVariable SalchP pestle
        setVariable SalchQuant 2
        setVariable Sherb <nothing>
        setVariable SherbQuant 1
        setVariable Sreag <nothing>
        setVariable SreagQuant 2
        setVariable Sbard fife
        setVariable SbardQuant 2
        setVariable Slock bronze keyblank
        setVariable SlockQuant 2
        setVariable Sarmo legguards
        setVariable SarmoQuant 2
        setVariable Scoin <nothing>
        setVariable ScoinQuant 2
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril lace fan
        setVariable SfrilQuant 2
        setVariable Shera <nothing>
        setVariable SheraQuant 2
        setVariable Stour <nothing>
        setVariable StourItemLoc in black basket
        setVariable StourQuant 1
        setVariable Stoyb whistle
        setVariable StoybQuant 3
        setVariable Sbarb blued-steel clippers
        setVariable SbarbQuant 1
        setVariable Smuse <nothing>
        setVariable SmuseQuant 1
        setVariable Sbake <nothing>
        setVariable SbakeQuant 2
        setVariable Sbows bolts
        setVariable SbowsP arrowhead
        setVariable SbowsQuant 1
        setVariable Stann bodkin
        setVariable StannQuant 2
        setVariable Ssupb steel shaper
        setVariable SsupbQuant 2
        setVariable Ssupf stone pestle
        setVariable SsupfQuant 1
        setVariable Smarw misericorde
        setVariable SmarwQuant 1
        setVariable Smarg cloth sheath
        setVariable SmargP bowl
        setVariable SmargQuant 2
        setVariable Senes jadice flower
        setVariable SenesQuant 1
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 2
        setVariable SCCweap <nothing>
        setVariable SCCweapQuant 2
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash <nothing>
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.5:
        setVariable skillrange 150-199
        setVariable Sgene clippers
        setVariable SgeneQuant 2
        setVariable Sweap targe
        setVariable SweapQuant 1
        setVariable Sstit blouse
        setVariable SstitQuant 2
        setVariable Scleric armband
        setVariable SclericQuant 1
        setVariable Salch tukai stones
        setVariable SalchQuant 2
        setVariable Sherb riolur leaf
        setVariable SherbQuant 2
        setVariable Sreag simple talisman
        setVariable SreagQuant 1
        setVariable Sbard bow
        setVariable SbardQuant 2
        setVariable Slock bronze lockpick
        setVariable SlockQuant 2
        setVariable Sarmo mail gauntlets
        setVariable SarmoQuant 2
        setVariable Scoin <nothing>
        setVariable ScoinQuant 2
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril pants
        setVariable SfrilQuant 2
        setVariable Shera target shield
        setVariable SheraQuant 2
        setVariable Stour boggle doll
        setVariable StourItemLoc in black basket
        setVariable StourQuant 1
        setVariable Stoyb beard
        setVariable StoybQuant 2
        setVariable Sbarb black clippers
        setVariable SbarbQuant 2
        setVariable Smuse <nothing>
        setVariable SmuseQuant 1
        setVariable Sbake <nothing>
        setVariable SbakeQuant 2
        setVariable Sbows shears
        setVariable SbowsQuant 2
        setVariable Stann scraper
        setVariable StannQuant 2
        setVariable Ssupb blued shaper
        setVariable SsupbQuant 2
        setVariable Ssupf stone pestle
        setVariable SsupfQuant 2
        setVariable Smarw misericorde
        setVariable SmarwQuant 2
        setVariable Smarg cloth scabbard
        setVariable SmargQuant 2
        setVariable Senes sufil sap
        setVariable SenesQuant 2
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 2
        setVariable SCCweap <nothing>
        setVariable SCCweapQuant 2
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash <nothing>
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.6:
        setVariable skillrange 200-249
        setVariable Sgene short sword
        setVariable SgeneQuant 2
        setVariable Sweap targe
        setVariable SweapQuant 2
        setVariable Sstit cloak
        setVariable SstitQuant 2
        setVariable Scleric armband
        setVariable SclericQuant 2
        setVariable Salch seolard weed
        setVariable SalchQuant 1
        setVariable Sherb genich stem
        setVariable SherbQuant 2
        setVariable Sreag simple talisman
        setVariable SreagQuant 2
        setVariable Sbard four strings
        setVariable SbardQuant 2
        setVariable Slock wrist sheath
        setVariable SlockQuant 1
        setVariable Sarmo choker
        setVariable SarmoQuant 2
        setVariable Scoin coin case
        setVariable ScoinQuant 1
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril sandals
        setVariable SfrilQuant 2
        setVariable Shera ordinary shield
        setVariable SheraQuant 2
        setVariable Stour boggle doll
        setVariable StourItemLoc in black basket
        setVariable StourQuant 2
        setVariable Stoyb wig
        setVariable StoybQuant 2
        setVariable Sbarb silver-trimmed clippers
        setVariable SbarbQuant 2
        setVariable Smuse black slippers
        setVariable SmuseQuant 1
        setVariable Sbake <nothing>
        setVariable SbakeQuant 2
        setVariable Sbows long arrows
        setVariable SbowsQuant 2
        setVariable Stann shears
        setVariable StannQuant 2
        setVariable Ssupb stone-tipped arrow
        setVariable SsupbQuant 2
        setVariable Ssupf stone pestle
        setVariable SsupfQuant 2
        setVariable Smarw visored helm
        setVariable SmarwQuant 2
        setVariable Smarg cloth backtube
        setVariable SmargQuant 2
        setVariable Senes blocil potion
        setVariable SenesQuant 2
        setVariable SCCleat <nothing>
        setVariable SCCleatQuant 2
        setVariable SCCweap thigh sheath
        setVariable SCCweapQuant 1
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash <nothing>
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.7:
        setVariable skillrange 250-299
        setVariable Sgene chain helm
        setVariable SgeneQuant 2
        setVariable Sweap stiletto
        setVariable SweapQuant 1
        setVariable Sstit tunic
        setVariable SstitQuant 2
        setVariable Scleric oil
        setVariable SclericQuant 1
        setVariable Salch seolarn weed
        setVariable SalchQuant 2
        setVariable Sherb hisan salve
        setVariable SherbQuant 2
        setVariable Sreag elbaite runestone
        setVariable SreagQuant 1
        setVariable Sbard refill
        setVariable SbardQuant 2
        setVariable Slock wrist sheath
        setVariable SlockQuant 2
        setVariable Sarmo mesh handguards
        setVariable SarmoQuant 2
        setVariable Scoin coin case
        setVariable ScoinQuant 2
        setVariable Stoke <nothing>
        setVariable StokeQuant 2
        setVariable Sfril doll
        setVariable SfrilQuant 1
        setVariable Shera medium buckler
        setVariable SheraQuant 2
        setVariable Stour badge
        setVariable StourItemLoc on stand
        setVariable StourQuant 2
        setVariable Stoyb book
        setVariable StoybQuant 2
        setVariable Sbarb brass razor
        setVariable SbarbQuant 2
        setVariable Smuse black slippers
        setVariable SmuseQuant 2
        setVariable Sbake <nothing>
        setVariable SbakeQuant 2
        setVariable Sbows barbed arrows
        setVariable SbowsQuant 2
        setVariable Stann pattern
        setVariable StannQuant 2
        setVariable Ssupb stone-tipped arrow
        setVariable SsupbQuant 2
        setVariable Ssupf marble pestle
        setVariable SsupfQuant 2
        setVariable Smarw jerkin
        setVariable SmarwQuant 2
        setVariable Smarg cloth backtube
        setVariable SmargQuant 2
        setVariable Senes ithor potion
        setVariable SenesQuant 2
        setVariable SCCleat crinnet
        setVariable SCCleatQuant 1
        setVariable SCCweap dirk
        setVariable SCCweapQuant 1
        setVariable HCfelt <nothing>
        setVariable HCfeltQuant 2
        setVariable HCequi <nothing>
        setVariable HCequiQuant 2
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash ring
        setVariable HCcashQuant 1
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.11:
    ILI.RANK.12:
    ILI.RANK.13:
    ILI.RANK.14:
    ILI.RANK.15:
        ECHO ***********************************************
        ECHO ***        Sorry, but there isn't anything harder yet!
        ECHO ***********************************************
    ILI.RANK.10:
    ILI.RANK.9:
    ILI.RANK.8:
        setVariable skillrange 300+
        setVariable Sgene great helm
        setVariable SgeneQuant 1
        setVariable Sweap stiletto
        setVariable SweapQuant 2
        setVariable Sstit coat
        setVariable SstitQuant 2
        setVariable Scleric bell
        setVariable SclericQuant 2
        setVariable Salch cauldron
        setVariable SalchQuant 2
        setVariable Sherb ithor potion
        setVariable SherbQuant 2
        setVariable Sreag elbaite runestone
        setVariable SreagQuant 2
        setVariable Sbard gilded mandolin
        setVariable SbardQuant 1
        setVariable Slock ivory lockpick
        setVariable SlockQuant 2
        setVariable Sarmo helmet
        setVariable SarmoQuant 1
        setVariable Scoin coin case
        setVariable ScoinQuant 2  
        setVariable Stoke <nothing>
        setVariable StokeQuant 1 
        setVariable Sfril doll
        setVariable SfrilQuant 1
        setVariable Shera ordinary shield
        setVariable SheraQuant 2
        setVariable Stour dagger
        setVariable StourItemLoc on table
        setVariable StourQuant 1
        setVariable Stoyb black book
        setVariable StoybQuant 1
        setVariable Sbarb horn-handled razor
        setVariable SbarbQuant 1
        setVariable Smuse slippers
        setVariable SmuseQuant 1
        setVariable Sbake <nothing>
        setVariable SbakeQuant 2
        setVariable Sbows barbed arrows
        setVariable SbowsQuant 2
        setVariable Stann potion
        setVariable StannQuant 2
        setVariable Ssupb razor arrowhead
        setVariable SsupbQuant 2
        setVariable Ssupf stone mortar
        setVariable SsupfQuant 2
        setVariable Smarw rapier
        setVariable SmarwQuant 2
        setVariable Smarg cloth backtube
        setVariable SmargQuant 3
        setVariable Senes ithor potion
        setVariable SenesQuant 3
        setVariable SCCleat chanfron
        setVariable SCCleatQuant 1
        setVariable SCCweap spear
        setVariable SCCweapQuant 1
        setVariable HCfelt amulet
        setVariable HCfeltQuant 1
        setVariable HCequi white blanket
        setVariable HCequiQuant 1
        setVariable HCfalc <nothing>
        setVariable HCfalcQuant 2
        setVariable HCjaht <nothing>
        setVariable HCjahtQuant 2
        setVariable HCcash ring
        setVariable HCcashQuant 2
        setVariable HCbow1 <nothing>
        setVariable HCbow1Quant 2
        setVariable HCbow2 <nothing>
        setVariable HCbow2Quant 1
        GOTO RANKREPORT

    ILI.RANK.-5:
    ILI.RANK.-4:
    ILI.RANK.-3:
    ILI.RANK.-2:
    ILI.RANK.-1:
    ILI.RANK.0:
        GOTO BEGGAR.MOD

    ILI.BAGCHECK:
        matchre BAGWARN /%Sgene%|%Sweap%|%Sstit%|%Salch%|%Sherb%|%Sreag%|%Sbard%|%Slock%/
        matchre BAGWARN /%Sarmo%|%Scoin%|%Stoke%|%Sfril%|%Shera%|%Stour%|%Stoyb%|%Sbarb%|%Scleric%/
        matchre BAGWARN /%Smuse%|%Sbake%|%Sbows%|%Stann%|%Ssupb%|%Ssupf%|%Smarw%|%Smarg%|%Senes%/
        matchre BAGWARN /%SCCleat%|%SCCweap%|%HCfelt%|%HCequi%|%HCfalc%|%HCjaht%|%HCcash%|%HCbow1%|%HCbow2%/
        match BAGS.STOW.%c% You glance
        put look in my %container%
        put glance
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####              ILITHI STARTING POSITION                  #####
#####                                                        #####
##################################################################

    SHARD:
        match SHARD.START.NG Shard, North City Gates
        match SHARD.START.WG Shard, West City Gates
        match SHARD.START.EG Shard, East City Gates
        match SHARD.START.SG Shard, South Square
        match SHARD.START.BANK Shard, First Bank of Ilithi
        match SHARD.START.PAWN Aelik's Pawn
        match SHARD.START.GENE Zerek
        match SHARD.START.WEAP Fiona
        match SHARD.START.STIT Meek's Stitchery
        match SHARD.START.CLER Imadrail
        match SHARD.START.HERB Zieq
        match SHARD.START.ALCH Idizieq
        match SHARD.START.REAG Sierack
        match SHARD.START.BARD Malik
        match SHARD.START.LOCK Kilam
        match SHARD.START.ARMO Demiciil
        match SHARD.START.COIN [Coin of the Realm]
        match SHARD.START.TOKE [Tokens of Affection]
        match SHARD.START.FRIL [Little Frills]
        match SHARD.START.HERA Bonime
        match SHARD.START.TOUR [Elanthian Travel Tours, Gift Shop]
        match SHARD.START.TOYB [The Toy Box]
        match SHARD.START.BARB Budd's Barber Shop
        match SHARD.START.MUSE Scholar's Museum
        match SHARD.START.BAKE Genevive
        match SHARD.START.BOWS Avlea
        match SHARD.START.TANN Froissart
        match SHARD.START.SUPB [Survivalist Supplies, Back Room]
        match SHARD.START.SUPF [Survivalist Supplies, Front Room]
        match SHARD.START.MARA Marachek's Oak, Merchant Central
        match SHARD.START.MARW Ivo Marachek
        match SHARD.START.MARG Windawn
        match SHARD.START.ENES Enescu
        match ILI.BADLOCATION Obvious
        put look
        GOTO UniversalMatch

    STEEL:
        match STEEL.START.LEAT Quintan
        match STEEL.START.WEAP Struan
        match STEEL.START.GATE Passing between the mammoth beams that serve as gateposts
    HORSE:
        match HORSE.START.PATH a red banner with a galloping horse-archer silhouetted
        match HORSE.START.FELT Anaylisse
        match HORSE.START.EQUI.W Stablemaster Ela
        match HORSE.START.EQUI.E Cut off from the rest of the tent by an elaborate screen
        match HORSE.START.FALC Akhila
        match HORSE.START.JAHT.1 Jan Taipen Chadir
        match HORSE.START.JAHT.2 Jahtinit
        match HORSE.START.CASH Yasnah
        match HORSE.START.BOW1 Fresh air wafts down from the opening at the apex
        match HORSE.START.BOW2 Fabric dyed the color of the winter sky covers
        match ILI.BADLOCATION Obvious
        setvariable citycode SHARD
        put look
        GOTO UniversalMatch

    ILI.BADLOCATION:
        put echocolumn /on
        waitfor EchoColumn
        ECHO ***********************************************
        ECHO *** Not a valid starting location.
        ECHO *** Starting locations in Ilithi are:
        ECHO ***
        ECHO *** Inside Shard Gates           Inside SCC gate
        ECHO *** Shard Bank                   Struan's Weapons
        ECHO *** Shard Pawn shop              Quintan's Leather
        ECHO *** Zerek's General Supplies     
        ECHO *** Fiona's Arms                 Inside Horse Clan path
        ECHO *** Demiciil's Armory            Anaylisse's Felterie
        ECHO *** Avlea's Bows                 Ela's Equine Supplies
        ECHO *** Meek's Stitchery             Falconer's Chadir
        ECHO *** Zieq's Herbs and Alchemy     Jahtinit's Corner
        ECHO *** Sierack's Artificer Shop     Yasnah's Cashmere
        ECHO *** Malik's Instruments          Zaldi Taipa, Bowyer
        ECHO *** Kilam's Locks
        ECHO *** Genevive's Bakery            Marachek's Oak
        ECHO *** The Scholar's Museum         Enescu's Herbs
        ECHO *** Coin of the Realm Shop
        ECHO *** Tokens of Affection Shop     Froissart's Tannery
        ECHO *** Little Frills Shop           Survivalist Supplies
        ECHO *** Bonime's Heraldry Shop
        ECHO *** The Toy Box
        ECHO *** Budd's Barber Shop
        ECHO *** Sister Imadrail's Emporium
        ECHO ***
        ECHO *******************************************************
        put echocolumn /off
        waitfor EchoColumn
        GOTO END

    SHARD.START.GENE:
        counter set 254
        setVariable storecode Sgene
        put out
        GOTO START

    SHARD.START.WEAP:
        counter set 37
        setVariable storecode Sweap
        put out
        GOTO START

    SHARD.START.STIT:
        counter set 42
        setVariable storecode Sstit
        put out
        GOTO START

    SHARD.START.CLER:
        counter set 49
        setVariable storecode Scleric
        put out
        GOTO START

    SHARD.START.HERB:
        match SHARD.START.ALCH Obvious
        put out
        GOTO UniversalMatch
    SHARD.START.ALCH:
        counter set 345
        setVariable storecode Salch
        put out
        GOTO START

    SHARD.START.REAG:
        counter set 61
        setVariable storecode Sreag
        put out
        GOTO START

    SHARD.START.LOCK:
        match SHARD.START.BARD Obvious
        put go trapdoor
        GOTO UniversalMatch
    SHARD.START.BARD:
        counter set 64
        setVariable storecode Sbard
        put out
        GOTO START

    SHARD.START.ARMO:
        counter set 72
        setVariable storecode Sarmo
        put out
        GOTO START

    SHARD.START.COIN:
        counter set 79
        setVariable storecode Scoin
        put go door
        GOTO START

    SHARD.START.TOKE:
        counter set 81
        setVariable storecode Stoke
        put go door
        GOTO START

    SHARD.START.FRIL:
        counter set 83
        setVariable storecode Sfril
        put go door
        GOTO START

    SHARD.START.HERA:
        counter set 86
        setVariable storecode Shera
        put go door
        GOTO START

    SHARD.START.TOUR:
        counter set 89
        setVariable storecode Stour
        put go door
        GOTO START

    SHARD.START.TOYB:
        counter set 92
        setVariable storecode Stoyb
        put go door
        GOTO START

    SHARD.START.BARB:
        counter set 94
        setVariable storecode Sbarb
        put go door
        GOTO START

    SHARD.START.MUSE:
        counter set 107
        setVariable storecode Smuse
        put out
        GOTO START

    SHARD.START.BAKE:
        counter set 112
        setVariable storecode Sbake
        put out
        GOTO START

    SHARD.START.BOWS:
        counter set 120
        setVariable storecode Sbows
        put out
        GOTO START

    SHARD.START.SUPF:
        match SHARD.START.SUPB Obvious
        put go curtain
        GOTO UniversalMatch
    SHARD.START.SUPB:
    SHARD.START.TANN:
        counter set 139
        setVariable storecode Stann
        put out
        GOTO START

    SHARD.START.MARW:
    SHARD.START.MARG:
        match SHARD.START.MARA Obvious
        put go door
        GOTO UniversalMatch
    SHARD.START.MARA:
        counter set 205
        setVariable storecode Smarw
        GOTO START

    SHARD.START.ENES:
        counter set 214
        setVariable storecode Senes
        GOTO START

    STEEL.START.LEAT:
        counter set 462
        setVariable storecode SCCleat
        put n
        GOTO START

    STEEL.START.WEAP:
        counter set 470
        setVariable storecode SCCweap
        put out
        GOTO START

    HORSE.START.FELT:
        counter set 580
        setVariable storecode HCfelt
        put go flap
        GOTO START

    HORSE.START.EQUI.W:
        match HORSE.START.EQUI.E Obvious
        put e
        GOTO UniversalMatch
    HORSE.START.EQUI.E:
        counter set 589
        setVariable storecode HCequi
        put w
        GOTO START

    HORSE.START.FALC:
        counter set 595
        setVariable storecode HCfalc
        put go flap
        GOTO START

    HORSE.START.JAHT.1:
        match HORSE.START.JAHT.2 Obvious
        put go corner
        GOTO UniversalMatch
    HORSE.START.JAHT.2:
        counter set 598
        setVariable storecode HCjaht
        put go tent
        GOTO START

    HORSE.START.CASH:
        counter set 605
        setVariable storecode HCcash
        put go flap
        GOTO START

    HORSE.START.BOW2:
        match HORSE.START.BOW1 Obvious
        put go curtain
        GOTO UniversalMatch
    HORSE.START.BOW1:
        counter set 608
        setVariable storecode HCbow1
        put go flap
        GOTO START

    SHARD.START.NG:
        counter set 1
      SHARD.1:
        put s
        GOTO TRAVEL
      SHARD.2:
        put s
        GOTO TRAVEL
      SHARD.3:
        put s
        GOTO TRAVEL
      SHARD.4:
        put go shop
        GOTO TRAVEL
      SHARD.5:
        GOTO SHARD.START.GENE

    SHARD.START.WG:
        counter set 6
      SHARD.6:
        put s
        GOTO TRAVEL
      SHARD.7:
        put se
        GOTO TRAVEL
      SHARD.8:
        setVariable storecode Sarmo
        put go building
        GOTO TRAVEL
      SHARD.9:
        GOTO SHARD.START.ARMO

    SHARD.START.EG:
        counter set 10
      SHARD.10:
        put s
        GOTO TRAVEL
      SHARD.11:
        put sw
        GOTO TRAVEL
      SHARD.12:
        setVariable storecode Sbows
        put go shop
        GOTO TRAVEL
      SHARD.13:
        GOTO SHARD.START.BOWS

    SHARD.START.SG:
        counter set 14
      SHARD.14:
        put go bridge
        GOTO TRAVEL
      SHARD.15:
        put w
        GOTO TRAVEL
      SHARD.16:
        put go shop
        GOTO TRAVEL
      SHARD.17:
        GOTO SHARD.START.COIN

    SHARD.START.BANK:
        counter set 383
      SHARD.383:
        put out
        GOTO TRAVEL
      SHARD.384:
        counter set 18
      SHARD.18:
        put e
        GOTO TRAVEL
      SHARD.19:
        put go bridge
        GOTO TRAVEL
      SHARD.20:
        put se
        GOTO TRAVEL
      SHARD.21:
        put go building
        GOTO TRAVEL
      SHARD.22:
        GOTO SHARD.START.REAG

    SHARD.START.PAWN:
        counter set 385
      SHARD.385:
        put out
        GOTO TRAVEL
      SHARD.386:
        counter set 23
      SHARD.23:
        put s
        GOTO TRAVEL
      SHARD.24:
        put s
        GOTO TRAVEL
      SHARD.25:
        put s
        GOTO TRAVEL
      SHARD.26:
        GOTO SHARD.START.SG

    STEEL.START.GATE:
        counter set 735
      SHARD.735:
        put e
        GOTO TRAVEL
      SHARD.736:
        put n
        GOTO TRAVEL
      SHARD.737:
        put n
        GOTO TRAVEL
      SHARD.738:
        put n
        GOTO TRAVEL
      SHARD.739:
        put go stable
        GOTO TRAVEL
      SHARD.740:
        put e
        GOTO TRAVEL
      SHARD.741:
        put s
        GOTO TRAVEL
      SHARD.742:
        GOTO STEEL.START.LEAT

    HORSE.START.PATH:
        counter set 749
      SHARD.749:
        put sw
        GOTO TRAVEL
      SHARD.750:
        put w
        GOTO TRAVEL
      SHARD.751:
        put sw
        GOTO TRAVEL
      SHARD.752:
        put se
        GOTO TRAVEL
      SHARD.753:
        put w
        GOTO TRAVEL
      SHARD.754:
        put w
        GOTO TRAVEL
      SHARD.755:
        put se
        GOTO TRAVEL
      SHARD.756:
        put se
        GOTO TRAVEL
      SHARD.757:
        put s
        GOTO TRAVEL
      SHARD.758:
        put go tent
        GOTO TRAVEL
      SHARD.759:
        GOTO HORSE.START.FELT


##################################################################
#####                                                        #####
#####                 ILITHI LEAVING SHOPS                   #####
#####                                                        #####
##################################################################


    LEAVE.SGENE:
        GOTO %LorM%.SGENE.1
    LEAVE.SGENE.1:
        counter set 27
      SHARD.27:
        put s
        GOTO TRAVEL
      SHARD.28:
        put s
        GOTO TRAVEL
      SHARD.29:
        put s
        GOTO TRAVEL
      SHARD.30:
        put s
        GOTO TRAVEL
      SHARD.31:
        put go gate
        GOTO TRAVEL
      SHARD.32:
        put s
        GOTO TRAVEL
      SHARD.33:
        put ne
        GOTO TRAVEL
      SHARD.34:
        put ne
        GOTO TRAVEL
      SHARD.35:
        put ne
        GOTO TRAVEL
      SHARD.36:
        setVariable storecode Sweap
        put ne
        GOTO TRAVEL
      SHARD.37:
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.SWEAP:
        counter set 38
      SHARD.38:
        put sw
        GOTO TRAVEL
      SHARD.39:
        put sw
        GOTO TRAVEL
      SHARD.40:
        put se
        GOTO TRAVEL
      SHARD.41:
        setVariable storecode Sstit
        put e
        GOTO TRAVEL
      SHARD.42:
        setVariable entrance home
        GOTO SETSTORE

    LEAVE.SSTIT:
        counter set 43
      SHARD.43:
        put go bridge
        GOTO TRAVEL
      SHARD.44:
        put w
        GOTO TRAVEL
      SHARD.45:
        put w
        GOTO TRAVEL
      SHARD.46:
        put go temple
        GOTO TRAVEL
      SHARD.47:
        put n
        GOTO TRAVEL
      SHARD.48:
        put go div arch
        GOTO TRAVEL
      SHARD.49:
        setVariable storecode Scleric
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.SCLERIC:
        counter set 337
      SHARD.337:
        put go arch
        GOTO TRAVEL
      SHARD.338:
        put s
        GOTO TRAVEL
      SHARD.339:
        put go door
        GOTO TRAVEL
      SHARD.340:
        put w
        GOTO TRAVEL
      SHARD.341:
        put n
        GOTO TRAVEL
      SHARD.342:
        put nw
        GOTO TRAVEL
      SHARD.343:
        put w
        GOTO TRAVEL
      SHARD.344:
        put w
        GOTO TRAVEL
      SHARD.345:
        setVariable storecode Salch
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.SALCH:
        counter set 52
      SHARD.52:
        put go door
        GOTO TRAVEL
      SHARD.53:
        setVariable storecode Sherb
        setVariable entrance iron door
        GOTO SETSTORE

    LEAVE.SHERB:
        counter set 54
      SHARD.54:
        put out
        GOTO TRAVEL
      SHARD.55:
        put sw
        GOTO TRAVEL
      SHARD.56:
        put s
        GOTO TRAVEL
      SHARD.57:
        put w
        GOTO TRAVEL
      SHARD.58:
        put w
        GOTO TRAVEL
      SHARD.59:
        put go bridge
        GOTO TRAVEL
      SHARD.60:
        put se
        GOTO TRAVEL
      SHARD.61:
        setVariable storecode Sreag
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.SREAG:
        counter set 62
      SHARD.62:
        put sw
        GOTO TRAVEL
      SHARD.63:
        setVariable storecode Sbard
        put sw
        GOTO TRAVEL
      SHARD.64:
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.SBARD:
        counter set 65
      SHARD.65:
        setVariable storecode Slock
        put go shop
        GOTO TRAVEL
      SHARD.66:
        put ask malik about kilam
        matchre KILAM1 /order something and offer|looks at you curiously/
        GOTO UniversalMatch
    KILAM1:
        put order pick
        match KILAM2 That would suit you
        GOTO UniversalMatch
    KILAM2:
        put offer 10000000
        match KILAM3 OFFER it again within the next
        GOTO UniversalMatch
    KILAM3:
        put offer 10000000
        match KILAM4 They drag you out
        GOTO UniversalMatch
    KILAM4:
        matchre KILAM4 /...wait|type ahead|Roundtime/i
        match SETSTORE You stand back up.
        put kneel
        put stand
        GOTO UniversalMatch

    LEAVE.SLOCK:
        counter set 68
      SHARD.68:
        match ALTLEAVE.SLOCK You can't go there.
        put sw
        GOTO TRAVEL
      SHARD.69:
        put sw
        GOTO TRAVEL
      SHARD.70:
        put go bridge
        GOTO TRAVEL
      SHARD.71:
        setVariable storecode Sarmo
        put nw
        GOTO TRAVEL
      SHARD.72:
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.SARMO:
        counter set 73
      SHARD.73:
        put se
        GOTO TRAVEL
      SHARD.74:
        put se
        GOTO TRAVEL
      SHARD.75:
        put e
        GOTO TRAVEL
      SHARD.76:
        put e
        GOTO TRAVEL
      SHARD.77:
        put go bridge
        GOTO TRAVEL
      SHARD.78:
        put w
        GOTO TRAVEL
      SHARD.79:
        setVariable storecode Scoin
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.SCOIN:
        counter set 80
      SHARD.80:
        put s
        GOTO TRAVEL
      SHARD.81:
        setVariable storecode Stoke
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.STOKE:
        counter set 82
      SHARD.82:
        put s
        GOTO TRAVEL
      SHARD.83:
        setVariable storecode Sfril
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.SFRIL:
        counter set 84
      SHARD.84:
        put s
        GOTO TRAVEL
      SHARD.85:
        put s
        GOTO TRAVEL
      SHARD.86:
        setVariable storecode Shera
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.SHERA:
        counter set 87
      SHARD.87:
        put e
        GOTO TRAVEL
      SHARD.88:
        put e
        GOTO TRAVEL
      SHARD.89:
        setVariable storecode Stour
        setVariable entrance shop
        setVariable itemlocation %StourItemLoc%
        GOTO SETSTORE

    LEAVE.STOUR:
        counter set 90
      SHARD.90:
        put n
        GOTO TRAVEL
      SHARD.91:
        put n
        GOTO TRAVEL
      SHARD.92:
        setVariable storecode Stoyb
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.STOYB:
        counter set 93
      SHARD.93:
        put n
        GOTO TRAVEL
      SHARD.94:
        setVariable storecode Sbarb
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.SBARB:
        counter set 95
      SHARD.95:
        put w
        GOTO TRAVEL
      SHARD.96:
        put n
        GOTO TRAVEL
      SHARD.97:
        put go square
        GOTO TRAVEL
      SHARD.98:
        put n
        GOTO TRAVEL
      SHARD.99:
        put n
        GOTO TRAVEL
      SHARD.100:
        put n
        GOTO TRAVEL
      SHARD.101:
        put n
        GOTO TRAVEL
      SHARD.102:
        put n
        GOTO TRAVEL
      SHARD.103:
        put n
        GOTO TRAVEL
      SHARD.104:
        put n
        GOTO TRAVEL
      SHARD.105:
        put n
        GOTO TRAVEL
      SHARD.106:
        setVariable storecode Smuse
        put go building
        GOTO TRAVEL
      SHARD.107:
        setVariable entrance arch
        GOTO SETSTORE

    LEAVE.SMUSE:
        counter set 108
      SHARD.108:
        put out
        GOTO TRAVEL
      SHARD.109:
        put go gate
        GOTO TRAVEL
      SHARD.110:
        put n
        GOTO TRAVEL
      SHARD.111:
        setVariable storecode Sbake
        put se
        GOTO TRAVEL
      SHARD.112:
        setVariable entrance bakery
        GOTO SETSTORE

    LEAVE.SBAKE:
        counter set 113
      SHARD.113:
        put se
        GOTO TRAVEL
      SHARD.114:
        put se
        GOTO TRAVEL
      SHARD.115:
        put se
        GOTO TRAVEL
      SHARD.116:
        put se
        GOTO TRAVEL
      SHARD.117:
        put se
        GOTO TRAVEL
      SHARD.118:
        put go bridge
        GOTO TRAVEL
      SHARD.119:
        setVariable storecode Sbows
        put ne
        GOTO TRAVEL
      SHARD.120:
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.SBOWS:
        GOTO %LorM%.SBOWS.1
    LEAVE.SBOWS.1:
        counter set 121
      SHARD.121:
        put ne
        GOTO TRAVEL
      SHARD.122:
        put n
        GOTO TRAVEL
      SHARD.123:
        put go gate
        GOTO TRAVEL
      SHARD.124:
        put e
        GOTO TRAVEL
      SHARD.125:
        put e
        GOTO TRAVEL
      SHARD.126:
        put e
        GOTO TRAVEL
      SHARD.127:
        put e
        GOTO TRAVEL
      SHARD.128:
        put e
        GOTO TRAVEL
      SHARD.129:
        put e
        GOTO TRAVEL
      SHARD.130:
        put go gap
        GOTO TRAVEL
      SHARD.131:
        put n
        GOTO TRAVEL
      SHARD.132:
        put n
        GOTO TRAVEL
      SHARD.133:
        put n
        GOTO TRAVEL
      SHARD.134:
        put go gate
        GOTO TRAVEL
      SHARD.135:
        put nw
        GOTO TRAVEL
      SHARD.136:
        put go path
        GOTO TRAVEL
      SHARD.137:
        put ne
        GOTO TRAVEL
      SHARD.138:
        put go building
        GOTO TRAVEL
      SHARD.139:
        setVariable storecode Stann
        setVariable entrance building
        GOTO SETSTORE

    ALTLEAVE.STANN:
    LEAVE.STANN:
        put out
        wait
        setVariable storecode Ssupb
        setVariable entrance tree
        GOTO SETSTORE

    LEAVE.SSUPB:
        counter set 140
      SHARD.140:
        put go tree
        GOTO TRAVEL
      SHARD.141:
        setVariable storecode Ssupf
        setVariable entrance curtain
        GOTO SETSTORE

    ALTLEAVE.SSUPF:
        counter set 380
      SHARD.380:
        put out
        GOTO TRAVEL
      SHARD.381:
        put sw
        GOTO TRAVEL
    LEAVE.SSUPF:
      SHARD.142:
        match ALTLEAVE.SSUPF referring
      SHARD.382:
        counter set 142
        put go path
        GOTO TRAVEL
      SHARD.143:
        put se
        GOTO TRAVEL
      SHARD.144:
        put go gate
        GOTO TRAVEL
      SHARD.145:
        put s
        GOTO TRAVEL
      SHARD.146:
        put s
        GOTO TRAVEL
      SHARD.147:
        put s
        GOTO TRAVEL
      SHARD.148:
        put go gap
        GOTO TRAVEL
      SHARD.149:
        put w
        GOTO TRAVEL
      SHARD.150:
        put n
        GOTO TRAVEL
      SHARD.151:
        put n
        GOTO TRAVEL
      SHARD.152:
        put n
        GOTO TRAVEL
      SHARD.153:
        put n
        GOTO TRAVEL
      SHARD.154:
        put n
        GOTO TRAVEL
      SHARD.155:
        put n
        GOTO TRAVEL
      SHARD.156:
        put n
        GOTO TRAVEL
      SHARD.157:
        put n
        GOTO TRAVEL
      SHARD.158:
        put nw
        GOTO TRAVEL
      SHARD.159:
        put nw
        GOTO TRAVEL
      SHARD.160:
        put nw
        GOTO TRAVEL
      SHARD.161:
        put nw
        GOTO TRAVEL
      SHARD.162:
        put nw
        GOTO TRAVEL
      SHARD.163:
        put nw
        GOTO TRAVEL
      SHARD.164:
        put w
        GOTO TRAVEL
      SHARD.165:
        put w
        GOTO TRAVEL
      SHARD.166:
        put w
        GOTO TRAVEL
      SHARD.167:
        put w
        GOTO TRAVEL
      SHARD.168:
        put w
        GOTO TRAVEL
      SHARD.169:
        put w
        GOTO TRAVEL
      SHARD.170:
        put w
        GOTO TRAVEL
      SHARD.171:
        GOTO %LorM%.SSUPF.1

    LEAVE.SSUPF.1:
        counter set 743
      SHARD.743:
        put ne
        GOTO TRAVEL
      SHARD.744:
        counter set 172
      SHARD.172:
        put nw
        GOTO TRAVEL
      SHARD.173:
        put nw
        GOTO TRAVEL
      SHARD.174:
        put n
        GOTO TRAVEL
      SHARD.175:
        put n
        GOTO TRAVEL
      SHARD.176:
        put e
        GOTO TRAVEL
      SHARD.177:
        put e
        GOTO TRAVEL
      SHARD.178:
        put ne
        GOTO TRAVEL
      SHARD.179:
        put e
        GOTO TRAVEL
      SHARD.180:
        put e
        GOTO TRAVEL
      SHARD.181:
        put n
        GOTO TRAVEL
      SHARD.182:
        put ne
        GOTO TRAVEL
      SHARD.183:
        put ne
        GOTO TRAVEL
      SHARD.184:
        put ne
        GOTO TRAVEL
      SHARD.185:
        put n
        GOTO TRAVEL
      SHARD.186:
        put ne
        GOTO TRAVEL
      SHARD.187:
        put ne
        GOTO TRAVEL
      SHARD.188:
        put n
        GOTO TRAVEL
      SHARD.189:
        put n
        GOTO TRAVEL
      SHARD.190:
        put ne
        GOTO TRAVEL
      SHARD.191:
        put ne
        GOTO TRAVEL
      SHARD.192:
        put n
        GOTO TRAVEL
      SHARD.193:
        put n
        GOTO TRAVEL
      SHARD.194:
        put ne
        GOTO TRAVEL
      SHARD.195:
        put n
        GOTO TRAVEL
      SHARD.196:
        put ne
        GOTO TRAVEL
      SHARD.197:
        put n
        GOTO TRAVEL
      SHARD.198:
        put ne
        GOTO TRAVEL
      SHARD.199:
        put e
        GOTO TRAVEL
      SHARD.200:
        put ne
        GOTO TRAVEL
      SHARD.201:
        put n
        GOTO TRAVEL
      SHARD.202:
        put go oak
        GOTO TRAVEL
      SHARD.203:
        put go clock
        GOTO TRAVEL
      SHARD.204:
        put go blue door
        GOTO TRAVEL
      SHARD.205:
        setVariable storecode Smarw
        setVariable entrance blue door
        GOTO SETSTORE

    LEAVE.SMARW:
        counter set 206
      SHARD.206:
        match ALTLEAVE.SMARW referring
        put go green door
        GOTO TRAVEL
      SHARD.207:
        setVariable storecode Smarg
        setVariable entrance green door
        GOTO SETSTORE

    LEAVE.SMARG:
        counter set 208
      SHARD.208:
        match ALTLEAVE.SMARG referring
        put go clock
        GOTO TRAVEL
      SHARD.209:
        put go road
        GOTO TRAVEL
      SHARD.210:
        put s
        GOTO TRAVEL
      SHARD.211:
        put sw
        GOTO TRAVEL
      SHARD.212:
        put climb stair
        GOTO TRAVEL
      SHARD.213:
        put go tree
        GOTO TRAVEL
      SHARD.214:
        setVariable storecode Senes
        setVariable entrance tree
        GOTO SETSTORE

    ALTLEAVE.SENES:
        counter set 387
      SHARD.387:
        put out
        GOTO TRAVEL
      SHARD.388:
    LEAVE.SENES:
        counter set 215
      SHARD.215:
        match ALTLEAVE.SENES referring
        put climb stair
        GOTO TRAVEL
      SHARD.216:
        put w
        GOTO TRAVEL
      SHARD.217:
        put sw
        GOTO TRAVEL
      SHARD.218:
        put s
        GOTO TRAVEL
      SHARD.219:
        put sw
        GOTO TRAVEL
      SHARD.220:
        put s
        GOTO TRAVEL
      SHARD.221:
        put sw
        GOTO TRAVEL
      SHARD.222:
        put s
        GOTO TRAVEL
      SHARD.223:
        put s
        GOTO TRAVEL
      SHARD.224:
        put sw
        GOTO TRAVEL
      SHARD.225:
        put sw
        GOTO TRAVEL
      SHARD.226:
        put s
        GOTO TRAVEL
      SHARD.227:
        put s
        GOTO TRAVEL
      SHARD.228:
        put sw
        GOTO TRAVEL
      SHARD.229:
        put sw
        GOTO TRAVEL
      SHARD.230:
        put s
        GOTO TRAVEL
      SHARD.231:
        put sw
        GOTO TRAVEL
      SHARD.232:
        put sw
        GOTO TRAVEL
      SHARD.233:
        GOTO %LorM%.SENES.1
    LEAVE.SENES.1:
        GOTO SHARD.CLAN.%clanoption%

    MOVEON.SENES.1:
    SHARD.CLAN.NO.1:
        counter set 733
      SHARD.733:
        put sw
        GOTO TRAVEL
      SHARD.734:
        counter set 234
      SHARD.234:
        put s
        GOTO TRAVEL
      SHARD.235:
        put w
        GOTO TRAVEL
      SHARD.236:
        put w
        GOTO TRAVEL
      SHARD.237:
        put sw
        GOTO TRAVEL
      SHARD.238:
        put w
        GOTO TRAVEL
      SHARD.239:
        put w
        GOTO TRAVEL
      SHARD.240:
        put s
        GOTO TRAVEL
      SHARD.241:
        put s
        GOTO TRAVEL
      SHARD.242:
        put se
        GOTO TRAVEL
      SHARD.243:
        put se
        GOTO TRAVEL
      SHARD.244:
        put sw
        GOTO TRAVEL

    SHARD.CLAN.YES:
        put echo %HCfelt% %HCequi% %HCfalc% %HCjaht% %HCcash% %HCbow1% %HCbow2% %SCCleat% %SCCweap%
        put glance
        match SHARD.CLAN.NO nothing nothing nothing nothing nothing nothing nothing nothing nothing
        match SHARD.CLAN.YES.2 You glance
        GOTO UniversalMatch

    SHARD.CLAN.NO:
        setVariable clanoption NO
        GOTO SHARD.CLAN.NO.1
        
    SHARD.CLAN.YES.2:
        counter set 452
      SHARD.452:
        put sw
        GOTO TRAVEL
      SHARD.453:
        put go path
        GOTO TRAVEL
      SHARD.454:
        put w
        GOTO TRAVEL
      SHARD.455:
        put go bridge
        GOTO TRAVEL
      SHARD.456:
        put e
        GOTO TRAVEL
      SHARD.457:
        put n
        GOTO TRAVEL
      SHARD.458:
        put n
        GOTO TRAVEL
      SHARD.459:
        put n
        GOTO TRAVEL
      SHARD.460:
        put go stable
        GOTO TRAVEL
      SHARD.461:
        put e
        GOTO TRAVEL
      SHARD.462:
        setVariable storecode SCCleat
        setVariable entrance south
        GOTO SETSTORE

    LEAVE.SCCLEAT:
        counter set 463
      SHARD.463:
        put w
        GOTO TRAVEL
      SHARD.464:
        put go door
        GOTO TRAVEL
      SHARD.465:
        put s
        GOTO TRAVEL
      SHARD.466:
        put s
        GOTO TRAVEL
      SHARD.467:
        put s
        GOTO TRAVEL
      SHARD.468:
        put e
        GOTO TRAVEL
      SHARD.469:
        put ne
        GOTO TRAVEL
      SHARD.470:
        setVariable storecode SCCweap
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.SCCWEAP:
        counter set 471
      SHARD.471:
        put sw
        GOTO TRAVEL
      SHARD.472:
        put w
        GOTO TRAVEL
      SHARD.473:
        put w
        GOTO TRAVEL
      SHARD.474:
        put go gate
        GOTO TRAVEL
      SHARD.475:
        put e
        GOTO TRAVEL
      SHARD.476:
        put go path
        GOTO TRAVEL
      SHARD.477:
        put s
        GOTO TRAVEL
      SHARD.478:
        put w
        GOTO TRAVEL
      SHARD.479:
        put w
        GOTO TRAVEL
      SHARD.480:
        put sw
        GOTO TRAVEL
      SHARD.481:
        put w
        GOTO TRAVEL
      SHARD.482:
        put w
        GOTO TRAVEL
      SHARD.483:
        put s
        GOTO TRAVEL
      SHARD.484:
        put s
        GOTO TRAVEL
      SHARD.485:
        put se
        GOTO TRAVEL
      SHARD.486:
        put se
        GOTO TRAVEL
      SHARD.487:
        put sw
        GOTO TRAVEL
      SHARD.488:
        put go trail
        GOTO TRAVEL
      SHARD.489:
        put w
        GOTO TRAVEL
      SHARD.490:
        put sw
        GOTO TRAVEL
      SHARD.491:
        put sw
        GOTO TRAVEL
      SHARD.492:
        put s
        GOTO TRAVEL
      SHARD.493:
        put w
        GOTO TRAVEL
      SHARD.494:
        put nw
        GOTO TRAVEL
      SHARD.495:
        put n
        GOTO TRAVEL
      SHARD.496:
        put nw
        GOTO TRAVEL
      SHARD.497:
        put w
        GOTO TRAVEL
      SHARD.498:
        put n
        GOTO TRAVEL
      SHARD.499:
        put nw
        GOTO TRAVEL
      SHARD.500:
        put n
        GOTO TRAVEL
      SHARD.501:
        put nw
        GOTO TRAVEL
      SHARD.502:
        put nw
        GOTO TRAVEL
      SHARD.503:
        put n
        GOTO TRAVEL
      SHARD.504:
        put ne
        GOTO TRAVEL
      SHARD.505:
        put ne
        GOTO TRAVEL
      SHARD.506:
        put ne
        GOTO TRAVEL
      SHARD.507:
        put n
        GOTO TRAVEL
      SHARD.508:
        put ne
        GOTO TRAVEL
      SHARD.509:
        put n
        GOTO TRAVEL
      SHARD.510:
        put nw
        GOTO TRAVEL
      SHARD.511:
        put nw
        GOTO TRAVEL
      SHARD.512:
        put w
        GOTO TRAVEL
      SHARD.513:
        put nw
        GOTO TRAVEL
      SHARD.514:
        put w
        GOTO TRAVEL
      SHARD.515:
        put w
        GOTO TRAVEL
      SHARD.516:
        put sw
        GOTO TRAVEL
      SHARD.517:
        put nw
        GOTO TRAVEL
      SHARD.518:
        put w
        GOTO TRAVEL
      SHARD.519:
        put w
        GOTO TRAVEL
      SHARD.520:
        put w
        GOTO TRAVEL
      SHARD.521:
        put w
        GOTO TRAVEL
      SHARD.522:
        put w
        GOTO TRAVEL
      SHARD.523:
        put sw
        GOTO TRAVEL
      SHARD.524:
        put nw
        GOTO TRAVEL
      SHARD.525:
        put w
        GOTO TRAVEL
      SHARD.526:
        put w
        GOTO TRAVEL
      SHARD.527:
        put sw
        GOTO TRAVEL
      SHARD.528:
        put sw
        GOTO TRAVEL
      SHARD.529:
        put nw
        GOTO TRAVEL
      SHARD.530:
        put w
        GOTO TRAVEL
      SHARD.531:
        put w
        GOTO TRAVEL
      SHARD.532:
        put sw
        GOTO TRAVEL
      SHARD.533:
        put sw
        GOTO TRAVEL
      SHARD.534:
        put nw
        GOTO TRAVEL
      SHARD.535:
        put w
        GOTO TRAVEL
      SHARD.536:
        put sw
        GOTO TRAVEL
      SHARD.537:
        put w
        GOTO TRAVEL
      SHARD.538:
        put sw
        GOTO TRAVEL
      SHARD.539:
        put climb path
        GOTO TRAVEL
      SHARD.540:
        put w
        GOTO TRAVEL
      SHARD.541:
        put nw
        GOTO TRAVEL
      SHARD.542:
        put w
        GOTO TRAVEL
      SHARD.543:
        put sw
        GOTO TRAVEL
      SHARD.544:
        put climb trail
        GOTO TRAVEL
      SHARD.545:
        put nw
        GOTO TRAVEL
      SHARD.546:
        put s
        GOTO TRAVEL
      SHARD.547:
        put sw
        GOTO TRAVEL
      SHARD.548:
        put w
        GOTO TRAVEL
      SHARD.549:
        put nw
        GOTO TRAVEL
      SHARD.550:
        put w
        GOTO TRAVEL
      SHARD.551:
        put w
        GOTO TRAVEL
      SHARD.552:
        put w
        GOTO TRAVEL
      SHARD.553:
        put sw
        GOTO TRAVEL
      SHARD.554:
        put se
        GOTO TRAVEL
      SHARD.555:
        put s
        GOTO TRAVEL
      SHARD.556:
        put w
        GOTO TRAVEL
      SHARD.557:
        put sw
        GOTO TRAVEL
      SHARD.558:
        put w
        GOTO TRAVEL
      SHARD.559:
        put sw
        GOTO TRAVEL
      SHARD.560:
        put w
        GOTO TRAVEL
      SHARD.561:
        put sw
        GOTO TRAVEL
      SHARD.562:
        put w
        GOTO TRAVEL
      SHARD.563:
        put nw
        GOTO TRAVEL
      SHARD.564:
        put w
        GOTO TRAVEL
      SHARD.565:
        put nw
        GOTO TRAVEL
      SHARD.566:
        put w
        GOTO TRAVEL
      SHARD.567:
        put nw
        GOTO TRAVEL
      SHARD.568:
        put w
        GOTO TRAVEL
      SHARD.569:
        put s
        GOTO TRAVEL
      SHARD.570:
        put go path
        GOTO TRAVEL
      SHARD.571:
        put sw
        GOTO TRAVEL
      SHARD.572:
        put w
        GOTO TRAVEL
      SHARD.573:
        put sw
        GOTO TRAVEL
      SHARD.574:
        put se
        GOTO TRAVEL
      SHARD.575:
        put w
        GOTO TRAVEL
      SHARD.576:
        put w
        GOTO TRAVEL
      SHARD.577:
        put se
        GOTO TRAVEL
      SHARD.578:
        put se
        GOTO TRAVEL
      SHARD.579:
        put s
        GOTO TRAVEL
      SHARD.580:
        setVariable storecode HCfelt
        setVariable entrance tent
        GOTO SETSTORE

    LEAVE.HCFELT:
        counter set 581
      SHARD.581:
        put sw
        GOTO TRAVEL
      SHARD.582:
        put e
        GOTO TRAVEL
      SHARD.583:
        put ne
        GOTO TRAVEL
      SHARD.584:
        put e
        GOTO TRAVEL
      SHARD.585:
        put se
        GOTO TRAVEL
      SHARD.586:
        put e
        GOTO TRAVEL
      SHARD.587:
        put se
        GOTO TRAVEL
      SHARD.588:
        put go tent
        GOTO TRAVEL
      SHARD.589:
        setVariable storecode HCequi
        setVariable entrance east
        GOTO SETSTORE

    LEAVE.HCEQUI:
        counter set 590
      SHARD.590:
        put go flap
        GOTO TRAVEL
      SHARD.591:
        put s
        GOTO TRAVEL
      SHARD.592:
        put se
        GOTO TRAVEL
      SHARD.593:
        put w
        GOTO TRAVEL
      SHARD.594:
        put nw
        GOTO TRAVEL
      SHARD.595:
        setVariable storecode HCfalc
        setVariable entrance tent
        GOTO SETSTORE

    LEAVE.HCFALC:
        counter set 596
      SHARD.596:
        put sw
        GOTO TRAVEL
      SHARD.597:
        put go tent
        GOTO TRAVEL
      SHARD.598:
        setVariable storecode HCjaht
        setVariable entrance corner
        GOTO SETSTORE

    LEAVE.HCJAHT:
        counter set 599
      SHARD.599:
        put go flap
        GOTO TRAVEL
      SHARD.600:
        put se
        GOTO TRAVEL
      SHARD.601:
        put se
        GOTO TRAVEL
      SHARD.602:
        put se
        GOTO TRAVEL
      SHARD.603:
        put e
        GOTO TRAVEL
      SHARD.604:
        put se
        GOTO TRAVEL
      SHARD.605:
        setVariable storecode HCcash
        setVariable entrance tent
        GOTO SETSTORE

    LEAVE.HCCASH:
        counter set 606
      SHARD.606:
        put n
        GOTO TRAVEL
      SHARD.607:
        put nw
        GOTO TRAVEL
      SHARD.608:
        setVariable storecode HCbow1
        setVariable entrance tent
        GOTO SETSTORE

    LEAVE.HCBOW1:
        setVariable storecode HCbow2
        GOTO SETSTORE

    LEAVE.HCBOW2:
        counter set 745
      SHARD.745:
        put go flap
        match SHARD.746 referring
        GOTO TRAVEL
      SHARD.746:
        counter set 609
      SHARD.609:
        put w
        GOTO TRAVEL
      SHARD.610:
        put ne
        GOTO TRAVEL
      SHARD.611:
        put n
        GOTO TRAVEL
      SHARD.612:
        put nw
        GOTO TRAVEL
      SHARD.613:
        put n
        GOTO TRAVEL
      SHARD.614:
        put nw
        GOTO TRAVEL
      SHARD.615:
        put w
        GOTO TRAVEL
      SHARD.616:
        match HORSE.HEALTH.%class hand which appears completely useless
        match LEAVE.HCBOW2.2 You glance
        put health
        put glance
        GOTO UniversalMatch

    HORSE.HEALTH.EMPATH:
        setVariable SelfHealLoc HorseClan
        GOTO EMPATH.HEALSELF

    SHARD.EMPATH.TO.RESUME.FROM.HORSECLAN:
        setVariable MRS shopcheck
        setVariable LorM leave
        setVariable npcoption yes
        GOTO LEAVE.HCBOW2.2

    HORSE.HEALTH.THIEF:
    HORSE.HEALTH.NONTHIEF:
    LEAVE.HCBOW2.2:
        counter set 805
      SHARD.805:
        put nw
        GOTO TRAVEL
      SHARD.806:
        counter set 617
      SHARD.617:
        put w
        GOTO TRAVEL
      SHARD.618:
        put sw
        GOTO TRAVEL
      SHARD.619:
        put w
        GOTO TRAVEL
      SHARD.620:
        put ne
        GOTO TRAVEL
      SHARD.621:
        put n
        GOTO TRAVEL
      SHARD.622:
        put nw
        GOTO TRAVEL
      SHARD.623:
        put nw
        GOTO TRAVEL
      SHARD.624:
        put e
        GOTO TRAVEL
      SHARD.625:
        put e
        GOTO TRAVEL
      SHARD.626:
        put nw
        GOTO TRAVEL
      SHARD.627:
        put ne
        GOTO TRAVEL
      SHARD.628:
        put e
        GOTO TRAVEL
      SHARD.629:
        put ne
        GOTO TRAVEL
      SHARD.630:
        put go path
        GOTO TRAVEL
      SHARD.631:
        put n
        GOTO TRAVEL
      SHARD.632:
        put e
        GOTO TRAVEL
      SHARD.633:
        put se
        GOTO TRAVEL
      SHARD.634:
        put e
        GOTO TRAVEL
      SHARD.635:
        put se
        GOTO TRAVEL
      SHARD.636:
        put e
        GOTO TRAVEL
      SHARD.637:
        put se
        GOTO TRAVEL
      SHARD.638:
        put e
        GOTO TRAVEL
      SHARD.639:
        put ne
        GOTO TRAVEL
      SHARD.640:
        put e
        GOTO TRAVEL
      SHARD.641:
        put ne
        GOTO TRAVEL
      SHARD.642:
        put e
        GOTO TRAVEL
      SHARD.643:
        put ne
        GOTO TRAVEL
      SHARD.644:
        put e
        GOTO TRAVEL
      SHARD.645:
        put n
        GOTO TRAVEL
      SHARD.646:
        put nw
        GOTO TRAVEL
      SHARD.647:
        put ne
        GOTO TRAVEL
      SHARD.648:
        put e
        GOTO TRAVEL
      SHARD.649:
        put e
        GOTO TRAVEL
      SHARD.650:
        put e
        GOTO TRAVEL
      SHARD.651:
        put se
        GOTO TRAVEL
      SHARD.652:
        put e
        GOTO TRAVEL
      SHARD.653:
        put ne
        GOTO TRAVEL
      SHARD.654:
        put n
        GOTO TRAVEL
      SHARD.655:
        put se
        GOTO TRAVEL
      SHARD.656:
        put climb bluff
        GOTO TRAVEL
      SHARD.657:
        put ne
        GOTO TRAVEL
      SHARD.658:
        put e
        GOTO TRAVEL
      SHARD.659:
        put se
        GOTO TRAVEL
      SHARD.660:
        counter set 670
      SHARD.670:
        put e
        GOTO TRAVEL
      SHARD.671:
        put climb path
        GOTO TRAVEL
      SHARD.672:
        put ne
        GOTO TRAVEL
      SHARD.673:
        put e
        GOTO TRAVEL
      SHARD.674:
        put ne
        GOTO TRAVEL
      SHARD.675:
        put e
        GOTO TRAVEL
      SHARD.676:
        put se
        GOTO TRAVEL
      SHARD.677:
        put ne
        GOTO TRAVEL
      SHARD.678:
        put ne
        GOTO TRAVEL
      SHARD.679:
        put e
        GOTO TRAVEL
      SHARD.680:
        put e
        GOTO TRAVEL
      SHARD.681:
        put se
        GOTO TRAVEL
      SHARD.682:
        put ne
        GOTO TRAVEL
      SHARD.683:
        put ne
        GOTO TRAVEL
      SHARD.684:
        put e
        GOTO TRAVEL
      SHARD.685:
        put e
        GOTO TRAVEL
      SHARD.686:
        put se
        GOTO TRAVEL
      SHARD.687:
        put ne
        GOTO TRAVEL
      SHARD.688:
        put e
        GOTO TRAVEL
      SHARD.689:
        put e
        GOTO TRAVEL
      SHARD.690:
        put e
        GOTO TRAVEL
      SHARD.691:
        put e
        GOTO TRAVEL
      SHARD.692:
        put e
        GOTO TRAVEL
      SHARD.693:
        put se
        GOTO TRAVEL
      SHARD.694:
        put ne
        GOTO TRAVEL
      SHARD.695:
        put e
        GOTO TRAVEL
      SHARD.696:
        put e
        GOTO TRAVEL
      SHARD.697:
        put se
        GOTO TRAVEL
      SHARD.698:
        put e
        GOTO TRAVEL
      SHARD.699:
        put se
        GOTO TRAVEL
      SHARD.700:
        put se
        GOTO TRAVEL
      SHARD.701:
        put s
        GOTO TRAVEL
      SHARD.702:
        put sw
        GOTO TRAVEL
      SHARD.703:
        put s
        GOTO TRAVEL
      SHARD.704:
        put sw
        GOTO TRAVEL
      SHARD.705:
        put sw
        GOTO TRAVEL
      SHARD.706:
        put sw
        GOTO TRAVEL
      SHARD.707:
        put s
        GOTO TRAVEL
      SHARD.708:
        put se
        GOTO TRAVEL
      SHARD.709:
        put se
        GOTO TRAVEL
      SHARD.710:
        put s
        GOTO TRAVEL
      SHARD.711:
        put se
        GOTO TRAVEL
      SHARD.712:
        put s
        GOTO TRAVEL
      SHARD.713:
        put e
        GOTO TRAVEL
      SHARD.714:
        put se
        GOTO TRAVEL
      SHARD.715:
        put s
        GOTO TRAVEL
      SHARD.716:
        put se
        GOTO TRAVEL
      SHARD.717:
        put e
        GOTO TRAVEL
      SHARD.718:
        put go trail
        GOTO TRAVEL
      SHARD.719:
        put ne
        GOTO TRAVEL
      SHARD.720:
        put ne
        GOTO TRAVEL
      SHARD.721:
        put e
        GOTO TRAVEL
      SHARD.722:
        put e
        GOTO TRAVEL
      SHARD.723:
    MOVEON.SSUPF.1:
        counter set 245
      SHARD.245:
        put s
        GOTO TRAVEL
      SHARD.246:
        put s
        GOTO TRAVEL
      SHARD.247:
        put s
        GOTO TRAVEL
      SHARD.248:
        put s
        GOTO TRAVEL
      SHARD.249:
        put s
        GOTO TRAVEL
      SHARD.250:
        put go gate
        GOTO TRAVEL
      SHARD.251:
        put s
        GOTO TRAVEL
      SHARD.252:
        put s
        GOTO TRAVEL
      SHARD.253:
        put s
        GOTO TRAVEL
      SHARD.254:
        setVariable storecode Sgene
        setVariable entrance shop
        GOTO SETSTORE

    MOVEON.SBOWS.1:
        counter set 260
      SHARD.260:
        put sw
        GOTO TRAVEL
      SHARD.261:
        put sw
        GOTO TRAVEL
      SHARD.262:
        put w
        GOTO TRAVEL
      SHARD.263:
        put w
        GOTO TRAVEL
      SHARD.264:
        put n
        GOTO TRAVEL
      SHARD.265:
        put n
        GOTO TRAVEL
      SHARD.266:
        put n
        GOTO TRAVEL
      SHARD.267:
        put go building
        GOTO TRAVEL
      SHARD.268:
        match SHARD.PAWN.TO.QUENTIN hand which appears completely useless
        match PAWN.%DropOrStow% You glance
        put health
        put glance
        GOTO UniversalMatch

    MOVEON.SGENE.1:
        counter set 760
      SHARD.760:
        put s
        GOTO TRAVEL
      SHARD.761:
        put s
        GOTO TRAVEL
      SHARD.762:
        put s
        GOTO TRAVEL
      SHARD.763:
        put s
        GOTO TRAVEL
      SHARD.764:
        put go gate
        GOTO TRAVEL
      SHARD.765:
        put s
        GOTO TRAVEL
      SHARD.766:
        put e
        GOTO TRAVEL
      SHARD.767:
        match SHARD.QUENTIN.%class hand which appears completely useless
        match MOVEON.SGENE.2 You glance
        put health
        put glance
        GOTO UniversalMatch

    SHARD.QUENTIN.THIEF:
    SHARD.QUENTIN.NONTHIEF:
        counter set 768
      SHARD.768:
        put go building
        GOTO TRAVEL
      SHARD.769:
        put lie
        matchre SHARD.QUENTIN.LEAVE /birthday party|just my friend|You sit up/
        GOTO UniversalMatch
    SHARD.QUENTIN.LEAVE:
        match SHARD.770 You stand
        matchre SHARD.QUENTIN.LEAVE /...wait|type ahead|Roundtime/i
        put kneel
        put stand
        GOTO UniversalMatch
      SHARD.770:
        put out
        GOTO TRAVEL
      SHARD.771:
        put w
        GOTO TRAVEL
      SHARD.772:
        GOTO SHARD.QUENTIN.RESUME

    SHARD.QUENTIN.EMPATH:
        counter set 794
      SHARD.794:
        put se
        GOTO TRAVEL
      SHARD.795:
        put s
        GOTO TRAVEL
      SHARD.796:
        put s
        GOTO TRAVEL
      SHARD.797:
        put sw
        GOTO TRAVEL
      SHARD.798:
        setVariable SelfHealLoc ShardTowerSE
        GOTO EMPATH.HEALSELF
    SHARD.EMPATH.TO.RESUME.FROM.SHARDTOWERSE:
        counter set 799
      SHARD.799:
        put ne
        GOTO TRAVEL
      SHARD.800:
        put n
        GOTO TRAVEL
      SHARD.801:
        put n
        GOTO TRAVEL
      SHARD.802:
        put nw
        GOTO TRAVEL
      SHARD.803:
        put w
        GOTO TRAVEL
      SHARD.804:
        GOTO SHARD.QUENTIN.RESUME

    MOVEON.SGENE.2:
        counter set 773
      SHARD.773:
        put se
        GOTO TRAVEL
      SHARD.774:
        put s
        GOTO TRAVEL
      SHARD.775:
        put s
        GOTO TRAVEL
      SHARD.776:
        put sw
        GOTO TRAVEL
      SHARD.777:
        put w
        GOTO TRAVEL
      SHARD.778:
        put se
        GOTO TRAVEL
      SHARD.779:
        GOTO LEAVE.SBAKE

    SHARD.PAWN.TO.QUENTIN:
        counter set 780
      SHARD.780:
        put o
        GOTO TRAVEL
      SHARD.781:
        put n
        GOTO TRAVEL
      SHARD.782:
        put n
        GOTO TRAVEL
      SHARD.783:
        put n
        GOTO TRAVEL
      SHARD.784:
        put n
        GOTO TRAVEL
      SHARD.785:
        put n
        GOTO TRAVEL
      SHARD.786:
        put go gate
        GOTO TRAVEL
      SHARD.787:
        put n
        GOTO TRAVEL
      SHARD.788:
        put e
        GOTO TRAVEL
      SHARD.789:
        put ne
        GOTO TRAVEL
      SHARD.790:
        put n
        GOTO TRAVEL
      SHARD.791:
        put n
        GOTO TRAVEL
      SHARD.792:
        put nw
        GOTO TRAVEL
      SHARD.793:
        GOTO SHARD.QUENTIN.ENTER

    ALTLEAVE.SCOIN:
    ALTLEAVE.STOKE:
    ALTLEAVE.SFRIL:
    ALTLEAVE.SHERA:
    ALTLEAVE.STOUR:
    ALTLEAVE.STOYB:
    ALTLEAVE.SBARB:
    ALTLEAVE.SMARW:
    ALTLEAVE.SMARG:
      SHARD.255:
        counter set 255
        put go door
        GOTO TRAVEL
      SHARD.256:
        GOTO LEAVE.%storecode%

    ALTLEAVE.SLOCK:
        match ALTLEAVE.SLOCK1 Kilam
        match ALTLEAVE.SLOCK2 Malik
        match LEAVE.SLOCK brown-trimmed blue shop
        put look
        GOTO UniversalMatch
    ALTLEAVE.SLOCK1:
        put go trapdoor
        match ALTLEAVE.SLOCK2 Malik
        GOTO UniversalMatch
    ALTLEAVE.SLOCK2:
        put out
        match LEAVE.SLOCK brown-trimmed blue shop
        GOTO UniversalMatch

    ALTLEAVE.HCFELT:
    ALTLEAVE.HPOTT:
    ALTLEAVE.HCFALC:
    ALTLEAVE.HCCASH:
        counter set 724
      SHARD.724:
        put go flap
        GOTO TRAVEL
      SHARD.725:
        GOTO LEAVE.%storecode%

    ALTLEAVE.HCBOW1:
    ALTLEAVE.HCBOW2:
        counter set 747
      SHARD.747:
        put go curtain
        GOTO TRAVEL
      SHARD.748:
        GOTO LEAVE.%storecode%

    ALTLEAVE.SCCLEAT:
        counter set 726
      SHARD.726:
        put n
        GOTO TRAVEL
      SHARD.727:
        GOTO LEAVE.%storecode%

    ALTLEAVE.HCEQUI:
        counter set 728
      SHARD.728:
        put w
        GOTO TRAVEL
      SHARD.729:
        GOTO LEAVE.%storecode%

    ALTLEAVE.HCJAHT:
        counter set 730
      SHARD.730:
        put go tent
        GOTO TRAVEL
      SHARD.731:
        GOTO LEAVE.%storecode%


##################################################################
#####                                                        #####
#####                    ILITHI BINNING                      #####
#####                                                        #####
##################################################################


    SHARD.PAWNFINISH.NONTHIEF:
    SHARD.PAWNFINISH.EMPATH:
        GOTO END

    SHARD.PAWNFINISH.THIEF:
        counter set 272
      SHARD.272:
        put out
        GOTO TRAVEL
      SHARD.273:
        put n
        GOTO TRAVEL
      SHARD.274:
        put n
        GOTO TRAVEL
      SHARD.275:
        put n
        GOTO TRAVEL
      SHARD.276:
        put n
        GOTO TRAVEL
      SHARD.277:
        put n
        GOTO TRAVEL
      SHARD.278:
        put go gate
        GOTO TRAVEL
      SHARD.279:
        put n
        GOTO TRAVEL
      SHARD.280:
        put e
        GOTO TRAVEL
      SHARD.281:
        put ne
        GOTO TRAVEL
      SHARD.282:
        put n
        GOTO TRAVEL
      SHARD.283:
        put e
        GOTO TRAVEL
      SHARD.284:
        put e
        GOTO TRAVEL
      SHARD.285:
        put go bridge
        GOTO TRAVEL
      SHARD.286:
        put e
        GOTO TRAVEL
      SHARD.287:
        put e
        GOTO TRAVEL
      SHARD.288:
        put e
        GOTO TRAVEL
      SHARD.289:
        put e
        GOTO TRAVEL
      SHARD.290:
        put e
        GOTO TRAVEL
      SHARD.291:
        put go well
        GOTO TRAVEL
      SHARD.292:
        put climb ladder
        GOTO TRAVEL
      SHARD.293:
        put w
        GOTO TRAVEL
      SHARD.294:
        put out
        GOTO TRAVEL
      SHARD.295:
        put w
        GOTO TRAVEL
      SHARD.296:
        put se
        GOTO TRAVEL
      SHARD.297:
        put go gap
        GOTO TRAVEL
      SHARD.298:
        match SHARD.299 What is the password?
        put knock door
        GOTO UniversalMatch
      SHARD.299:
        match SHARD.300 I thought I recognized you.
        put say %shardpass
        GOTO UniversalMatch
      SHARD.300:
        counter set 300
        put go door
        GOTO TRAVEL
      SHARD.301:
        put go arch
        GOTO TRAVEL
      SHARD.302:
        put s
        GOTO TRAVEL
      SHARD.303:
        GOTO PAWN.BIN

    SHARD.BINFINISH.THIEF:
        counter set 304
      SHARD.304:
        put n
        GOTO TRAVEL
      SHARD.305:
        put go arch
        GOTO TRAVEL
      SHARD.306:
        put go door
        GOTO TRAVEL
      SHARD.307:
        put n
        GOTO TRAVEL
      SHARD.308:
        put nw
        GOTO TRAVEL
      SHARD.309:
        put e
        GOTO TRAVEL
      SHARD.310:
        put go fissure
        GOTO TRAVEL
      SHARD.311:
        put e
        GOTO TRAVEL
      SHARD.312:
        put climb ladder
        GOTO TRAVEL
      SHARD.313:
        put up
        GOTO TRAVEL
      SHARD.314:
        put w
        GOTO TRAVEL
      SHARD.315:
        put w
        GOTO TRAVEL
      SHARD.316:
        put w
        GOTO TRAVEL
      SHARD.317:
        put w
        GOTO TRAVEL
      SHARD.318:
        put go bridge
        GOTO TRAVEL
      SHARD.319:
        put w
        GOTO TRAVEL
      SHARD.320:
        put w
        GOTO TRAVEL
      SHARD.321:
        put w
        GOTO TRAVEL
      SHARD.322:
        put s
        GOTO TRAVEL
      SHARD.323:
        put sw
        GOTO TRAVEL
      SHARD.324:
        put w
        GOTO TRAVEL
      SHARD.325:
        put s
        GOTO TRAVEL
      SHARD.326:
        put go gate
        GOTO TRAVEL
      SHARD.327:
        put s
        GOTO TRAVEL
      SHARD.328:
        put s
        GOTO TRAVEL
      SHARD.329:
        put s
        GOTO TRAVEL
      SHARD.330:
        put s
        GOTO TRAVEL
      SHARD.331:
        put s
        GOTO TRAVEL
      SHARD.332:
        put go shop
        GOTO TRAVEL
      SHARD.333:
        GOTO END


##################################################################
#####                                                        #####
#####              ILITHI JUSTICE AND RESUMING               #####
#####                                                        #####
##################################################################


    SHARD.ITEMCHECK:
        put drop my small sack
        wait
        match SHARD.DEBT2 You have nothing
        match SHARD.FREE2 INVENTORY HELP
        put inv
        GOTO UniversalMatch

    SHARD.DEBT:
        counter set 389
      SHARD.389:
        put go hallway
        GOTO TRAVEL
    SHARD.DEBT2:
        counter set 390
      SHARD.390:
        put out
        GOTO TRAVEL
      SHARD.391:
        put s
        GOTO TRAVEL
      SHARD.392:
        put w
        GOTO TRAVEL
      SHARD.393:
        put nw
        GOTO TRAVEL
      SHARD.394:
        put go arch
        GOTO TRAVEL
      SHARD.395:
        put w
        GOTO TRAVEL
      SHARD.396:
        put w
        GOTO TRAVEL
      SHARD.397:
        put go bridge
        GOTO TRAVEL
      SHARD.398:
        put w
        GOTO TRAVEL
      SHARD.399:
        put w
        GOTO TRAVEL
      SHARD.400:
        put go bank
        GOTO TRAVEL
      SHARD.401:
        put n
        GOTO TRAVEL
      SHARD.402:
        put wit 500 bronze dokoras
        wait
        counter set 403
      SHARD.403:
        put s
        GOTO TRAVEL
      SHARD.404:
        put out
        GOTO TRAVEL
      SHARD.405:
        put e
        GOTO TRAVEL
      SHARD.406:
        put go bridge
        GOTO TRAVEL
      SHARD.407:
        put e
        GOTO TRAVEL
      SHARD.408:
        put e
        GOTO TRAVEL
      SHARD.409:
        put e
        GOTO TRAVEL
      SHARD.410:
        put go arch
        GOTO TRAVEL
      SHARD.411:
        put se
        GOTO TRAVEL
      SHARD.412:
        counter set 334
      SHARD.334:
        put e
        GOTO TRAVEL
      SHARD.335:
        put go entr
        GOTO TRAVEL
      SHARD.336:
        counter set 413
      SHARD.413:
        put go pass
        GOTO TRAVEL
      SHARD.414:
        put pay 5000
        wait
        counter set 415
      SHARD.415:
        put w
        GOTO TRAVEL
      SHARD.416:
        put s
        GOTO TRAVEL
      SHARD.417:
        put w
        GOTO TRAVEL
      SHARD.418:
        put nw
        GOTO TRAVEL
      SHARD.419:
        put go arch
        GOTO TRAVEL
      SHARD.420:
        put w
        GOTO TRAVEL
      SHARD.421:
        put w
        GOTO TRAVEL
      SHARD.422:
        put go bridge
        GOTO TRAVEL
      SHARD.423:
        put w
        GOTO TRAVEL
      SHARD.424:
        put w
        GOTO TRAVEL
      SHARD.425:
        put go bank
        GOTO TRAVEL
      SHARD.426:
        put n
        GOTO TRAVEL
      SHARD.427:
        put dep all
        wait
        counter set 428
      SHARD.428:
        put s
        GOTO TRAVEL
      SHARD.429:
        put out
        GOTO TRAVEL
      SHARD.430:
        put e
        GOTO TRAVEL
      SHARD.431:
        put go bridge
        GOTO TRAVEL
      SHARD.432:
        put e
        GOTO TRAVEL
      SHARD.433:
        put e
        GOTO TRAVEL
      SHARD.434:
        put e
        GOTO TRAVEL
      SHARD.435:
        put go arch
        GOTO TRAVEL
      SHARD.436:
        put se
        GOTO TRAVEL
      SHARD.437:
        put e
        GOTO TRAVEL
      SHARD.438:
        put go entr
        GOTO TRAVEL
      SHARD.439:
        put go corr
        GOTO TRAVEL
      SHARD.440:
        GOTO GETSACK

    SHARD.FREE:
        counter set 270
      SHARD.270:
        put go hall
        GOTO TRAVEL
      SHARD.271:
        GOTO GETSACK

    SHARD.FREE2:
        pause 1
        match SHARD.MISSINGSTART waitandsee
        match SHARD.FREE3 okstart
        put echo %startlocation%
        put echo okstart
        GOTO UniversalMatch

    SHARD.MISSINGSTART:
        setVariable startlocation Sgene
        setVariable ResumeStore Sgene
        GOTO SHARD.FREE3

    SHARD.FREE3:
        counter set 442
      SHARD.442:
        put out
        GOTO TRAVEL
      SHARD.443:
        put n
        GOTO TRAVEL
      SHARD.444:
        put go arch
        GOTO TRAVEL
    SHARD.QUENTIN.RESUME:
        counter set 445
      SHARD.445:
        put n
        GOTO TRAVEL
      SHARD.446:
        put go gate
        GOTO TRAVEL
      SHARD.447:
        put n
        GOTO TRAVEL
      SHARD.448:
        put n
        GOTO TRAVEL
      SHARD.449:
        put n
        GOTO TRAVEL
      SHARD.450:
        put n
        GOTO TRAVEL
      SHARD.451:
        counter set 1
        setVariable storecode Sgene
        GOTO RESUME.%ResumeStore%

    RESUME.HCBOW2:
        counter add 1
    RESUME.HCBOW1:
        counter add 1
    RESUME.HCCASH:
        counter add 1
    RESUME.HCJAHT:
        counter add 1
    RESUME.HCFALC:
        counter add 1
    RESUME.HPOTT:
        counter add 1
    RESUME.HCEQUI:
        counter add 1
    RESUME.HCFELT:
        counter add 1
    RESUME.SCCWEAP:
        counter add 1
    RESUME.SCCLEAT:
        counter add 1
    RESUME.SENES:
        counter add 1
    RESUME.SMARG:
        counter add 1
    RESUME.SMARW:
        counter add 1
    RESUME.SSUPF:
        counter add 1
    RESUME.SSUPB:
        counter add 1
    RESUME.STANN:
        counter add 1
    RESUME.SBOWS:
        counter add 1
    RESUME.SBAKE:
        counter add 1
    RESUME.SMUSE:
        counter add 1
    RESUME.SBARB:
        counter add 1
    RESUME.STOYB:
        counter add 1
    RESUME.STOUR:
        counter add 1
    RESUME.SHERA:
        counter add 1
    RESUME.SFRIL:
        counter add 1
    RESUME.STOKE:
        counter add 1
    RESUME.SCOIN:
        counter add 1
    RESUME.SARMO:
        counter add 1
    RESUME.SLOCK:
        counter add 1
    RESUME.SBARD:
        counter add 1
    RESUME.SREAG:
        counter add 1
    RESUME.SHERB:
        counter add 1
    RESUME.SALCH:
        counter add 1
    RESUME.SCLERIC:
        counter add 1
    RESUME.SSTIT:
        counter add 1
    RESUME.SWEAP:
        counter add 1
    RESUME.SGENE:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


##################################################################################
#############                                                        #############
#############                       Therengia                        #############
#############                                                        #############
#############                  SKILL DETERMINATION                   #############
#############      (tweak the items you steal here if desired)       #############
#############                                                        #############
##################################################################################


     THG.RANK.1:
        setVariable skillrange 20-39
        setVariable RHcloth <nothing>
        setVariable RHclothQuant 1
        setVariable RHgen purse
        setVariable RHgenQuant 1
        setVariable RHarms <nothing>
        setVariable RHarmsQuant 1
        setVariable RHflow black orchid
        setVariable RHflowQuant 1
        setVariable RHart <nothing>
        setVariable RHartQuant 1
        setVariable RHlock ordinary lockpick
        setVariable RHlockQuant 1
        setVariable RHjoy chocolate
        setVariable RHjoyQuant 1
        setVariable RHtobac <nothing>
        setVariable RHtobacQuant 1
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 1
        setVariable RHweap <nothing>
        setVariable RHweapQuant 1
        setVariable RHcler1 grey-brown feather
        setVariable RHcler1Quant 1
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 1
        setVariable RHbard1 pick
        setVariable RHbard1Quant 1
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap <nothing>
        setVariable RHnapQuant 1
        setVariable RHherb water
        setVariable RHherbQuant 2
        setVariable RHtog1 <nothing>
        setVariable RHtog1Quant 1
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 1
        setVariable RHseli <nothing>
        setVariable RHseliQuant 1
        setVariable RHiron <nothing>
        setVariable RHironQuant 1
        GOTO RANKREPORT

    THG.RANK.2:
        setVariable skillrange 40-59
        setVariable RHcloth <nothing>
        setVariable RHclothQuant 2
        setVariable RHgen flint
        setVariable RHgenQuant 2
        setVariable RHarms dart
        setVariable RHarmsQuant 1
        setVariable RHflow black orchid
        setVariable RHflowQuant 2
        setVariable RHart <nothing>
        setVariable RHartQuant 2
        setVariable RHlock ordinary lockpick
        setVariable RHlockQuant 2
        setVariable RHjoy <nothing>
        setVariable RHjoyQuant 2
        setVariable RHtobac pouch
        setVariable RHtobacQuant 2
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 2
        setVariable RHweap <nothing>
        setVariable RHweapQuant 2
        setVariable RHcler1 incense
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 pick
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap <nothing>
        setVariable RHnapQuant 2
        setVariable RHherb mixing stick
        setVariable RHherbQuant 2
        setVariable RHtog1 <nothing>
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli <nothing>
        setVariable RHseliQuant 2
        setVariable RHiron <nothing>
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.3:
        setVariable skillrange 60-99
        setVariable RHcloth sash
        setVariable RHclothQuant 2
        setVariable RHgen bark
        setVariable RHgenQuant 2
        setVariable RHarms bolts
        setVariable RHarmsP dart
        setVariable RHarmsQuant 2
        setVariable RHflow black orchid
        setVariable RHflowQuant 2
        setVariable RHart <nothing>
        setVariable RHartQuant 2
        setVariable RHlock stout lockpick
        setVariable RHlockQuant 2
        setVariable RHjoy <nothing>
        setVariable RHjoyQuant 2
        setVariable RHtobac sungrown cigar
        setVariable RHtobacP pouch
        setVariable RHtobacQuant 2
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 2
        setVariable RHweap <nothing>
        setVariable RHweapQuant 2
        setVariable RHcler1 candle
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 drum stick
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap <nothing>
        setVariable RHnapQuant 1
        setVariable RHherb oil
        setVariable RHherbQuant 2
        setVariable RHtog1 <nothing>
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli claw gloves
        setVariable RHseliQuant 1
        setVariable RHiron <nothing>
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.4:
        setVariable skillrange 100-149
        setVariable RHcloth gloves
        setVariable RHclothQuant 2
        setVariable RHgen spade
        setVariable RHgenQuant 2
        setVariable RHarms stiletto
        setVariable RHarmsQuant 2
        setVariable RHflow <nothing>
        setVariable RHflowQuant 2
        setVariable RHart <nothing>
        setVariable RHartQuant 2
        setVariable RHlock stout lockpick
        setVariable RHlockQuant 2
        setVariable RHjoy <nothing>
        setVariable RHjoyQuant 1
        setVariable RHtobac apple pipe
        setVariable RHtobacQuant 2
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 2
        setVariable RHweap <nothing>
        setVariable RHweapQuant 2
        setVariable RHcler1 violets
        setvariable RHcler1P chalice
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 linen cloth
        setvariable RHbard1P drum stick
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap <nothing>
        setVariable RHnapQuant 1
        setVariable RHherb pestle
        setVariable RHherbQuant 2
        setVariable RHtog1 <nothing>
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli claw gloves
        setVariable RHseliQuant 2
        setVariable RHiron <nothing>
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.5:
        setVariable skillrange 150-199
        setVariable RHcloth blouse
        setVariable RHclothQuant 2
        setVariable RHgen dagger sheath
        setVariable RHgenQuant 2
        setVariable RHarms kris
        setVariable RHarmsQuant 2
        setVariable RHflow silk orchid
        setVariable RHflowQuant 1
        setVariable RHart simple talisman
        setVariable RHartQuant 2
        setVariable RHlock slim lockpick
        setVariable RHlockQuant 2
        setVariable RHjoy kitten
        setVariable RHjoyQuant 1
        setVariable RHtobac lanival pipe
        setVariable RHtobacQuant 2
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 2
        setVariable RHweap club
        setVariable RHweapQuant 1
        setVariable RHcler1 herbs
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 blouse
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap naphtha
        setVariable RHnapQuant 1
        setVariable RHherb jar
        setVariable RHherbQuant 2
        setVariable RHtog1 beaded slippers
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli legwraps
        setVariable RHseliQuant 2
        setVariable RHiron <nothing>
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.6:
        setVariable skillrange 200-249
        setVariable RHcloth skirt
        setVariable RHclothQuant 2
        setVariable RHgen scabbard
        setVariable RHgenQuant 2
        setVariable RHarms rapier
        setVariable RHarmsQuant 2
        setVariable RHflow silk orchid
        setVariable RHflowQuant 2
        setVariable RHart simple talisman
        setVariable RHartQuant 2
        setVariable RHlock slim lockpick
        setVariable RHlockQuant 2
        setVariable RHjoy bunny
        setVariable RHjoyQuant 2
        setVariable RHtobac olvio pipe
        setVariable RHtobacQuant 2
        setVariable RHmirg <nothing>
        setVariable RHmirgQuant 2
        setVariable RHweap club
        setVariable RHweapQuant 2
        setVariable RHcler1 bottle
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 alpargatas
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap naphtha
        setVariable RHnapQuant 2
        setVariable RHherb jadice flower
        setVariable RHherbQuant 2
        setVariable RHtog1 ivory shirt
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli hood
        setVariable RHseliQuant 2
        setVariable RHiron <nothing>
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.7:
        setVariable skillrange 250-299
        setVariable RHcloth houpelande
        setVariable RHclothQuant 2
        setVariable RHgen shears
        setVariable RHgenQuant 2
        setVariable RHarms composite bow
        setVariable RHarmsQuant 1
        setVariable RHflow wreath
        setVariable RHflowQuant 2
        setVariable RHart cambrinth ring
        setVariable RHartQuant 1
        setVariable RHlock <nothing>
        setVariable RHlockQuant 2
        setVariable RHjoy bunny
        setVariable RHjoyQuant 3
        setVariable RHtobac riverhaven tobacco
        setVariable RHtobacQuant 2
        setVariable RHmirg anklet
        setVariable RHmirgQuant 2
        setVariable RHweap thorny mace
        setVariable RHweapQuant 2
        setVariable RHcler1 chalice
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 refill
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap naphtha
        setVariable RHnapQuant 2
        setVariable RHherb riolur leaf
        setVariable RHherbQuant 2
        setVariable RHtog1 linen shirt
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli bronze gauntlets
        setVariable RHseliQuant 2
        setVariable RHiron bronze gauntlets
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.11:
    THG.RANK.12:
    THG.RANK.13:
    THG.RANK.14:
    THG.RANK.15:
        ECHO ***********************************************
        ECHO ***        Sorry, but there isn't anything harder yet!
        ECHO ***********************************************
    THG.RANK.10:
    THG.RANK.9:
    THG.RANK.8:
        setVariable skillrange 300+
        setVariable RHcloth dress
        setVariable RHclothQuant 2
        setVariable RHgen stove
        setVariable RHgenQuant 2
        setVariable RHarms sword
        setVariable RHarmsQuant 2
        setVariable RHflow silk orchid
        setVariable RHflowQuant 2
        setVariable RHart cambrinth ring
        setVariable RHartQuant 2
        setVariable RHlock <nothing>
        setVariable RHlockQuant 2
        setVariable RHjoy bunny
        setVariable RHjoyQuant 3
        setVariable RHtobac baron tobacco
        setVariable RHtobacQuant 2
        setVariable RHmirg toe-bells
        setVariable RHmirgQuant 2
        setVariable RHweap goat-head mace
        setVariable RHweapQuant 2
        setVariable RHcler1 pomander
        setVariable RHcler1Quant 2
        setVariable RHcler2 <nothing>
        setVariable RHcler2Quant 2
        setVariable RHbard1 mandolin
        setVariable RHbard1Quant 2
        setVariable RHbard2 <nothing>
        setVariable RHbard2Quant 2
        setVariable RHnap naphtha
        setVariable RHnapQuant 2
        setVariable RHherb ithor potion
        setVariable RHherbQuant 2
        setVariable RHtog1 linen shirt
        setVariable RHtog1Quant 2
        setVariable RHtog2 <nothing>
        setVariable RHtog2Quant 2
        setVariable RHseli aventail
        setVariable RHseliQuant 2
        setVariable RHiron chain greaves
        setVariable RHironQuant 2
        GOTO RANKREPORT

    THG.RANK.-5:
    THG.RANK.-4:
    THG.RANK.-3:
    THG.RANK.-2:
    THG.RANK.-1:
    THG.RANK.0:
        GOTO BEGGAR.MOD

    THG.BAGCHECK:
        matchre BAGWARN /%RHcloth%|%RHgen%|%RHarms%|%RHflow%|%RHart%|%RHlock%|%RHjoy%|%RHiron%/
        matchre BAGWARN /%RHtobac%|%RHmirg%|%RHweap%|%RHseli%|%RHnap%|%RHherb%/
        matchre BAGWARN /%RHtog1%|%RHtog2%|%RHbard1%|%RHbard2%|%RHcler1%|%RHcler2%/
        match BAGS.STOW.%c% You glance
        put look in my %container%
        put glance
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####               THERENGIA START LOCATION                 #####
#####                                                        #####
##################################################################


    HAVEN:
        match HAVEN.START.BANK [Bank of Riverhaven, Main Lobby]
        match HAVEN.START.PIER You also see the Municipal Pier.
        match HAVEN.START.W exit from the town into the countryside.
        match HAVEN.START.E tower's shadow and through a narrow gate
        match HAVEN.START.N The Gate of Nobles, the northern passage
        match HAVEN.START.CLOTH [Clothiers, Sales Floor]
        match HAVEN.START.GEN [Enfermine's Dry Goods, Showroom]
        match HAVEN.START.ARMS [Noel's Arms, Showroom]
        match HAVEN.START.FLOW [Cecelia's Blossoms, Showroom]
        match HAVEN.START.ART [Zanthron's Artificer Shop, Salesroom]
        match HAVEN.START.LOCK [Ss'Thran's Locks, Workroom]
        match HAVEN.START.SELI [Seli's Armory, Sales Room]
        match HAVEN.START.JOY [Smaragdaus' Joy, Front Room]
        match HAVEN.START.TOBAC [Fine Leaf's End, Sales Room]
        match HAVEN.START.MIRG [Mirglyn Sisters, Goldsmiths]
        match HAVEN.START.WEAP [Thringol's Weapon Shop, Salesroom]
        match HAVEN.START.CLER1 [Riverhaven, Cleric Shop]
        match HAVEN.START.CLER2 [Cleric Shop, Storage Room and Supplies]
        match HAVEN.START.BARD1 [House of Bardic Blues, Wayfarer's Den]
        match HAVEN.START.BARD2 [House of Bardic Blues, Baubles and Bits]
        match HAVEN.START.NAP vendor's cart with a vial of naphtha
        match HAVEN.START.HERB [Crin's Herbal Shop, Salesroom]
        match HAVEN.START.TOG1 [City Togs, Sales Room]
        match HAVEN.START.TOG2 [City Togs, Storeroom]
        match HAVEN.START.IRON [Bantheld's Ironworks, Salesroom]
        match HAVEN.START.PAWN Ioun's Pawn
        match THG.BADLOCATION Obvious
        put look
        GOTO UniversalMatch

    THG.BADLOCATION:
        ECHO ***********************************************
        ECHO *** Not a valid starting location.
        ECHO *** Starting locations in Therengia are:
        ECHO ***
        ECHO *** Inside Riverhaven Gates
        ECHO *** Riverhaven Bank
        ECHO *** Riverhaven Pawn Shop
        ECHO *** Outside Riverhaven Pier
        ECHO *** Clothiers
        ECHO *** Enfermine's Dry Goods
        ECHO *** Noel's Arms
        ECHO *** Seli's Armory
        ECHO *** Bantheld's Ironworks
        ECHO *** Cecelia's Blossoms
        ECHO *** Zanthron's Artificer Shop
        ECHO *** Ss'Thran's Locks
        ECHO *** Smaragdaus' Joy
        ECHO *** Fine Leaf's End
        ECHO *** Mirglyn Sisters, Goldsmiths
        ECHO *** Thringol's Weapon Shop
        ECHO *** House of Bardic Blues
        ECHO *** Cleric Shop
        ECHO *** Outside Naphtha Cart
        ECHO *** Crin's Herbal Shop
        ECHO *** City Togs
        ECHO ***
        ECHO *******************************************************
        GOTO END

    HAVEN.START.CLOTH:
        counter set 437
        setVariable storecode RHcloth
        put out
        GOTO START

    HAVEN.START.GEN:
        counter set 27
        setVariable storecode RHgen
        put out
        GOTO START

    HAVEN.START.ARMS:
        counter set 34
        setVariable storecode RHarms
        put out
        GOTO START

    HAVEN.START.FLOW:
        counter set 39
        setVariable storecode RHflow
        put out
        GOTO START

    HAVEN.START.ART:
        counter set 46
        setVariable storecode RHart
        put out
        GOTO START

    HAVEN.START.LOCK:
        counter set 47
        setVariable storecode RHlock
        put out
        GOTO START

    HAVEN.START.SELI:
        counter set 53
        setVariable storecode RHseli
        put out
        GOTO START

    HAVEN.START.JOY:
        counter set 426
        setVariable storecode RHjoy
        put out
        GOTO START

    HAVEN.START.TOBAC:
        counter set 61
        setVariable storecode RHtobac
        put out
        GOTO START

    HAVEN.START.MIRG:
        counter set 65
        setVariable storecode RHmirg
        put out
        GOTO START

    HAVEN.START.WEAP:
        counter set 69
        setVariable storecode RHweap
        put out
        GOTO START

    HAVEN.START.BARD1:
        counter set 78
        setVariable storecode RHbard1
        put out
        GOTO START

    HAVEN.START.BARD2:
        counter set 428
        setVariable storecode RHbard2
        put go curtain
        GOTO START

    HAVEN.START.CLER1:
        counter set 435
        setVariable storecode RHcler1
        put out
        GOTO START

    HAVEN.START.CLER2:
        counter set 81
        setVariable storecode RHcler2
        put go opening
        GOTO START

    HAVEN.START.NAP:
        counter set 87
        setVariable storecode RHnap
        GOTO START

    HAVEN.START.HERB:
        counter set 94
        setVariable storecode RHherb
        put out
        GOTO START

    HAVEN.START.TOG1:
        counter set 98
        setVariable storecode RHtog1
        put go door
        GOTO START

    HAVEN.START.TOG2:
        counter set 413
        setVariable storecode RHtog2
        put go curtain
        GOTO START

    HAVEN.START.IRON:
        counter set 108
        setVariable storecode RHiron
        put o
        GOTO START

    HAVEN.START.BANK:
        counter set 1
      HAVEN.1:
        put out
        GOTO TRAVEL
      HAVEN.2:
        put n
        GOTO TRAVEL
      HAVEN.3:
        put n
        GOTO TRAVEL
      HAVEN.4:
        put go shop
        GOTO TRAVEL
      HAVEN.5:
        GOTO HAVEN.START.BARD1

    HAVEN.START.PIER:
        counter set 6
      HAVEN.6:
        put w
        GOTO TRAVEL
      HAVEN.7:
        put w
        GOTO TRAVEL
      HAVEN.8:
        put w
        GOTO TRAVEL
      HAVEN.9:
        put go shop
        GOTO TRAVEL
      HAVEN.10:
        GOTO HAVEN.START.CLOTH

    HAVEN.START.E:
        counter set 11
      HAVEN.11:
        put n
        GOTO TRAVEL
      HAVEN.12:
        put n
        GOTO TRAVEL
      HAVEN.13:
        put n
        GOTO TRAVEL
      HAVEN.14:
        put n
        GOTO TRAVEL
      HAVEN.15:
        put n
        GOTO TRAVEL
      HAVEN.16:
        put go shop
        GOTO TRAVEL
      HAVEN.17:
        GOTO HAVEN.START.TOG1

    HAVEN.START.W:
        counter set 18
      HAVEN.18:
        put n
        GOTO TRAVEL
      HAVEN.19:
        put go arms
        GOTO TRAVEL
      HAVEN.20:
        GOTO HAVEN.START.ARMS

    HAVEN.START.N:
        counter set 21
      HAVEN.21:
        put s
        GOTO TRAVEL
      HAVEN.22:
        put go shop
        GOTO TRAVEL
      HAVEN.23:
        GOTO HAVEN.START.CLER1

    HAVEN.START.PAWN:
        counter set 419
      HAVEN.419:
        put out
        GOTO TRAVEL
      HAVEN.420:
        put go arms
        GOTO TRAVEL
      HAVEN.421:
        GOTO HAVEN.START.ARMS

##################################################################
#####                                                        #####
#####                  HAVEN LEAVING SHOPS                   #####
#####                                                        #####
##################################################################


    LEAVE.RHCLOTH:
        counter set 25
      HAVEN.25:
        put w
        GOTO TRAVEL
      HAVEN.26:
        put w
        GOTO TRAVEL
      HAVEN.27:
        setVariable storecode RHgen
        setVariable entrance store
        GOTO SETSTORE

    LEAVE.RHGEN:
        counter set 30
      HAVEN.30:
        put w
        GOTO TRAVEL
      HAVEN.31:
        put w
        GOTO TRAVEL
      HAVEN.32:
        put w
        GOTO TRAVEL
      HAVEN.33:
        put n
        GOTO TRAVEL
      HAVEN.34:
        setVariable storecode RHarms
        setVariable entrance arms
        GOTO SETSTORE

    LEAVE.RHARMS:
        GOTO %LorM%.RHARMS.1
    LEAVE.RHARMS.1:
        counter set 37
      HAVEN.37:
        put n
        GOTO TRAVEL
      HAVEN.38:
        put n
        GOTO TRAVEL
      HAVEN.39:
        setVariable storecode RHflow
        setVariable entrance shop
        GOTO SETSTORE

    MOVEON.RHARMS.1:
        counter set 120
      HAVEN.120:
        put go pawn
        GOTO TRAVEL
      HAVEN.121:
        GOTO PAWN.%DropOrStow%

    LEAVE.RHFLOW:
        counter set 42
      HAVEN.42:
        put n
        GOTO TRAVEL
      HAVEN.43:
        put se
        GOTO TRAVEL
      HAVEN.44:
        put se
        GOTO TRAVEL
      HAVEN.45:
        put se
        GOTO TRAVEL
      HAVEN.46:
        setVariable storecode RHart
        setVariable entrance art shop
        GOTO SETSTORE

    LEAVE.RHART:
      HAVEN.47:
        setVariable storecode RHlock
        setVariable entrance ord shop
        GOTO SETSTORE

    LEAVE.RHLOCK:
        counter set 50
      HAVEN.50:
        put se
        GOTO TRAVEL
      HAVEN.51:
        put se
        GOTO TRAVEL
      HAVEN.52:
        put s
        GOTO TRAVEL
      HAVEN.53:
        setVariable storecode RHseli
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHSELI:
        counter set 422
      HAVEN.422:
        put n
        GOTO TRAVEL
      HAVEN.423:
        put e
        GOTO TRAVEL
      HAVEN.424:
        put ne
        GOTO TRAVEL
      HAVEN.425:
        put e
        GOTO TRAVEL
      HAVEN.426:
        setVariable storecode RHjoy
        setVariable entrance door
        GOTO SETSTORE

    LEAVE.RHJOY:
        counter set 58
      HAVEN.58:
        put s
        GOTO TRAVEL
      HAVEN.59:
        put s
        GOTO TRAVEL
      HAVEN.60:
        setVariable storecode RHtobac
        put kneel
        wait
    RHTOBAC.SHORT:
        put go shop
        match SHORTSTAND You must be standing
        GOTO TRAVEL
      HAVEN.61:
        setVariable entrance shop
        GOTO SETSTORE

    ALTLEAVE.RHTOBAC:
        counter set 417
      HAVEN.417:
        put out
        GOTO TRAVEL
      HAVEN.418:
    LEAVE.RHTOBAC:
        matchre LEAVE.RHTOBAC /...wait|type ahead|Roundtime/i
        matchre LEAVE.RHTOBAC.2 /You stand|already standing/
        match ALTLEAVE.RHTOBAC You can't stand
        put stand
        GOTO UniversalMatch
    LEAVE.RHTOBAC.2:
        counter set 63
      HAVEN.63:
        put w
        GOTO TRAVEL
      HAVEN.64:
        put w
        GOTO TRAVEL
      HAVEN.65:
        setVariable storecode RHmirg
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHMIRG:
        counter set 68
      HAVEN.68:
        put se
        GOTO TRAVEL
      HAVEN.69:
        setVariable storecode RHweap
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHWEAP:
        counter set 72
      HAVEN.72:
        put se
        GOTO TRAVEL
      HAVEN.73:
        put ne
        GOTO TRAVEL
      HAVEN.74:
        put n
        GOTO TRAVEL
      HAVEN.75:
        put n
        GOTO TRAVEL
      HAVEN.76:
        put n
        GOTO TRAVEL
      HAVEN.77:
        put n
        GOTO TRAVEL
      HAVEN.78:
        setVariable storecode RHbard1
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHBARD1:
        counter set 427
      HAVEN.427:
        put go shop
        GOTO TRAVEL
      HAVEN.428:
        setVariable storecode RHbard2
        setVariable entrance curtain
        GOTO SETSTORE

    ALTLEAVE.RHBARD2:
        counter set 429
      HAVEN.429:
        put go curtain
        GOTO TRAVEL
      HAVEN.430:
    LEAVE.RHBARD2:
        counter set 431
      HAVEN.431:
        put o
        GOTO TRAVEL
      HAVEN.432:
        put n
        GOTO TRAVEL
      HAVEN.433:
        put n
        GOTO TRAVEL
      HAVEN.434:
        put n
        GOTO TRAVEL
      HAVEN.435:
        setVariable storecode RHcler1
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHCLER1:
        counter set 80
      HAVEN.80:
        put go shop
        GOTO TRAVEL
      HAVEN.81:
        setVariable storecode RHcler2
        setVariable entrance curtain
        GOTO SETSTORE

    ALTLEAVE.RHCLER2:
        counter set 82
      HAVEN.82:
        put go opening
        GOTO TRAVEL
      HAVEN.83:
    LEAVE.RHCLER2:
        counter set 84
      HAVEN.84:
        put o
        GOTO TRAVEL
      HAVEN.85:
        counter set 85
        put n
        GOTO TRAVEL
      HAVEN.86:
        put se
        GOTO TRAVEL
      HAVEN.87:
        setVariable storecode RHnap
        setVariable itemlocation on cart
        setVariable entrance shop
        GOTO SETSTORE

    ALTLEAVE.RHNAP:
    LEAVE.RHNAP:
        counter set 90
      HAVEN.90:
        put se
        GOTO TRAVEL
      HAVEN.91:
        put se
        GOTO TRAVEL
      HAVEN.92:
        put se
        GOTO TRAVEL
      HAVEN.93:
        put se
        GOTO TRAVEL
      HAVEN.94:
        setVariable storecode RHherb
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHHERB:
        counter set 97
      HAVEN.97:
        put se
        GOTO TRAVEL
      HAVEN.98:
        setVariable storecode RHtog1
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHTOG1.1:
        counter set 410
      HAVEN.410:
        put go shop
        GOTO TRAVEL
      HAVEN.411:
    LEAVE.RHTOG1:
        counter set 412
      HAVEN.412:
        put go hall
        match LEAVE.RHTOG1.1 referring
        GOTO TRAVEL
      HAVEN.413:
    ALTLEAVE.RHTOG1:
        setVariable storecode RHtog2
        setVariable entrance hall
        GOTO SETSTORE

    ALTLEAVE.RHTOG2:
    LEAVE.RHTOG2:
        counter set 414
      HAVEN.414:
        put go hall
        GOTO TRAVEL
      HAVEN.415:
        put go door
        match LEAVE.RHTOG2 referring
        GOTO TRAVEL
      HAVEN.416:
        counter set 100
      HAVEN.100:
        put nw
        GOTO TRAVEL
      HAVEN.101:
        put nw
        GOTO TRAVEL
      HAVEN.102:
        put nw
        GOTO TRAVEL
      HAVEN.103:
        put nw
        GOTO TRAVEL
      HAVEN.104:
        put sw
        GOTO TRAVEL
      HAVEN.105:
        put sw
        GOTO TRAVEL
      HAVEN.106:
        put sw
        GOTO TRAVEL
      HAVEN.107:
        put nw
        GOTO TRAVEL
      HAVEN.108:
        setVariable storecode RHiron
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHIRON:
        counter set 109
      HAVEN.109:
        put se
        GOTO TRAVEL
      HAVEN.110:
        put sw
        GOTO TRAVEL
      HAVEN.111:
        put sw
        GOTO TRAVEL
      HAVEN.112:
        put sw
        GOTO TRAVEL
      HAVEN.113:
        put sw
        GOTO TRAVEL
      HAVEN.114:
        counter set 436
      HAVEN.436:
        put sw
        GOTO TRAVEL
      HAVEN.437:
        put w
        GOTO TRAVEL
      HAVEN.438:
        setVariable storecode RHcloth
        setVariable entrance shop
        GOTO SETSTORE


##################################################################
#####                                                        #####
#####          RIVER HAVEN JUSTICE AND RESUMING              #####
#####                                                        #####
##################################################################


    HAVEN.ITEMCHECK:
        put drop my small sack
        wait
        match HAVEN.DEBT2 You have nothing
        match HAVEN.FREE2 INVENTORY HELP
        put inv
        GOTO UniversalMatch

    HAVEN.DEBT:
        counter set 225
      HAVEN.225:
        put go door
        GOTO TRAVEL
    HAVEN.DEBT2:
        counter set 226
      HAVEN.226:
        put out
        GOTO TRAVEL
      HAVEN.227:
        put n
        GOTO TRAVEL
      HAVEN.228:
        put nw
        GOTO TRAVEL
      HAVEN.229:
        put nw
        GOTO TRAVEL
      HAVEN.230:
        put nw
        GOTO TRAVEL
      HAVEN.231:
        put nw
        GOTO TRAVEL
      HAVEN.232:
        put sw
        GOTO TRAVEL
      HAVEN.233:
        put sw
        GOTO TRAVEL
      HAVEN.234:
        put sw
        GOTO TRAVEL
      HAVEN.235:
        put sw
        GOTO TRAVEL
      HAVEN.236:
        put sw
        GOTO TRAVEL
      HAVEN.237:
        put sw
        GOTO TRAVEL
      HAVEN.238:
        put sw
        GOTO TRAVEL
      HAVEN.239:
        put n
        GOTO TRAVEL
      HAVEN.240:
        put n
        GOTO TRAVEL
      HAVEN.241:
        put go bank
        GOTO TRAVEL
      HAVEN.242:
        put go arch
        GOTO TRAVEL
      HAVEN.243:
        put wit 500 bronze lirum
        wait
        counter set 244
      HAVEN.244:
        put go arch
        GOTO TRAVEL
      HAVEN.245:
        put out
        GOTO TRAVEL
      HAVEN.246:
        put s
        GOTO TRAVEL
      HAVEN.247:
        put s
        GOTO TRAVEL
      HAVEN.248:
        put s
        GOTO TRAVEL
      HAVEN.249:
        put go hall
        GOTO TRAVEL
      HAVEN.250:
        put go office
        GOTO TRAVEL
      HAVEN.251:
        put pay 5000
        wait
        counter set 252
      HAVEN.252:
        put out
        GOTO TRAVEL
      HAVEN.253:
        put out
        GOTO TRAVEL
      HAVEN.254:
        put n
        GOTO TRAVEL
      HAVEN.255:
        put n
        GOTO TRAVEL
      HAVEN.256:
        put n
        GOTO TRAVEL
      HAVEN.257:
        put go bank
        GOTO TRAVEL
      HAVEN.258:
        put go arch
        GOTO TRAVEL
      HAVEN.259:
        put dep all
        wait
        counter set 260
      HAVEN.260:
        put go arch
        GOTO TRAVEL
      HAVEN.261:
        put out
        GOTO TRAVEL
      HAVEN.262:
        put s
        GOTO TRAVEL
      HAVEN.263:
        put s
        GOTO TRAVEL
      HAVEN.264:
        put ne
        GOTO TRAVEL
      HAVEN.265:
        put ne
        GOTO TRAVEL
      HAVEN.266:
        put ne
        GOTO TRAVEL
      HAVEN.267:
        put ne
        GOTO TRAVEL
      HAVEN.268:
        put ne
        GOTO TRAVEL
      HAVEN.269:
        put ne
        GOTO TRAVEL
      HAVEN.270:
        put ne
        GOTO TRAVEL
      HAVEN.271:
        put se
        GOTO TRAVEL
      HAVEN.272:
        put se
        GOTO TRAVEL
      HAVEN.273:
        put se
        GOTO TRAVEL
      HAVEN.274:
        put se
        GOTO TRAVEL
      HAVEN.275:
        put s
        GOTO TRAVEL
      HAVEN.276:
        put go door
        GOTO TRAVEL
      HAVEN.277:
        GOTO GETSACK

    HAVEN.FREE:
        counter set 280
      HAVEN.280:
        put go door
        GOTO TRAVEL
      HAVEN.281:
        GOTO GETSACK

    HAVEN.FREE2:
        pause 1
        match HAVEN.MISSINGSTART waitandsee
        match HAVEN.FREE3 okstart
        put echo %startlocation
        put echo okstart
        GOTO UniversalMatch

    HAVEN.MISSINGSTART:
        setVariable startlocation RHtog1
        setVariable ResumeStore RHtog1
        GOTO HAVEN.FREE3

    HAVEN.FREE3:
        counter set 285
       HAVEN.285:
        put out
        GOTO TRAVEL
      HAVEN.286:
        put n
        GOTO TRAVEL
      HAVEN.287:
        counter set 1
        setVariable storecode RHtog1
        GOTO RESUME.%ResumeStore%

    RESUME.RHHERB:
        counter add 1
    RESUME.RHNAP:
        counter add 1
    RESUME.RHCLER2:
        counter add 1
    RESUME.RHCLER1:
        counter add 1
    RESUME.RHBARD2:
        counter add 1
    RESUME.RHBARD1:
        counter add 1
    RESUME.RHWEAP:
        counter add 1
    RESUME.RHMIRG:
        counter add 1
    RESUME.RHTOBAC:
        counter add 1
    RESUME.RHJOY:
        counter add 1
    RESUME.RHSELI:
        counter add 1
    RESUME.RHLOCK:
        counter add 1
    RESUME.RHART:
        counter add 1
    RESUME.RHFLOW:
        counter add 1
    RESUME.RHARMS:
        counter add 1
    RESUME.RHGEN:
        counter add 1
    RESUME.RHCLOTH:
        counter add 1
    RESUME.RHIRON:
        counter add 1
    RESUME.RHTOG2:
        counter add 1
    RESUME.RHTOG1:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


##################################################################
#####                                                        #####
#####                  THERENGIA PAWNING                     #####
#####                                                        #####
##################################################################


    HAVEN.PAWNFINISH.NONTHIEF:
    HAVEN.PAWNFINISH.EMPATH:
        counter set 439
      HAVEN.439:
        put out
        GOTO TRAVEL
      HAVEN.440:
        put s
        GOTO TRAVEL
      HAVEN.441:
        put e
        GOTO TRAVEL
      HAVEN.442:
        put e
        GOTO TRAVEL
      HAVEN.443:
        put e
        GOTO TRAVEL
      HAVEN.444:
        put go store
        GOTO TRAVEL
      HAVEN.445:
        setVariable BinOrBucket basket
        GOTO PAWN.BIN

    HAVEN.BINFINISH.NONTHIEF:
    HAVEN.BINFINISH.EMPATH:
        counter set 446
      HAVEN.446:
        put out
        GOTO TRAVEL
      HAVEN.447:
        put w
        GOTO TRAVEL
      HAVEN.448:
        put w
        GOTO TRAVEL
      HAVEN.449:
        put w
        GOTO TRAVEL
      HAVEN.450:
        put n
        GOTO TRAVEL
      HAVEN.451:
        put go pawn
        GOTO TRAVEL
      HAVEN.452:
        GOTO END

    HAVEN.PAWNFINISH.THIEF:
        setVariable havenguild rook
    HAVEN.CONTACT.FALSE:
      HAVEN.GUILDFIND1:
        setVariable knockdoor door
        setVariable contact false
        match HAVEN.GUILDPAWN convenient spot
        match HAVEN.ARTIFICER Silvermoon Road
        match HAVEN.HALFLING with his own kind
        match HAVEN.COOP cooped up somewhere
        match HAVEN.CRESCENT Crescent Way
        match HAVEN.ROOK checking around the rookery
        match HAVEN.TEST.%havenguild% You glance
        put contact guild
        put glance
        GOTO UniversalMatch

    HAVEN.TEST.GUILDPAWN:
        GOTO HAVEN.ARTIFICER
    HAVEN.TEST.ARTIFICER:
        GOTO HAVEN.HALFLING
    HAVEN.TEST.HALFLING:
        GOTO HAVEN.COOP
    HAVEN.TEST.COOP:
        GOTO HAVEN.CRESCENT
    HAVEN.TEST.CRESCENT:
        GOTO HAVEN.ROOK
    HAVEN.TEST.ROOK:
        GOTO HAVEN.GUILDPAWN

    HAVEN.CONTACT.TRUE:
        GOTO END

    HAVEN.SEARCH:
        put search
        match HAVEN.KNOCK Success!
        match HAVEN.SEARCH Roundtime
        GOTO UniversalMatch

    HAVEN.KNOCK:
        pause 1
        put knock %knockdoor%
        waitfor You knock
        put whisper %riverpass
        wait
        GOTO HAVEN.%havenguild%.ENTER

    HAVEN.ARTIFICER:
        setVariable havenguild artificer
        GOTO HAVEN.GUILDFIND2
    HAVEN.HALFLING:
        setVariable havenguild halfling
        setVariable knockdoor grat
        GOTO HAVEN.GUILDFIND2
    HAVEN.COOP:
        setVariable havenguild coop
        GOTO HAVEN.GUILDFIND2
    HAVEN.CRESCENT:
        setVariable havenguild crescent
        GOTO HAVEN.GUILDFIND2
    HAVEN.ROOK:
        setVariable havenguild rook
        GOTO HAVEN.GUILDFIND2

    HAVEN.GUILDPAWN:
        setVariable havenguild guildpawn
        counter set 300
      HAVEN.300:
        put out
        GOTO TRAVEL
      HAVEN.301:
        GOTO HAVEN.SEARCH
    HAVEN.GUILDPAWN.ENTER:
        counter set 302
      HAVEN.302:
        put climb stair
        GOTO TRAVEL
      HAVEN.303:
        put ne
        GOTO TRAVEL
      HAVEN.304:
        put go corner
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.305:
        GOTO %havenguild%.RHLEAVE

    HAVEN.GUILDFIND2:
        counter set 306
      HAVEN.306:
        put out
        GOTO TRAVEL
      HAVEN.307:
        put n
        GOTO TRAVEL
      HAVEN.308:
        put n
        GOTO TRAVEL
      HAVEN.309:
        put n
        GOTO TRAVEL
      HAVEN.310:
        put se
        GOTO TRAVEL
      HAVEN.311:
        put se
        GOTO TRAVEL
      HAVEN.312:
        put se
        GOTO TRAVEL
      HAVEN.313:
        GOTO HAVEN.%havenguild%.2

    HAVEN.ARTIFICER.2:
        GOTO HAVEN.SEARCH
    HAVEN.ARTIFICER.ENTER:
        counter set 314
      HAVEN.314:
        put look floor
        wait
        put go door
        GOTO TRAVEL
      HAVEN.315:
        put go corner
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.316:
        GOTO %havenguild%.RHLEAVE

    HAVEN.HALFLING.2:
    HAVEN.COOP.2:
    HAVEN.CRESCENT.2:
    HAVEN.ROOK.2:
        counter set 317
      HAVEN.317:
        put se
        GOTO TRAVEL
      HAVEN.318:
        put se
        GOTO TRAVEL
      HAVEN.319:
        GOTO HAVEN.%havenguild%.3

    HAVEN.HALFLING.3:
        counter set 320
      HAVEN.320:
        put e
        GOTO TRAVEL
      HAVEN.321:
        put ne
        GOTO TRAVEL
      HAVEN.322:
        put look door
        wait
        put go footpath
        GOTO TRAVEL
      HAVEN.323:
        GOTO HAVEN.SEARCH
    HAVEN.HALFLING.ENTER:
        counter set 324
      HAVEN.324:
        put go door
        GOTO TRAVEL
      HAVEN.325:
        put ne
        GOTO TRAVEL
      HAVEN.326:
        put go nook
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.327:
        GOTO %havenguild%.RHLEAVE

    HAVEN.COOP.3:
        counter set 328
      HAVEN.328:
        put se
        GOTO TRAVEL
      HAVEN.329:
        put e
        GOTO TRAVEL
      HAVEN.330:
        GOTO HAVEN.SEARCH
    HAVEN.COOP.ENTER:
        counter set 331
      HAVEN.331:
        put n
        GOTO TRAVEL
      HAVEN.332:
        put go corner
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.333:
        GOTO %havenguild%.RHLEAVE

    HAVEN.CRESCENT.3:
        counter set 334
      HAVEN.334:
        put s
        GOTO TRAVEL
      HAVEN.335:
        GOTO HAVEN.SEARCH
    HAVEN.CRESCENT.ENTER:
        counter set 336
      HAVEN.336:
        put sear shadow
        wait
        put go open
        GOTO TRAVEL
      HAVEN.337:
        put go corner
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.338:
        GOTO %havenguild%.RHLEAVE

    HAVEN.ROOK.3:
        counter set 339
      HAVEN.339:
        put se
        GOTO TRAVEL
      HAVEN.340:
        put se
        GOTO TRAVEL
      HAVEN.341:
        put se
        GOTO TRAVEL
      HAVEN.342:
        put ne
        GOTO TRAVEL
      HAVEN.343:
        put ne
        GOTO TRAVEL
      HAVEN.344:
        put ne
        GOTO TRAVEL
      HAVEN.345:
        put ne
        GOTO TRAVEL
      HAVEN.346:
        put ne
        GOTO TRAVEL
      HAVEN.347:
        put go alley
        GOTO TRAVEL
      HAVEN.348:
        put s
        GOTO TRAVEL
      HAVEN.349:
        put s
        GOTO TRAVEL
      HAVEN.350:
        put go reces
        GOTO TRAVEL
      HAVEN.351:
        GOTO HAVEN.SEARCH
    HAVEN.ROOK.ENTER:
        counter set 352
      HAVEN.352:
        put go arch
        GOTO TRAVEL
      HAVEN.353:
        put clim stai
        GOTO TRAVEL
      HAVEN.354:
        put go corner
        match PAWN.BIN thief Crow
        GOTO TRAVEL
      HAVEN.355:
        GOTO %havenguild%.RHLEAVE


##################################################################
#####                                                        #####
#####                    HAVEN BINNING                       #####
#####                                                        #####
##################################################################


    HAVEN.BINFINISH.THIEF:
       GOTO %havenguild%.RHLEAVE

    GUILDPAWN.RHLEAVE:
        counter set 356
      HAVEN.356:
        put out
        GOTO TRAVEL
      HAVEN.357:
        put sw
        GOTO TRAVEL
      HAVEN.358:
        put clim stair
        GOTO TRAVEL
      HAVEN.359:
        put go door
        GOTO TRAVEL
      HAVEN.360:
        put go pawn
        GOTO TRAVEL
      HAVEN.361:
        GOTO HAVEN.CONTACT.%contactguild%

    HALFING.RHLEAVE:
        counter set 362
      HAVEN.362:
        put out
        GOTO TRAVEL
      HAVEN.363:
        put sw
        GOTO TRAVEL
      HAVEN.364:
        put go door
        GOTO TRAVEL
      HAVEN.365:
        put go grat
        GOTO TRAVEL
      HAVEN.366:
        put sw
        GOTO TRAVEL
      HAVEN.367:
        put w
        GOTO TRAVEL
      HAVEN.368:
        GOTO RHINTERSECTION2

    COOP.RHLEAVE:
        counter set 369
      HAVEN.369:
        put out
        GOTO TRAVEL
      HAVEN.370:
        put s
        GOTO TRAVEL
      HAVEN.371:
        put go door
        GOTO TRAVEL
      HAVEN.372:
        put w
        GOTO TRAVEL
      HAVEN.373:
        put nw
        GOTO TRAVEL
      HAVEN.374:
        GOTO RHINTERSECTION2

    CRESCENT.RHLEAVE:
        counter set 375
      HAVEN.375:
        put out
        GOTO TRAVEL
      HAVEN.376:
        put out
        GOTO TRAVEL
      HAVEN.377:
        put go door
        GOTO TRAVEL
      HAVEN.378:
        put n
        GOTO TRAVEL
      HAVEN.379:
        GOTO RHINTERSECTION2

    ROOK.RHLEAVE:
        counter set 380
      HAVEN.380:
        put out
        GOTO TRAVEL
      HAVEN.381:
        put climb stair
        GOTO TRAVEL
      HAVEN.382:
        put go arch
        GOTO TRAVEL
      HAVEN.383:
        put go door
        GOTO TRAVEL
      HAVEN.384:
        put go reces
        GOTO TRAVEL
      HAVEN.385:
        put n
        GOTO TRAVEL
      HAVEN.386:
        put n
        GOTO TRAVEL
      HAVEN.387:
        put sw
        GOTO TRAVEL
      HAVEN.388:
        put sw
        GOTO TRAVEL
      HAVEN.389:
        put sw
        GOTO TRAVEL
      HAVEN.390:
        put sw
        GOTO TRAVEL
      HAVEN.391:
        put sw
        GOTO TRAVEL
      HAVEN.392:
        put nw
        GOTO TRAVEL
      HAVEN.393:
        put nw
        GOTO TRAVEL
      HAVEN.394:
        put nw
        GOTO TRAVEL
      HAVEN.395:
        GOTO RHINTERSECTION2

    RHINTERSECTION2:
        counter set 396
      HAVEN.396:
        put nw
        GOTO TRAVEL
      HAVEN.397:
        put nw
        GOTO TRAVEL
      HAVEN.398:
        GOTO ARTIFICER2.RHLEAVE

    ARTIFICER.RHLEAVE:
        counter set 399
      HAVEN.399:
        put out
        GOTO TRAVEL
      HAVEN.400:
        put climb door
        GOTO TRAVEL
    ARTIFICER2.RHLEAVE:
        counter set 401
      HAVEN.401:
        put nw
        GOTO TRAVEL
      HAVEN.402:
        put nw
        GOTO TRAVEL
      HAVEN.403:
        put nw
        GOTO TRAVEL
      HAVEN.404:
        put s
        GOTO TRAVEL
      HAVEN.405:
        put s
        GOTO TRAVEL
      HAVEN.406:
        put s
        GOTO TRAVEL
      HAVEN.407:
        put go pawn
        GOTO TRAVEL
      HAVEN.408:
        GOTO HAVEN.CONTACT.%contactguild%


##################################################################################
#############                                                        #############
#############                     QI'RESHALIA                        #############
#############                                                        #############
#############                  SKILL DETERMINATION                   #############
#############      (tweak the items you steal here if desired)       #############
#############                                                        #############
##################################################################################


     QIR.RANK.1:
        setVariable skillrange 20-39
        setVariable Rbait worms
        setVariable RbaitQuant 2
        setVariable Rchan rope
        setVariable RchanQuant 1
        setVariable Rherb water
        setVariable RherbQuant 2
        setVariable Rforge <nothing>
        setVariable RforgeQuant 1
        setVariable Rbard pick
        setVariable RbardQuant 1
        setVariable Rhair unguent
        setVariable RhairQuant 1
        setVariable Rleather <nothing>
        setVariable RleatherQuant 1
        setVariable Rtailor stockings
        setVariable RtailorQuant 1
        setVariable Rgami <nothing>
        setVariable RgamiQuant 1
        setVariable Rmagik <nothing>
        setVariable RmagikQuant 1
        setVariable Rjewel <nothing>
        setVariable RjewelQuant 1
        setVariable Rthea <nothing>
        setVariable RtheaQuant 1
        setVariable Rcleric lavender
        setVariable RclericQuant 1
        setVariable Rexot <nothing>
        setVariable RexotQuant 1
        setvariable Atann <nothing>
        setvariable AtannQuant 1
        setvariable Aalch water
        setvariable AalchQuant 2
        setvariable Acloth <nothing>
        setvariable AclothQuant 1
        setvariable Ascript <nothing>
        setvariable AscriptQuant 1
        setvariable Acleric lanahh pao
        setvariable AclericQuant 1
        setvariable Agami <nothing>
        setvariable AgamiQuant 1
        setvariable Agem <nothing>
        setvariable AgemQuant 1
        setvariable Amagic <nothing>
        setvariable AmagicQuant 1
        setvariable Asling flights
        setvariable AslingQuant 1
        setvariable Apuzz <nothing>
        setvariable ApuzzQuant 1
        setvariable Afoot <nothing>
        setvariable AfootQuant 1
        setvariable Ashield <nothing>
        setvariable AshieldQuant 1
        setvariable Aweap <nothing>
        setvariable AweapQuant 1
        setvariable Aforge <nothing>
        setvariable AforgeQuant 1
        setvariable Agen charcoal
        setvariable AgenQuant 1
        setvariable Aflow <nothing>
        setvariable AflowQuant 1
        setvariable Abard pick
        setvariable AbardQuant 1
        GOTO RANKREPORT

    QIR.RANK.2:
        setVariable skillrange 40-59
        setVariable Rbait cheese
        setVariable RbaitQuant 2
        setVariable Rchan biscuit
        setVariable RchanQuant 2
        setVariable Rherb alcohol
        setVariable RherbQuant 2
        setVariable Rforge <nothing>
        setVariable RforgeQuant 2
        setVariable Rbard rag
        setVariable RbardQuant 2
        setVariable Rhair unguent
        setVariable RhairQuant 2
        setVariable Rleather <nothing>
        setVariable RleatherQuant 2
        setVariable Rtailor stockings
        setVariable RtailorQuant 2
        setVariable Rgami <nothing>
        setVariable RgamiQuant 2
        setVariable Rmagik <nothing>
        setVariable RmagikQuant 2
        setVariable Rjewel <nothing>
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric plume feather
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann <nothing>
        setvariable AtannQuant 2
        setvariable Aalch stick
        setvariable AalchQuant 2
        setvariable Acloth <nothing>
        setvariable AclothQuant 2
        setvariable Ascript <nothing>
        setvariable AscriptQuant 2
        setvariable Acleric sage
        setvariable AclericQuant 2
        setvariable Agami <nothing>
        setvariable AgamiQuant 2
        setvariable Agem <nothing>
        setvariable AgemQuant 2
        setvariable Amagic <nothing>
        setvariable AmagicQuant 2
        setvariable Asling fishtail arrowhead
        setvariable AslingQuant 2
        setvariable Apuzz beanbags
        setvariable ApuzzQuant 1
        setvariable Afoot socks
        setvariable AfootQuant 1
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap <nothing>
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen flint
        setvariable AgenQuant 2
        setvariable Aflow <nothing>
        setvariable AflowQuant 2
        setvariable Abard pick
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.3:
        setVariable skillrange 60-99
        setVariable Rbait pole
        setVariable RbaitQuant 1
        setVariable Rchan lobscouse stew
        setVariable RchanQuant 2
        setVariable Rherb pestle
        setVariable RherbQuant 2
        setVariable Rforge <nothing>
        setVariable RforgeQuant 2
        setVariable Rbard cloth
        setVariable RbardQuant 2
        setVariable Rhair hairbrush
        setVariable RhairQuant 2
        setVariable Rleather <nothing>
        setVariable RleatherQuant 2
        setVariable Rtailor shirt
        setVariable RtailorQuant 2
        setVariable Rgami <nothing>
        setVariable RgamiQuant 2
        setVariable Rmagik <nothing>
        setVariable RmagikQuant 2
        setVariable Rjewel ear-frill
        setVariable Rjewel chain
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric wine
        setVariable RclericP plume feather
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann thread
        setvariable AtannQuant 1
        setvariable Aalch pestle
        setvariable AalchQuant 1
        setvariable Acloth britches
        setvariable AclothQuant 1
        setvariable Ascript <nothing>
        setvariable AscriptQuant 2
        setvariable Acleric incense
        setvariable AclericQuant 2
        setvariable Agami <nothing>
        setvariable AgamiQuant 2
        setvariable Agem <nothing>
        setvariable AgemQuant 2
        setvariable Amagic <nothing>
        setvariable AmagicQuant 2
        setvariable Asling shaper
        setvariable AslingQuant 1
        setvariable Apuzz beanbags
        setvariable ApuzzQuant 2
        setvariable Afoot socks
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap <nothing>
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen trowel
        setvariable AgenQuant 2
        setvariable Aflow <nothing>
        setvariable AflowQuant 1
        setvariable Abard rag
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.4:
        setVariable skillrange 100-149
        setVariable Rbait pole
        setVariable RbaitQuant 1
        setVariable Rchan polish
        setVariable RchanQuant 2
        setVariable Rherb large jar
        setVariable RherbQuant 2
        setVariable Rforge dagger
        setVariable RforgeQuant 2
        setVariable Rbard tambourine
        setVariable RbardQuant 2
        setVariable Rhair clippers
        setVariable RhairP razor
        setVariable RhairQuant 2
        setVariable Rleather <nothing>
        setVariable RleatherQuant 2
        setVariable Rtailor sash
        setVariable RtailorQuant 2
        setVariable Rgami plain paper
        setVariable RgamiQuant 1
        setVariable Rmagik <nothing>
        setVariable RmagikQuant 2
        setVariable Rjewel bangle
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric candle
        setVariable RclericP vial
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann thread
        setvariable AtannQuant 2
        setvariable Aalch pestle
        setvariable AalchQuant 2
        setvariable Acloth britches
        setvariable AclothQuant 2
        setvariable Ascript trimmed scroll
        setvariable AscriptQuant 1
        setvariable Acleric candle
        setvariable AclericQuant 2
        setvariable Agami <nothing>
        setvariable AgamiQuant 2
        setvariable Agem <nothing>
        setvariable AgemQuant 2
        setvariable Amagic <nothing>
        setvariable AmagicQuant 2
        setvariable Asling shaper
        setvariable AslingP canvas sling
        setvariable AslingQuant 2
        setvariable Apuzz basic puzzle
        setvariable ApuzzQuant 2
        setvariable Afoot pouch
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap <nothing>
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen tinderbox
        setvariable AgenQuant 2
        setvariable Aflow wristlet
        setvariable AflowQuant 2
        setvariable Abard cloth
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.5:
        setVariable skillrange 150-199
        setVariable Rbait pole
        setVariable RbaitQuant 2
        setVariable Rchan breaker
        setVariable RchanQuant 2
        setVariable Rherb cebi root
        setVariable RherbQuant 2
        setVariable Rforge dagger
        setVariable RforgeQuant 2
        setVariable Rbard flute
        setVariable RbardQuant 2
        setVariable Rhair clippers
        setVariable RhairQuant 2
        setVariable Rleather <nothing>
        setVariable RleatherQuant 2
        setVariable Rtailor tunic
        setVariable RtailorQuant 2
        setVariable Rgami plain paper
        setVariable RgamiQuant 2
        setVariable Rmagik <nothing>
        setVariable RmagikQuant 2
        setVariable Rjewel clasp
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric vial
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann bodkin
        setvariable AtannQuant 2
        setvariable Aalch cebi root
        setvariable AalchQuant 2
        setvariable Acloth tunic
        setvariable AclothQuant 2
        setvariable Ascript trimmed scroll
        setvariable AscriptQuant 2
        setvariable Acleric wine
        setvariable AclericQuant 2
        setvariable Agami plain paper
        setvariable AgamiQuant 1
        setvariable Agem <nothing>
        setvariable AgemQuant 2
        setvariable Amagic <nothing>
        setvariable AmagicQuant 2
        setvariable Asling small rocks
        setvariable AslingP leather sling
        setvariable AslingQuant 1
        setvariable Apuzz intermediate puzzle
        setvariable ApuzzQuant 2
        setvariable Afoot woolen tights
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap <nothing>
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen razor
        setvariable AgenQuant 2
        setvariable Aflow necklace
        setvariable AflowQuant 2
        setvariable Abard bow
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.6:
        setVariable skillrange 200-249
        setVariable Rbait pole
        setVariable RbaitQuant 2
        setVariable Rchan strap
        setVariable RchanQuant 2
        setVariable Rherb riolur leaf
        setVariable RherbQuant 2
        setVariable Rforge sap
        setVariable RforgeQuant 2
        setVariable Rbard six strings
        setVariable RbardQuant 2
        setVariable Rhair <nothing>
        setVariable RhairQuant 2
        setVariable Rleather gauntlets
        setVariable RleatherQuant 1
        setVariable Rtailor trousers
        setVariable RtailorQuant 2
        setVariable Rgami white paper
        setVariable RgamiQuant 2
        setVariable Rmagik simple talisman
        setVariable RmagikQuant 1
        setVariable Rjewel silver chain
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric censer
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann scraper
        setvariable AtannQuant 2
        setvariable Aalch nemoih root
        setvariable AalchQuant 2
        setvariable Acloth shirt
        setvariable AclothQuant 2
        setvariable Ascript painted scroll
        setvariable AscriptQuant 2
        setvariable Acleric sandals
        setvariable AclericQuant 2
        setvariable Agami plain paper
        setvariable AgamiQuant 2
        setvariable Agem bracelet
        setvariable AgemQuant 2
        setvariable Amagic <nothing>
        setvariable AmagicQuant 2
        setvariable Asling small rocks
        setvariable AslingQuant 2
        setvariable Apuzz bunny
        setvariable ApuzzQuant 2
        setvariable Afoot lace stockings
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap <nothing>
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen pruning knife
        setvariable AgenQuant 2
        setvariable Aflow circlet
        setvariable AflowQuant 2
        setvariable Abard four strings
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.7:
        setVariable skillrange 250-299
        setVariable Rbait pole
        setVariable RbaitQuant 3
        setVariable Rchan ditty bag
        setVariable RchanQuant 2
        setVariable Rherb ithor potion
        setVariable RherbQuant 2
        setVariable Rforge sap
        setVariable RforgeQuant 2
        setVariable Rbard refill
        setVariable RbardQuant 2
        setVariable Rhair <nothing>
        setVariable RhairQuant 2
        setVariable Rleather gauntlets
        setVariable RleatherQuant 2
        setVariable Rtailor vest
        setVariable RtailorQuant 2
        setVariable Rgami blue paper
        setVariable RgamiQuant 2
        setVariable Rmagik simple talisman
        setVariable RmagikQuant 2
        setVariable Rjewel collar
        setVariable RjewelQuant 1
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric censer
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann shears
        setvariable AtannQuant 2
        setvariable Aalch ithor potion
        setvariable AalchQuant 2
        setvariable Acloth trousers
        setvariable AclothQuant 2
        setvariable Ascript canvas scroll
        setvariable AscriptQuant 1
        setvariable Acleric armband
        setvariable AclericQuant 1
        setvariable Agami white paper
        setvariable AgamiQuant 2
        setvariable Agem earcuff
        setvariable AgemQuant 2
        setvariable Amagic marble
        setvariable AmagicQuant 2
        setvariable Asling canvas sling
        setvariable AslingQuant 2
        setvariable Apuzz wand
        setvariable ApuzzQuant 2
        setvariable Afoot lace stockings
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap telek
        setvariable AweapQuant 2
        setvariable Aforge <nothing>
        setvariable AforgeQuant 2
        setvariable Agen mirror
        setvariable AgenQuant 2
        setvariable Aflow wreath
        setvariable AflowQuant 2
        setvariable Abard seven strings
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.11:
    QIR.RANK.12:
    QIR.RANK.13:
    QIR.RANK.14:
    QIR.RANK.15:
        ECHO ***********************************************
        ECHO ***        Sorry, but there isn't anything harder yet!
        ECHO ***********************************************
    QIR.RANK.10:
    QIR.RANK.9:
    QIR.RANK.8:
        setVariable skillrange 300+
        setVariable Rbait pole
        setVariable RbaitQuant 3
        setVariable Rchan sailcloth quiver
        setVariable RchanQuant 2
        setVariable Rherb tincture jar
        setVariable RherbQuant 2
        setVariable Rforge sap
        setVariable RforgeQuant 2
        setVariable Rbard lyre
        setVariable RbardQuant 2
        setVariable Rhair <nothing>
        setVariable RhairQuant 2
        setVariable Rleather gauntlets
        setVariable RleatherQuant 2
        setVariable Rtailor kilt
        setVariable RtailorQuant 2
        setVariable Rgami bird instructions
        setVariable RgamiQuant 2
        setVariable Rmagik cambrinth ring
        setVariable RmagikQuant 1
        setVariable Rjewel collar
        setVariable RjewelQuant 2
        setVariable Rthea <nothing>
        setVariable RtheaQuant 2
        setVariable Rcleric oil
        setVariable RclericQuant 2
        setVariable Rexot <nothing>
        setVariable RexotQuant 2
        setvariable Atann potion
        setvariable AtannQuant 2
        setvariable Aalch seolarn weed
        setvariable AalchQuant 2
        setvariable Acloth doublet
        setvariable AclothQuant 2
        setvariable Ascript canvas scroll
        setvariable AscriptQuant 2
        setvariable Acleric armband
        setvariable AclericQuant 2
        setvariable Agami blue paper
        setvariable AgamiQuant 2
        setvariable Agem haedor
        setvariable AgemQuant 2
        setvariable Amagic cube
        setvariable AmagicQuant 2
        setvariable Asling needle arrows
        setvariable AslingQuant 2
        setvariable Apuzz rings
        setvariable ApuzzQuant 2
        setvariable Afoot spidersilk stockings
        setvariable AfootQuant 2
        setvariable Ashield <nothing>
        setvariable AshieldQuant 2
        setvariable Aweap garz
        setvariable AweapQuant 2
        setvariable Aforge chausses
        setvariable AforgeQuant 2
        setvariable Agen lantern
        setvariable AgenQuant 2
        setvariable Aflow pillow
        setvariable AflowQuant 2
        setvariable Abard drum pouch
        setvariable AbardQuant 2
        GOTO RANKREPORT

    QIR.RANK.-5:
    QIR.RANK.-4:
    QIR.RANK.-3:
    QIR.RANK.-2:
    QIR.RANK.-1:
    QIR.RANK.0:
        GOTO BEGGAR.MOD

    QIR.BAGCHECK:
        matchre BAGWARN /%Rbait%|%Rchan%|%Rherb%|%Rforge%|%Rbard%|%Rhair%|%Rthea%/
        matchre BAGWARN /%Rleather%|%Rtailor%|%Rgami%|%Rmagik%|%Rjewel%|%Rcleric%|%Rexot%/
        matchre BAGWARN /%Atann%|%Aalch%|%Acloth%|%Ascript%|%Acleric%|%Agami%|%Agem%|%Agen%|%Aflow%/
        matchre BAGWARN /%Amagic%|%Asling%|%Apuzz%|%Afoot%|%Ashield%|%Aweap%|%Aforge%|%Abard%/
        match BAGS.STOW.%c% You glance
        put look in my %container%
        put glance
        GOTO UniversalMatch


##################################################################
#####                                                        #####
#####                  RATHA START LOCATION                  #####
#####                                                        #####
##################################################################


    RATHA:
        match RATHA.START.GREEN [Truffenyi's Green]
        match RATHA.START.3SEWER The travel-worn road narrows, and the caravans that frequent
        match RATHA.START.2SEWER Fabulous marble colonnades line a regal plaza
        match RATHA.START.1SEWER A wall of refuse brings an end to travel along this alley.
        match RATHA.START.BANK Lower Bank of Ratha, Atrium
        match RATHA.START.PAWN Paedraig
        match RATHA.START.BAIT Drorg
        match RATHA.START.CHAN Namazzi
        match RATHA.START.HERB Ktzini
        match RATHA.START.FORGE Krrikt'k
        match RATHA.START.BARD Elepaio
        match RATHA.START.HAIR Dennats Baya
        match RATHA.START.LEATHER Redwing
        match RATHA.START.TAILOR Amorand
        match RATHA.START.GAMI Ssivo
        match RATHA.START.MAGIK Kalazashi
        match RATHA.START.JEWEL Svra'an
        match RATHA.START.THEA Hotagi'rath Theater, Rehearsal Hall
        match RATHA.START.EXOT Chabalu
        match RATHA.START.CLERIC This quaint shop run by the Oracle Veraclese
        match QIR.BADLOCATION Obvious
        setVariable citycode ratha
        put look
        GOTO UniversalMatch

    QIR.BADLOCATION:
        put echocolumn /on
        waitfor EchoColumn
        ECHO ***********************************************
        ECHO *** Not a valid starting location.
        ECHO *** Starting locations in Qi'Reshalia are:
        ECHO ***
        ECHO *** Ratha Bank Atrium        Aesry Outside Bank
        ECHO *** Outside Ratha sewers     Aesry West Gate
        ECHO *** Truffenyi's Green        Aesry Pawn Shop
        ECHO *** Ratha Pawn Shop          Aesry Tannery
        ECHO *** Ratha Bait Shop          Aesry Herb & Alchemist
        ECHO *** Ratha Chandlery          Aesry Clothing Shop
        ECHO *** Ratha Herb & Alchemist   Aesry Scriptorium
        ECHO *** Ratha Forge              Aesry Cleric Shop
        ECHO *** Ratha Bard Shop          Aesry Origami Boutique
        ECHO *** Ratha Hair Care          Aesry Jewelry Shop
        ECHO *** Ratha Leatherwork        Aesry Magic Shop
        ECHO *** Ratha Tailor             Aesry Slings and Arrows
        ECHO *** Ratha Origami Shop       Aesry General Store
        ECHO *** Ratha Magik Shop         Aesry Flower Shop
        ECHO *** Ratha Jewelry Shop       Aesry Instrument Shop
        ECHO *** Ratha Cleric Shop        Aesry Martrem's Forge
        ECHO *** Ratha Exotics Shop       Aesry Kilora's Weaponry
        ECHO *** Ratha Theater            Aesry Field of Shields
        ECHO ***    Rehearsal Hall        Aesry Footwear (Cordwainer's)
        ECHO ***                          Aesry Puzzle Shop
        ECHO ***
        ECHO ***********************************************
        put echocolumn /off
        waitfor EchoColumn
        GOTO END

    RATHA.START.GREEN:
        setVariable upperlower upper
        counter set 540
      RATHA.540:
        put s
        GOTO TRAVEL
      RATHA.541:
        put w
        GOTO TRAVEL
      RATHA.542:
        put w
        GOTO TRAVEL
      RATHA.543:
        put nw
        GOTO TRAVEL
      RATHA.544:
        put ne
        GOTO TRAVEL

    RATHA.START.3SEWER:
        setVariable upperlower upper
        counter set 545
      RATHA.545:
        put go grat
        GOTO TRAVEL
      RATHA.546:
        setVariable upperlower lower
        put go crev
        GOTO TRAVEL
      RATHA.547:
        put e
        GOTO TRAVEL
      RATHA.548:
        put se
        GOTO TRAVEL
      RATHA.549:
        put down
        GOTO TRAVEL
      RATHA.550:
        put s
        GOTO TRAVEL
      RATHA.566:
        counter set 551
      RATHA.551:
        put down
        GOTO TRAVEL
      RATHA.552:
        put ne
        GOTO TRAVEL
      RATHA.553:
        put se
        GOTO TRAVEL
      RATHA.554:
        put e
        GOTO TRAVEL
      RATHA.555:
        put go passage
        GOTO TRAVEL
      RATHA.556:
        put go grat
        GOTO TRAVEL

    RATHA.START.1SEWER:
        setVariable upperlower lower
        counter set 557
      RATHA.557:
        put e
        GOTO TRAVEL
      RATHA.558:
        put ne
        GOTO TRAVEL
      RATHA.559:
        put se
        GOTO TRAVEL
      RATHA.560:
        put s
        GOTO TRAVEL
      RATHA.561:
        put se
        GOTO TRAVEL
      RATHA.562:
        put se
        GOTO TRAVEL

    RATHA.START.2SEWER:
        setVariable upperlower lower
        counter set 564
      RATHA.564:
        put go drain
        GOTO TRAVEL
      RATHA.565:
        put go open
        GOTO TRAVEL

    RATHA.START.BANK:
        setVariable upperlower lower
        counter set 567
      RATHA.567:
        put go door
        GOTO TRAVEL
      RATHA.568:
        put climb stair
        GOTO TRAVEL
      RATHA.569:
        put sw
        GOTO TRAVEL
      RATHA.563:
        counter set 570
      RATHA.570:
        put s
        GOTO TRAVEL
      RATHA.571:
        put s
        GOTO TRAVEL
      RATHA.572:
        put s
        GOTO TRAVEL
      RATHA.573:
        put w
        GOTO TRAVEL
      RATHA.574:
        put nw
        GOTO TRAVEL
      RATHA.575:
        setVariable storecode Rbait
        put w
        GOTO TRAVEL
      RATHA.576:
      RATHA.594:
        setVariable startlocation %storecode%
      RATHA.538:
        setVariable entrance shop
        GOTO SETSTORE

    RATHA.START.PAWN:
        setVariable upperlower lower
      RATHA.577:
        counter set 577
        put out
        GOTO TRAVEL
      RATHA.578:
        put ne
        GOTO TRAVEL
      RATHA.579:
        put se
        GOTO TRAVEL
      RATHA.580:
        put se
        GOTO TRAVEL
      RATHA.581:
        put s
        GOTO TRAVEL
      RATHA.582:
        put s
        GOTO TRAVEL
      RATHA.583:
        put se
        GOTO TRAVEL
      RATHA.584:
        put e
        GOTO TRAVEL
      RATHA.585:
        put s
        GOTO TRAVEL
      RATHA.586:
        put se
        GOTO TRAVEL
      RATHA.587:
        put s
        GOTO TRAVEL
      RATHA.588:
        put s
        GOTO TRAVEL
      RATHA.589:
        put ne
        GOTO TRAVEL
      RATHA.590:
        put e
        GOTO TRAVEL
      RATHA.591:
        put e
        GOTO TRAVEL
      RATHA.592:
        put e
        GOTO TRAVEL
      RATHA.593:
        setVariable storecode Rbait
        put ne
        GOTO TRAVEL

    RATHA.START.BAIT:
        counter set 576
        setVariable upperlower lower
        setVariable storecode Rbait
        put out
        GOTO START

    RATHA.START.CHAN:
        counter set 10
        setVariable upperlower lower
        setVariable storecode Rchan
        put out
        GOTO START

    RATHA.START.HERB:
        counter set 26
        setVariable upperlower lower
        setVariable storecode Rherb
        put out
        GOTO START

    RATHA.START.FORGE:
        counter set 46
        setVariable upperlower lower
        setVariable storecode Rforge
        put out
        GOTO START

    RATHA.START.BARD:
        counter set 70
        setVariable upperlower lower
        setVariable storecode Rbard
        put out
        GOTO START

    RATHA.START.HAIR:
        counter set 77
        setVariable upperlower lower
        setVariable storecode Rhair
        put out
        GOTO START

    RATHA.START.LEATHER:
        counter set 82
        setVariable upperlower lower
        setVariable storecode Rleather
        put out
        GOTO START

    RATHA.START.TAILOR:
        counter set 91
        setVariable upperlower lower
        setVariable storecode Rtailor
        put out
        GOTO START

    RATHA.START.GAMI:
        counter set 104
        setVariable upperlower upper
        setVariable storecode Rgami
        put out
        GOTO START

    RATHA.START.MAGIK:
        counter set 111
        setVariable upperlower upper
        setVariable storecode Rmagik
        put out
        GOTO START

    RATHA.START.JEWEL:
        counter set 119
        setVariable upperlower upper
        setVariable storecode Rjewel
        put out
        GOTO START

    RATHA.START.THEA:
        counter set 123
        setVariable upperlower upper
        setVariable storecode Rthea
        put go arch
        GOTO START

    RATHA.START.EXOT:
        counter set 336
        setVariable upperlower upper
        setVariable storecode Rexot
        put out
        GOTO START

    RATHA.START.CLERIC:
        counter set 340
        setVariable upperlower upper
        setVariable storecode Rcleric
        put out
        GOTO START

##################################################################
#####                                                        #####
#####                  RATHA LEAVING SHOPS                   #####
#####                                                        #####
##################################################################


    LEAVE.RBAIT:
        GOTO %LorM%.RBAIT.1
    LEAVE.RBAIT.1:
        counter set 1
      RATHA.1:
        put e
        GOTO TRAVEL
      RATHA.2:
        put se
        GOTO TRAVEL
      RATHA.3:
        put e
        GOTO TRAVEL
      RATHA.4:
        put e
        GOTO TRAVEL
      RATHA.5:
        put e
        GOTO TRAVEL
      RATHA.6:
        put e
        GOTO TRAVEL
      RATHA.7:
        put e
        GOTO TRAVEL
      RATHA.8:
        put e
        GOTO TRAVEL
      RATHA.9:
        put n
        GOTO TRAVEL
      RATHA.10:
        setVariable storecode Rchan
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RCHAN:
        counter set 12
      RATHA.12:
        put n
        GOTO TRAVEL
      RATHA.13:
        put n
        GOTO TRAVEL
      RATHA.14:
        put n
        GOTO TRAVEL
      RATHA.15:
        put nw
        GOTO TRAVEL
      RATHA.16:
        put n
        GOTO TRAVEL
      RATHA.17:
        put nw
        GOTO TRAVEL
      RATHA.18:
        put n
        GOTO TRAVEL
      RATHA.19:
        put nw
        GOTO TRAVEL
      RATHA.20:
        put nw
        GOTO TRAVEL
      RATHA.21:
        put w
        GOTO TRAVEL
      RATHA.22:
        put w
        GOTO TRAVEL
      RATHA.23:
        put sw
        GOTO TRAVEL
      RATHA.24:
        put w
        GOTO TRAVEL
      RATHA.25:
        put sw
        GOTO TRAVEL
      RATHA.26:
        setVariable storecode Rherb
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHERB:
        counter set 27
      RATHA.27:
        put sw
        GOTO TRAVEL
      RATHA.28:
        put sw
        GOTO TRAVEL
      RATHA.29:
        put w
        GOTO TRAVEL
      RATHA.30:
        put go grat
        GOTO TRAVEL
      RATHA.31:
        put go passage
        GOTO TRAVEL
      RATHA.32:
        put w
        GOTO TRAVEL
      RATHA.33:
        put nw
        GOTO TRAVEL
      RATHA.34:
        put sw
        GOTO TRAVEL
      RATHA.35:
        put up
        GOTO TRAVEL
      RATHA.36:
        put go open
        GOTO TRAVEL
      RATHA.37:
        put go drain
        GOTO TRAVEL
      RATHA.38:
        put ne
        GOTO TRAVEL
      RATHA.39:
        put e
        GOTO TRAVEL
      RATHA.40:
        put se
        GOTO TRAVEL
      RATHA.41:
        put se
        GOTO TRAVEL
      RATHA.42:
        put s
        GOTO TRAVEL
      RATHA.43:
        put se
        GOTO TRAVEL
      RATHA.44:
        put se
        GOTO TRAVEL
      RATHA.45:
        put se
        GOTO TRAVEL
      RATHA.46:
        setVariable storecode Rforge
        setVariable entrance forge
        GOTO SETSTORE

    LEAVE.RFORGE:
        counter set 47
      RATHA.47:
        put nw
        GOTO TRAVEL
      RATHA.48:
        put nw
        GOTO TRAVEL
      RATHA.49:
        put nw
        GOTO TRAVEL
      RATHA.50:
        put n
        GOTO TRAVEL
      RATHA.51:
        put nw
        GOTO TRAVEL
      RATHA.52:
        put nw
        GOTO TRAVEL
      RATHA.53:
        put w
        GOTO TRAVEL
      RATHA.54:
        put w
        GOTO TRAVEL
      RATHA.55:
        put w
        GOTO TRAVEL
      RATHA.56:
        put w
        GOTO TRAVEL
      RATHA.57:
        put w
        GOTO TRAVEL
      RATHA.58:
        put sw
        GOTO TRAVEL
      RATHA.59:
        put w
        GOTO TRAVEL
      RATHA.60:
        put w
        GOTO TRAVEL
      RATHA.61:
        put nw
        GOTO TRAVEL
      RATHA.62:
        put n
        GOTO TRAVEL
      RATHA.63:
        put w
        GOTO TRAVEL
      RATHA.64:
        put w
        GOTO TRAVEL
      RATHA.65:
        put ne
        GOTO TRAVEL
      RATHA.66:
        put nw
        GOTO TRAVEL
      RATHA.67:
        put nw
        GOTO TRAVEL
      RATHA.68:
        put sw
        GOTO TRAVEL
      RATHA.69:
        put s
        GOTO TRAVEL
      RATHA.70:
        setVariable storecode Rbard
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RBARD:
        counter set 71
      RATHA.71:
        put n
        GOTO TRAVEL
      RATHA.72:
        put ne
        GOTO TRAVEL
      RATHA.73:
        put se
        GOTO TRAVEL
      RATHA.74:
        put se
        GOTO TRAVEL
      RATHA.75:
        put sw
        GOTO TRAVEL
      RATHA.76:
        put e
        GOTO TRAVEL
      RATHA.77:
        setVariable storecode Rhair
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RHAIR:
        counter set 78
      RATHA.78:
        put e
        GOTO TRAVEL
      RATHA.79:
        put s
        GOTO TRAVEL
      RATHA.80:
        put se
        GOTO TRAVEL
      RATHA.81:
        put e
        GOTO TRAVEL
      RATHA.82:
        setVariable storecode Rleather
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RLEATHER:
        counter set 83
      RATHA.83:
        put e
        GOTO TRAVEL
      RATHA.84:
        put ne
        GOTO TRAVEL
      RATHA.85:
        put e
        GOTO TRAVEL
      RATHA.86:
        put e
        GOTO TRAVEL
      RATHA.87:
        put e
        GOTO TRAVEL
      RATHA.88:
        put e
        GOTO TRAVEL
      RATHA.89:
        put e
        GOTO TRAVEL
      RATHA.90:
        put e
        GOTO TRAVEL
      RATHA.91:
        setVariable storecode Rtailor
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RTAILOR:
        counter set 92
      RATHA.92:
        put w
        GOTO TRAVEL
      RATHA.93:
        put w
        GOTO TRAVEL
      RATHA.94:
        put sw
        GOTO TRAVEL
      RATHA.95:
        put go drain
        GOTO TRAVEL
      RATHA.96:
        put go open
        GOTO TRAVEL
      RATHA.97:
        put n
        GOTO TRAVEL
      RATHA.98:
        put up
        GOTO TRAVEL
      RATHA.99:
        put nw
        GOTO TRAVEL
      RATHA.100:
        put w
        GOTO TRAVEL
      RATHA.101:
        put go crev
        GOTO TRAVEL
      RATHA.102:
        put go grat
        setVariable upperlower upper
        GOTO TRAVEL
      RATHA.103:
        put sw
        GOTO TRAVEL
      RATHA.104:
        setVariable storecode Rgami
        setVariable entrance struct
        GOTO SETSTORE

    LEAVE.RGAMI:
        counter set 105
      RATHA.105:
        put w
        GOTO TRAVEL
      RATHA.106:
        put w
        GOTO TRAVEL
      RATHA.107:
        put nw
        GOTO TRAVEL
      RATHA.108:
        put nw
        GOTO TRAVEL
      RATHA.109:
        put nw
        GOTO TRAVEL
      RATHA.110:
        put n
        GOTO TRAVEL
      RATHA.111:
        setVariable storecode Rmagik
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RMAGIK:
        counter set 112
      RATHA.112:
        put e
        GOTO TRAVEL
      RATHA.113:
        put ne
        GOTO TRAVEL
      RATHA.114:
        put ne
        GOTO TRAVEL
      RATHA.115:
        put ne
        GOTO TRAVEL
      RATHA.116:
        put se
        GOTO TRAVEL
      RATHA.117:
        put se
        GOTO TRAVEL
      RATHA.118:
        put ne
        GOTO TRAVEL
      RATHA.119:
        setVariable storecode Rjewel
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RJEWEL:
        counter set 120
      RATHA.120:
        put e
        GOTO TRAVEL
      RATHA.121:
        put go building
        GOTO TRAVEL
      RATHA.122:
        put w
        GOTO TRAVEL
      RATHA.123:
        setVariable storecode Rthea
        setVariable entrance arch
        GOTO SETSTORE

    LEAVE.RTHEA:
        counter set 328
      RATHA.328:
        put e
        GOTO TRAVEL
      RATHA.329:
        put out
        GOTO TRAVEL
      RATHA.330:
        put w
        GOTO TRAVEL
      RATHA.331:
        put sw
        GOTO TRAVEL
      RATHA.332:
        put se
        GOTO TRAVEL
      RATHA.333:
        put e
        GOTO TRAVEL
      RATHA.334:
        put e
        GOTO TRAVEL
      RATHA.335:
        setVariable storecode Rexot
        put e
        GOTO TRAVEL
      RATHA.336:
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.REXOT:
        counter set 337
      RATHA.337:
        put w
        GOTO TRAVEL
      RATHA.338:
        put w
        GOTO TRAVEL
      RATHA.339:
        put s
        GOTO TRAVEL
      RATHA.340:
        setVariable storecode Rcleric
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.RCLERIC:
        counter set 125
      RATHA.125:
        put sw
        GOTO TRAVEL
      RATHA.126:
        put sw
        GOTO TRAVEL
      RATHA.127:
        put go grat
        GOTO TRAVEL
      RATHA.128:
        put go crev
        GOTO TRAVEL
      RATHA.129:
        put e
        GOTO TRAVEL
      RATHA.130:
        put se
        GOTO TRAVEL
      RATHA.131:
        put down
        GOTO TRAVEL
      RATHA.132:
        put s
        GOTO TRAVEL
      RATHA.133:
        put down
        GOTO TRAVEL
      RATHA.134:
        put ne
        GOTO TRAVEL
      RATHA.135:
        put se
        GOTO TRAVEL
      RATHA.136:
        put e
        GOTO TRAVEL
      RATHA.137:
        put go passage
        GOTO TRAVEL
      RATHA.138:
        put go grat
        setVariable upperlower lower
        GOTO TRAVEL
      RATHA.139:
        put e
        GOTO TRAVEL
      RATHA.140:
        put ne
        GOTO TRAVEL
      RATHA.141:
        put nw
        GOTO TRAVEL
      RATHA.142:
        put se
        GOTO TRAVEL
      RATHA.143:
        put se
        GOTO TRAVEL
      RATHA.144:
        put s
        GOTO TRAVEL
      RATHA.145:
        put se
        GOTO TRAVEL
      RATHA.146:
        put se
        GOTO TRAVEL
      RATHA.147:
        put s
        GOTO TRAVEL
      RATHA.148:
        put s
        GOTO TRAVEL
      RATHA.149:
        put s
        GOTO TRAVEL
      RATHA.150:
        counter set 535
      RATHA.535:
        put w
        GOTO TRAVEL
      RATHA.536:
        put nw
        GOTO TRAVEL
      RATHA.537:
        setVariable storecode Rbait
        put w
        GOTO TRAVEL

    ALTLEAVE.RBAIT:
    ALTLEAVE.RCHAN:
    ALTLEAVE.RHERB:
    ALTLEAVE.RFORGE:
    ALTLEAVE.RBARD:
    ALTLEAVE.RHAIR:
    ALTLEAVE.RLEATHER:
    ALTLEAVE.RTAILOR:
    ALTLEAVE.RGAMI:
    ALTLEAVE.RMAGIK:
    ALTLEAVE.RJEWEL:
    ALTLEAVE.RCLERIC:
        GOTO MOVEERROR
    ALTLEAVE.RTHEA:
        counter set 341
      RATHA.341:
        put go arch
        GOTO TRAVEL
      RATHA.342:
        GOTO LEAVE.RTHEA
    ALTLEAVE.REXOT:
        counter set 356
      RATHA.356:
        put out
        GOTO TRAVEL
      RATHA.357:
        GOTO LEAVE.REXOT


##################################################################
#####                                                        #####
#####                  RATHA MOVEON COORDS                   #####
#####                                                        #####
##################################################################


    MOVEON.RBAIT.1:
      RATHA.178:
        counter set 152
      RATHA.152:
        put sw
        GOTO TRAVEL
      RATHA.153:
        put w
        GOTO TRAVEL
      RATHA.154:
        put w
        GOTO TRAVEL
      RATHA.155:
        put w
        GOTO TRAVEL
      RATHA.156:
        put sw
        GOTO TRAVEL
      RATHA.157:
        put n
        GOTO TRAVEL
      RATHA.158:
        put n
        GOTO TRAVEL
      RATHA.159:
        put nw
        GOTO TRAVEL
      RATHA.160:
        put n
        GOTO TRAVEL
      RATHA.161:
        put w
        GOTO TRAVEL
      RATHA.162:
        put nw
        GOTO TRAVEL
      RATHA.163:
        put n
        GOTO TRAVEL
      RATHA.164:
        put n
        GOTO TRAVEL
      RATHA.165:
        put nw
        GOTO TRAVEL
      RATHA.166:
        put nw
        GOTO TRAVEL
      RATHA.167:
        put sw
        GOTO TRAVEL
      RATHA.168:
        put go building
        GOTO TRAVEL
      RATHA.169:
        GOTO PAWN.%DropOrStow%

##################################################################
#####                                                        #####
#####                     RATHA BINNING                      #####
#####                                                        #####
##################################################################


    RATHA.PAWNFINISH.NONTHIEF:
    RATHA.PAWNFINISH.EMPATH:
        GOTO END

    RATHA.PAWNFINISH.THIEF:
        counter set 758
      RATHA.758:
        put out
        GOTO TRAVEL
      RATHA.759:
        put ne
        GOTO TRAVEL
      RATHA.760:
        put ne
        GOTO TRAVEL
      RATHA.761:
        put e
        GOTO TRAVEL
      RATHA.762:
        put e
        GOTO TRAVEL
      RATHA.763:
        put e
        GOTO TRAVEL
      RATHA.764:
        put se
        GOTO TRAVEL
      RATHA.765:
        put e
        GOTO TRAVEL
      RATHA.766:
        put e
        GOTO TRAVEL
      RATHA.767:
        put e
        GOTO TRAVEL
      RATHA.768:
        put e
        GOTO TRAVEL
      RATHA.769:
        put sw
        GOTO TRAVEL
      RATHA.770:
        put w
        GOTO TRAVEL
      RATHA.771:
        put go grat
        GOTO TRAVEL
      RATHA.772:
        put go passage
        GOTO TRAVEL
      RATHA.773:
        put w
        GOTO TRAVEL
      RATHA.774:
        put nw
        GOTO TRAVEL
      RATHA.775:
        put sw
        GOTO TRAVEL
      RATHA.776:
        put up
        GOTO TRAVEL
      RATHA.777:
        put n
        GOTO TRAVEL
      RATHA.778:
        put up
        GOTO TRAVEL
      RATHA.779:
        put nw
        GOTO TRAVEL
      RATHA.780:
        put w
        GOTO TRAVEL
      RATHA.781:
        put go crev
        GOTO TRAVEL
      RATHA.782:
        put go grat
        GOTO TRAVEL
      RATHA.783:
        put ne
        GOTO TRAVEL
      RATHA.784:
        put ne
        GOTO TRAVEL
      RATHA.785:
        put n
        GOTO TRAVEL
      RATHA.786:
        put e
        GOTO TRAVEL
      RATHA.787:
        put e
        GOTO TRAVEL
      RATHA.788:
        put go shop
        GOTO TRAVEL
      RATHA.789:
        put ask chab about cellar
        wait
        put go door
        GOTO TRAVEL
      RATHA.790:
        put go tunnel
        GOTO TRAVEL
      RATHA.791:
        put w
        GOTO TRAVEL
      RATHA.792:
        GOTO PAWN.BIN

    RATHA.BINFINISH.THIEF:
        GOTO END


##################################################################
#####                                                        #####
#####             RATHA 1ST & 2ND TIER JUSTICE               #####
#####                                                        #####
##################################################################

    RATHA.FREE:
        put get %name sack
        matchre SACKCHECK1 /referring|You reach|You realize/
        GOTO UniversalMatch

    RATHA.DEBT:
        GOTO RATHA.%upperlower%.DEBT

    RATHA.ITEMCHECK:
        GOTO RATHA.%upperlower%.ITEMCHECK

    RATHA.LOWER.ITEMCHECK:
        put drop my small sack
        wait
        match RATHA.LOWER.DEBT You have nothing
        match RATHA.LOWER.FREE INVENTORY HELP
        put inv
        matchwait

    RATHA.LOWER.DEBT:
        setVariable upperlower lower
        counter set 603
      RATHA.603:
        put out
        GOTO TRAVEL
      RATHA.604:
        put n
        GOTO TRAVEL
      RATHA.605:
        put n
        GOTO TRAVEL
      RATHA.606:
        put ne
        GOTO TRAVEL
      RATHA.607:
        put climb stair
        GOTO TRAVEL
      RATHA.608:
        put go door
        GOTO TRAVEL
      RATHA.609:
        put go cash
        GOTO TRAVEL
      RATHA.610:
        put with 500 bronze lirum
        wait
        put go atr
        GOTO TRAVEL
      RATHA.611:
        put go door
        GOTO TRAVEL
      RATHA.612:
        put climb stair
        GOTO TRAVEL
      RATHA.613:
        put sw
        GOTO TRAVEL
      RATHA.614:
        put nw
        GOTO TRAVEL
      RATHA.615:
        put nw
        GOTO TRAVEL
      RATHA.616:
        put n
        GOTO TRAVEL
      RATHA.617:
        put nw
        GOTO TRAVEL
      RATHA.618:
        put sw
        GOTO TRAVEL
      RATHA.619:
        put w
        GOTO TRAVEL
      RATHA.620:
        put go grat
        GOTO TRAVEL
      RATHA.621:
        put go passage
        GOTO TRAVEL
      RATHA.622:
        put w
        GOTO TRAVEL
      RATHA.623:
        put nw
        GOTO TRAVEL
      RATHA.624:
        put sw
        GOTO TRAVEL
      RATHA.625:
        put up
        GOTO TRAVEL
      RATHA.626:
        put n
        GOTO TRAVEL
      RATHA.627:
        put up
        GOTO TRAVEL
      RATHA.628:
        put nw
        GOTO TRAVEL
      RATHA.629:
        put w
        GOTO TRAVEL
      RATHA.630:
        put go crev
        GOTO TRAVEL
      RATHA.631:
        put go grat
        GOTO TRAVEL
      RATHA.632:
        put sw
        GOTO TRAVEL
      RATHA.633:
        put se
        GOTO TRAVEL
      RATHA.634:
        put s
        GOTO TRAVEL
      RATHA.635:
        put sw
        GOTO TRAVEL
      RATHA.636:
        put s
        GOTO TRAVEL
      RATHA.637:
        put w
        GOTO TRAVEL
      RATHA.638:
        put go gate
        GOTO TRAVEL
      RATHA.639:
        put n
        GOTO TRAVEL
      RATHA.640:
        put n
        GOTO TRAVEL
      RATHA.641:
        put climb stair
        GOTO TRAVEL
      RATHA.642:
        put go door
        GOTO TRAVEL
      RATHA.643:
        put go hall
        GOTO TRAVEL
      RATHA.644:
        put go off
        GOTO TRAVEL
      RATHA.645:
        put pay 5000
        wait
        put out
        GOTO TRAVEL
      RATHA.646:
        put out
        GOTO TRAVEL
      RATHA.647:
        put go door
        GOTO TRAVEL
      RATHA.648:
        put climb stair
        GOTO TRAVEL
      RATHA.649:
        put s
        GOTO TRAVEL
      RATHA.650:
        put s
        GOTO TRAVEL
      RATHA.651:
        put go gate
        GOTO TRAVEL
      RATHA.652:
        put w
        GOTO TRAVEL
      RATHA.653:
        put n
        GOTO TRAVEL
      RATHA.654:
        put nw
        GOTO TRAVEL
      RATHA.655:
        put n
        GOTO TRAVEL
      RATHA.656:
        put ne
        GOTO TRAVEL
      RATHA.657:
        put e
        GOTO TRAVEL
      RATHA.658:
        put e
        GOTO TRAVEL
      RATHA.659:
        put ne
        GOTO TRAVEL
      RATHA.660:
        put go grat
        GOTO TRAVEL
      RATHA.661:
        put go crev
        GOTO TRAVEL
      RATHA.662:
        put e
        GOTO TRAVEL
      RATHA.663:
        put se
        GOTO TRAVEL
      RATHA.664:
        put down
        GOTO TRAVEL
      RATHA.665:
        put s
        GOTO TRAVEL
      RATHA.666:
        put down
        GOTO TRAVEL
      RATHA.667:
        put ne
        GOTO TRAVEL
      RATHA.668:
        put se
        GOTO TRAVEL
      RATHA.669:
        put e
        GOTO TRAVEL
      RATHA.670:
        put go passage
        GOTO TRAVEL
      RATHA.671:
        put go grat
        GOTO TRAVEL
      RATHA.672:
        put e
        GOTO TRAVEL
      RATHA.673:
        put ne
        GOTO TRAVEL
      RATHA.674:
        put se
        GOTO TRAVEL
      RATHA.675:
        put s
        GOTO TRAVEL
      RATHA.676:
        put se
        GOTO TRAVEL
      RATHA.677:
        put se
        GOTO TRAVEL
      RATHA.678:
        put ne
        GOTO TRAVEL
      RATHA.679:
        put climb stair
        GOTO TRAVEL
      RATHA.680:
        put go door
        GOTO TRAVEL
      RATHA.681:
        put go cash
        GOTO TRAVEL
      RATHA.682:
        put depo all
        wait
        put go atr
        GOTO TRAVEL
      RATHA.683:
        put go door
        GOTO TRAVEL
      RATHA.684:
        put climb stair
        GOTO TRAVEL
      RATHA.685:
        put sw
        GOTO TRAVEL
      RATHA.686:
        put s
        GOTO TRAVEL
      RATHA.687:
        put s
        GOTO TRAVEL
      RATHA.688:
        put go guard
        GOTO TRAVEL
      RATHA.689:
        put get %name sack
        matchre SACKCHECK1 /referring|You reach|You realize/
        GOTO UniversalMatch

    RATHA.LOWER.FREE:
        setVariable upperlower lower
        pause 1
        match RATHA.LOWER.MISSINGSTART waitandsee
        match RATHA.LOWER.FREE2 okstart
        put echo %startlocation
        put echo okstart
        GOTO UniversalMatch

    RATHA.LOWER.MISSINGSTART:
        setVariable startlocation Rbait
        setVariable ResumeStore Rbait
        GOTO RATHA.LOWER.FREE2

    RATHA.LOWER.FREE2:
        counter set 254
      RATHA.254:
        put out
        GOTO TRAVEL
      RATHA.255:
        put s
        GOTO TRAVEL
      RATHA.256:
        put w
        GOTO TRAVEL
      RATHA.257:
        put nw
        GOTO TRAVEL
      RATHA.258:
        put w
        GOTO TRAVEL
      RATHA.259:
        counter set 1
        setVariable storecode Rbait
        GOTO RESUME.%ResumeStore%

    RESUME.RTAILOR:
        counter add 1
    RESUME.RLEATHER:
        counter add 1
    RESUME.RHAIR:
        counter add 1
    RESUME.RBARD:
        counter add 1
    RESUME.RFORGE:
        counter add 1
    RESUME.RHERB:
        counter add 1
    RESUME.RCHAN:
        counter add 1
    RESUME.RBAIT:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


##################################################################
#####                                                        #####
#####             RATHA 3RD & 4TH TIER JUSTICE               #####
#####                                                        #####
##################################################################


    RATHA.UPPER.ITEMCHECK:
        put drop my small sack
        wait
        match RATHA.UPPER.DEBT You have nothing
        match RATHA.UPPER.FREE INVENTORY HELP
        put inv
        matchwait

    RATHA.UPPER.DEBT:
        setVariable upperlower upper
        counter set 717
      RATHA.717:
        put out
        GOTO TRAVEL
      RATHA.718:
        put s
        GOTO TRAVEL
      RATHA.719:
        put s
        GOTO TRAVEL
      RATHA.720:
        put w
        GOTO TRAVEL
      RATHA.721:
        put sw
        GOTO TRAVEL
      RATHA.722:
        put s
        GOTO TRAVEL
      RATHA.723:
        put se
        GOTO TRAVEL
      RATHA.724:
        put s
        GOTO TRAVEL
      RATHA.725:
        put e
        GOTO TRAVEL
      RATHA.726:
        put go gate
        GOTO TRAVEL
      RATHA.727:
        put n
        GOTO TRAVEL
      RATHA.728:
        put n
        GOTO TRAVEL
      RATHA.729:
        put climb stair
        GOTO TRAVEL
      RATHA.730:
        put go door
        GOTO TRAVEL
      RATHA.731:
        put e
        GOTO TRAVEL
      RATHA.732:
        put e
        GOTO TRAVEL
      RATHA.733:
        put with 500 bronze lirum
        wait
        put w
        GOTO TRAVEL
      RATHA.734:
        put w
        GOTO TRAVEL
      RATHA.735:
        put go hall
        GOTO TRAVEL
      RATHA.736:
        put go coll office
        GOTO TRAVEL
      RATHA.737:
        put pay 5000
        wait
        put out
        GOTO TRAVEL
      RATHA.738:
        put out
        GOTO TRAVEL
      RATHA.739:
        put e
        GOTO TRAVEL
      RATHA.740:
        put e
        GOTO TRAVEL
      RATHA.741:
        put depo all
        wait
        put w
        GOTO TRAVEL
      RATHA.742:
        put w
        GOTO TRAVEL
      RATHA.743:
        put go door
        GOTO TRAVEL
      RATHA.744:
        put climb stair
        GOTO TRAVEL
      RATHA.745:
        put s
        GOTO TRAVEL
      RATHA.746:
        put s
        GOTO TRAVEL
      RATHA.747:
        put go gate
        GOTO TRAVEL
      RATHA.748:
        put w
        GOTO TRAVEL
      RATHA.749:
        put n
        GOTO TRAVEL
      RATHA.750:
        put nw
        GOTO TRAVEL
      RATHA.751:
        put n
        GOTO TRAVEL
      RATHA.752:
        put ne
        GOTO TRAVEL
      RATHA.753:
        put e
        GOTO TRAVEL
      RATHA.754:
        put n
        GOTO TRAVEL
      RATHA.755:
        put n
        GOTO TRAVEL
      RATHA.756:
        put go office
        GOTO TRAVEL
      RATHA.757:
        put get %name sack
        matchre SACKCHECK1 /referring|You reach|You realize/
        GOTO UniversalMatch

    RATHA.UPPER.FREE:
        setVariable upperlower upper
        pause 1
        match RATHA.UPPER.MISSINGSTART waitandsee
        match RATHA.UPPER.FREE2 okstart
        put echo %startlocation
        put echo okstart
        GOTO UniversalMatch

    RATHA.UPPER.MISSINGSTART:
        setVariable startlocation Rgami
        setVariable ResumeStore Rgami
        GOTO RATHA.UPPER.FREE2

    RATHA.UPPER.FREE2:
      RATHA.246:
        counter set 246
        put out
        GOTO TRAVEL
      RATHA.247:
        put out
        GOTO TRAVEL
      RATHA.248:
        put out
        GOTO TRAVEL
      RATHA.249:
        put s
        GOTO TRAVEL
      RATHA.250:
        put s
        GOTO TRAVEL
      RATHA.251:
        put e
        GOTO TRAVEL
      RATHA.252:
        counter set 1
        setVariable storecode Rgami
        GOTO RESUME.%ResumeStore%

    RESUME.RCLERIC:
        counter add 1
    RESUME.REXOT:
        counter add 1
    RESUME.RTHEA:
        counter add 1
    RESUME.RJEWEL:
        counter add 1
    RESUME.RMAGIK:
        counter add 1
    RESUME.RGAMI:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


##################################################################
#####                                                        #####
#####                  AESRY START LOCATION                  #####
#####                                                        #####
##################################################################


    AESRY:
        match AESRY.START.BANK a ragtag peddler
        match AESRY.START.GATE prayer gate dedicated to Eluned
        match AESRY.START.PAWN Ishh stands
        match AESRY.START.TANN Sklaar'ishht
        match AESRY.START.ALCH Taernen
        match AESRY.START.CLOTH Miakoda
        match AESRY.START.SCRIPT Nakuge
        match AESRY.START.CLERIC Raeloka
        match AESRY.START.GAMI Tilaya
        match AESRY.START.GEM Shoiya
        match AESRY.START.MAGIC Zenastara
        match AESRY.START.SLING Woodbyne
        match AESRY.START.PUZZ Joirin
        match AESRY.START.FOOT Bayanzi
        match AESRY.START.SHIELD Field of Shields
        match AESRY.START.WEAP Kilora
        match AESRY.START.FORGE Martrem
        match AESRY.START.GEN Rummeltum
        match AESRY.START.FLOW Erianthe
        match AESRY.START.BARD Teshi
        match QIR.BADLOCATION Obvious
        setVariable citycode AESRY
        put look
        GOTO UniversalMatch

    AESRY.START.TANN:
        counter set 133
        setVariable storecode Atann
        GOTO START

    AESRY.START.ALCH:
        counter set 20
        setVariable storecode Aalch
        put out
        GOTO START

    AESRY.START.CLOTH:
        counter set 33
        setVariable storecode Acloth
        put out
        GOTO START

    AESRY.START.SCRIPT:
        counter set 36
        setVariable storecode Ascript
        put out
        GOTO START

    AESRY.START.CLERIC:
        counter set 40
        setVariable storecode Acleric
        put out
        GOTO START

    AESRY.START.GAMI:
        counter set 43
        setVariable storecode Agami
        put out
        GOTO START

    AESRY.START.GEM:
        counter set 46
        setVariable storecode Agem
        put out
        GOTO START

    AESRY.START.MAGIC:
        counter set 50
        setVariable storecode Amagic
        put go door
        GOTO START

    AESRY.START.SLING:
        counter set 66
        setVariable storecode Asling
        GOTO START

    AESRY.START.PUZZ:
        counter set 84
        setVariable storecode Apuzz
        put out
        GOTO START

    AESRY.START.FOOT:
        counter set 88
        setVariable storecode Afoot
        put out
        GOTO START

    AESRY.START.SHIELD:
        counter set 90
        setVariable storecode Ashield
        put out
        GOTO START

    AESRY.START.WEAP:
        counter set 94
        setVariable storecode Aweap
        put out
        GOTO START

    AESRY.START.FORGE:
        counter set 97
        setVariable storecode Aforge
        put out
        GOTO START

    AESRY.START.GEN:
        counter set 100
        setVariable storecode Agen
        put out
        GOTO START

    AESRY.START.FLOW:
        counter set 103
        setVariable storecode Aflow
        put out
        GOTO START

    AESRY.START.BARD:
        counter set 109
        setVariable storecode Abard
        put out
        GOTO START

    AESRY.START.BANK:
        counter set 1
      AESRY.1:
        put w
        GOTO TRAVEL
    AESRY.START.GATE:
        counter set 2
      AESRY.2:
        put s
        GOTO TRAVEL
      AESRY.3:
        put s
        GOTO TRAVEL
      AESRY.4:
        put climb step
        GOTO TRAVEL
      AESRY.5:
        put s
        GOTO TRAVEL
      AESRY.6:
        put go store
        GOTO TRAVEL
      AESRY.7:
        GOTO AESRY.START.GEN

    AESRY.START.PAWN:
        counter set 138
      AESRY.138:
        put go door
        GOTO TRAVEL
      AESRY.139:
        counter set 8
      AESRY.8:
        put sw
        GOTO TRAVEL
      AESRY.9:
        put s
        GOTO TRAVEL
      AESRY.10:
        put sw
        GOTO TRAVEL
      AESRY.11:
        put go shop
        GOTO TRAVEL
      AESRY.12:
        GOTO AESRY.START.PUZZ


##################################################################
#####                                                        #####
#####                  AESRY LEAVING SHOPS                   #####
#####                                                        #####
##################################################################


    ALTLEAVE.ATANN:
    LEAVE.ATANN:
        counter set 13
      AESRY.13:
        put e
        GOTO TRAVEL
      AESRY.14:
        put o
        GOTO TRAVEL
      AESRY.15:
        put go gate
        GOTO TRAVEL
      AESRY.16:
        put e
        GOTO TRAVEL
      AESRY.17:
        put ne
        GOTO TRAVEL
      AESRY.18:
        put n
        GOTO TRAVEL
      AESRY.19:
        put ne
        GOTO TRAVEL
      AESRY.20:
        setvariable storecode Aalch
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.AALCH:
        counter set 21
      AESRY.21:
        put sw
        GOTO TRAVEL
      AESRY.22:
        put s
        GOTO TRAVEL
      AESRY.23:
        put sw
        GOTO TRAVEL
      AESRY.24:
        put w
        GOTO TRAVEL
      AESRY.25:
        put s
        GOTO TRAVEL
      AESRY.26:
        put climb stair
        GOTO TRAVEL
      AESRY.27:
        put s
        GOTO TRAVEL
      AESRY.28:
        put s
        GOTO TRAVEL
    MOVEON.ABARD.1:
        counter set 29
      AESRY.29:
        put e
        GOTO TRAVEL
      AESRY.30:
        put ne
        GOTO TRAVEL
      AESRY.31:
        put n
        GOTO TRAVEL
      AESRY.32:
        put ne
        GOTO TRAVEL
      AESRY.33:
        setvariable storecode Acloth
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.ACLOTH:
        counter set 34
      AESRY.34:
        put ne
        GOTO TRAVEL
      AESRY.35:
        put e
        GOTO TRAVEL
      AESRY.36:
        setvariable storecode Ascript
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.ASCRIPT:
        counter set 37
      AESRY.37:
        put ne
        GOTO TRAVEL
      AESRY.38:
        put e
        GOTO TRAVEL
      AESRY.39:
        put se
        GOTO TRAVEL
      AESRY.40:
        setvariable storecode Acleric
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.ACLERIC:
        counter set 41
      AESRY.41:
        put e
        GOTO TRAVEL
      AESRY.42:
        put se
        GOTO TRAVEL
      AESRY.43:
        setvariable storecode Agami
        setVariable entrance building
        GOTO SETSTORE

    LEAVE.AGAMI:
        counter set 44
      AESRY.44:
        put se
        GOTO TRAVEL
      AESRY.45:
        put s
        GOTO TRAVEL
      AESRY.46:
        setvariable storecode Agem
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.AGEM:
        counter set 47
      AESRY.47:
        put se
        GOTO TRAVEL
      AESRY.48:
        put e
        GOTO TRAVEL
      AESRY.49:
        put n
        GOTO TRAVEL
      AESRY.50:
        setvariable storecode Amagic
        setVariable entrance shop
        GOTO SETSTORE

    ALTLEAVE.AMAGIC:
        counter set 51
      AESRY.51:
        put go door
        GOTO TRAVEL
      AESRY.52:
    LEAVE.AMAGIC:
        counter set 53
      AESRY.53:
        put s
        GOTO TRAVEL
      AESRY.54:
        put s
        GOTO TRAVEL
      AESRY.55:
        put climb stair
        GOTO TRAVEL
      AESRY.56:
        put s
        GOTO TRAVEL
      AESRY.57:
        put s
        GOTO TRAVEL
      AESRY.58:
        put s
        GOTO TRAVEL
      AESRY.59:
        GOTO %LorM%.AMAGIC.1

    LEAVE.AMAGIC.1:
        counter set 136
      AESRY.136:
        put go foot
        GOTO TRAVEL
      AESRY.137:
        counter set 60
      AESRY.60:
        put se
        GOTO TRAVEL
      AESRY.61:
        put se
        GOTO TRAVEL
      AESRY.62:
        put ne
        GOTO TRAVEL
      AESRY.63:
        put se
        GOTO TRAVEL
      AESRY.64:
        put ne
        GOTO TRAVEL
      AESRY.65:
        setVariable storecode Asling
        put kneel
        wait
    ASLING.SHORT:
        put go burrow
        match SHORTSTAND You must be standing
        GOTO TRAVEL
      AESRY.66:
        setVariable entrance shop
        GOTO SETSTORE

    ALTLEAVE.ASLING:
    LEAVE.ASLING:
        counter set 67
      AESRY.67:
        put go opening
        match AESRY.68 referring
        GOTO TRAVEL
      AESRY.68:
        matchre AESRY.68 /...wait|type ahead|Roundtime/i
        matchre LEAVE.ASLING.2 /You stand|already standing/
        put stand
        GOTO UniversalMatch
    LEAVE.ASLING.2:
        counter set 69
      AESRY.69:
        put sw
        GOTO TRAVEL
      AESRY.70:
        put nw
        GOTO TRAVEL
      AESRY.71:
        put sw
        GOTO TRAVEL
      AESRY.72:
        put nw
        GOTO TRAVEL
      AESRY.73:
        put nw
        GOTO TRAVEL
      AESRY.74:
        put w
        GOTO TRAVEL
    MOVEON.AMAGIC.1:
        counter set 75
      AESRY.75:
        put s
        GOTO TRAVEL
      AESRY.76:
        put s
        GOTO TRAVEL
      AESRY.77:
        put climb step
        GOTO TRAVEL
      AESRY.78:
        put s
        GOTO TRAVEL
      AESRY.79:
        put w
        GOTO TRAVEL
      AESRY.80:
        GOTO %LorM%.ASLING.1
    LEAVE.ASLING.1:
        counter set 81
      AESRY.81:
        put sw
        GOTO TRAVEL
      AESRY.82:
        put s
        GOTO TRAVEL
      AESRY.83:
        put sw
        GOTO TRAVEL
      AESRY.84:
        setvariable storecode Apuzz
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.APUZZ:
        GOTO %LorM%.APUZZ.1
    LEAVE.APUZZ.1:
        counter set 85
      AESRY.85:
        put sw
        GOTO TRAVEL
      AESRY.86:
        put w
        GOTO TRAVEL
      AESRY.87:
        put sw
        GOTO TRAVEL
      AESRY.88:
        setvariable storecode Afoot
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.AFOOT:
        counter set 89
      AESRY.89:
        put w
        GOTO TRAVEL
      AESRY.90:
        setvariable storecode Ashield
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.ASHIELD:
        counter set 91
      AESRY.91:
        put nw
        GOTO TRAVEL
      AESRY.92:
        put w
        GOTO TRAVEL
      AESRY.93:
        put nw
        GOTO TRAVEL
      AESRY.94:
        setvariable storecode Aweap
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.AWEAP:
        counter set 95
      AESRY.95:
        put nw
        GOTO TRAVEL
      AESRY.96:
        put n
        GOTO TRAVEL
      AESRY.97:
        setvariable storecode Aforge
        setVariable entrance forge
        GOTO SETSTORE

    LEAVE.AFORGE:
        counter set 98
      AESRY.98:
        put nw
        GOTO TRAVEL
      AESRY.99:
        put w
        GOTO TRAVEL
      AESRY.100:
        setvariable storecode Agen
        setVariable entrance store
        GOTO SETSTORE

    LEAVE.AGEN:
        GOTO %LorM%.AGEN.1
    LEAVE.AGEN.1:
        counter set 101
      AESRY.101:
        put s
        GOTO TRAVEL
      AESRY.102:
        put s
        GOTO TRAVEL
      AESRY.103:
        setvariable storecode Aflow
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.AFLOW:
        counter set 105
      AESRY.105:
        put climb stair
        GOTO TRAVEL
      AESRY.106:
        put s
        GOTO TRAVEL
      AESRY.107:
        put e
        GOTO TRAVEL
      AESRY.108:
        put se
        GOTO TRAVEL
      AESRY.109:
        setvariable storecode Abard
        setVariable entrance shop
        GOTO SETSTORE

    LEAVE.ABARD:
        counter set 110
      AESRY.110:
        put nw
        GOTO TRAVEL
      AESRY.111:
        put w
        GOTO TRAVEL
      AESRY.112:
        put n
        GOTO TRAVEL
      AESRY.113:
        put climb stair
        GOTO TRAVEL
      AESRY.114:
        put n
        GOTO TRAVEL
      AESRY.115:
        put n
        GOTO TRAVEL
      AESRY.116:
        put n
        GOTO TRAVEL
      AESRY.117:
        put climb step
        GOTO TRAVEL
      AESRY.118:
        put n
        GOTO TRAVEL
      AESRY.119:
        put n
        GOTO TRAVEL
      AESRY.120:
        put n
        GOTO TRAVEL
      AESRY.121:
        put n
        GOTO TRAVEL
      AESRY.122:
        put n
        GOTO TRAVEL
      AESRY.123:
        put climb step
        GOTO TRAVEL
      AESRY.124:
        put n
        GOTO TRAVEL
      AESRY.125:
        GOTO %LorM%.ABARD.1

    LEAVE.ABARD.1:
        counter set 126
      AESRY.126:
        put n
        GOTO TRAVEL
      AESRY.127:
        put n
        GOTO TRAVEL
      AESRY.128:
        put climb stair
        GOTO TRAVEL
      AESRY.129:
        put n
        GOTO TRAVEL
      AESRY.130:
        put go gate
        GOTO TRAVEL
      AESRY.131:
        put go door
        GOTO TRAVEL
      AESRY.132:
        put w
        GOTO TRAVEL
      AESRY.133:
        setvariable storecode Atann
        setvariable entrance w
        GOTO SETSTORE

    MOVEON.AGEN.1:
        counter set 209
      AESRY.209:
        put e
        GOTO TRAVEL
      AESRY.210:
        put se
        GOTO TRAVEL
      AESRY.211:
        put s
        GOTO TRAVEL
      AESRY.212:
        put se
        GOTO TRAVEL
      AESRY.213:
        put se
        GOTO TRAVEL
      AESRY.214:
        put e
        GOTO TRAVEL
      AESRY.215:
        put se
        GOTO TRAVEL
      AESRY.216:
        put e
        GOTO TRAVEL
      AESRY.217:
        put ne
        GOTO TRAVEL
      AESRY.218:
        put e
        GOTO TRAVEL
      AESRY.219:
        put ne
        GOTO TRAVEL
      AESRY.220:
        GOTO MOVEON.APUZZ.1

    MOVEON.APUZZ.1:
        counter set 205
      AESRY.205:
        put ne
        GOTO TRAVEL
      AESRY.206:
        put n
        GOTO TRAVEL
      AESRY.207:
        put ne
        GOTO TRAVEL
      AESRY.208:
        GOTO MOVEON.ASLING.1

    MOVEON.ASLING.1:
        counter set 134
      AESRY.134:
        put go shop
        GOTO TRAVEL
      AESRY.135:
        GOTO PAWN.%DropOrStow%


##################################################################
#####                                                        #####
#####                  AESRY PAWN AND BIN                    #####
#####                                                        #####
##################################################################


    AESRY.PAWNFINISH.NONTHIEF:
    AESRY.PAWNFINISH.EMPATH:
    AESRY.PAWNFINISH.THIEF:
        counter set 224
      AESRY.224:
        put go door
        GOTO TRAVEL
      AESRY.225:
        put e
        GOTO TRAVEL
      AESRY.226:
        put n
        GOTO TRAVEL
      AESRY.227:
        put climb step
        GOTO TRAVEL
      AESRY.228:
        put n
        GOTO TRAVEL
      AESRY.229:
        put n
        GOTO TRAVEL
      AESRY.230:
        put w
        GOTO TRAVEL
      AESRY.231:
        put sw
        GOTO TRAVEL
      AESRY.232:
        put s
        GOTO TRAVEL
      AESRY.233:
        put sw
        GOTO TRAVEL
      AESRY.234:
        put sw
        GOTO TRAVEL
      AESRY.235:
        put go foot
        GOTO TRAVEL
      AESRY.236:
        put sw
        GOTO TRAVEL
      AESRY.237:
        put w
        GOTO TRAVEL
      AESRY.238:
        put nw
        GOTO TRAVEL
      AESRY.239:
        put w
        GOTO TRAVEL
      AESRY.240:
        put nw
        GOTO TRAVEL
      AESRY.241:
        put nw
        GOTO TRAVEL
      AESRY.242:
        put n
        GOTO TRAVEL
      AESRY.243:
        put nw
        GOTO TRAVEL
      AESRY.244:
        put go gate
        GOTO TRAVEL
      AESRY.245:
        put go door
        GOTO TRAVEL
      AESRY.246:
        put n
        GOTO TRAVEL
      AESRY.247:
        put w
        GOTO TRAVEL
      AESRY.248:
        setVariable BinOrBucket basket
        GOTO PAWN.BIN

    AESRY.BINFINISH.NONTHIEF:
    AESRY.BINFINISH.EMPATH:
    AESRY.BINFINISH.THIEF:
        GOTO END


##################################################################
#####                                                        #####
#####               AESRY JUSTICE AND RESUMING               #####
#####                                                        #####
##################################################################


    AESRY.ITEMCHECK:
        put drop my small sack
        wait
        match AESRY.DEBT2 You have nothing
        match AESRY.FREE2 INVENTORY HELP
        put inv
        GOTO UniversalMatch

    AESRY.DEBT:
        counter set 150
      AESRY.150:
        put n
        GOTO TRAVEL
      AESRY.151:
        put n
        GOTO TRAVEL
    AESRY.DEBT2:
        counter set 152
      AESRY.152:
        put go door
        GOTO TRAVEL
      AESRY.153:
        put go gate
        GOTO TRAVEL
      AESRY.154:
        put s
        GOTO TRAVEL
      AESRY.155:
        put sw
        GOTO TRAVEL
      AESRY.156:
        put s
        GOTO TRAVEL
      AESRY.157:
        put go gate
        GOTO TRAVEL
      AESRY.158:
        put go door
        GOTO TRAVEL
      AESRY.159:
        put n
        GOTO TRAVEL
      AESRY.160:
        put wit 500 bronze lirums
        wait
        counter set 161
      AESRY.161:
        put s
        GOTO TRAVEL
      AESRY.162:
        put go door
        GOTO TRAVEL
      AESRY.163:
        put go gate
        GOTO TRAVEL
      AESRY.164:
        put n
        GOTO TRAVEL
      AESRY.165:
        put ne
        GOTO TRAVEL
      AESRY.166:
        put n
        GOTO TRAVEL
      AESRY.167:
        put ne
        GOTO TRAVEL
      AESRY.168:
        put ne
        GOTO TRAVEL
      AESRY.169:
        put e
        GOTO TRAVEL
      AESRY.170:
        put go gate
        GOTO TRAVEL
      AESRY.171:
        put pay 5000
        wait
        counter set 172
      AESRY.172:
        put o
        GOTO TRAVEL
      AESRY.173:
        put w
        GOTO TRAVEL
      AESRY.174:
        put sw
        GOTO TRAVEL
      AESRY.175:
        put sw
        GOTO TRAVEL
      AESRY.176:
        put s
        GOTO TRAVEL
      AESRY.177:
        put sw
        GOTO TRAVEL
      AESRY.178:
        put s
        GOTO TRAVEL
      AESRY.179:
        put go gate
        GOTO TRAVEL
      AESRY.180:
        put go door
        GOTO TRAVEL
      AESRY.181:
        put n
        GOTO TRAVEL
      AESRY.182:
        put dep all
        wait
        counter set 183
      AESRY.183:
        put s
        GOTO TRAVEL
      AESRY.184:
        put go door
        GOTO TRAVEL
      AESRY.185:
        put go gate
        GOTO TRAVEL
      AESRY.186:
        put n
        GOTO TRAVEL
      AESRY.187:
        put ne
        GOTO TRAVEL
      AESRY.188:
        put n
        GOTO TRAVEL
      AESRY.189:
        put go gate
        GOTO TRAVEL
      AESRY.190:
        put go door
        GOTO TRAVEL
      AESRY.191:
        GOTO GETSACK

    AESRY.FREE:
        counter set 221
      AESRY.221:
        put n
        GOTO TRAVEL
      AESRY.222:
        put n
        GOTO TRAVEL
      AESRY.223:
        GOTO GETSACK

    AESRY.FREE2:
        pause 1
        match AESRY.MISSINGSTART waitandsee
        match AESRY.FREE3 okstart
        put echo %startlocation%
        put echo okstart
        GOTO UniversalMatch

    AESRY.MISSINGSTART:
        setVariable startlocation Agen
        setVariable ResumeStore Agen
        GOTO AESRY.FREE3

    AESRY.FREE3:
        counter set 194
      AESRY.194:
        put go door
        GOTO TRAVEL
      AESRY.195:
        put go gate
        GOTO TRAVEL
      AESRY.196:
        put s
        GOTO TRAVEL
      AESRY.197:
        put sw
        GOTO TRAVEL
      AESRY.198:
        put s
        GOTO TRAVEL
      AESRY.199:
        put w
        GOTO TRAVEL
      AESRY.200:
        put s
        GOTO TRAVEL
      AESRY.201:
        put s
        GOTO TRAVEL
      AESRY.202:
        put climb step
        GOTO TRAVEL
      AESRY.203:
        put s
        GOTO TRAVEL
      AESRY.204:
        counter set 1
        setVariable storecode Agen
        GOTO RESUME.%ResumeStore%

    RESUME.AFORGE:
        counter add 1
    RESUME.AWEAP:
        counter add 1
    RESUME.ASHIELD:
        counter add 1
    RESUME.AFOOT:
        counter add 1
    RESUME.APUZZ:
        counter add 1
    RESUME.ASLING:
        counter add 1
    RESUME.AMAGIC:
        counter add 1
    RESUME.AGEM:
        counter add 1
    RESUME.AGAMI:
        counter add 1
    RESUME.ACLERIC:
        counter add 1
    RESUME.ASCRIPT:
        counter add 1
    RESUME.ACLOTH:
        counter add 1
    RESUME.AALCH:
        counter add 1
    RESUME.ATANN:
        counter add 1
    RESUME.ABARD:
        counter add 1
    RESUME.AFLOW:
        counter add 1
    RESUME.AGEN:
        counter add 1
        setVariable Countdown %c%
        GOTO RESUME


######################################################################################
#####################                                     ############################
#####################            SCRIPT END               ############################
#####################                                     ############################
######################################################################################


    LabelError:
        GOTO %labelerr%
    HELP:
        SHIFT
        ECHO ***********************************************
        ECHO *** Thank you for choosing PROGRESSIVE STEALING!
        ECHO *** This is a collaborative project by Kalic and Challeirra.
        ECHO *** Special thanks go to Arthadin for help with Ratha.
        ECHO ***     ----------------------------------------
        ECHO ***
        ECHO *** USAGE: .(scriptname) <command1> <command2> <command3> ...
        ECHO ***
        ECHO *** COMMAND LINE ONLY: 
        ECHO ***
        ECHO ***    PROFIT: User will try to select items that will pawn for cash.
        ECHO ***    PAUSE:  Script will wait for user confirmation before stealing
        ECHO ***            at each shop.
        ECHO ***    PAWN:   Used to directly run the pawn function.
        ECHO ***    BIN:    Used to deposit items at any bin or trash receptacle.
        ECHO ***    EASY:   For each "easy", user's rank will be modified to steal
        ECHO ***            items set from one rank bracket lower.
        ECHO ***    HARD:   For each "hard", user's rank will be modified to steal
        ECHO ***            items set from one rank bracket higher.
        ECHO ***    LESS:   For each "less", user will steal one less item per shop
        ECHO ***            (minimum of 1).
        ECHO ***    MORE:   For each "more", user will steal one more item per shop
        ECHO ***            (maximum of 6).
        ECHO ***
        ECHO *** TOGGLE OVERRIDES: (variables set by editing the top of script but
        ECHO ***       can be overridden through entering them in the command line)
        ECHO ***
        ECHO ***    STEAL: The default for non-magic users; steals with no extra
        ECHO ***           actions in shops.
        ECHO ***    MARK:  Allows thieves to also MARK their target items (and skip 
        ECHO ***           any that are too hard) before they attempt to steal them.
        ECHO ***    PERC:  Assumes the user is an Empath and will perceive health
        ECHO ***           in each shop before attempting to steal.
        ECHO ***    POWER: This toggle can be used by Empaths or any other magic
        ECHO ***           user, and will POWER before stealing. Moon mages will
        ECHO ***           cycle through a specialized perceive list.
        ECHO ***    STOW:  This toggle will stow stolen items to be pawned 
        ECHO ***           or (for thieves) binned later if they're rejected.
        ECHO ***    DROP:  This toggle will drop all items instead of stowing.
        ECHO ***    PUT:   User will simply PUT stowed items into their containers.
        ECHO ***    SLIP:  User will attempt to SLIP items into their containers.
        ECHO ***    SKULK: For thieves, option to use khri skulk before the other
        ECHO ***           default khri.
        ECHO ***    SNEAK: This will turn on sneaking into and out of shops.
        ECHO ***  NOSNEAK: This will turn off sneaking into and out of shops.
        ECHO ***
        ECHO *** Send all bugs, questions, comments, and donation offers to
        ECHO *** KalicMasiacl@yahoo.com and Challeirra@gmail.com
        ECHO ***********************************************
        ECHO
        ECHO *** Type "Next" to continue.
        waitfor next
        GOTO featurelist

    FEATURELIST:
        ECHO ***********************************************
        ECHO ************** CURRENT FEATURES ***************
        ECHO ***
        ECHO *** INTELLIGENT DESIGN
        ECHO *** - Progressive items set based on your skill level
        ECHO *** - Usable by any class, with special thief-only features
        ECHO ***      including applicable Khris, slip sneak, and tunnels
        ECHO *** - Loops so you can start anywhere in a province but only
        ECHO ***      visits each shop once per run
        ECHO *** - Intelligent Pawning/binning system for stolen goods
        ECHO *** - Exp check at each shop to pawn/bin early if mind locked
        ECHO *** - Skips any shops where you have nothing set to steal
        ECHO ***
        ECHO *** CUSTOMIZABLE
        ECHO *** - Preset but easily adjustable items to be stolen
        ECHO *** - Toggles to adjust difficulty and quantity of items stolen
        ECHO *** - Toggle to include MARK, PERC HEALTH, or POWER at each shop
        ECHO *** - Toggle whether to drop or stow and pawn/bin items
        ECHO *** - Toggle to choose whether to include clans in stealing route
        ECHO *** - Toggle whether unexpected stun or death will log you out
        ECHO *** - Additional toggles can be added on request
        ECHO ***
        ECHO *** REACTIVE
        ECHO *** - Knows whether you act or move as expected, and retries if
        ECHO ***      you get stuck due to roundtime or type ahead lines
        ECHO *** - Reacts to arrest, death, and being stunned at any time
        ECHO *** - If arrested, pleads, pays debt and gets items, and picks
        ECHO ***      up where it left off as if nothing happened
        ECHO *** - If caught by clan justice (when they chase you down and cut
        ECHO ***      off your hand), automatically heals up (if empath)
        ECHO ***      or goes to the auto-empath for healing, then resumes
        ECHO *** - Retreats if engaged anywhere and runs to the next shop
        ECHO *** - Automatically steals from mobile NPCS you encounter
        ECHO *** - Skips any shops that are closed for the night
        ECHO ***
        ECHO *** START LOCATIONS
        ECHO *** - Crossing inside any shop, inside gates, or outside bank
        ECHO *** - Arthe Dale inside any shop or inside gate
        ECHO *** - Tiger Clan inside any shop or inside gate
        ECHO *** - Leth Deriel inside any shop, NW and SW gates, or town center
        ECHO *** - Haven inside any shop, bank, inside gates, or by naphtha cart
        ECHO *** - Shard inside any shop, bank, or inside gates
        ECHO *** - Horse Clan inside any tent (except potter) or inside path
        ECHO *** - SCC inside weapon or leather shop or inside gate
        ECHO *** - Ratha inside any shop, lower bank, or outside sewers
        ECHO *** - Aesry inside any shop, outside bank, or inside gate
        ECHO *** - Lists available start locations if you start elsewhere
        ECHO ***
        ECHO ***********************************************
        ECHO
        ECHO ***  Type "Next" to continue.
        waitfor next
        GOTO helpitemwarning

    HELPITEMWARNING:
        ECHO ***********************************************
        ECHO *** PRESERVING YOUR ITEMS
        ECHO ***
        ECHO *** This script does a LOT of item handling!
        ECHO ***
        ECHO *** It will do its best to make sure you get all your
        ECHO *** items back if you get arrested. You must set your name
        ECHO *** as a variable in case you have to pay your debt and
        ECHO *** collect a sack at the guard house. If you have any
        ECHO *** items that won't be automatically re-worn after being
        ECHO *** in jail, you must also set them in the variable section
        ECHO *** at the top of the script. Otherwise, the script will
        ECHO *** refuse to continue after you get back your sack if it
        ECHO *** can't be successfully emptied!
        ECHO ***
        ECHO *** In addition, if you choose the option to stow and 
        ECHO *** pawn/bin your pilfered goods, you must set the containers
        ECHO *** in which you will be storing them. The script will
        ECHO *** check these in advance to ensure they do not contain
        ECHO *** any items of the same type that you will later be
        ECHO *** pawning. If they do, you will have to confirm with
        ECHO *** the script that this is OK before it will proceed.
        ECHO ***
        ECHO ***********************************************
        ECHO
        ECHO ***********************************************
        ECHO *** To see these help messages in the future, type
        ECHO *** .(scriptname) HELP
        ECHO ***********************************************
        ECHO
        ECHO *** Type "Next" to continue.
        waitfor next
        setVariable stealinghelp notfirstrun
        GOTO notfirstrun

    REALERROR:
        ECHO
        ECHO
        ECHO
        ECHO ***********************************************
        ECHO ***   Unfortunately there has been an unrecoverable label error. Please
        ECHO ***    submit a bug report including a brief log of the circumstances
        ECHO ***       that produced this error. Version %update%, %citycode%.%c%.
        ECHO ***********************************************
        GOTO END

    END:
        ECHO
        ECHO
        ECHO
        ECHO ***********************************************
        ECHO ***      Thank you for using Kalic and Challeirra's
        ECHO ***             Progressive Stealing script.
        ECHO ***********************************************
        ECHO
        ECHO
        ECHO
        GOTO ARREST.%arrest%

    ARREST.TRUE:
        ECHO ***********************************************
        ECHO ***      Don't forget to restart your gweths and/or
        ECHO ***         albredine rings due to your arrest.
        ECHO ***********************************************
        ECHO
        ECHO
        ECHO
    ARREST.FALSE:
        GOTO END.%class

    END.THIEF:
        put khri stop
        wait
    END.NONTHIEF:
    END.EMPATH:
        put hide
        exit

    LASTNUMBER:
        ECHO CROSS.336
        ECHO ARTHE.75
        ECHO TIGER.54
        ECHO LETH.466
        ECHO HAVEN.452
        ECHO AESRY.248
        ECHO RATHA.858 (358-534 empty)
        ECHO SHARD.806 (346-379 empty)
        exit