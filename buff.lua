---@meta _

--- TODO
---
---@class Buff
---@field sprite Sprite TODO
---@field subimage number TODO
---@field frameSpeed number TODO
---
---@overload fun(name: string): Buff
Buff = {}

--[[
---- static functions
--]]

--- TODO
---
---@param name string TODO
---@return Buff
function Buff.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Buff
function Buff.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Buff[]
function Buff.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the buff
function Buff:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the buff
function Buff:getName() end

--- TODO
---
---@alias BuffCallback
---| 'start' TODO
---| 'step' TODO
---| 'end' TODO

--- TODO
---
---@param callback BuffCallback TODO
---@param bind fun(actor: ActorInstance, time: number) TODO
function Buff:addCallback(callback, bind) end
