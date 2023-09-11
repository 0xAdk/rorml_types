---@meta _

--- A `DamagerInstance` is any instance of a bullet or explosion.
---
---@class DamagerInstance: Instance
local DamagerInstance = {}


--- # Example
---     Get the instance which spawned the damager stored in explosion.
---
---     ```lua
---     local parent = explosion:getParent()
---     ```
---
---@return Instance? '' The instance that created the damager
function DamagerInstance:getParent() end

--- # Example
---     Set the local variable direction to 90 if the instance in damager is an explosion,
---     otherwise sets it to the bullet’s direction.
---
---     ```lua
---     local direction
---     if damager:isExplosion() then
---         direction = 90
---     else
---         direction = damager:get("direction")
---     end
---     ```
---
---@return boolean '' true: if the instance is an explosion, false: if it’s a bullet
function DamagerInstance:isExplosion() end
