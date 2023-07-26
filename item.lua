---@meta _

--- TODO
---
---@class Item
---@field pickupText string TODO
---@field sprite Sprite TODO
---@field isUseItem boolean TODO
---@field useCooldown number TODO
---@field displayName string TODO
---@field color Color TODO
---@field colour Color alias for `color`
---
---@overload fun(name: string): Item
Item = {}

--[[
---- static functions
--]]

---TODO
---
---@param name string TODO
---@return Item
function Item.new(name) end

--- TODO
---
---@param name string TODO
---@param namespace? Namespace TODO
---@return Item
function Item.find(name, namespace) end

--- TODO
---
---@param namespace? Namespace TODO
---@return Item[]
function Item.findAll(namespace) end

---TODO
---
---@param object GMObject TODO
---@return Item?
function Item.fromObject(object) end

--[[
---- methods
--]]

--- TODO
---
---@return GMObject
function Item:getObject() end

--- TODO
---
---@return Namespace
function Item:getOrigin() end

--- TODO
---
---@return string
function Item:getName() end

--- TODO
---
---@param callback 'pickup'|'use'|'drop' TODO
---@param bind fun(player: PlayerInstance) TODO
function Item:addCallback(callback, bind) end

--- TODO
---
---@alias LogGroup
---| 'start' TODO
---| 'common' TODO
---| 'common_locked' TODO
---| 'uncommon' TODO
---| 'uncommon_locked' TODO
---| 'rare' TODO
---| 'rare_locked' TODO
---| 'use' TODO
---| 'use_locked' TODO
---| 'boss' TODO
---| 'boss_locked' TODO
---| 'end' TODO

--- TODO
---
---@class LogArgs
---@field group LogGroup TODO
---@field description string TODO
---@field priority string TODO
---@field destination string TODO
---@field date string TODO
---@field story string TODO

--- TODO
---
---@param args LogArgs TODO
function Item:setLog(args) end

--- TODO
---
---@param tier 'common'|'uncommon'|'rare'|'use'|string TODO
function Item:setTier(tier) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance
function Item:create(x, y) end
