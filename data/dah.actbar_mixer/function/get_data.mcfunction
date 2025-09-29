# Reorder data of storage of
#    dah:actbar data
# so that dah:actbar data[0] contains the data for the executor

execute unless score @s dah.actbar.UID matches 1.. run return fail
function dah.actbar_mixer:z_private/uid/get
return 1