---@meta _

--- The `ActorInstance` class is used to manipulate instances of characters in the game world.
---
--- `ActorInstance` inherits all functionality from [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html).
---
--- It provides no additional fields, but a variety of useful methods.
---
---@class ActorInstance: Instance
local ActorInstance = {}

--- Gets the direction the instance is facing.
--- Usually used alongside the `fireBullet` method.
---
---@return 0|180 angle `0` for facing `right`, `180` for facing `left`
function ActorInstance:getFacingDirection() end

DAMAGER_NO_RECALC = 1     -- When this flag is set, the damager's displayed damage will not be randomized and the bullet cannot be a critical hit.
DAMAGER_NO_PROC = 2       -- The damager won’t proc on-hit item effects when this flag is set; Such as Sticky Bomb or Ifrit’s Horn.
DAMAGER_BULLET_PIERCE = 4 -- Allows the damager to pierce through any number of enemies, like the Commando’s FMJ.

--- FIXME: Is this worth it?
---
---@alias FireBulletProperties
---| `DAMAGER_NO_RECALC`
---| `DAMAGER_NO_PROC`
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC`
---| `DAMAGER_BULLET_PIERCE`
---| `DAMAGER_NO_RECALC + DAMAGER_BULLET_PIERCE`
---| `DAMAGER_NO_PROC + DAMAGER_BULLET_PIERCE`
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC + DAMAGER_BULLET_PIERCE`

