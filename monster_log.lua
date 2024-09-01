---@meta _

--- A `MonsterLog` is the unlockable data entry associated with an enemy.
---
---@class MonsterLog
---@field displayName string The name of the log as displayed in-game
---@field story string The main lore of the enemy
---@field statHP number The enemy’s displayed HP stat
---@field statDamage number The enemy’s displayed damage stat
---@field statSpeed number The enemy’s displayed speed stat
---@field sprite Sprite The sprite of the enemy used as the log icon
---@field portrait Sprite The big sprite of the enemy seen when viewing the log
---@field portraitSubimage number The subimage of the portrait sprite to display. **Note**: *This is 0-indexed rather than the usual 1-indexing*
---
---@overload fun(name: string): MonsterLog
MonsterLog = {}

--- A [Map](https://saturnyoshi.gitlab.io/RoRML-Docs/class/map.html) associating an enemy’s [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) to its log entry.
---
--- Assigning a log to an object in this map will cause that object to drop the log when killed.
---
---@type Map<GMObject, MonsterLog>
MonsterLog.map = nil

--- Creates and returns a new monster log.
---
--- # Example
---   Create a new enemy and its log, assigning the log to the enemy.
---   ```lua
---   local enemy_obj = Object.base("EnemyClassic", "myEnemy")
---   local enemy_log = MonsterLog.new("My Enemy")
---   MonsterLog.map[enemy_obj] = enemy_log
---   ```
---
---@param name string The name to give the monster log within the current namespace
---@return MonsterLog
function MonsterLog.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return MonsterLog
function MonsterLog.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return MonsterLog[]
function MonsterLog.findAll(namespace) end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the monster log
function MonsterLog:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the monster log
function MonsterLog:getName() end
