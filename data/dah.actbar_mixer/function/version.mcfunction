# When executes in chat, output the version of the datapack
# This function will return the numic version of the datapack
# It also sets
#    dah:actbar sys.pong__
# to true, so external systems can detect that the datapack is loaded

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