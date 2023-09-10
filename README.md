# RoRML Types

[RoRML](https://saturnyoshi.gitlab.io/RoRML-Docs/index.html) api type information defined using [lua-language-server](https://github.com/LuaLS/lua-language-server)'s annotation syntax

The meta files were built by reading the modloader's lua source code and referencing RoRML

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

