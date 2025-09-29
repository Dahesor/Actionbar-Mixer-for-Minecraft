execute unless score @s dah.actbar.UID matches 1.. run return fail
function dah.actbar_mixer:z_private/uid/get

scoreboard players set #order dah.actbar.calc 0
execute if data storage dah:actbar data[0].content[1] store result score #order dah.actbar.calc run data get storage dah:actbar data[0].content[-1].order
scoreboard players add #order dah.actbar.calc 1
data modify storage dah:actbar new.order set value 0
execute store result storage dah:actbar new.order int 1 run scoreboard players get #order dah.actbar.calc

data modify storage dah:actbar data[0].content append from storage dah:actbar new
return 1