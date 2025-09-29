# DAM Actionbar Mixer v1.3

[中文](./readme/zh_cn.md)

This library allows you combine and display different segments of text components on player actionbar.

Supports `1.21+`.

By Dahesor

## Adding A Text Component

Every text segments must contains an id, and a Text Component:

* (A text segment) (compound tag)
*  |--- `id` (string. Any id at your choose. Avoid using quotation marks.)
*  |--- `text` (text component (1.21.5+ as snbt, 1.21.4- as json string). The text to display)
*  |--- `order` (*Optional* int. Determines the order of this text on the action bar. A smaller value makes the text more on the left side. Defaults to `0`)
*  |--- `list` (int. **DEPRECATED**. Same as `order`)


To add a text component to a player's actionbar, first store the NBT structure above to storage `dah:actbar` under key `new`, then run `function dah.actbar_mixer:new/(append|prepend|insert|replace_index|update_id)` as the target player:

 - **function dah.actbar_mixer:new/append**: Append this segment to the right of the actionbar. The `order` of the new segment will to set to the current highest order + 1. The `order` from input will not be used.
 - **function dah.actbar_mixer:new/prepend**: Prepend this segment to the left of the actionbar. The `order` of the new segment will to set to the current lowest order - 1. The `order` from input will not be used.
 - **function dah.actbar_mixer:new/insert**: Insert this text segment to a specific location of the actionbar determined by your input `order`. if two texts have the same order, the one that was added first will appear in front.
 - **function dah.actbar_mixer:new/replace_index**: Same as **new/insert**, but it first delete all segments with the same `order`.
 - **function dah.actbar_mixer:new/update_id**: Same as **new/insert**, but it first delete all segments with the same `id`.

## Examples:

This player should see `Hello` on actionbar:
```mcfunction
data modify storage dah:actbar new set value {id:"test:1",text:{"text":"Hello"},order:1}
function dah.actbar_mixer:new/insert
```

Running the above again, with `{id:"test:2",text:{"text":"World!"},order:3}`, then the player should see `Hello World!` on actionbar.

After this, the player should see `Hey! Hello World`:
```mcfunction
data modify storage dah:actbar new set value {id:"test:1",text:{"text":"Hey!"}}
function dah.actbar_mixer:new/prepend
```

After this, the player should see `Hey! Hello Beautiful World`:
```mcfunction
data modify storage dah:actbar new set value {id:"test:beautiful",text:{"text":"Beautiful"},order:2}
function dah.actbar_mixer:new/insert
```

After this, the player should see `Hey! Hello Great World`:
```mcfunction
data modify storage dah:actbar new set value {id:"test:beautiful",text:{"text":"Great"},order:2}
function dah.actbar_mixer:new/update_id
```




## Removing A Text Component

To remove a segment of a target, execute the following remove function as that target:
```mcfunction
function dah.actbar_mixer:remove/this {id:"<id>"}
```
Where `<id>` should be the id of that segment you specified when appending. All segments with this id will be removed.

To remove a segment for all players (is online or was online), run `function dah.actbar_mixer:remove/for_all {id:"<id>"}` instead.

To clear all segments for a player, execute `function dah.actbar_mixer:empty/self` as that target.

Executing `function dah.actbar_mixer:empty/everything` clears all segments for all players (offline players included).


## Separator

Separator is what's placed between every text segments. The default separator applied to every new player is stored in `storage dah:actbar default_separator` as a text component. It defaults to "` `" (one white space).

You may change `storage dah:actbar default_separator` to edit the default separator for every player.

To change the separator of a single player, first store the JSON object as a string to storage `dah:actbar` under key `separator`, the execute `function dah.actbar_mixer:separator/from` as the player:
```mcfunction
data modify storage dah:actbar separator set value "-"
function dah.actbar_mixer:separator/from
```
This sets the separator of this player to `-`.

A macro version of this function is also provided as `function dah.actbar_mixer:separator/set`:
```mcfunction
function dah.actbar_mixer:separator/set {separator:"-"}
```
Again, this costs more performance and you will not get any autocompleting from mcdoc.

To set the separator for all players (is online or was online), directly change `data[].separator` of storage `dah:actbar`:
```mcfunction
data modify storage dah:actbar data[].separator set value "="
```

Finally, running `function dah.actbar_mixer:separator/reset_all` resets all players' separator (offline included) back to one white space.

## Turning Off

Setting the score of `#off` on scoreboard `dah.actbar.calc` to `1` turns the system off, which makes it not be affecting the actionbar.

To pause the display on a specific player, tag the player with `dah.actbar.pause`.

## Manually Managing Data

All text segments is stored in storage `dah:actbar` under key `data`.

It is a order, and each of its elements represents a player. You may execute `function dah.actbar_mixer:z_private/uid/get` as a player, which will reorder the order so that this player is the first entry of the order.

You may then directly changing `data[0].separator` which is this player's separator, or `data[0].content` which is a list containing all segment objects. Do not edit `data[0].content[0]`, which is a root used to make sure that the style in each segment is independent.

To append the same text component for all players (is online or was online), simply append the arguments to storage `dah:actbar` under path `data[].content`:
```mcfunction
data modify storage dah:actbar data[].content append value {id:"test:4",text:"Hey There!"}
```

## Dependency File

A `DAM_Dependency.zip` file is included in the release. Put this file anywhere on your computer, then by creating a `spyglass.json` file at the root of your workspace, the Spyglass extension will provides you the completion and error checking of all the functions, storages, and tags you need to write to use this library.

Example content of the `spyglass.json` file. See [Spyglass Documentation](https://spyglassmc.com/user/config.html) for more.
```json
{
	"env": {
		"dependencies": [
			"file:///C:/path/to/DAM_Dependency.zip",
			"@vanilla-mcdoc",
			"@vanilla-resourcepack",
			"@vanilla-mcdoc"
		],
		"gameVersion": "1.21.5"
	}
}
```
Remeber to Reload Vscode. If something about this somehow goes wrong, make Vs Code run the `Spyglass: Reset Project Cahce` command.

## Misc

There is a built in [gu](https://github.com/gibbsly/gu) library in this pack to take care of player UUIDs.