--- Creates a hitscan bullet.
---
--- # Example
---     Fire a bullet originating from instance `player` with 100 range, dealing 200% damage.
---     It has no hit sprite, pierces, and doesn’t proc on-hit effects.
---
---     ```lua
---     player:fireBullet(player.x, player.y, player:getFacingDirection(), 100, 2, nil, DAMAGER_BULLET_PIERCE + DAMAGER_NO_PROC)
---     ```
---
---@param x number Horizontal origin of the bullet
---@param y number Vertical origin of the bullet
---@param direction number Direction the bullet travels in
---@param distance number Max distance the bullet can travel
---@param damage number Damage multiplier of the bullet. The final damage dealt will be the actor’s damage multiplied by this number
---@param hitSprite? Sprite The sprite of the sparks spawned when the damager hits something, *if left nil then sparks won’t be created*
---@param properties? FireBulletProperties A combination of damager property constants, as seen below, added together
---@return DamagerInstance '' The created [DamagerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function ActorInstance:fireBullet(x, y, direction, distance, damage, hitSprite, properties) end

--- FIXME: Is this worth it?
---
---@alias FireExplosionProperties
---| `DAMAGER_NO_RECALC`
---| `DAMAGER_NO_PROC`
---| `DAMAGER_NO_RECALC + DAMAGER_NO_PROC`

--- Creates an explosion.
---
--- # Example
---     Fire an explosion on the instance `inst`, with a size of 100x100, dealing 150% damage,
---     using `detonationSprite` as the explosion sprite but no hit sprite.
---
---     ```lua
---     inst:fireExplosion(inst.x, inst.y, 100/19, 100/4, 1.5, detonationSprite, nil, BULLET_NO_RECALCULATE)
---     ```
---
---@param x number Horizontal origin of the explosion
---@param y number Vertical origin of the explosion
---@param width number The width of the explosion, as a multiple of 19
---@param height number The height of the explosion, as a multiple of 4
---@param damage number Damage multiplier of the explosion. The final damage dealt will be the actor’s damage multiplied by this number
---@param explosionSprite? Sprite The animation used by the explosion itself, *if left nil then the explosion won’t be visible*
---@param hitSprite? Sprite The sprite of the sparks spawned when the damager hits something, *if left nil then sparks won’t be created*
---@param properties? FireExplosionProperties A combination of damager property constants, as seen below, added together
---@return DamagerInstance '' The created [DamagerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function ActorInstance:fireExplosion(x, y, width, height, damage, explosionSprite, hitSprite, properties) end



---@alias AnimationKey
---| string
---| 'idle'      The sprite displayed when the actor is idle
---| 'walk'      The sprite displayed when the actor is walking.
---| 'jump'      The sprite displayed when the actor is jumping.
---| 'climb'     Only applies to players. Sprite used when climbing ropes.
---| 'death'     The animation played when the actor dies. The first frame is also used when the actor takes knockback.
---| 'dead'      Only applies to players. Alias for `'death'` key
---| 'shoot1'    The sprite used for the 1st skill
---| 'shoot2'    The sprite used for the 2nd skill
---| 'shoot3'    The sprite used for the 3rd skill
---| 'shoot4'    The sprite used for the 4th skill
---| 'shoot1_1'  The 1st sprite used for the 1st skill
---| 'shoot1_2'  The 2nd sprite used for the 1st skill
---| 'shoot1_3'  The 3rd sprite used for the 1st skill
---| 'shoot2_1'  The 1st sprite used for the 2nd skill
---| 'shoot2_2'  The 2nd sprite used for the 2nd skill
---| 'shoot2_3'  The 3rd sprite used for the 2nd skill
---| 'shoot3_1'  The 1st sprite used for the 3rd skill
---| 'shoot3_2'  The 2nd sprite used for the 3rd skill
---| 'shoot3_3'  The 3rd sprite used for the 3rd skill
---| 'shoot4_1'  The 1st sprite used for the 4th skill
---| 'shoot4_2'  The 2nd sprite used for the 4th skill
---| 'shoot4_3'  The 3rd sprite used for the 4th skill

--- Gets one of the actor’s animations.
---
--- # Example
---     Get the walk sprite of instance `lemurian`.
---
---     ```lua
---     local walk = lemurian:getAnimation("walk")
---     ```
---
---@param key AnimationKey The key to check for
---@return Sprite
function ActorInstance:getAnimation(key) end

--- Sets one of the actor’s animations.
---
--- # Example
---     Set the walk sprite of instance `lemurian` to the sprite stored in `customWalk`.
---
---     ```lua
---     lemurian:setAnimation("walk", customWalk)
---     ```
---
---@param key AnimationKey The key to set the sprite for
---@param sprite Sprite The sprite to set the key to
function ActorInstance:setAnimation(key, sprite) end

--- Sets multiple of the actor’s animations at the same time.
---
--- # Example
---     Set both the walk and idle animations of the instance `lemurian` to those
---     stored in the variables `customWalk` and `customIdle`.
---
---     ```lua
---     lemurian:setAnimations{walk = customWalk, idle = customIdle}
---     ```
---
---@param args table<AnimationKey, Sprite> A table of animation keys and sprite pairs to set
function ActorInstance:setAnimations(args) end

--- Applies a [Buff](https://saturnyoshi.gitlab.io/RoRML-Docs/class/buff.html) to the instance.
---
--- Applying a buff already active on the instance will extend the timer.
---
--- # Example
---     Apply the buff `someBuff` to the instance `player` for 3 seconds.
---
---     ```lua
---     player:applyBuff(someBuff, 60 * 3)
---     ```
---
---@param buff Buff The buff to apply
---@param duration number The duration of the buff in frames
function ActorInstance:applyBuff(buff, duration) end

--- Removes a [Buff](https://saturnyoshi.gitlab.io/RoRML-Docs/class/buff.html) from the instance.
---
--- # Example
---     Remove the buff `someBuff` from the instance `player`.
---
---     ```lua
---     player:removeBuff(someBuff)
---     ```
---
---@param buff Buff The type of buff to remove
function ActorInstance:removeBuff(buff) end

--- Checks whether an instance is affected by a [Buff](https://saturnyoshi.gitlab.io/RoRML-Docs/class/buff.html).
---
--- # Example
---     Do something if the instance `actor` has the buff `someBuff`.
---
---     ```lua
---     if actor:hasBuff(someBuff) then
---         -- Do something
---     end
---     ```
---
---@param buff Buff The type of buff to check for.
---@return boolean '' true if the instance is affected by the buff otherwise false
function ActorInstance:hasBuff(buff) end

--- TODO
---
---@param buff Buff TODO
---@return number
function ActorInstance:getBuffTime(buff) end

--- Gets all the [Buffs](https://saturnyoshi.gitlab.io/RoRML-Docs/class/buff.html) affecting the instance.
---
--- # Example
---     Loop over the buffs a player has and do something for each.
---
---     ```lua
---     for _, buff in ipairs(player:getBuffs()) do
---     	-- Do something
---     end
---     ```
---
---@return Buff[] '' A list of Buff objects
function ActorInstance:getBuffs() end

---@return EliteType '' The enemy’s [EliteType](https://saturnyoshi.gitlab.io/RoRML-Docs/class/eliteType.html) if one is applied, otherwise returns nil
function ActorInstance:getElite() end

--- Applies an [EliteType](https://saturnyoshi.gitlab.io/RoRML-Docs/class/eliteType.html) to the instance.
---
--- If the enemy is already elite or blighted then this method won’t do anything.
---
--- For the elite type to be applied, it must be available in the actor’s spawn elites.
---
--- # Examples
---     Make a `golem` a random elite from its list of available elite types.
---
---     ```lua
---     golem:makeElite()
---     ```
---
---
---     Make the `golem` an overloading elite, provided it’s allowed to be one normally.
---
---     ```lua
---     local overloading = EliteType.find("Overloading", "Vanilla")
---     golem:makeElite(overloading)
---     ```
---
---@param type? EliteType The elite type to apply to the enemy. *if nil the enemy will be assigned a random type from its available types*
---@return boolean actorChanged true if the actor was changed, otherwise false
function ActorInstance:makeElite(type) end

---@return number? '' The blighted enemy’s type if one is applied, otherwise nil
function ActorInstance:getBlighted() end

--- Transforms an enemy into a blighted version.
---
--- If the enemy is already elite or blighted then this method won’t do anything.
---
--- For the enemy to become blighted, it must be able to spawn blighted under normal circumstances.
--- The blighted enemy’s type is represented by a single number generated by multiplying primes together to define its traits.
---
--- Each prime and associated effect is as follows:
---
---     | Prime | Effect                                                              |
---     |-------|---------------------------------------------------------------------|
---     | 3     | (Blazing) The enemy gains a fire trail.                             |
---     | 5     | (Frenzied) The enemy gains 30% attack speed and 25% movement speed. |
---     | 7     | (Leeching) The enemy gains 50 lifesteal.                            |
---     | 11    | (Overloading) The enemy gains on-hit lightning.                     |
---     | 13    | (Volatile) The enemy gains explosive attacks.                       |
---
--- # Examples
---     Make the `wisp` a random blighted enemy type.
---
---     ```lua
---     wisp:makeBlighted()
---     ```
---
---
---     Make the `wisp` a blighted enemy with all effects. Normally blighted enemies
---     only spawn with 2, but there’s no limit to how many can be provided.
---
---     ```lua
---     golem:makeElite(3 * 5 * 7 * 11 * 13)
---     ```
---
---@param type? number The blight type as explained above. *if nil is provided, a random type will be generated from 2 of the primes*
---@return boolean actorChanged true if the actor was changed, otherwise false
function ActorInstance:makeBlighted(type) end

--- Kills the actor.
---
--- # Example
---     Kill the instance `lemurian`.
---
---     ```lua
---     lemurian:kill()
---     ```
---
function ActorInstance:kill() end

--- Used to check whether the actor is a “classic” type actor.
---
--- Classic actors are those which can walk across the map and be knocked down ledges,
--- such as Lemurians, Golems, Players, and Imp Overlords.
---
---@return boolean
function ActorInstance:isClassic() end

--- Used to check whether the actor is a boss.
---
---@return boolean
function ActorInstance:isBoss() end
