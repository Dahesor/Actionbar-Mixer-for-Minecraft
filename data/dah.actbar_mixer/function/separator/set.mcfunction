#>@public dah.actbar_mixer:separator/set
# Set the actionbar separator for the executor
# @context As the player whose actionbar separator is being set
# @macro struct{
#   /// The new actionbar separator
#   separator: ::java::util::text::Text,
# }

execute unless score @s dah.actbar.UID matches 1.. run return -1
function dah.actbar_mixer:z_private/uid/get

$data modify storage dah:actbar data[0].separator set value $(separator)