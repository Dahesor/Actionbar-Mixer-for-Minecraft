#>@public dah.actbar_mixer:get_data
# Get the actionbar mixer data for the current player.
# See documentation for more details
# @context As the player whose data is being retrieved
# @writes storage dah:actbar data[0]
#   Reordered so that dah:actbar data[0] contains the data for this player
# @returns
#   @success Fail if the current entity does not have a valid UID

execute unless score @s dah.actbar.UID matches 1.. run return fail
function dah.actbar_mixer:z_private/uid/get
return 1