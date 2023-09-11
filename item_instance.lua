---@meta _

--- An `ItemInstance` is any instance of an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) object.
---
---@class ItemInstance: Instance
local ItemInstance = {}


--- # Example
---     Get the [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) that the instance stored in variable `instance` was created from.
---
---     ```lua
---     local item = instance:getItem()
---     ```
---
---@return Item '' The Item which the instance represents
function ItemInstance:getItem() end
