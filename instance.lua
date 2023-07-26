---@meta _

--- TODO
---
---@class Instance
---@field sprite Sprite TODO
---@field mask Sprite|nil TODO
---@field blendColor Color TODO
---@field blendColour Color alias for `blendColor`
---@field xscale number TODO
---@field yscale number TODO
---@field angle number TODO
---@field alpha number TODO
---@field spriteSpeed number TODO
---@field subimage number TODO
---@field depth number TODO
---@field visible number TODO
---@field x number TODO
---@field y number TODO
---@field id Id TODO
---@field ID Id alias for `id`
local Instance = {}

--- TODO
---
---@return boolean
function Instance:isValid() end

--- TODO
function Instance:destroy() end

--- TODO
function Instance:delete() end

--- TODO
---
---@return GMObject
function Instance:getObject() end

--- TODO
---
---@param ... string TODO
---@return number|string|nil ... TODO
function Instance:get(...) end

--- TODO
---
---@param varName string TODO
---@param value number|string|nil TODO
---@return Instance self TODO
function Instance:set(varName, value) end

--- TODO
---
---@return InstanceAccessor
function Instance:getAccessor() end

--- TODO
---
---@param index number TODO
---@return number remaingTime TODO
function Instance:getAlarm(index) end

--- TODO
---
---@param index number TODO
---@param value number TODO
---@return Instance self TODO
function Instance:setAlarm(index, value) end

--- TODO
---
---@param other Instance|GMObject TODO
---@param x number TODO
---@param y number TODO
---@return boolean
function Instance:collidesWith(other, x, y) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return boolean
function Instance:collidesMap(x, y) end

--- TODO
---
---@return NetInstance
function Instance:getNetIdentity() end

--- TODO
---
---@param dumpValues boolean TODO
---@param advanced boolean TODO
function Instance:dumpVariables(dumpValues, advanced) end

--- TODO
---
---@return table
function Instance:getData() end

--- TODO
---
---@param mod string TODO
---@return table
function Instance:getModData(mod) end
