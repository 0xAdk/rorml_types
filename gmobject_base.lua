---@meta _

--- TODO
---
---@class GMObjectBase
local GMObjectBase = {}


--- TODO
---
---@param n number TODO
---@return Instance?
function GMObjectBase:find(n) end

--- TODO
---
---@return Instance[]
function GMObjectBase:findAll() end

--- TODO
---
---@return number _ TODO correct type?
function GMObjectBase:count() end

--- TODO
---
---@param key string TODO
---@param value string|number|nil TODO
---@param ... string|number|nil TODO
---@return Instance[]
function GMObjectBase:findMatching(key, value, ...) end

---@alias FindMatchingOperator
---| '=='
---| '~='
---| '<'
---| '>'
---| '<='
---| '>='

--- TODO
---
---@param key string TODO
---@param operator FindMatchingOperator TODO
---@param value string|number|nil TODO
---@param ... string|number|nil|FindMatchingOperator TODO
---@return Instance[]
function GMObjectBase:findMatchingOp(key, operator, value, ...) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance
function GMObjectBase:findNearest(x, y) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance
function GMObjectBase:findFurthest(x, y) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance
function GMObjectBase:findRectangle(x1, y1, x2, y2) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance[]
function GMObjectBase:findAllRectangle(x1, y1, x2, y2) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance
function GMObjectBase:findEllipse(x1, y1, x2, y2) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance[]
function GMObjectBase:findAllEllipse(x1, y1, x2, y2) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance
function GMObjectBase:findLine(x1, y1, x2, y2) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@return Instance[]
function GMObjectBase:findAllLine(x1, y1, x2, y2) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance
function GMObjectBase:findPoint(x, y) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@return Instance[]
function GMObjectBase:findAllPoint(x, y) end
