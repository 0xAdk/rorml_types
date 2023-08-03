---@meta _

--- TODO
---
---@class DynamicSprite: BaseSprite
local DynamicSprite = {}

--- TODO
function DynamicSprite:delete() end

--- TODO
---
---@return boolean
function DynamicSprite:isValid() end

--- TODO
---
---@param name string TODO
---@return Sprite
function DynamicSprite:finalise(name) end

DynamicSprite.finalize = DynamicSprite.finalise

--- TODO
---
---@param source Surface TODO
---@param x? number TODO
---@param y? number TODO
---@param w? number TODO
---@param h? number TODO
function DynamicSprite:addFrame(source, x, y, w, h) end
