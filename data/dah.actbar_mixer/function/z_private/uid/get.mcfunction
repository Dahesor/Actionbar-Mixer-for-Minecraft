#>@internal dah.actbar_mixer:z_private/uid/get

#>@local score __LAST_GET__ dah.actbar.UID

execute if score __LAST_GET__ dah.actbar.UID = @s dah.actbar.UID run return 1

data modify storage dah:actbar temp set value {UID:-1}
execute store result storage dah:actbar temp.UID int 1 run scoreboard players operation __LAST_GET__ dah.actbar.UID = @s dah.actbar.UID
function dah.actbar_mixer:z_private/uid/re_order with storage dah:actbar temp