#>@public dah.actbar_mixer:remove/for_all
# Remove the target actionbar entry for all players (is online or was online)
# @context @any
# @macro struct{
#   /// The ID of the actionbar entry to remove
#   id: string,
# }

$data remove storage dah:actbar data[].content[{id:'$(id)'}]