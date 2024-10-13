execute unless score @s dah.actbar.UID matches 1.. run return -1
function dah.actbar_mixer:z_private/uid/get

data modify storage dah:actbar data[0].separator set from storage dah:actbar separator

