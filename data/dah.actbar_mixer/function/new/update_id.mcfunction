execute unless score @s dah.actbar.UID matches 1.. run return fail
function dah.actbar_mixer:z_private/uid/get

function dah.actbar_mixer:z_private/insert/remove_id with storage dah:actbar new

scoreboard players set #order dah.actbar.calc 0
execute if data storage dah:actbar new.list store result score #order dah.actbar.calc run data get storage dah:actbar new.list
execute if data storage dah:actbar new.order store result score #order dah.actbar.calc run data get storage dah:actbar new.order

execute unless data storage dah:actbar data[0].content[1] run return run function dah.actbar_mixer:z_private/insert/here

data modify storage dah:actbar temp set value []
function dah.actbar_mixer:z_private/insert/loop
data modify storage dah:actbar data[0].content append from storage dah:actbar temp[]
data modify storage dah:actbar temp set value []

return 1