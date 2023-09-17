---@meta _

--- The `BaseSprite` class provides shared methods to the [Sprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sprite.html) and [DynamicSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/dynamicSprite.html) classes.
---
--- The origin of the sprite (`xorigin`, `yorigin`) is used as the sprite’s pivot point.
---
--- The `sprite`s bounding box is the area of the sprite used for collision detection.
---
---@class BaseSprite
---@field xorigin number The horizontal origin of the sprite
---@field yorigin number The vertical origin of the sprite
---@field width number The width of the sprite, in pixels
---@field height number The height of the sprite, in pixels
---@field frames number The number of frames in the sprite
---@field boundingBoxLeft number The lower x position of the bounding box. *relative to `xorigin`*
---@field boundingBoxRight number The upper x position of the bounding box. *relative to `xorigin`*
---@field boundingBoxTop number The lower y position of the sprite bounding box. *relative to `yorigin`*
---@field boundingBoxBottom number The upper y position of the sprite bounding box. *relative to `yorigin`*
local BaseSprite = {}


--- Draws the sprite to the current drawing surface.
---
--- # Example
---     Draw the banana sprite to the screen at `player`'s position.
--- 
---     ```lua
---     banana:draw(player.x, player.y, 1)
---     ```
---
---@param x number The horizontal position to draw the sprite at
---@param y number The vertical position to draw the sprite at.
---@param subimage number The subimage of the sprite to draw
function BaseSprite:draw(x, y, subimage) end

-- the rorml-docs (https://saturnyoshi.gitlab.io/RoRML-Docs/class/baseSprite.html)
-- claim that BaseSprite contains a replace method, through testing
-- (checking a DynamicSprite instance for it) this isn't true.
--
-- Only `Sprite`s have a replace method
