---@meta _

--- A `Surface` is an image which can be drawn to.
---
--- **Note**: Surfaces become invalid when the game is minimized, so you should always make sure a surface is valid before accessing it.
---
---@class Surface
---@field width number The width of the surface, in pixels
---@field height number The height of the surface, in pixels
---
---@overload fun(width: number, height: number): Surface
Surface = {}

--[[
---- static functions
--]]

--- Creates a new Surface
---
--- # Example
---     Create a new surface with a width of 8 and a height of 256.
---
---     ```lua
---     local vine = Surface.new(8, 256)
---     ```
---
---@param width number The width of the surface, in pixels
---@param height number The height of the surface, in pixels
---@return Surface
function Surface.new(width, height) end

--- Checks if a value is a valid surface.
---
---@param val? any The value to check
---@return boolean '' true if the value is a surface, and `value:isValid()` is true
function Surface.isValid(val) end

--[[
---- methods
--]]

--- Manually deletes the surface.
--- 
--- Surfaces take up graphical memory which is a limited resource, so it is important to free them when you’re done with them.
---
--- # Example
---     In this code we create a temporary surface and then draw it,
---     then since we’re not going to need it for next frame, we free it from memory.
---
---     ```lua
---     local tempsurf = createTempSurface()
---     tempsurf:draw(xpos, ypos)
---     tempsurf:free()
---     ```
---
function Surface:free() end

--- Checks whether the surface still exists.
---
--- In some cases using `Surface.isValid` may be preferable.
--- 
--- # Example
---     Check if the surface `vine` is valid before drawing it.
---     If the surface is not valid, then a function is called to create a new surface.
---
---     ```lua
---     if not vine:isValid() then
---         vine = constructVineSurface()
---     end
---
---     vine:draw(vineposx, vineposy)
---     ```
---
---@return boolean '' true if surface exists otherwise false
function Surface:isValid() end

--- Fills the surface with full transparency.
---
--- # Example
---     Removes anything drawn to the surface `vine` so it can be drawn to without overlapping the previous contents.
---
---     ```lua
---     vine:clear()
---     ```
---
function Surface:clear() end

--- Draws the surface at the specified coordinates.
---
--- # Example
---     Draw the surface `bubble` relative to the position of `player`.
---
---     ```lua
---     bubble:draw(player.x - 10, player.y - 10)
---     ```
---
---@param x number The horizontal position of the top left corner of where to draw the surface, relative to the current drawing surface
---@param y number The vertical position of the top left corner of where to draw the surface, relative to the current drawing surface
function Surface:draw(x, y) end

--- Creates a new [DynamicSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/dynamicSprite.html), adding the surface as its only subimage.
---
---@param xorigin? number The x coordinate of the sprite’s origin. defaults to (TODO)
---@param yorigin? number The y coordinate of the sprite’s origin. defaults to (TODO)
---@param x? number The left x coordinate of the region of the surface to copy. *defaults to 0*
---@param y? number The top y coordinate of the region of the surface to copy. *default to 0*
---@param w? number The width of the surface. *defaults to the width of the surface*
---@param h? number The height of the surface. *defaults to the height of the surface*
---@return DynamicSprite '' The newly created [DynamicSprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/dynamicSprite.html) object.
function Surface:createSprite(xorigin, yorigin, x, y, w, h) end
