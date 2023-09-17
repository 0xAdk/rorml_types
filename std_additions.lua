---@meta _

--- TODO
---
---@generic T
---@param t T[] TODO
---@return T
function table.irandom(t) end

--- TODO
---
---@generic T
---@param t table<any, T> TODO
---@return T
function table.random(t) end

--- TODO
---
---@param percent number TODO
---@return boolean
function math.chance(percent) end

--- TODO
---
---@param value number TODO
---@param target number TODO
---@param step? number TODO
---@return number
function math.approach(value, target, step) end

--- TODO
---
---@param n number TODO
---@return -1|0|1
function math.sign(n) end

--- TODO
---
---@param n number TODO
---@return number
function math.round(n) end

--- TODO
---
---@param value number TODO
---@param lower number TODO
---@param upper number TODO
---@return number
function math.clamp(value, lower, upper) end

--- TODO
---
---@param from number TODO
---@param to number TODO
---@param amount number TODO
---@return number
function math.lerp(from, to, amount) end

--- TODO
---
---@param ... any TODO
function log(...) end

--- TODO
---
---@param instance any TODO
---@param type string TODO
---@return boolean
function isa(instance, type) end
