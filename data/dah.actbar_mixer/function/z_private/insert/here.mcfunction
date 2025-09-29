data modify storage dah:actbar data[0].content append from storage dah:actbar new
data modify storage dah:actbar data[0].content[-1].order set value 1
execute store result storage dah:actbar data[0].content[-1].order int 1 run scoreboard players get #order dah.actbar.calc
return 1