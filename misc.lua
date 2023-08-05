---@meta _

--- TODO
misc = {}


--- TODO
---
---@type PlayerInstance[]
misc.players = {}

--- TODO
---
---@type Instance
misc.hud = nil
misc.HUD = misc.hud

--- TODO
---
---@type Instance
misc.director = nil


--- TODO
---
---@alias ConfigOption
---|-- video
---| 'video.quality' TODO
---| 'video.fullscreen' TODO
---| 'video.scale' TODO
---| 'video.hud_scale' TODO
---| 'video.show_money' TODO
---| 'video.show_damage' TODO
---| 'video.frameskip' TODO
---| 'video.vsync' TODO
---|
---|-- volume
---| 'general.volume' TODO
---| 'general.music volume' TODO

--- TODO
---
---@param name ConfigOption TODO
---@return boolean|number
function misc.getOption(name) end

--- TODO
---
---@return number
function misc.getGold() end

--- TODO
---
---@param value number TODO
function misc.setGold(value) end

--- TODO
---
---@return number
function misc.getTimeStop() end

--- TODO
---
---@param value number TODO
function misc.setTimeStop(value) end

--- TODO
---
---@return number minutes, number seconds
function misc.getTime() end

--- TODO
---
---@param frames number TODO
function misc.shakeScreen(frames) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@param direction number TODO
---@param distance number TODO
---@param damage number TODO
---@param team string TODO
---@param hitSprite? Sprite TODO
---@ TEST: saturn's docs says this is the only property that is supported...
---@       but there is a good chance that is wrong.
---@param properties? `DAMAGER_BULLET_PIERCE` TODO
---@return DamagerInstance
function misc.fireBullet(x, y, direction, distance, damage, team, hitSprite, properties) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@param width number TODO
---@param height number TODO
---@param damage number TODO
---@param team string TODO
---@param explosionSprite? Sprite TODO
---@param hitSprite? Sprite TODO
---@ TEST: saturn's docs include that this function has a properties field,
---@       but dont give valid values. I am going to assume it's the same
---@       as ActorInstance:fireExplosion
---@param properties? FireBulletProperties TODO
---@return DamagerInstance
function misc.fireExplosion(x, y, width, height, damage, team, explosionSprite, hitSprite, properties) end

--- TODO
---
---@param damage number TODO
---@param x number TODO
---@param y number TODO
---@param critical boolean TODO
---@param color Color TODO
function misc.damage(damage, x, y, critical, color) end

--- TODO
---
---@param seed? number
function misc.setRunSeed(seed) end

--- TODO
---
---@return boolean
function misc.getIngame() end
