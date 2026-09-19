execute store result score #this dah.actbar.calc run data get storage dah:actbar sys.version
execute if data storage dah:actbar sys.version if score #this dah.actbar.calc matches ..3 if data storage dah:actbar data[0].content[0] run data remove storage dah:actbar data[].content[{id:"dah_actbar:ROOT_RESET"}]


data modify storage dah:actbar sys merge value {version:4,MCVersionRange:"1.21~26.3",VersionName:"v1.4.0"}
execute unless data storage dah:actbar default_separator run data modify storage dah:actbar default_separator set value ""