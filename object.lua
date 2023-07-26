---@meta _

--- TODO
---
---@overload fun(name?: string): GMObject
Object = {}

--- TODO
---
---@param name string TODO
---@param namespace? Namespace TODO
---@return GMObject
function Object.find(name, namespace) end

--- TODO
---
---@param namespace? Namespace TODO
---@return GMObject[]
function Object.findAll(namespace) end

--- TODO
---
---@param name string TODO
---@return GMObject
function Object.new(name) end

--- TODO
---
---@param kind string TODO
---@param name? string TODO
---@return GMObject
function Object.base(kind, name) end

--- TODO
---
---@param id Id TODO
---@return Instance?
function Object.findInstance(id) end

--- TODO
---
---@param id Id TODO
---@return GMObject?
function Object.fromID(id) end
