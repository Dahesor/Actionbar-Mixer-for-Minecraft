scoreboard players add #NEW dah.actbar.UID 1
scoreboard players operation @s dah.actbar.UID = #NEW dah.actbar.UID
function gu:generate
data modify storage dah:actbar data append value {UID:-1,content:[{id:"dah_actbar:ROOT_RESET",text:{text:""}}],UUID:"0-0-0-0-0",separator:" "}
data modify storage dah:actbar data[-1].separator set string storage dah:actbar default_separator
execute store result storage dah:actbar data[-1].UID int 1 run scoreboard players get @s dah.actbar.UID
data modify storage dah:actbar data[-1].UUID set from storage gu:main out