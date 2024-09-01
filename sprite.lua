---@meta _

--- A Sprite is any image which can be rendered to the screen but is not modified during runtime.
---
--- Sprite inherits all functionality from [BaseSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/baseSprite.html).
---
---@class Sprite: BaseSprite
---@field id Id The sprite’s GameMaker resource ID
---@field ID Id alias for `id`
---
---@overload fun(name: string, fname: string, frames: number, xorigin: number, yorigin: number): Sprite
Sprite = {}

--[[
---- static functions
--]]

--- Loads a sprite from the path fname relative to the mod’s directory.
---
--- **Note**: Only .png files are supported.
---
--- # Example
---   load the sprite called `Light Switch`.
---   It has two frames and its origin is at (12, 14).
---   ```lua
---   ls = Sprite.load("Light Switch", "sprites/light switch.png", 2, 12, 14)
---   ```
---
---@param name string The name to give the sprite within the current namespace.
---@param fname string This is the path to the file, relative to the mod’s base path. *file extension is optional*
---@param frames number The amount of frames in the sprite. When the sprite is imported into the game, the PNG image will be cut into this many equally sized vertical slices
---@param xorigin number The X position of the sprite’s origin. When a sprite is being drawn to the screen, this is the point that will end up at the specified coordinates
---@param yorigin number The Y position of the sprite’s origin
---@return Sprite
function Sprite.load(name, fname, frames, xorigin, yorigin) end

--- Shorthand for `Sprite.load` that omits the name parameter
---
---@param fname string
---@param frames number
---@param xorigin number
---@param yorigin number
---@return Sprite
function Sprite.load(fname, frames, xorigin, yorigin) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Sprite
function Sprite.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Sprite[]
function Sprite.findAll(namespace) end

--- Used to fetch a Sprite object from its GameMaker resource ID.
---
--- Useful for getting sprites from instance variables which contain a sprite ID.
---
---@param id Id The GameMaker ID of the sprite
---@return Sprite '' The Sprite if found, otherwise nil
function Sprite.fromID(id) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the sprite
function Sprite:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the sprite
function Sprite:getName() end

--- Replaces a sprite with another sprite. Useful for visual mods.
---
--- # Example
---   Replace every single sprite in the vanilla game with the sprite `eggplant`.
---   ```lua
---   for _, v in ipairs(Sprite.findAll("vanilla")) do
---       v:replace(eggplant)
---   end
---   ```
---
---@param new Sprite The sprite that will replace the old sprite
function Sprite:replace(new) end
