---@meta _

--- The `Item` class is used to create and modify items which can be found in the game.
---
---@class Item
---@field pickupText string The text displayed under the name of the item when it’s picked up, usually a short descriptor of the item’s functionality
---@field sprite Sprite The sprite of the item. Use items expect a 2 frame sprite, the first one with the `USE` label on it. Other item sprites will only display the first frame
---@field isUseItem boolean Whether the item is a use item or not
---@field useCooldown number *Only applies to use items*: This is the cooldown of the item, in seconds. *default is 45*
---@field displayName string The name of the item as displayed in-game
---@field color Color|ColorText The color of the item’s tier in colored text formatting or as a Color object
---@field colour Color alias for `color`
---
---@overload fun(name: string): Item
Item = {}

--[[
---- static functions
--]]

--- Creates a new item.
---
--- # Example
---   Creates a new item called `"Peach"`.
---   ```lua
---   local peach = Item.new("Peach")
---   ```
---
---@param name string The name to give the item within the current namespace
---@return Item
function Item.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Item
function Item.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Item[]
function Item.findAll(namespace) end

--- Searches for an item which uses the specified [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html).
---
---@param object GMObject The object to use to find the item
---@return Item? '' The item if found, otherwise nil
function Item.fromObject(object) end

--[[
---- methods
--]]

--- # Example
---   Creates an instance of the item `exampleItem` at a specific position.
---   ```lua
---   exampleItem:getObject():create(xpos, ypos)
---   ```
--- 
---@return GMObject '' The [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) used to represent the item in the game world.
function Item:getObject() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the item
function Item:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the item
function Item:getName() end

---@alias ItemCallback
---| 'pickup' Fired when a player picks up the item
---| 'use' *Use items only*: Fired when the item is used
---| 'drop' *Use items only*: Fired when the item is dropped as a result of being switched out for another

--- Binds a function to be called when a specific callback is fired.
---
--- The [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html) which triggered the callback is always passed to the function.
---
--- # Example
---   Two different ways of achieving the same effect; an item that moves the player 100 pixels upward when picked up.
---
---   1.
---   ```lua
---   local function itemPickup(player)
---       player.y = player.y - 100
---   end
---
---   customItem:addCallback("pickup", itemPickup)
---   ```
---   2.
---   ```lua
---   customItem:addCallback("pickup", function(player)
---       player.y = player.y - 100
---   end)
---   ```
--- 
---@param callback ItemCallback The name of the callback to bind a function to
---@param bind fun(player: PlayerInstance) The function to be run when the callback is fired
function Item:addCallback(callback, bind) end

---@alias LogGroup
---| 'start'
---| 'common'
---| 'common_locked'
---| 'uncommon'
---| 'uncommon_locked'
---| 'rare'
---| 'rare_locked'
---| 'use'
---| 'use_locked'
---| 'boss'
---| 'boss_locked'
---| 'end'

---@class LogArgs
---@field group LogGroup Decides where in the item log your items will appear. Mod items will always appear after base game items of the same rarity
---@field description string A description of the items functionality, usually more detailed than the in-game description. Supports [colored text formatting](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/coloredTextFormatting.html)
---@field priority? string A lore-friendly description of rarity, see the in-game descriptions of items for examples. Not setting this will set it automatically to a default based on what group the Log is set to. Supports [colored text formatting](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/coloredTextFormatting.html)
---@field destination string Shipping destination for the item
---@field date string Estimated delivery date for the item
---@field story string A flavorful story or description relating to the item

--- Creates an entry for the item in the Item Log, alternatively modifies the existing one.
---
--- # Examples
---   Create a fully formed item log for the custom item.
---   Priority has been omitted so that it’s set to the default for uncommon items.
---   ```lua
---   customItem:setLog {
---       group = "uncommon",
---       description = "This is what the item does",
---       destination = "City,\nCountry,\nPlanet",
---       date = "mm/DD/YYYY",
---       story = "This is some flavortext for the item."
---   }
---   ```
---
---   Edit a item log description to match the modded changes
---   ```lua
---   Item.find("infusion", "vanilla"):setLog {
---       description = "Killing an enemy increases your &r&health permanently by 0.25.&!&"
---   }
---   ```
---
---@param args LogArgs
function Item:setLog(args) end

--- Sets the `color` of the item (Usually "w", "g", "r", "or", and "p" for common, uncommon, rare, use, and special items respectively)
--- and adds it to the appropriate [ItemPool](https://saturnyoshi.gitlab.io/RoRML-Docs/class/itemPool.html).
--- If the item is already in the common, uncommon, rare, or use pool then it will be removed
---
--- # Examples
---   Both of the below code examples achieve the same effect.
---   However, the example utilizing `setTier` is much more concise.
---
---   1.
---   ```lua
---   customItem:setTier("common")
---   ```
---   2.
---   ```lua
---   ItemPool.find("common"):add(customItem)
---   customItem.color = "w"
---   ```
---
---@param tier 'common'|'uncommon'|'rare'|'use'|string
function Item:setTier(tier) end

--- Creates a new instance of the item. Can be used as a shortcut to `item:getObject():create(x, y)`.
---
--- # Example
---   Create an instance of the item `exampleItem` at a specific position.
---   ```lua
---   exampleItem:getObject():create(xpos, ypos)
---   ```
--- 
---@param x number The horizontal coordinate to create an instance of the item at
---@param y number The vertical coordinate to create an instance of the item at
---@return Instance '' The newly created instance
function Item:create(x, y) end
