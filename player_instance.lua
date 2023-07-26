---@meta _

--- TODO
---
---@class PlayerInstance: ActorInstance
---@field playerIndex number TODO
---@field useItem Item TODO
local PlayerInstance = {}

--- TODO
---
---@return Survivor
function PlayerInstance:getSurvivor() end

--- TODO
---
---@param name string TODO
---@return PressStatus
function PlayerInstance:control(name) end

--- TODO
---
---@param noCooldown? boolean TODO
---@param item? Item TODO
function PlayerInstance:activateUseItem(noCooldown, item) end

--- TODO
---
---@param item Item TODO
---@param count? number TODO
function PlayerInstance:giveItem(item, count) end

--- TODO
---
---@param item Item TODO
---@return number
function PlayerInstance:countItem(item) end

--- TODO
---
---@param item Item TODO
---@param count? number TODO
function PlayerInstance:removeItem(item, count) end

--- TODO
---
---@param item Item TODO
---@param sprite Sprite TODO
function PlayerInstance:setItemSprite(item, sprite) end

--- TODO
---
---@param item Item TODO
---@param text string TODO
function PlayerInstance:setItemText(item, text) end

--- TODO
---
---@param health number TODO
---@param damage number TODO
---@param regen number TODO
function PlayerInstance:survivorSetInitialStats(health, damage, regen) end

--- TODO
---
---@param health number
---@param damage number
---@param regen number
---@param armor number
function PlayerInstance:survivorLevelUpStats(health, damage, regen, armor) end

--- TODO
---
---@param index number TODO
---@param sprite Sprite TODO
---@param speed number TODO
---@param scaleSpeed boolean TODO
---@param resetHSpeed boolean TODO
function PlayerInstance:survivorActivityState(index, sprite, speed, scaleSpeed, resetHSpeed) end

--- TODO
---
---@param damageMultiplier? number TODO
---@return DamagerInstance _ TODO: not sure if this is the correct type
function PlayerInstance:survivorFireHeavenCracker(damageMultiplier) end

--- TODO
---
---@param index number TODO
function PlayerInstance:activateSkillCooldown(index) end

--- TODO
---
---@param index number TODO
---@param name string TODO
---@param desc string TODO
---@param sprite Sprite TODO
---@param subimage number TODO
---@param cooldown number TODO
function PlayerInstance:setSkill(index, name, desc, sprite, subimage, cooldown) end

--- TODO
---
---@param index number TODO
---@param sprite Sprite TODO
---@param subimage number TODO
function PlayerInstance:setSkillIcon(index, sprite, subimage) end
