---@meta _

--- An `ItemInstance` is any instance of an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) object.
---
---@class ItemInstance: Instance
local ItemInstance = {}


--- # Example
---   Get the [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) that the instance stored in variable `instance` was created from.
---   ```lua
---   local item = instance:getItem()
---   ```
---
---@return Item '' The Item which the instance represents
function ItemInstance:getItem() end

--- Used to get the item instance's mod data table.
---
--- This table can be used to store any arbitrary information,
--- there are absolutely no limitations on what keys or values can be stored here.
---
--- When storing custom information, it is preferable to use this over the instance's
--- get and set methods for several reasons:
---  * There are no limitations for what can be stored here.
---    This includes nested tables, non-string keys, or even other Lua objects.
---  * The get and set methods have significant overhead, while instance data has none.
---  * The table is also specific to each mod, so mods are less likely to conflict.
---
---@return ItemInstanceModData '' The mod-specific unique data table for the item instance
function ItemInstance:getData() end
