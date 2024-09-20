---@meta _

--- An `EliteType` is a kind of elite enemy that can spawn.
---
---@class EliteType
---@field displayName string The name of the elite, like `frenzied`, or `overloading`
---@field color Color The primary color of the elite, used to tint the enemy when the elite palette is not available
---@field colour Color alias for `color`
---@field colorHard Color The color of the elite when hard elites are active. *you can usually ignore this*
---@field colourHard Color alias for `colorHard`
---@field palette Sprite A single frame 1x6 pixel sprite containing the palette used for recoloring enemies of this elite. *[vanilla palettes upscaled for reference](https://saturnyoshi.gitlab.io/RoRML-Docs/_images/elitepalettes.png)*
---
---@overload fun(name: string): EliteType
EliteType = {}

--- Creates a new elite type.
---
--- **Note**: This `EliteType` won't show up in-game until it's manually added to an enemy's elite list.
---
---@param name string The name to give the elite within the current namespace
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

--- Used to setup an elite palette for a new enemy.
---
--- The sprite will automatically be overwritten to include all other elite palettes.
---
--- The sprite should be a single frame 1x6 pixel image containing the enemy's source colors which will be mapped to the elite palette's colors.
---
--- [palette example image](https://saturnyoshi.gitlab.io/RoRML-Docs/_images/elitepalettes.png)
---
---@param palette Sprite The new palette being set up
---@param object GMObject The enemy the palette is being assigned to. The palette must still be manually set as the enemy's `palette` sprite on spawn
function EliteType.registerPalette(palette, object) end

--- Forces all elite palettes to be refreshed.
---
--- Only needed if creating a new elite type after loading is finished.
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
