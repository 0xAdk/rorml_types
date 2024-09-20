# RoRML Types

[RoRML](https://saturnyoshi.gitlab.io/RoRML-Docs/index.html) api type information defined using [lua-language-server](https://github.com/LuaLS/lua-language-server)'s annotation syntax

The meta files were built by reading the modloader's lua source code and referencing RoRML

## ModData Types

Aside from providing types for the [RoRML](https://saturnyoshi.gitlab.io/RoRML-Docs/index.html) api there are a few declared types used in the `Instance:getData()` method's return value which can be defined by your mod when needed.

These are
 - `InstanceModData`
 - `PlayerInstanceModData`
 - `ActorInstanceModData`
 - `DamagerInstanceModData`
 - `ItemInstanceModData`

For example
```lua
---@class PlayerInstanceModData
---@field step_count number

callback.register('onPlayerInit', function (player)
	local pd = player:getData()
	pd.step_count = 0
end)

callback.register('onPlayerStep', function (player)
	local pd = player:getData()
	pd.step_count = pd.step_count + 1
end)
```

## Installation

This repo in intended to be installed inside the `ModLoader/mods` folder.

To use it, add it to your `.luarc.json`'s `workspace.library` as `../rorml_types`
```json
"workspace.library": [
    "../rorml_types"
]
```


---

If you don't have a `.luarc.json` already you can use this base:

Create a file `.luarc.json` in the root of your mod's directory and copy in this json.

```json
{
    "$schema": "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json",

    "runtime": {
        "version": "LuaJIT",

        "pathStrict": true,
        "path": [
            "?.lua",
            "?"
        ]
    },

    "workspace.library": [
        "../rorml_types",
        "../../resources/libs"
    ]
}
```

