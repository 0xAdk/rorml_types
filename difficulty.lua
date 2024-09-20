---@meta _

--- A `Difficulty` is a setting you can pick before starting a new game.
---
---@class Difficulty
---@field displayName string The difficulty's display name
---@field icon Sprite The icon sprite used by the difficulty
---@field scale number The scaling used by the difficulty, to get harder over time. *this is applied every minute*
---@field scaleOnline number Same as scale. *only for online use*
---@field description string The description of the difficulty. Displayed when hovered over on survivor selection screen
---@field enableMissileIndicators boolean whether missiles will have a drawn circle over their target
---@field forceHardElites boolean whether forces elites to spawn
---@field enableBlightedEnemies boolean whether blighted enemies will be able to spawn
---
---@overload fun(name: string): Difficulty
Difficulty = {}

--- Creates a new difficulty.
---
--- # Example
---   Create a new difficulty called `Drought`.
---   ```lua
---   local droughtDiff = Difficulty.new("Drought")
---   ```
---
---@param name string The name to give the difficulty within the current namespace
---@return Difficulty
function Difficulty.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Difficulty
function Difficulty.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Difficulty[]
function Difficulty.findAll(namespace) end

---@alias DifficultyScaleKind
---| 'hp' Used to scale actors' base HP over time
---| 'damage' Used to scale actors' base damage over time
---| 'cost' Used to increase chests and other interactables' cost over time

--- Returns one of the game's different stat multipliers described below.
--- These are used to increase difficulty as time goes on.
---
---@param kind? DifficultyScaleKind The stat to get the multiplier for
---@return number '' The multiplier used for the given stat
function Difficulty.getScaling(kind) end

--- Gets the currently active difficulty
---
---@return Difficulty '' The current difficulty
function Difficulty.getActive() end

--- Sets the game's current difficulty to the given one
---
--- # Example
---   Set the game's difficulty to `droughtDiff`.
---   ```lua
---   Difficulty.setActive(droughtDiff)
---   ```
---
---@param diff Difficulty The difficulty to set as active
function Difficulty.setActive(diff) end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the difficulty
function Difficulty:getName() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the difficulty
function Difficulty:getOrigin() end
