execute store result score #this dah.actbar.calc run data get storage dah:actbar data[0].content[-1].order
execute if score #order dah.actbar.calc >= #this dah.actbar.calc run return run function dah.actbar_mixer:z_private/insert/here
say wakakak
data modify storage dah:actbar temp prepend from storage dah:actbar data[0].content[-1]
data remove storage dah:actbar data[0].content[-1]
tellraw @a {storage:"dah:actbar",nbt:"data[0].content"}
execute unless data storage dah:actbar data[0].content[1] run return run function dah.actbar_mixer:z_private/insert/here
say wakakak====
function dah.actbar_mixer:z_private/insert/loop