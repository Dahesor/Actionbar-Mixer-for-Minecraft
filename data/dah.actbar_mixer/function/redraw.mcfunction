# Immediately redraw the executor's action bar

function dah.actbar_mixer:z_private/uid/get
title @s actionbar [{"nbt": "data[0].content[].text","storage": "dah:actbar","interpret": true,"separator": {"nbt": "data[0].separator","storage": "dah:actbar","interpret": true}}]
return 1

data modify storage dah:actbar new set value {id:"test",text:{text:"Hello World!"},order:100}
function dah.actbar_mixer:new/insert