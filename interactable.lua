---@meta _

--- TODO
---
---@class Interactable
---@field spawnCost number TODO
---
---@overload fun(obj: GMObject, name: string): Interactable
Interactable = {}

--[[
---- static functions
--]]

--- TODO
---
---@param obj GMObject TODO
---@param name? string TODO
---@return Interactable
function Interactable.new(obj, name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Interactable
function Interactable.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Interactable[]
function Interactable.findAll(namespace) end

--- TODO
---
---@param object GMObject TODO
---@return Interactable '' TODO
function Interactable.fromObject(object) end

--[[
---- methods
--]]

--- TODO
---
---@return GMObject '' TODO
function Interactable:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the interactable
function Interactable:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the interactable
function Interactable:getName() end
