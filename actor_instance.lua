---@meta _

--- TODO
---
---@class ActorInstance: Instance
local ActorInstance = {}

--- Gets the direction the instance is facing.
--- Usually used alongside the `fireBullet` method.
---
---@return 0|180 angle `0` for facing `right`, `180` for facing `left`
function ActorInstance:getFacingDirection() end

DAMAGER_NO_RECALC = 1     -- TODO
DAMAGER_NO_PROC = 2       -- TODO
DAMAGER_BULLET_PIERCE = 4 -- TODO

--- FIXME: Is this worth it?
---
---@alias FireBulletProperties
---| `DAMAGER_NO_RECALC` TODO
---| `DAMAGER_NO_PROC` TODO
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC` TODO
---| `DAMAGER_BULLET_PIERCE` TODO
---| `DAMAGER_NO_RECALC + DAMAGER_BULLET_PIERCE` TODO
---| `DAMAGER_NO_PROC + DAMAGER_BULLET_PIERCE` TODO
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC + DAMAGER_BULLET_PIERCE` TODO

--- TODO
---
---@param x number TODO
---@param y number TODO
---@param direction number TODO
---@param distance number TODO
---@param damage number TODO
---@param hitSprite? Sprite TODO
---@param properties? FireBulletProperties TODO
---@return DamagerInstance
function ActorInstance:fireBullet(x, y, direction, distance, damage, hitSprite, properties) end

--- FIXME: Is this worth it?
---
---@alias FireExplosionProperties
---| `DAMAGER_NO_RECALC` TODO
---| `DAMAGER_NO_PROC` TODO
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC` TODO

--- TODO
---
---@param x number TODO
---@param y number TODO
---@param width number TODO
---@param height number TODO
---@param damage number TODO
---@param explosionSprite? Sprite TODO
---@param hitSprite? Sprite TODO
---@param properties? FireExplosionProperties TODO
---@return DamagerInstance
function ActorInstance:fireExplosion(x, y, width, height, damage, explosionSprite, hitSprite, properties) end

--- TODO
---
---@param key string TODO
---@return Sprite
function ActorInstance:getAnimation(key) end

--- TODO
---
---@param key string TODO
---@param sprite Sprite TODO
function ActorInstance:setAnimation(key, sprite) end

--- TODO
---
---@param args table<string, Sprite> TODO
function ActorInstance:setAnimations(args) end

--- TODO
---
---@param buff Buff TODO
---@param duration number TODO
function ActorInstance:applyBuff(buff, duration) end

--- TODO
---
---@param buff Buff TODO
function ActorInstance:removeBuff(buff) end

--- TODO
---
---@param buff Buff TODO
---@return boolean
function ActorInstance:hasBuff(buff) end

--- TODO
---
---@param buff Buff TODO
---@return number
function ActorInstance:getBuffTime(buff) end

--- TODO
---
---@return Buff[]
function ActorInstance:getBuffs() end

--- TODO
---
---@return EliteType
function ActorInstance:getElite() end

--- TODO
---
---@param type? EliteType TODO
---@return boolean actorChanged TODO
function ActorInstance:makeElite(type) end

--- TODO
---
---@return number?
function ActorInstance:getBlighted() end

--- TODO
---
---@param type? number TODO
---@return boolean actorChanged TODO
function ActorInstance:makeBlighted(type) end

--- TODO
function ActorInstance:kill() end

--- TODO
---
---@return boolean
function ActorInstance:isClassic() end

--- TODO
---
---@return boolean
function ActorInstance:isBoss() end
