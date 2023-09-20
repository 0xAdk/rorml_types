---@meta _

--- An `Interactable` represents an object randomly spawned in a [Stage](https://saturnyoshi.gitlab.io/RoRML-Docs/class/stage.html) such as chests, broken drones, or shrines.
---
---@class Interactable
---@field spawnCost number This number of spawn points the object costs to spawn. *Defaults to 75*, the same amount as item shops. For reference, small chests take 50, large chests 110, golden chests 250, small barrels 7, and chance shrines 65.
---
---@overload fun(obj: GMObject, name: string): Interactable
Interactable = {}

--[[
---- static functions
--]]

--- Creates a new interactable from an existing object, with the specified name.
---
--- # Example
---     Create a new interactable called `Toast_Interactable`.
---
---     ```lua
---     local toastObject = Object.new("Toast_Object")
---     local toastInteractable = Interactable.new(toastObject, "Toast_Interactable")
---     ```
---
---@param obj GMObject The object represented by this interactable
---@param name? string The name to give the interactable within the current namespace
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

--- Finds an existing interactable given its object.
---
--- # Example
---     Get the existing interactable for the `Chest` object.
---
---     ```lua
---     local chestObject = Object.find("Chest", "vanilla")
---     local chestInteractable = Interactable.fromObject(chestObject)
---     ```
---
---@param object GMObject The object represented by this interactable
---@return Interactable '' An `Interactable` if one exists for the given object, otherwise nil
function Interactable.fromObject(object) end

--[[
---- methods
--]]

---@return GMObject '' The object represented by this interactable.
function Interactable:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the interactable
function Interactable:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the interactable
function Interactable:getName() end
