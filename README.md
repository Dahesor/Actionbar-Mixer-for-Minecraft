# Actionbar Mixer v1.0

This library allows you combine and display different segments of text components on player actionbar.

It only directly supports `1.21+`. However, by slightly modifying it (like adding a `s` behind `function`), it should also works at least for `1.20.4`.

## Appending A Text Component

Every text segment must contains an id, and a JSON Text Component:

* (A text segment) (compound tag)
*  |--- `id` (string. Any id at your choose. Avoid using quotation marks.)
*  |--- `json` (string. A text component stored in NBT string)

To append a text component to a player's actionbar, first store the NBT structure above to storage `dah:actbar` under key `new`, then run `function dah.actbar_mixer:append/from` as the target player. That player should see `Hello` on actionbar:
```
data modify storage dah:actbar new set value {id:"test:1",json:'{"text":"Hello"}'}
function dah.actbar_mixer:append/from
```

Running the above again, with `{id:"test:2",json:'{"text":"World!"}'}`, then the player should see `Hello World!` on actionbar.

A macro version of the append function, `function dah.actbar_mixer:append/macro` is also provided. Just place all the arguments inside `new`.  Example: `function dah.actbar_mixer:append/macro {new:{id:"test:3",json:'{"text":"Hello World!"}'}}` (Using it will cost more performance and you will not get any autocompleting from mcdoc).

To append the same text component for all players (is online or was online), simply append the arguments to storage `dah:actbar` under path `data[].content`:
```
data modify storage dah:actbar data[].content append value {id:"test:4",json:'"Hey There!"'}
```

## Removing A Text Component

To remove a segment of a target, execute the following remove function as that target:
```
function dah.actbar_mixer:remove/this {id:"<id>"}
```
Where `<id>` should be the id of that segment you specified when appending. All segments with this id will be removed.

To remove a segment for all players (is online or was online), run `function dah.actbar_mixer:remove/for_all {id:"<id>"}` instead.

To clear all segments for a player, execute `function dah.actbar_mixer:empty/self` as that target.

Executing `function dah.actbar_mixer:empty/everything` clears all segments for all players (offline players included).


## Separator

Separator is what's placed between every text segments. It defaults to "` `" (one white space).

To change the separator of a player, first store the JSON object as a string to storage `dah:actbar` under key `separator`, the execute `function dah.actbar_mixer:separator/from` as the player:
```
data modify storage dah:actbar separator set value '"-"'
function dah.actbar_mixer:separator/from
```
This sets the separator of this player to `-`.

A macro version of this function is also provided as `function dah.actbar_mixer:separator/set`:
```
function dah.actbar_mixer:separator/set {separator:'"-"'}
```
Again, this costs more performance and you will not get any autocompleting from mcdoc.

To set the separator for all players (is online or was online), directly change `data[].separator` of storage `dah:actbar`:
```
data modify storage dah:actbar data[].separator set value '"="'
```

Finally, running `function dah.actbar_mixer:separator/reset_all` resets all players' separator (offline included) back to one white space.

## Turning Off

Setting the score of `#off` on scoreboard `dah.actbar.calc` to `1` turns the system off, which makes it not be affecting the actionbar.

To pause the display on a specific player, tag the player with `dah.actbar.pause`.

## Manually Managing Data

All text segments is stored in storage `dah:actbar` under key `data`.

It is a list, and each of its element represents a player. You may execute `function dah.actbar_mixer:z_private/uid/get` as a player, which will reorder the list so that this player is the first entry of the list.

You may then directly changing `data[0].separator` which is this player's separator, or `data[0].content` which is list containing all segment objects.

## Mcdoc File

A mcdoc folder is provided with the data pack. Moving the mcdoc to the root of your own workspace, [Spyglass](https://github.com/SpyglassMC/Spyglass) (Datapack Helper Plus) with version 4.0+ will provided you with auto completion of the custom NBT storage used in the pack. 

## Misc

There is a built in [gu](https://github.com/gibbsly/gu) library in this pack to take care of player UUIDs.