---@meta _

--- TODO
---
---@class GMObject: GMObjectBase
---@field id Id TODO
---@field ID Id alias for `id`
---@field sprite Sprite TODO
---@field depth number TODO
local GMObject = {}


--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance
function GMObject:create(x, y) end

--- TODO
---
---@return Namespace namespace TODO
function GMObject:getOrigin() end

--- TODO
---
---@return string
function GMObject:getName() end

---@alias GMObjectCallback
---| 'create' TODO
---| 'destroy' TODO
---| 'step' TODO
---| 'draw' TODO

--- TODO
---
---@param callback GMObjectCallback TODO
---@param bind fun(Instance) TODO
function GMObject:addCallback(callback, bind) end
