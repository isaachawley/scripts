#getfavor:  perform the favor routine
if_1 goto start

main:
# matchclear
match main You feel a sense of peace settle over you
match main The more you relax
match main You breathe deeply
match main The ship lurches beneath you
match main A caravan has been ambushed by bandits
match say declare that name now
put pray
matchwait

say:
put 'Chadatru
waitfor rise
put stand
waitfor orb
put get chadatru orb
put go arch

start:
# matchclear
match vase You also see a vase on top of the altar
match sponge You also see a granite altar with several candles on it, a granite font and a small sponge
match tinder You also see some tinders, several candles, a granite font and a granite altar
match jug You also see a granite altar with several candles and a water jug on it, and a granite font
match end Obvious paths: east, west
match window The air is stifling due to the lack of circulation
put look
matchwait

window:
put open window
waitfor you notice a thin crack running along the painted edge
pause
pause
put open window
waitfor you feel the thick paint binding slip
pause
pause
put open window
waitfor a cool
pause pause
put go window
goto start

jug:
put get jug
waitfor you reverently
put fill font
waitfor you carefully
goto stair

tinder:
put get tinder
waitfor you reach
put light candle
waitfor you carefully
goto stair


sponge:
put get sponge
waitfor you pick
put clean altar
waitfor you use up
goto stair


vase:
put get flowers
waitfor the vase
put go path
goto start

stair:
put climb stair
pause
put go door
pause
goto start


end:
