---@meta _

--- A `Room` represents a space where instances can be spawned. Rooms should not be confused with [Stages](https://saturnyoshi.gitlab.io/RoRML-Docs/class/stage.html).
---
--- Rooms are used for menus or specific stage variants.
---
---@class Room
---
---@overload fun(name: string): Room
local Room = {}

--[[
---- static functions
--]]


--- Creates a new room.
---
--- # Example
---   Create a new room called `CoolRoom`.
---   ```lua
---   local coolRoom = Room.new("CoolRoom")
---   ```
---
---@param name? string The name to give the room within the current namespace
function Room.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Room
function Room.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Room[]
function Room.findAll(namespace) end

---@return Room '' The currently loaded Room
function Room.getCurrentRoom() end


--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the room
function Room:getName() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the room
function Room:getOrigin() end


--- Creates an instance of the given object at the given coordinates, and returns the created instance's ID.
---
--- Note that the instance isn't actually created until the room is loaded.
---
--- # Example
---   Create a `Golem` instance in the `coolRoom` room, and stores the instance's ID.
---   ```lua
---   local golem = Object.find("Golem")
---   local golemInstID = coolRoom:createInstance(golem, 10, 10)
---   ```
---
---@param object GMObject The object of the instance to be created
---@param x number The horizontal coordinate of the position to create the instance in
---@param y number The vertical coordinate of the position to create the instance in
---@return Id
function Room:createInstance(object, x, y) end

--- Resizes the room to match the given width and height.
---
--- # Example
---   Resize the `coolRoom` room to be 420x69.
---   ```lua
---   coolRoom:resize(420, 69)
---   ```
---
---@param width number The room's new width.
---@param height number The room's new height.
function Room:resize(width, height) end
