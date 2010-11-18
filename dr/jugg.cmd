#jugg

start:
put juggle my crabs 
waitfor roundtime
put juggle my crabs
waitfor roundtime

put exp skill perception

match start time development
match hide mind lock
matchwait

hide:
put stow
put hide

waiting:
pause 60
put exp skill perception
match waiting time development
match go thoughtful
matchwait

go:
#put quit
put take my crabs
goto start


