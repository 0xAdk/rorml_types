---@meta _

--- TODO
---
---@class ItemPool
---@field ignoreLocks boolean TODO
---@field ignoreEnigma boolean TODO
---@field weighted boolean TODO
---
---@overload fun(name: string): ItemPool
ItemPool = {}

--[[
---- static functions
--]]

---TODO
---
---@param name string TODO
---@return ItemPool
function ItemPool.new(name) end

--- TODO
---
---@param name string TODO
---@param namespace? Namespace TODO
---@return ItemPool
function ItemPool.find(name, namespace) end

--- TODO
---
---@param namespace? Namespace TODO
---@return ItemPool[]
function ItemPool.findAll(namespace) end


--[[
---- methods
--]]

--- TODO
---
---@param item Item TODO
function ItemPool:add(item) end

--- TODO
---
---@param item Item TODO
function ItemPool:remove(item) end

--- TODO
---
---@param item Item TODO
---@return boolean
function ItemPool:contains(item) end

--- TODO
---
---@return Item
function ItemPool:roll() end

--- TODO
---
---@return GMObject
function ItemPool:getCrate() end

--- TODO
---
---@return Item[]
function ItemPool:toList() end

--- TODO
---
---@return string
function ItemPool:getName() end

--- TODO
---
---@return Namespace
function ItemPool:getOrigin() end

--- TODO
---
---@param item Item TODO
---@param weight number TODO
function ItemPool:setWeight(item, weight) end

--- TODO
---
---@param item Item TODO
---@return number
function ItemPool:getWeight(item) end
