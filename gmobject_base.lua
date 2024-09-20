---@meta _

--- The `GMObjectBase` class provides shared methods to the [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) and [ParentObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/parentObject.html) classes.
---
--- **Note**: Methods which return an [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) may return any [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) child class depending on the calling object.
---
---@class GMObjectBase
local GMObjectBase = {}


--- Finds the `n`th [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object. Instances are sorted by the order they were created.
---
--- # Example
---   Print the IDs of the first 5 instances of the `eggplant` object.
---   ```lua
---   for i = 1, 5 do
---       local instance = eggplant:find(i)
---       print(instance.ID)
---   end
---   ```
---
---@param n number The number of the instance to find
---@return Instance? '' The [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) if found, otherwise nil
function GMObjectBase:find(n) end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object.
---
--- # Example
---   Destroy all instances of the object `eggplant`.
---   ```lua
---   for _, instance in ipairs(eggplant:findAll()) do
---       instance:destroy()
---   end
---   ```
---
---@return Instance[] '' A numerically indexed table containing all the found [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function GMObjectBase:findAll() end

--- TODO
---
---@return number _ TODO correct type?
function GMObjectBase:count() end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object with matching key and value variable pairs.
---
--- Example:
---   Heal all Lemurians where `boost` is nil by 50 health,
---   and then sets `boost` to 1 so they're only healed once.
---   ```lua
---   local lizard = Object.find("lizard", "vanilla")
---   for _, v in ipairs(lizard:findMatching("boost", nil) do
---       v:set("hp", v:get("hp") + 50)
---       v:set("boost", 1)
---   end
---   ```
---
---@param key string The name of the first variable to match
---@param value string|number|nil The value of the first variable to match
---@param ... string|number|nil Any number of additional key and value pairs may be specified
---@return Instance[] '' A numerically indexed table containing all the matching [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function GMObjectBase:findMatching(key, value, ...) end

---@alias FindMatchingOperator
---| '=='
---| '~='
---| '<'
---| '>'
---| '<='
---| '>='

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object with matching key and value variable pairs.
---
--- # Example
---   Kill all Lemurians with less than 30 remaining health.
---   ```lua
---   local lizard = Object.find("lizard", "vanilla")
---   for _, v in ipairs(lizard:findMatchingOp("hp", "<", 30) do
---       v:kill()
---   end
---   ```
---
---@param key string The name of the first variable to compare against
---@param operator FindMatchingOperator The operator to compare with
---@param value string|number|nil The value of the first variable to compare against
---@param ... string|number|nil|FindMatchingOperator Any number of additional key, operator and value sets may be specified
---@return Instance[] '' A numerically indexed table containing all the matching [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function GMObjectBase:findMatchingOp(key, operator, value, ...) end

--- Finds the [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object closest to a point.
---
--- # Example
---   Find the instance of the object `eggplant` closest to the instance `player`.
---   ```lua
---   local target = eggplant:findNearest(player.x, player.y)
---   ```
---
---@param x number The horizontal coordinate of the point to check from
---@param y number The vertical coordinate of the point to check from
---@return Instance '' The [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) if found, otherwise nil
function GMObjectBase:findNearest(x, y) end

--- Finds the [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the object furthest from a point.
---
--- # Example
---   Find the instance of the object `eggplant` farthest from the instance `player`.
---   ```lua
---   local target = eggplant:findFurthest(player.x, player.y)
---   ```
---
---@param x number The horizontal coordinate of the point to check from
---@param y number The vertical coordinate of the point to check from
---@return Instance '' The [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) if found, otherwise nil
function GMObjectBase:findFurthest(x, y) end

--- Finds a single [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) inside of the specified rectangle.
---
---@param x1 number First x coordinates of the rectangle to check
---@param y1 number First y coordinates of the rectangle to check
---@param x2 number Second x coordinates of the rectangle to check
---@param y2 number Second y coordinates of the rectangle to check
---@return Instance '' The first [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) found within the rectangle
function GMObjectBase:findRectangle(x1, y1, x2, y2) end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) inside of the specified rectangle.
---
---@param x1 number First x coordinates of the rectangle to check
---@param y1 number First y coordinates of the rectangle to check
---@param x2 number Second x coordinates of the rectangle to check
---@param y2 number Second y coordinates of the rectangle to check
---@return Instance[] '' A numerically indexed table of [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) found within the rectangle
function GMObjectBase:findAllRectangle(x1, y1, x2, y2) end

--- Finds a single [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) inside of the specified ellipse.
---
---@param x1 number First x coordinates of the ellipse bounding box to check
---@param y1 number First y coordinates of the ellipse bounding box to check
---@param x2 number Second x coordinates of the ellipse bounding box to check
---@param y2 number Second y coordinates of the ellipse bounding box to check
---@return Instance '' The first [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) found within the ellipse
function GMObjectBase:findEllipse(x1, y1, x2, y2) end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) inside of the specified ellipse.
---
---@param x1 number First x coordinates of the ellipse bounding box to check
---@param y1 number First y coordinates of the ellipse bounding box to check
---@param x2 number Second x coordinates of the ellipse bounding box to check
---@param y2 number Second y coordinates of the ellipse bounding box to check
---@return Instance[] '' A numerically indexed table of [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) found within the ellipse
function GMObjectBase:findAllEllipse(x1, y1, x2, y2) end

--- Finds a single [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the specified line.
---
---@param x1 number The x coordinate of the first end of the line
---@param y1 number The y coordinate of the first end of the line
---@param x2 number The x coordinate of the second end of the line
---@param y2 number The y coordinate of the second end of the line
---@return Instance '' The first [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the line
function GMObjectBase:findLine(x1, y1, x2, y2) end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the specified line.
---
---@param x1 number The x coordinate of the first end of the line
---@param y1 number The y coordinate of the first end of the line
---@param x2 number The x coordinate of the second end of the line
---@param y2 number The y coordinate of the second end of the line
---@return Instance[] '' A numerically indexed table of [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the line
function GMObjectBase:findAllLine(x1, y1, x2, y2) end

--- Finds a single [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the specified point.
---
---@param x number The x coordinate of the point to check
---@param y number The y coordinate of the point to check
---@return Instance '' The first [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the point
function GMObjectBase:findPoint(x, y) end

--- Finds all [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the specified point.
---
---@param x number The x coordinate of the point to check
---@param y number The y coordinate of the point to check
---@return Instance[] '' A numerically indexed table of [Instances](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) colliding with the point
function GMObjectBase:findAllPoint(x, y) end
