scoreboard objectives add dah.actbar.calc dummy
scoreboard objectives add dah.actbar.UID dummy
function dah.actbar_mixer:z_private/init
execute if data storage dah:actbar data[0].content[0] run function dah.actbar_mixer:z_private/uid/fix_root