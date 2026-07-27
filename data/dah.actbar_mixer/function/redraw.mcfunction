# Immediately redraw the executor's action bar
execute if score #off dah.actbar.calc matches 1.. run return fail
function dah.actbar_mixer:z_private/uid/get
title @s[tag=!dah.actbar.pause] actionbar [{"nbt": "data[0].content[].text","storage": "dah:actbar","interpret": true,"separator": {"nbt": "data[0].separator","storage": "dah:actbar","interpret": true}}]
return 1