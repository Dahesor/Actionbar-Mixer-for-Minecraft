scoreboard players set #test dah.actbar.calc 1

execute if entity @s[tag=dah.actbar.pause] run return fail

title @s actionbar [{"nbt": "data[0].content[].text","storage": "dah:actbar","interpret": true,"separator": {"nbt": "data[0].separator","storage": "dah:actbar","interpret": true}}]