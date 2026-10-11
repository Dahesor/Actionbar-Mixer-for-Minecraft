#>@internal dah.actbar_mixer:z_private/uid/re_order

$data modify storage dah:actbar temp set from storage dah:actbar data[{UID:$(UID)}]
$data remove storage dah:actbar data[{UID:$(UID)}]
data modify storage dah:actbar data prepend from storage dah:actbar temp