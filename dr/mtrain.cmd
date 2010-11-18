power:
put perc
pause 2
put perc yavash
pause 2
put perc xibar
pause 2
put perc katamba
pause 2
put perc stel
pause 2
put perc psychic
pause 2
put perc perception
pause 2
put perc transduction
pause 2
put perc moon
pause 2
put perc moonl
pause 2
put perc planets
pause 2
put perc watchers
pause 2
put exp magic
goto magic
magic:
pause 2
put prep shad %1
waitfor You feel fully prepared to cast your spell.
put cast
match magic You notice the shadows
match magic There is a subtle change
match rune You are unable to harness
match end backfire
matchwait
end:
*** You prepped it too high ***
goto rune
rune:
put exp magic
put get rune
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put focus rune
pause 2
put stow rune
put exp magic
match pause fluid
match pause murky
match pause thick
match pause dense
match pause stagnant
match pause frozen
match power EXP HELP for more information
matchwait
pause:
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 90
put exp
pause 5
goto power