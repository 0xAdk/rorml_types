---@meta _

--- An `Achievement` is an unlockable that triggers upon doing some sort of objective.
--- It can unlock new items and survivors.
---
---@class Achievement
---@field requirement number The target required to hit to unlock the achievement
---@field sprite Sprite The sprite of the achievement, displayed upon unlocking. *same size as an item sprite*
---@field unlockText string The text that is displayed on the death screen / end screen when you unlock the achievement. Usually "This item will now drop." for items and "This character is now playable." for survivors.
---@field deathReset boolean Sets whether the achievement progress should reset upon death
---@field description string The description of the achievement, namely the information on what to do to unlock it. Displayed on the achievement unlock popup and on Scores and Unlockables page, under Achievements.
---@field highscoreText string The text that indicates what the achievement unlocked. Usually the item / survivor's `displayName` in quotes, followed by `" Unlocked"`
---@field parent? Achievement The achievement's parent. The achievement can only be unlocked if the parent achievement is also unlocked. *if nil it can be unlocked at anytime*
---
---@overload fun(name: string): Achievement
Achievement = {}

--[[
---- static functions
--]]

--- Creates a new achievement.
---
--- # Example
---   Create a new achievement called `Harvester`.
---   ```lua
---   local harvestAchievement = Achievement.new("Harvester")
---   ```
---
---@param name string The name to give the achievement within the current namespace.
---@return Achievement
function Achievement.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Achievement
function Achievement.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Achievement[]
function Achievement.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the achievement
function Achievement:getName() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the achievement
function Achievement:getOrigin() end

--- Increments the achievement's progress by `inc`.
---
--- If the achievement's `requirement` field is hit or surpassed, the achievement is unlocked.
---
--- # Example
---   Increment harvestAchievement's progress by one.
---   ```lua
---   harvestAchievement:increment(1)
---   ```
---
---@param inc number The amount to increase the achievement has progress by
function Achievement:increment(inc) end

--- Assigns an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) or [Survivor](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html) to the achievement, unlocking it when the achievement is unlocked.
---
--- This automatically sets the
--- 1. `highscoreText` field to the item/survivor's `displayName` in quotes followed by `" Unlocked"`
--- 2. The `sprite` field to the item/survivor's sprite
--- 3. The `unlockText` to
---   * "This character is now playable." for survivors
---   * "This item will now drop." for items.
---
--- # Example
---   Assign the Item `scythe` to the `harvestAchievement` achievement.
---   Setting its `highscoreText`, `sprite`, and `unlockText` accordingly.
---   ```lua
---   local scythe = Item.new("Scythe")
---   harvestAchievement:assignUnlockable(scythe)
---   ```
---
---@param thing Item|Survivor The unlockable this achievement should unlock
function Achievement:assignUnlockable(thing) end

--- Checks if the achievement has already been unlocked.
---
--- # Example
---   Check if the `harvestAchievement` has been unlocked, if it is set the player's `blendColor` to green.
---   ```lua
---   if harvestAchievement:isComplete() then
---           player.blendColor = Color.GREEN
---   end
---   ```
---
---@return boolean '' true if the achievement has been unlocked, otherwise false
function Achievement:isComplete() end

---@alias AchievementCallback
---| 'onIncrement' Called each time the achievement is incremented.
---| 'onComplete' Called when the achievement is unlocked.

--- Binds a function to be called whenever the specified callback is fired.
---
--- # Example
---   Create a burst of `FireworkFlare` particles when the `harvestAchievement` achievement is unlocked.
---   ```lua
---   harvestAchievement:addCallback("onComplete", function()
---           ParticleType.find("FireworkFlare", "vanilla"):burst("above", player.x, player.y, 10, Color.GREEN)
---   end)
---   ```
---
---@param callback AchievementCallback The name of the callback to bind a function to
---@param bind function The function to be run when the callback is fired
function Achievement:addCallback(callback, bind) end
