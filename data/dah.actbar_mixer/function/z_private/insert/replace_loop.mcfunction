execute store result score #this dah.actbar.calc run data get storage dah:actbar data[0].content[-1].order
execute if score #order dah.actbar.calc > #this dah.actbar.calc run return run function dah.actbar_mixer:z_private/insert/here

execute unless score #order dah.actbar.calc = #this dah.actbar.calc run data modify storage dah:actbar temp prepend from storage dah:actbar data[0].content[-1]
data remove storage dah:actbar data[0].content[-1]
execute unless data storage dah:actbar data[0].content[1] run return run function dah.actbar_mixer:z_private/insert/here
function dah.actbar_mixer:z_private/insert/replace_loop