---@meta _

--- TODO
---
---@class MonsterLog
---@field displayName string TODO
---@field story string TODO
---@field statHP number TODO
---@field statDamage number TODO
---@field statSpeed number TODO
---@field sprite Sprite TODO
---@field portrait Sprite TODO
---@field portraitSubimage number TODO
---
MonsterLog = {}

---@type Map<GMObject, MonsterLog> TODO
MonsterLog.map = nil

--- TODO
---
---@param name string TODO
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
