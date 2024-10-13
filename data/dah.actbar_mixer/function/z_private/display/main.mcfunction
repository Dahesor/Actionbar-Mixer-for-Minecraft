scoreboard players set #test dah.actbar.calc 0
function dah.actbar_mixer:z_private/display/get_player with storage dah:actbar data[0]
execute if score #test dah.actbar.calc matches 0 run data modify storage dah:actbar sleep append from storage dah:actbar data[0]
execute unless score #test dah.actbar.calc matches 0 run data modify storage dah:actbar temp append from storage dah:actbar data[0]
data remove storage dah:actbar data[0]
scoreboard players remove #count dah.actbar.calc 1
execute if score #count dah.actbar.calc matches 1.. if data storage dah:actbar data[0] run function dah.actbar_mixer:z_private/display/main