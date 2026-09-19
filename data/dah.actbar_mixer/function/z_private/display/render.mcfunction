execute unless data storage dah:actbar data[0].content[0] run return run title @s actionbar ""
data modify storage dah:actbar parsing set value []
data modify storage dah:actbar parsing append from storage dah:actbar data[0].content[].text

data modify storage dah:actbar parsing prepend value {extra:[""],text:""}
data modify storage dah:actbar parsing[0].extra[0] set from storage dah:actbar parsing[1]
data remove storage dah:actbar parsing[1]

data modify storage dah:actbar display set value {"nbt": "parsing[]","storage": "dah:actbar","interpret": true,"separator": ""}
data modify storage dah:actbar display.separator set from storage dah:actbar data[0].separator

title @s actionbar {storage:"dah:actbar",nbt:"display",interpret:true}