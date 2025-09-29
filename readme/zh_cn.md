# DAM Actionbar Mixer v1.3

本库允许你组合不同的文本组件片段一起显示在 actionbar 上。

支持 `1.21+`。

By Dahesor

## 增加新片段

每个文本组件片段都必须包含一个 ID 和一个文本组件：

* （一个片段）（复合标签）
*  |--- `id`（字符串。任何你想要的 ID。建议使用类似 `foo:bar` 的命名空间制。请勿使用引号）
*  |--- `text`（文本组件（1.21.5+ 为 snbt，1.21.4- 为字符串形式的 JSON）要显示的文本）
*  |--- `order`（*可选* 整数。决定该文字在 actionbar 上显示的顺序。更小的数字会使这个片段更靠左侧。默认为 `0`。）
*  |--- `list`（整数。**已弃用**。请使用 `order`）

要将一个文本组件添加到玩家的 actionbar 上，首先将上述 NBT 结构存储到 `dah:actbar` 的 `new` 键中，然后以该玩家身份执行 `function dah.actbar_mixer:new/(append|prepend|insert|replace_index|update_id)`：

- **function dah.actbar_mixer:new/append**：将该片段添加到 actionbar 的最右侧。新片段的 `order` 将被设置为当前最高`order` + 1，输入中的 `order` 不会被使用。
- **function dah.actbar_mixer:new/prepend**：将该片段添加到 actionbar 的最左侧。新片段的 `order` 将被设置为当前最低`order` - 1，输入中的 `order` 不会被使用。
- **function dah.actbar_mixer:new/insert**：将该片段插入到由输入 `order` 决定的位置。如果两个片段有相同的顺序，先添加的会显示在前。
- **function dah.actbar_mixer:new/replace_index**：与 **new/insert** 相同，但会先删除所有具有相同 `order` 的片段。
- **function dah.actbar_mixer:new/update_id**：与 **new/insert** 相同，但会先删除所有具有相同 `id` 的片段。

## 示例：

玩家应该会在 actionbar 上看到 `Hello`：
```mcfunction
data modify storage dah:actbar new set value {id:"test:1",text:{"text":"Hello"},order:1}
function dah.actbar_mixer:new/insert
```

再次重复上述命令，这次使用 `{id:"test:2",text:{"text":"World!"},order:3}`，玩家应该会看到 `Hello World!`。

然后运行如下命令，玩家应该会看到 `Hey! Hello World`：
```mcfunction
data modify storage dah:actbar new set value {id:"test:1",text:{"text":"Hey!"}}
function dah.actbar_mixer:new/prepend
```

接着运行如下命令，玩家应看到 `Hey! Hello Beautiful World`：
```mcfunction
data modify storage dah:actbar new set value {id:"test:beautiful",text:{"text":"Beautiful"},order:2}
function dah.actbar_mixer:new/insert
```

之后运行如下命令，玩家应看到 `Hey! Hello Great World`：
```mcfunction
data modify storage dah:actbar new set value {id:"test:beautiful",text:{"text":"Great"},order:2}
function dah.actbar_mixer:new/update_id
```

## 移除文本组件

若要移除目标玩家的片段，使用以下指令，以该玩家身份执行：
```mcfunction
function dah.actbar_mixer:remove/this {id:"<id>"}
```
其中 `<id>` 是你之前添加片段时指定的id。所有该 id 的片段都会被移除。

若要为所有玩家（无论是否在线）移除该片段，使用：
```mcfunction
function dah.actbar_mixer:remove/for_all {id:"<id>"}
```

若要清除某个玩家的所有片段，使用：
```mcfunction
function dah.actbar_mixer:empty/self
```

若要清除所有玩家（包括离线玩家）的所有片段，使用：
```mcfunction
function dah.actbar_mixer:empty/everything
```

## 分隔符

分隔符用于各个文本片段之间的分隔。默认的分隔符存储在`storage dah:actbar default_separator`中，是一个文本组件，默认为一个空格（"` `"）。

你可以更改 `storage dah:actbar default_separator` 来修改所有玩家的默认分隔符。

若要更改单个玩家的分隔符，先将文本组件存储到`dah:actbar`的`separator`键中，然后以该玩家身份执行：
```mcfunction
data modify storage dah:actbar separator set value "-"
function dah.actbar_mixer:separator/from
```

另一个更简洁的方式是使用宏指令：
```mcfunction
function dah.actbar_mixer:separator/set {separator:"-"}
```

若要设置所有玩家的分隔符（包括离线），可以直接修改`data[].separator`：
```mcfunction
data modify storage dah:actbar data[].separator set value "="
```

运行以下指令可将所有玩家的分隔符重置会默认的`storage dah:actbar default_separator`：
```mcfunction
function dah.actbar_mixer:separator/reset_all
```

## 关闭系统

将记分板`dah.actbar.calc`上`#off`的分数设置为`1`将会关闭整个系统，使其不再影响 actionbar。

若只想暂停某个玩家的显示，可为该玩家添加`dah.actbar.pause`标签。

## 手动管理数据

所有文本片段都存储在`dah:actbar`的`data`键下。

这是一个列表，每个元素代表一个玩家。你可以以某个玩家身份执行：
```mcfunction
function dah.actbar_mixer:z_private/uid/get
```
该命令会将该玩家移到列表的首位。

随后你可以直接修改该玩家的分隔符或片段列表：
```mcfunction
data[0].separator
data[0].content
```
**不要编辑 `data[0].content[0]`，那是一个用于保持样式独立性的根节点。**

若想为所有玩家添加相同的文本组件，只需向`data[].content`路径追加内容：
```mcfunction
data modify storage dah:actbar data[].content append value {id:"test:4",text:"Hey There!"}
```

## Dependency文件

该数据包附带了一个`DAM_Dependency.zip`文件。将其放置到电脑的任意位置，配合 [Spyglass](https://github.com/SpyglassMC/Spyglass)（Datapack Helper Plus），就可以通过在数据包根目录创建一个`spyglass.json`文件的方式，获取本库所需的所有函数/stoarge/计分板等的自定义补全。

示例`spyglass.json`:

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

## 其他

本数据包内置了 [gu](https://github.com/gibbsly/gu) 库，用于处理玩家 UUID。