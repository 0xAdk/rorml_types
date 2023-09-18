---@meta _

---@alias MonsterCardType
---| 'classic' TODO
---| 'player' TODO
---| 'origin' TODO
---| 'offscreen' TODO

--- TODO
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
MonsterCard = {}

--- TODO
---
---@param name string TODO
---@param object GMObject TODO
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

--- TODO
---
---@return GMObject '' TODO
function MonsterCard:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the monster card
function MonsterCard:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the monster card
function MonsterCard:getName() end
