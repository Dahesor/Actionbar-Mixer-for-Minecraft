#>dah.actbar_mixer:z_private/load
# @protected within minecraft

scoreboard objectives add dah.actbar.calc dummy
scoreboard objectives add dah.actbar.UID dummy
function dah.actbar_mixer:z_private/init

#>@public tag dah.actbar.pause
# Player with the tag will have their actionbar paused

#>@internal objective dah.actbar.calc

#>@protected objective dah.actbar.UID
# Each player will have a unique identifier stored in the dah.actbar.UID objective

#>@internal score #count
#>@internal score #NEW
#>@internal score #order
#>@internal score #temp
#>@internal score #test
#>@internal score #this