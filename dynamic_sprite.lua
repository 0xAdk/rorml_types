---@meta _

--- The `DynamicSprite` class is used to create [Sprites](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sprite.html) at runtime.
---
--- DynamicSprite inherits all functionality from [BaseSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/baseSprite.html).
---
--- A `DynamicSprite` is created using the [Surface:createSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html#surface-createsprite) method.
---
--- Much like a [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html), a `DynamicSprite` can be created at any time and drawn to the screen.
--- Unlike a [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html), a `DynamicSprite` will never stop being valid unless it is explicitly deleted, but does require a [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html) to be created from.
--- This class can also be used to generate regular [Sprites](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sprite.html) which can be used
--- to dynamically generate items or other content.
---
---@class DynamicSprite: BaseSprite
local DynamicSprite = {}

--- Deletes the sprite, causing it to become invalid.
--- All future attempts to access the sprite will result in an error.
function DynamicSprite:delete() end

--- Checks whether the sprite still exists.
--- This will only return false after the sprite's delete method has been called.
---
---@return boolean
function DynamicSprite:isValid() end

--- Used to retrieve a final [Sprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sprite.html).
--- Also causes the `DynamicSprite` to become invalid.
---
---@param name string The name to give the sprite within the current namespace
---@return Sprite '' A new Sprite with the same contents
function DynamicSprite:finalise(name) end

--- Alias for `DynamicSprite.finalise`
DynamicSprite.finalize = DynamicSprite.finalise

--- Adds a new frame to the sprite, using the provided [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html).
--- The frame is appended at the end of the current animation sequence.
---
---@param source Surface The [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html) to pull the image from
---@param x? number The left x coordinate of the region of the surface to copy. *defaults to 0*
---@param y? number The top y coordinate of the region of the surface to copy. *default to 0*
---@param w? number The width of the region of the surface to copy. *defaults to the width of the sprite*
---@param h? number The height of the region of the surface to copy. *defaults to the height of the sprite*
function DynamicSprite:addFrame(source, x, y, w, h) end
