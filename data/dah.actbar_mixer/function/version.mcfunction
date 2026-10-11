#>@public @user dah.actbar_mixer:version
# When executes in chat, output the version of the datapack
# This function will return the numic version of the datapack
# @writes storage dah:actbar sys.pong__
#   Set to true for easy detection of the datapack being loaded
# @returns the numeric version of actionbar mixer

#>@public storage dah:actbar The storage for actionbar mixer data

function dah.actbar_mixer:z_private/init
data modify storage dah:actbar sys.pong__ set value true

tellraw @s [{text:"DAM - Dahesor's Actionbar Mixer\n",color:"yellow"},\
    {"text": "  - Version: ","color":"green"},\
    {"nbt": "sys.VersionName","storage": "dah:actbar"},\
    "\n",\
    {"text": "  - Numic Version: ","color":"aqua"},\
    {"nbt": "sys.version","storage": "dah:actbar"},\
    "\n",\
    {"text": "  - For Minecraft: ","color":"gold"},\
    {"nbt": "sys.MCVersionRange","storage": "dah:actbar"},\
]

return run data get storage dah:actbar sys.version