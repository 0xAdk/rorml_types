---@meta _

--- TODO
---
---@class Surface
---@field width number TODO
---@field height number TODO
---
---@overload fun(width: number, height: number): Surface
Surface = {}

--[[
---- static functions
--]]

--- TODO
---
---@param width number TODO
---@param height number TODO
---@return Surface
function Surface.new(width, height) end

--- TODO
---
---@param val? any TODO
---@return boolean
function Surface.isValid(val) end

--[[
---- methods
--]]

--- TODO
function Surface:free() end

--- TODO
---
---@return boolean
function Surface:isValid() end

--- TODO
function Surface:clear() end

--- TODO
---
---@param x number TODO
---@param y number TODO
function Surface:draw(x, y) end

--- TODO
---
---@param xorigin? number TODO
---@param yorigin? number TODO
---@param x? number TODO
---@param y? number TODO
---@param w? number TODO
---@param h? number TODO
---@return DynamicSprite
function Surface:createSprite(xorigin, yorigin, x, y, w, h) end
