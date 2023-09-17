---@meta _

--- A `GMObject` is a specific type of [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html).
---
--- `GMObject` inherits all functionality from [GMObjectBase](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObjectBase.html).
---
--- A list of most usable objects added by the base game can be found on [this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/objects.html).
---
---@class GMObject: GMObjectBase
---@field id Id The object’s GameMaker resource ID
---@field ID Id alias for `id`
---@field sprite Sprite The default sprite of the object
---@field depth number The depth the object will be rendered at. A higher depth means the object will be rendered further back. *defaults to 0*
local GMObject = {}


--- Creates an [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object at the specified position in the game world.
---
--- # Example
---     Create an instance of the object `eggplant` at coordinates 200, 200.
---
---     ```lua
---     eggplant:create(200, 200)
---     ```
---
---@param x number The horizontal coordinate to create the instance at
---@param y number The vertical coordinate to create the instance at
---@return Instance '' The newly created instance.
function GMObject:create(x, y) end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace namespace '' The namespace containing the object
function GMObject:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the object
function GMObject:getName() end

---@alias GMObjectCallback
---| 'create' [*built-in object compatible*] Called each time a new instance is created.
---| 'destroy' [*built-in object compatible*] Called when an instance is destroyed.
---| 'step' [*built-in object incompatible*] Called each frame when instance logic is handled.
---| 'draw' [*built-in object incompatible*] Called when the instance is rendered to the screen.

--- Binds a function to be called by [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object alongside a specific event.
---
--- The [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) calling the function is passed along to it.
--- 
--- **Note**: that some events are not currently supported by built-in objects.
---
--- # Example
---     Make instances of the object `leftMover` move to the left by 2 pixels each frame.
---
---     ```lua
---     leftMover:addCallback("step", function(self)
---             self.x = self.x - 2
---     end)
---     ```
---
---@param callback GMObjectCallback The name of the callback to bind a function onto
---@param bind fun(self: Instance) The function to be run when the callback is fired. The function is always passed the Instance which fired the callback
function GMObject:addCallback(callback, bind) end
