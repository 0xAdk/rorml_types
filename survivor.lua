---@meta _

--- TODO
---
---@class Survivor
---@field disabled boolean TODO
---@field displayName string TODO
---@field loadoutSprite Sprite TODO
---@field loadoutColor Color TODO
---@field loadoutColour Color alias for `loadoutColor`
---@field loadoutWide boolean TODO
---@field titleSprite Sprite TODO
---@field idleSprite Sprite TODO
---@field endingQuote string TODO
---
---@overload fun(name: string): Survivor
Survivor = {}

--[[
---- static functions
--]]

--- TODO
---
---@param name string TODO
---@return Survivor
function Survivor.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Survivor
function Survivor.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Survivor[]
function Survivor.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the survivor
function Survivor:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the survivor
function Survivor:getName() end

--- TODO
---
---@alias SurvivorCallback
---| 'init' TODO
---| 'step' TODO
---| 'draw' TODO
---| 'useSkill' TODO
---| 'onSkill' TODO
---| 'levelUp' TODO
---| 'scepter' TODO

--- TODO
---
---@overload fun(callback: 'init', bind: fun(player: PlayerInstance))
---@overload fun(callback: 'step', bind: fun(player: PlayerInstance, player_id: number))
---@overload fun(callback: 'draw', bind: fun(player: PlayerInstance, x: number, y: number))
---@overload fun(callback: 'useSkill', bind: fun(player: PlayerInstance, index: number))
---@overload fun(callback: 'onSkill', bind: fun(player: PlayerInstance, index: number, animation_frame: number))
---@overload fun(callback: 'levelUp', bind: fun(player: PlayerInstance))
---@overload fun(callback: 'scepter', bind: fun(player: PlayerInstance))
---
---@-- FIXME: using `Callback` as the type instead of string casues every callback to show up
---@--        twice in suggestions due to the overloads.
---@--        It's required for the callback docs, and the overloads for the autocomplete.
---@param callback SurvivorCallback TODO
---@param bind fun(player: PlayerInstance, _: unknown, _: unknown) TODO
function Survivor:addCallback(callback, bind) end

--- TODO
---
---@param index number TODO
---@param name string TODO
---@param description string TODO
function Survivor:setLoadoutSkill(index, name, description) end

--- TODO
---
---@param description string TODO
---@param skills Sprite TODO
function Survivor:setLoadoutInfo(description, skills) end
