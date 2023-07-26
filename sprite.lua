---@meta _

--- TODO
---
---@class Sprite: BaseSprite
---@field id Id TODO
---@field ID Id alias for `id`
---
---@overload fun(name: string, fname: string, frames: number, xorigin: number, yorigin: number): Sprite
Sprite = {}

--[[
---- static functions
--]]

--- TODO
---
---@param name string TODO
---@param fname string TODO
---@param frames number TODO
---@param xorigin number TODO
---@param yorigin number TODO
---@return Sprite
function Sprite.load(name, fname, frames, xorigin, yorigin) end

--- TODO
---
---@param fname string TODO
---@param frames number TODO
---@param xorigin number TODO
---@param yorigin number TODO
---@return Sprite
function Sprite.load(fname, frames, xorigin, yorigin) end

--- TODO
---
---@param name string TODO
---@param namespace? Namespace TODO
---@return Sprite
function Sprite.find(name, namespace) end

--- TODO
---
---@param namespace? Namespace TODO
---@return Sprite[]
function Sprite.findAll(namespace) end

--- TODO
---
---@param id Id TODO
---@return Sprite
function Sprite.fromID(id) end

--[[
---- methods
--]]

--- TODO
---
---@return Namespace
function Sprite:getOrigin() end

--- TODO
---
---@return string
function Sprite:getName() end

--- TODO
---
---@param new Sprite TODO
function Sprite:replace(new) end
