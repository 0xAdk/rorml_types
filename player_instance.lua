---@meta _

--- The `PlayerInstance` class is a subclass of the `ActorInstance` class used to manipulate players.
---
--- `PlayerInstance` inherits all functionality from [ActorInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html) and [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html).
---
---@class PlayerInstance: ActorInstance
---@field playerIndex number **[Read only]** The slot of the player
---@field useItem? Item The player’s current use item
local PlayerInstance = {}

--- # Example
---     Print the display name of `player`’s selected character.
---
---     ```lua
---     print(player:getSurvivor().displayName)
---     ```
---
---@return Survivor '' The [Survivor](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html) object of the player’s selected character
function PlayerInstance:getSurvivor() end

--- Used to check the press status of one of the player’s inputs.
---
--- Functionally the same as [input.checkControl](https://saturnyoshi.gitlab.io/RoRML-Docs/global/input.html#input-check-control).
---
--- # Example
---     Do something as long as `player` is holding their left key.
---
---     ```lua
---     if player:control("left") == input.HELD then
---         -- Do something
---     end
---     ```
---
---@param name PlayerControl The control to check. *case insensitive*
---@return PressStatus '' The press status of the control
function PlayerInstance:control(name) end

--- Activates either the player’s use item or a specified usable [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html).
---
--- Optionally the use cooldown will not be applied to the player.
---
---@param noCooldown? boolean When set to true the use item’s cooldown will not be activated. *defaults to false*
---@param item? Item The item to activate. *defaults to the player’s use item*
function PlayerInstance:activateUseItem(noCooldown, item) end

--- Gives the player a certain amount of a specified [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html).
---
--- # Example
---     Give `player` 3 of the item `infusion`
---
---     ```lua
---     player:giveItem(infusion, 3)
---     ```
---
---@param item Item The item to give the player
---@param count? number The amount of the item to give the player. *defaults to 1*
function PlayerInstance:giveItem(item, count) end

--- Used to get the player’s current stack of a specific [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html).
---
--- Useful for simple item effects.
---
--- # Example
---     Do something if `player` has at least 3 `infusion`s.
---
---     ```lua
---     if player:countItem(infusion) >= 3 then
---         -- Do something
---     end
---     ```
---
---@param item Item The item to get the stack of
---@return number '' The stack of the specified item
function PlayerInstance:countItem(item) end

--- Removes or takes from the stack of an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) on the player’s HUD.
---
--- Keep in mind that this function does not actually reverse the item’s effects and that needs to be handled manually.
---
--- # Example:
---     Check if `player` has any of the item `infusion` and if they do takes one away.
---
---     ```lua
---     if player:countItem(infusion) >= 1 then
---         -- Remove the item from the player's HUD
---         player:removeItem(infusion)
---         -- Subtract from the player's "hp_after_kill" variable to remove the effect
---         player:set("hp_after_kill", player:get("hp_after_kill") - 1)
---     end
---     ```
---
---     The `removeItem` method doesn’t remove the effects itself, so the player’s `hp_after_kill` variable is subtracted to reverse the effects of the item.
---
---@param item Item The item to remove from the HUD
---@param count? number The stack to take. *defaults to 1*
function PlayerInstance:removeItem(item, count) end

--- Sets the sprite of an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) on the player’s HUD.
--- If the player does not already have the item, this method will do nothing.
---
---@param item Item The item to set the sprite of
---@param sprite Sprite The new sprite for the item to use
function PlayerInstance:setItemSprite(item, sprite) end

