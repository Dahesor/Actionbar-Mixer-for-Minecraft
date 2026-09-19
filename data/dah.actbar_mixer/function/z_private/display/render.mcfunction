data modify storage dah:actbar render_content set from storage dah:actbar data[0].content
data remove storage dah:actbar render_content[1]

title @s actionbar ["",{"nbt":"data[0].content[1].text","storage":"dah:actbar","interpret":true},{"nbt":"render_content[].text","storage":"dah:actbar","interpret":true,"separator":{"nbt":"data[0].separator","storage":"dah:actbar","interpret":true}}]
