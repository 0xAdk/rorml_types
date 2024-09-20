---@meta _

--- The `Stage` class is used to get and change information for the in-game levels.
---
---@class Stage
---@field displayName string The name of the stage displayed on the screen when you enter it. **Note**: that the internal name of the stage will still be the same if this is altered
---@field subname string The text displayed under the name of the stage when it's entered
---@field disabled boolean Removes the stage from stage selection. Be sure not to disable all stages of a certain set otherwise the game will crash
---@field music? Sound The music used by this stage
---@field enemies List<MonsterCard> The list of enemy cards that can spawn in this stage
---@field interactables List<Interactable> The list of interactables that can spawn in this stage
---@field interactableRarity Map<Interactable, number> A map containing each interactable's spawn rarity. Spawn rarity modifies how far away an object has to be from the stage entrance to spawn. *defaults to 1*
---@field rooms List<Room> The list of rooms present in this stage
---@field teleporterIndex number The subimage used by the teleporter the player enters through. Can be used to select stage specific enterance teleporters
---
---@overload fun(name: string): Stage
Stage = {}

--[[
---- static functions
--]]

--- TODO
---
---@param name string TODO
---@return Stage '' TODO
function Stage.new(name) end

--- Contains a numerically indexed table of all [lists](https://saturnyoshi.gitlab.io/RoRML-Docs/class/list.html) of stages normally found in the game.
---
--- If trying to access level indexes after the default 6, [Stage.getProgression](https://saturnyoshi.gitlab.io/RoRML-Docs/class/stage.html#stage-getprogression) must be used.
---
--- # Example
---   Store the first stage available for selection at level index 2 in the local variable `stage`.
---   ```lua
---   local stage = Stage.progression[2][1]
---   ```
---
---@type List<Stage>[]
Stage.progression = {}

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Stage
function Stage.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Stage[]
function Stage.findAll(namespace) end


--- # Example
---   Print the name of the current stage.
---   ```lua
---   print(Stage.getCurrentStage().displayName)
---   ```
---
--- @return Stage '' The currently loaded stage
function Stage.getCurrentStage() end

--- # Example
---   Store the size of the current stage in the `width` and `height` variables.
---   ```lua
---   local width, height = Stage.getDimensions()
---   ```
---
---@return number room_width '' The width of the current stage. *in pixels*
---@return number room_height '' The height of the current stage. *in pixels*
function Stage.getDimensions() end

--- Used to check whether the map is solid at a specific point.
---
---@param x number The x coordinate to check at
---@param y number The y coordinate to check at
---@return boolean '' A boolean indicating whether there was a collision
function Stage.collidesPoint(x, y) end

--- Used to check for map solidity within a rectangle.
---
---@param x1 number The left x coordinate to check at
---@param y1 number The top y coordinate to check at
---@param x2 number The right x coordinate to check at
---@param y2 number The bottom y coordinate to check at
---@return boolean '' A boolean indicating whether there was a collision
function Stage.collidesRectangle(x1, y1, x2, y2) end

--- Gets or sets the number of stages until the last stage.
---
--- The last set of stages in the progression is used as the final level accessed through the divine teleporter.
---
--- Normally the limit is 6.
---
--- # Example
---   Change the number of stages in a run to 3.
---   ```lua
---   Stage.progressionLimit(3)
---   ```
---
---   Print the current progression limit
---   ```lua
---   print(Stage.progressionLimit())
---   ```
---
---@param value? number The new value if setting, nil if getting
---@return number '' The current stage limit if `value` is nil, otherwise returns `value`.
function Stage.progressionLimit(value) end

--- Gets the [list](https://saturnyoshi.gitlab.io/RoRML-Docs/class/list.html) of stages that can be selected for the index-nth level.
---
--- Unless you need to access level indexes after the default 6, using the built-in [Stage.progression](https://saturnyoshi.gitlab.io/RoRML-Docs/class/stage.html#stage-progression) table is usually preferable.
---
--- # Example
---   Change the maximum stage to 7 (1 higher than the base game).
---   Then get the stages at the newly added stage index.
---   ```lua
---   Stage.progressionLimit(7)
---   local list = Stage.getProgression(7)
---   ```
---
---@param index number The level index to get the stages for
---@return List<Stage> '' A list containing the stages that can be selected for level index
function Stage.getProgression(index) end

--- Changes the current stage to [Stage Class](https://saturnyoshi.gitlab.io/RoRML-Docs/class/stage.html#).
---
--- # Example
---   Immediately teleport every player to the stage "Boar Beach".
---   ```lua
---   local boarBeach = Stage.find("Boar Beach")
---   Stage.transport(boarBeach)
---   ```
---
---@param stage Stage The stage to teleport to
function Stage.transport(stage) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the stage
function Stage:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the stage
function Stage:getName() end
