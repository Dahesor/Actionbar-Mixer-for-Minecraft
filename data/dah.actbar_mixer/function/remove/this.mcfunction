#>@public dah.actbar_mixer:remove/this
# Remove the target actionbar entry for the executor
# @context As the player whose actionbar is to be modified
# @macro struct{
#   /// The ID of the actionbar entry to remove
#   id: string,
# }

execute unless score @s dah.actbar.UID matches 1.. run return -1
function dah.actbar_mixer:z_private/uid/get

$data remove storage dah:actbar data[0].content[{id:'$(id)'}]