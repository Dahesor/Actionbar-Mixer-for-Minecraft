function dah.actbar_mixer:z_private/uid/get
data remove storage dah:actbar data[0]
scoreboard players reset @s dah.actbar.UID
advancement revoke @s only dah.actbar_mixer:new_player