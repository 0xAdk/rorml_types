---@meta _

--- A `Buff` is a positive or negative status effect which can be applied to most actors.
---
--- Applying and removing buffs is handled in the [ActorInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html) class.
---
--- For a full list of buffs added by the base game, [see this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/vanillaBuffs.html).
---
---@class Buff
---@field sprite Sprite The sprite of the buff. This will appear above the affected character
---@field subimage number The frame of the sprite to use. *defaults to 1*
---@field frameSpeed number How fast the buff sprite should animate. *defaults to 0 for no animation*
---
---@overload fun(name: string): Buff
Buff = {}

--[[
---- static functions
--]]

--- Creates a new Buff.
---
--- If a name is not provided then an automatically generated name will be used.
---
--- # Example
---   Create a new buff called `Jump Boost`.
---   ```lua
---   local jumpboost = Buff.new("Jump Boost")
---   ```
---
---@param name? string The name to give the buff within the current namespace
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

---@alias BuffCallback
---| 'start' Fired when the buff is first applied
---| 'step' Fired every step that the buff is applied to the [ActorInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html)
---| 'end' Fired when the buff ends

--- Binds a function to be called when a specific callback is fired.
---
--- The [ActorInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html) affected by the buff is always passed to the function.
---
--- # Example
---   After the `jumpboost` buff is applied to an actor give them the ability to jump a bit higher.
---   Then revert it once the buff wears off.
---   ```lua
---   jumpboost:addCallback("start", function(player)
---       player:set("pVmax", player:get("pVmax") + 1)
---   end)
---
---   jumpboost:addCallback("end", function(player)
---       player:set("pVmax", player:get("pVmax") - 1)
---   end)
---   ```
---
---@overload fun(self, callback: 'start', bind: fun(actor: ActorInstance))
---@overload fun(self, callback: 'step', bind: fun(actor: ActorInstance, remaining_time: number))
---@overload fun(self, callback: 'end', bind: fun(actor: ActorInstance))
---
---@-- FIXME: using `BuffCallback` as the type instead of `string` casues every callback to show up
---@--        twice in suggestions due to the overloads.
---@--        It's required for the callback docs, and the overloads for the autocomplete.
---@param callback BuffCallback The name of the callback to bind a function to
---@param bind fun(actor: ActorInstance, time: number) The function to be run when the callback is fired. The function is always passed the [ActorInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html) affected by the buff
function Buff:addCallback(callback, bind) end
