# Immediately redraw the executor's action bar
execute if score #off dah.actbar.calc matches 1.. run return fail
execute if entity @s[tag=dah.actbar.pause] run return fail
function dah.actbar_mixer:z_private/uid/get
function dah.actbar_mixer:z_private/display/render
return 1