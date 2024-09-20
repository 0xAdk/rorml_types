---@meta _

--- A `DamagerInstance` is any instance of a bullet or explosion.
---
---@class DamagerInstance: Instance
local DamagerInstance = {}


--- # Example
---   Get the instance which spawned the damager stored in explosion.
---   ```lua
---   local parent = explosion:getParent()
---   ```
---
---@return Instance? '' The instance that created the damager
function DamagerInstance:getParent() end

--- # Example
---   Set the local variable direction to 90 if the instance in damager is an explosion,
---   otherwise sets it to the bullet's direction.
---   ```lua
---   local direction
---   if damager:isExplosion() then
---       direction = 90
---   else
---       direction = damager:get("direction")
---   end
---   ```
---
---@return boolean '' true: if the instance is an explosion, false: if it's a bullet
function DamagerInstance:isExplosion() end

--- Used to get the damager instance's mod data table.
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
---@return DamagerInstanceModData '' The mod-specific unique data table for the damager instance
function DamagerInstance:getData() end
