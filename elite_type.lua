---@meta _

--- TODO
---
---@class EliteType
---@field displayName string TODO
---@field color Color TODO
---@field colour Color alias for `color`
---@field colorHard Color TODO
---@field colourHard Color alias for `colorHard`
---@field palette Sprite TODO
---
EliteType = {}

--- TODO
---
---@param name string TODO
---@return EliteType
function EliteType.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return EliteType
function EliteType.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return EliteType[]
function EliteType.findAll(namespace) end

--- TODO
---
---@param palette Sprite TODO
---@param object GMObject TODO
function EliteType.registerPalette(palette, object) end

--- TODO
---
function EliteType.refreshPalettes() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the elite type
function EliteType:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the elite type
function EliteType:getName() end
