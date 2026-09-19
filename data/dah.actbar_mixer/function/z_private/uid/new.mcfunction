scoreboard players add #NEW dah.actbar.UID 1
scoreboard players operation @s dah.actbar.UID = #NEW dah.actbar.UID

# Use convert here to avoid issues with 2 account (offline and online) sharing the same name.
function gu:convert with entity @s

# Cleanup Old Data if there is any
function dah.actbar_mixer:z_private/uid/__cleanup with storage gu:main

data modify storage dah:actbar data append value {UID:-1,content:[],UUID:"0-0-0-0-0",separator:""}
data modify storage dah:actbar data[-1].separator set from storage dah:actbar default_separator
execute store result storage dah:actbar data[-1].UID int 1 run scoreboard players get @s dah.actbar.UID
data modify storage dah:actbar data[-1].UUID set from storage gu:main out