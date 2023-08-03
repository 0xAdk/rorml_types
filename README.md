# RoRML Types
[RoRML](https://saturnyoshi.gitlab.io/RoRML-Docs/index.html) api type information defined using [lua-language-server](https://github.com/LuaLS/lua-language-server)'s annotation syntax

This repo in intended to be installed inside the `ModLoader/mods` folder, after
which just need to add the path `../rorml_types` to `workspace.library` in your
project's `.luarc.json`

---
If you don't have a `.luarc.json` already, you can use this base.

```json
{
	"runtime.version": "Lua 5.1",

	"runtime.pathStrict": true,
	"runtime.path": [
		"?.lua",
		"?",
	],

	"workspace.library": [
		"../rorml_types",
		"../../resources/libs",
	],
}
```

Create a file `.luarc.json` in the root of your mod's directory and copy in the
json above.
