#jugg

start:
put juggle my eggs 
waitfor roundtime
pause 1
put juggle my eggs
waitfor roundtime
pause 1

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
match go perusing
match waiting time development
matchwait

go:
#put quit
put take my eggs
goto start


