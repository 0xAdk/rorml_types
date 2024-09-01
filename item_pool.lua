---@meta _

--- An `ItemPool` is a container for multiple [Items](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) objects used to randomly select which items are dropped.
---
--- For a complete list of pools in the base game, see [this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/vanillaItemPools.html).
---
---@class ItemPool
---@field ignoreLocks boolean If set to true all items in the pool will be able to drop even if the player hasn’t unlocked them
---@field ignoreEnigma boolean By default, use items will not be rolled if the Artifact of Enigma is enabled. Setting this flag to true allows the item pool to roll use items even when Enigma is active
---@field weighted boolean Allows assigning different weights to items in the item pool. Setting this to false clears all existing weight values in the pool. *the only default item pool where this is true is the gunchest pool*
---
---@overload fun(name: string): ItemPool
ItemPool = {}

--[[
---- static functions
--]]

--- Creates a new ItemPool
---
--- # Example
---   Create a new ItemPool called `blue`.
---   ```lua
---   local blueItems = ItemPool.new("blue")
---   ```
---
---@param name string The name to give the itemPool. This is mostly used to distinguish the ItemPool from others in searches
---@return ItemPool
function ItemPool.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return ItemPool
function ItemPool.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return ItemPool[]
function ItemPool.findAll(namespace) end


--[[
---- methods
--]]

--- Adds an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) to the pool.
---
--- # Example
---   Add Infusion to the `coolPool` pool.
---   ```lua
---   coolPool:add(Item.find("Infusion"))
---   ```
---
---@param item Item The Item to be added to the pool
function ItemPool:add(item) end

--- Removes an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) from the pool.
---
--- # Example
---   Removes Infusion from the `coolPool` pool.
---   ```lua
---   coolPool:remove(Item.find("Infusion"))
---   ```
---
---@param item Item The Item to be removed from the pool
function ItemPool:remove(item) end

--- Checks if an Item is in the pool.
---
--- # Example
---   Print "uncool" if Infusion is in `coolPool`.
---   ```lua
---   if coolPool:contains(Item.find("Infusion")) then
---       print("uncool")
---   end
---   ```
---
---@param item Item The Item to checked for
---@return boolean '' true if the item is in the pool, otherwise false
function ItemPool:contains(item) end

--- Get one [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) randomly selected from the pool.
---
--- # Example
---   Create an instance of a random object from the `coolPool` pool at (`x`, `y`).
---   ```lua
---   coolPool:roll().getObject().create(x, y)
---   ```
---
---@return Item
function ItemPool:roll() end

--- # Example
---   Create a command crate containing the `coolPool` items.
---   ```lua
---   coolPool:getCrate().create(x, y)
---   ```
---
---@return GMObject '' The command crate [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) for the pool.
function ItemPool:getCrate() end

--- # Example
---   Print the internal name of all items in `pool`.
---   ```lua
---   local items = pool:toList()
---   for _, v in ipairs(items) do
---       print(v:getName())
---   end
---   ```
---
---@return Item[] '' An array table containing all the Items within the pool
function ItemPool:toList() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the item
function ItemPool:getName() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the item
function ItemPool:getOrigin() end

--- Has no effect if `pool.weighted` is not set to true.
---
--- Sets the weight of the item within the pool.
---
--- Should be called after the item is already added to the pool.
---
---@param item Item The item to set the weight of
---@param weight number The new weight of the item
function ItemPool:setWeight(item, weight) end

--- Returns the weight of an item in the pool.
---
--- Defaults to 1 and always returns 1 if `pool.weighted` is not set to true.
---
---@param item Item The item to get the weight of
---@return number '' The weight of the item in the pool
function ItemPool:getWeight(item) end
