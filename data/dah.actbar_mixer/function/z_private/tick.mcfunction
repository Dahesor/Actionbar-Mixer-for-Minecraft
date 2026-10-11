#>dah.actbar_mixer:z_private/tick
# @protected within minecraft

execute unless score #off dah.actbar.calc matches 1 run function dah.actbar_mixer:z_private/display/prepare

#>@public score #off
# if set to `1`, the actionbar mixer system will be turned off