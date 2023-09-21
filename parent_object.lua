---@meta _

--- A `ParentObject` represents a specific group of [GMObjects](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html).
---
--- ParentObject inherits all functionality from [GMObjectBase](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObjectBase.html).
---
--- Below is a complete list of all `ParentObjects`.
---
---   | Name           | Description                                          |
---   |----------------|------------------------------------------------------|
---   | `actors`         | All actors, including players, enemies, drones, etc. |
---   | `enemies`        | All enemies and bosses.                              |
---   | `classicEnemies` | All standard physics affected enemies.               |
---   | `flyingEnemies`  | All flying enemies.                                  |
---   | `bosses`         | All bosses.                                          |
---   | `drones`         | All drones.                                          |
---   | `mapObjects`     | All chests, shrines, etc.                            |
---   | `droneItems`     | All drone map objects.                               |
---   | `chests`         | All chest map objects.                               |
---   | `items`          | All items.                                           |
---   | `artifacts`      | All artifact pickups.                                |
---   | `commandCrates`  | All crates from the artifact of command.             |
---
---@class ParentObject: GMObjectBase
ParentObject = {}

---@alias ParentObjectName
---| 'actors' All actors, including players, enemies, drones, etc.
---| 'enemies' All enemies and bosses.
---| 'classicEnemies' All standard physics affected enemies.
---| 'flyingEnemies' All flying enemies.
---| 'bosses' All bosses.
---| 'drones' All drones.
---| 'mapObjects' All chests, shrines, etc.
---| 'droneItems' All drone map objects.
---| 'chests' All chest map objects.
---| 'items' All items.
---| 'artifacts' All artifact pickups.
---| 'commandCrates' All crates from the artifact of command.

--[[
---- static functions
--]]

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name ParentObjectName
---@param namespace? Namespace
---@return ParentObject
function ParentObject.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return ParentObject[]
function ParentObject.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the parent object
function ParentObject:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return ParentObjectName '' The name of the parent object
function ParentObject:getName() end
