---@meta _

--- An `Artifact` is a togglable gameplay modifier which can have any range of effects, from simplifying the game to making it harder.
---
---@class Artifact
---@field displayName string The name of the artifact as displayed in-game.
---@field pickupName string The name displayed when the artifact is picked up. Usually the item's `displayName` with `"Artifact of "` added to the start. Automatically updated when `displayName` is changed.
---@field pickupSprite Sprite The sprite of the artifact's pickup object.
---@field active boolean Whether the artifact is enabled. This can be modified at any time, but will be reset to false at the end of the run if the artifact is not unlocked.
---@field unlocked boolean Whether the artifact is unlocked and selectable. Saved to the save file. Set to true when a player picks up the artifact.
---@field disabled boolean When set to true the artifact will be hidden from all menus and be unable to be toggled by the player.
---@field loadoutSprite Sprite The sprite of the artifact in the character select menu. Usually a 2 frame image with the origin at the center. The first frame of the sprite is the icon in solid white. The second frame is used when the artifact is enabled.
---@field loadoutText string The description of the artifact in the character select screen. A short description of the artifact's effect.
---
---@overload fun(name: string): Artifact
Artifact = {}

--[[
---- static functions
--]]

--- Creates a new artifact.
---
--- # Example
---   Create a new artifact called `Something`.
---   ```lua
---   local someArtifact = Artifact.new("Something")
---   ```
---
---@param name string The name to give the artifact within the current namespace
---@return Artifact
function Artifact.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Artifact
function Artifact.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Artifact[]
function Artifact.findAll(namespace) end

--- Searches for an artifact which uses the specified [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html).
---
---@param object GMObject The object to use to find the artifact
---@return Artifact? '' The artifact if found, otherwise nil
function Artifact.fromObject(object) end

--[[
---- methods
--]]

--- # Example
---   Creates an instance of the artifact `someArtifact` at a specific position.
---   ```lua
---   someArtifact:getObject():create(xpos, ypos)
---   ```
---
---@return GMObject '' The [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) used as the artifact's pickup.
function Artifact:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the artifact
function Artifact:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the artifact
function Artifact:getName() end
