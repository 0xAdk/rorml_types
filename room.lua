---@meta _

--- TODO
---
---@class Room
---
---@overload fun(name: string): Room
local Room = {}

--[[
---- static functions
--]]


--- TODO
---
---@param name? string TODO
function Room.new(name) end

--- TODO
---
---@param name string TODO
---@param namespace? Namespace TODO
---@return Room
function Room.find(name, namespace) end

--- TODO
---
---@param namespace? Namespace TODO
---@return Room[]
function Room.findAll(namespace) end

--- TODO
---
---@return Room
function Room.getCurrentRoom() end

--[[
---- methods
--]]

--- TODO
---
---@return string
function Room:getName() end

--- TODO
---
---@return Namespace
function Room:getOrigin() end


--- TODO
---
---@param object GMObject TODO
---@param x number TODO
---@param y number TODO
---@return Id
function Room:createInstance(object, x, y) end

--- TODO
---
---@param width number TODO
---@param height number TODO
function Room:resize(width, height) end
