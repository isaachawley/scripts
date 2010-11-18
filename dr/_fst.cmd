start:
put prep fst 8
put targ

match cast The formation of the target pattern around
matchwait

cast:
put cast
waitfor roundtime
pause 3

match start You feel fully attuned to the mana streams again.
matchwait

goto start

