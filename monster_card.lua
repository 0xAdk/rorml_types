---@meta _

---@alias MonsterCardType
---| 'classic' Spawns on the ground with an animation and sound. This is the typical spawn type for classic enemies
---| 'player' Spawns the enemy at the exact same coordinates as the player. This is used by a few bosses to find an appropriate spawn location
---| 'origin' Spawns the enemy at the coordinates 0,0. This is used by the Magma Worm because the spawned object is a controller and doesn’t have a hitbox.
---| 'offscreen' Spawns at the edge of the game view, slightly offscreen. This is the typical spawn type for flying enemies

--- A `MonsterCard` defines the rules which allow a type of enemy to spawn in a level.
---
---@class MonsterCard
---@field cost number
---@field sprite Sprite
---@field object GMObject
---@field sound Sound?
---@field isBoss boolean
---@field canBlight boolean
---@field type MonsterCardType
---@field eliteTypes List<EliteType>
---
---@overload fun(name: string, object: GMObject): MonsterCard
MonsterCard = {}

--- Creates a new monster card, binding it to the passed object.
---
--- Depending on the object, some properties of the resulting card are automatically set:
--- * Classic enemies are initialized with all vanilla elite types.
--- * Bosses automatically have `isBoss` set to true.
--- * If the enemy is classic, spawn type is set to `classic`, otherwise it’s set to `offscreen`.
---
--- # Example
---     Create a new enemy and its spawn card.
---
---     ```lua
---     local enemy_obj = Object.base("EnemyClassic", "myEnemy")
---     local enemy_card = MonsterCard.new("myEnemyCard", enemy_obj)
---     ```
---
---@param name string The name to give the monster card within the current namespace
---@param object GMObject The actual object representing the enemy
---@return MonsterCard
function MonsterCard.new(name, object) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return MonsterCard
function MonsterCard.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return MonsterCard[]
function MonsterCard.findAll(namespace) end

--- Returns the object represented by this monster card.
---
---@return GMObject
---@deprecated 'use the `object` field'
function MonsterCard:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the monster card
function MonsterCard:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the monster card
function MonsterCard:getName() end