--- Sets the text which is displayed when the cursor is hovered over an [Item](https://saturnyoshi.gitlab.io/RoRML-Docs/class/item.html) on the player’s HUD.
--- If the player does not already have the item, this method will do nothing.
---
--- # Example
---     Set both the sprite and text of the item `someItem` on the player’s HUD.
---
---     ```lua
---     player:setItemSprite(someItem, itemCharging)
---     player:setItemText(someItem, "This item is recharging.")
---     ```
---
---@param item Item The item to set the sprite of
---@param text string The new text for the item to use.
function PlayerInstance:setItemText(item, text) end

--- Used to set the starting stats of custom survivors.
---
--- Automatically adjusts values for the glass artifact and for extra health and regen in Drizzle mode.
---
--- Should be called in the [Survivor’s](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html) `init` callback.
---
--- # Example
---     Set the player’s health, damage, and regen stats to 110, 12, and 0.01 respectively, matching the Commando.
---
---     ```lua
---     player:survivorSetInitialStats(110, 12, 0.01)
---     ```
---@param health number The value to set the player’s health to
---@param damage number The value to set the player’s damage to
---@param regen number The value to set the player’s health regeneration to
function PlayerInstance:survivorSetInitialStats(health, damage, regen) end

--- Used to add to the player’s stats when they level up.
---
--- Automatically adjusts values for the glass artifact.
---
--- Should be called in the [Survivor’s](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html) `levelUp` callback.
---
--- # Example
---     Increase the player’s stats, matching the level up stats of the Commando.
---
---     ```lua
---     player:survivorLevelUpStats(32, 3, 0.002, 2)
---     ```
---
---@param health number The value to increase the player’s health by
---@param damage number The value to increase the player’s damage by
---@param regen number The value to increase the player’s health regeneration by
---@param armor number The value to increase the player’s armor by
function PlayerInstance:survivorLevelUpStats(health, damage, regen, armor) end

--- Used to make custom skills, putting the player into a state which automatically ends when the animation is finished.
---
--- Called in the [Survivor’s](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html) `useSkill` callback.
---
---@param index number The activity state ID. *1 to 4 inclusive*
---@param sprite Sprite The player’s animation used in the attack
---@param speed number The animation speed of the sprite. Usually around 0.25 for 15 frames per second
---@param scaleSpeed boolean Whether to multiply the animation speed by the player’s attack speed. Most attacks use this but some abilities like the Commando’s roll do not
---@param resetHSpeed boolean Whether to automatically set the player’s movement speed to 0 when they’re on the ground. Used by almost any ability where the player is unable to control the character during the animation
function PlayerInstance:survivorActivityState(index, sprite, speed, scaleSpeed, resetHSpeed) end



--- Used to control when the Heaven Cracker item is triggered.
---
--- Fires a bullet after being called a specific number of times, provided the player has the Heaven Cracker item.
--- The number of calls required to fire a bullet is 5 minus the item’s stack.
---
--- If the player doesn’t have the Heaven Cracker item then this method always returns nil.
---
---@param damageMultiplier? number The damage multiplier of a successful attack. *defaults to 1*
---@return DamagerInstance _ The fired bullet when successful, otherwise nil (FIXME: not sure if this is the correct type)
function PlayerInstance:survivorFireHeavenCracker(damageMultiplier) end

--- Activates one of the player’s skill cooldowns as if the ability was just used.
---
--- # Example
---     Put all 4 of `player`’s skills on cooldown simultaneously.
--- 
---     ```lua
---     for i = 1, 4 do
---             player:activateSkillCooldown(i)
---     end
---     ```
---
---@param index number The index of the skill to put on cooldown, *1 to 4 inclusive*
function PlayerInstance:activateSkillCooldown(index) end

--- Used to set all the information about a skill, including its name, description, icon, and cooldown.
---
--- Usually only used when creating a custom [Survivor](https://saturnyoshi.gitlab.io/RoRML-Docs/class/survivor.html), but may be used for any purpose outside of that.
---
--- # Example
---     Set the information for `player`’s second ability to match the Commando’s second ability.
--- 
---     ```lua
---     player:setSkill(2,
---         "Full Metal Jacket",
---         "Shoot a bullet that passes through enemies for 230% damage, knocking them back.",
---         Sprite.find("GManSkills", "Vanilla"), 1,
---         3 * 60
---     )
---     ```
---
---@param index number The index of the skill to set the information of, *1 to 4 inclusive*
---@param name string The name to give the skill
---@param desc string The description to give the skill. Visible when the mouse is hovered over the skill on the HUD
---@param sprite Sprite The icon sprite to give the skill. Each icon is 18x18 with the origin placed at the top left of the sprite
---@param subimage number The subimage of the icon sprite to use
---@param cooldown number The cooldown of the skill, in frames
function PlayerInstance:setSkill(index, name, desc, sprite, subimage, cooldown) end

--- Used to set the icon of a skill.
---
--- A stripped down version of the main `setSkill` method. Useful for changing the icon of a skill to reflect its state, like the Mercenary’s multiple third skill uses, or the Engineer’s rechargable mines.
---
---@param index number The index of the skill to set the information of, *1 to 4 inclusive*
---@param sprite Sprite The new icon sprite to give the skill. Each icon is 18x18 with the origin placed at the top left of the sprite
---@param subimage number The new subimage of the icon sprite to use
function PlayerInstance:setSkillIcon(index, sprite, subimage) end
