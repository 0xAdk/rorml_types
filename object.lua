---@meta _

--- A `GMObject` is a specific type of [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html).
---
--- `GMObject` inherits all functionality from [GMObjectBase](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObjectBase.html).
---
--- A list of most usable objects added by the base game can be found on [this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/objects.html).
---
---@overload fun(name?: string): GMObject
Object = {}

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return GMObject
function Object.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return GMObject[]
function Object.findAll(namespace) end

--- Creates a new GMObject.
---
--- If a name is not provided then an automatically generated name will be used.
---
--- # Example
---     Create a new GMObject.
---
---     ```lua
---     local fireball = Object.new("fireball")
---     ```
---
---@param name string The name to give the object within the current namespace
---@return GMObject
function Object.new(name) end

--- Creates a new `GMObject`, inheriting properties from a base object type.
--- 
--- If a name is not provided then an automatically generated name will be used.
--- 
--- This method is used to generate objects for custom enemies, interactables, and other features with built-in behavior.
--- 
--- [See here](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/baseObjects.html) for information on each base object type.
---
--- # Example
---    TODO
---
---@param kind string The base object type to inherit from
---@param name? string The name to give the object within the current namespace
---@return GMObject
function Object.base(kind, name) end

--- Finds the Instance with a certain ID.
---
--- # Example
---     Find the instance with the ID in `someID`.
---
---     ```lua
---     local inst = Object.findInstanceByID(someID)
---     ```
---
---@param id Id The ID of the instance to find
---@return Instance? '' An Instance when found, otherwise nil
function Object.findInstance(id) end

--- Used to fetch a GMObject from its GameMaker resource ID.
---
--- Useful for getting objects from instance variables which contain an object ID.
---
---@param id Id The GameMaker ID of the object
---@return GMObject? '' The GMObject if found, otherwise nil
function Object.fromID(id) end
