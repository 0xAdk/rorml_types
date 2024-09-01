---@meta _

--- The `misc` module is used to manipulate some miscellaneous game functionality.
misc = {}


--- An array table containing each [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html) in order.
---
--- This table is updated at the start of every run.
---
--- # Example
---   Print the name of each player.
---   ```lua
---   for _, v in ipairs(misc.players) do
---           print(v:get("name"))
---   end
---   ```
---
---@type PlayerInstance[]
misc.players = {}

--- Contains an [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the HUD [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) not otherwise accessible.
--- This field is replaced at the start of every run.
---
--- For a list of the instance’s variables, see the page on [common variables](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/variables.html#hud-fields).
---
--- # Example
---   Hide the part of the HUD that displays the player’s gold.
---   ```lua
---   misc.hud:set("show_gold", 0)
---   ```
---
---@type Instance
misc.hud = nil

--- Alias for `misc.hud`
misc.HUD = misc.hud

--- Contains an [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html) of the director [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) not otherwise accessible.
--- This field is replaced at the start of every run.
---
--- For a list of the instance’s variables, see the page on [common variables](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/variables.html#director-fields).
---
--- # Example
---   Increase the strength of enemies by 30% of their starting strength.
---   ```lua
---   misc.director:set("enemy_buff", director:get("enemy_buff") + 0.3)
---   ```
---
---@type Instance
misc.director = nil


---@alias ConfigOption
---|-- video
---| 'video.quality' [number] The graphics quality. 1: low, 2: medium, 3: high
---| 'video.fullscreen' [boolean] Whether the game is in fullscreen mode
---| 'video.scale' [number] The currently selected zoom scale.
---| 'video.hud_scale' [number] The currently selected HUD scale. Usually the same as video.scale. Can only be set through the console
---| 'video.show_money' [boolean] When set to false coins and exp are hidden. Can only be set through the console
---| 'video.show_damage' [boolean] When set to false damage indicators are not created
---| 'video.frameskip' [boolean] When set to true draw events are only called every other frame
---| 'video.vsync' [boolean] Whether vertical synchronization is enabled
---|
---|-- volume
---| 'general.volume' [number] The sound effects volume. *ranges from 0 to 1*
---| 'general.music volume' [number] The music volume. *ranges from 0 to 1*

--- Gets the value of one of the game’s configuration options.
---
--- # Example
---   Check if the graphics quality is set to high and then does something.
---   Useful for allowing the player to disable expensive visual effects.
---   ```lua
---   if misc.getOption("video.quality") == 3 then
---       -- Do something
---   end
---   ```
---
---@param name ConfigOption The option to get
---@return boolean|number
function misc.getOption(name) end

--- # Example
---   Check if the player has at least 1000 gold and then do something.
---   ```lua
---   if misc.getGold() >= 1000 then
---       -- Do something
---   end
---   ```
---
---@return number '' the amount of gold the player has
function misc.getGold() end

--- Sets the amount of gold the player has.
---
--- # Example
---   Increase the player’s gold by 10.
---   ```lua
---   misc.setGold(misc.getGold() + 10)
---   ```
---
---@param value number The value to set the player’s gold to
function misc.setGold(value) end

--- # Example
---   Check to make sure time isn’t stopped before executing code. Useful for custom enemy behavior.
---   ```lua
---   if misc.getTimeStop() == 0 then
---           -- Do something
---   end
---   ```
---
---@return number '' The remaining frames time is stopped for. *0 if time isn’t stopped*
function misc.getTimeStop() end

--- When time is stopped, enemies are frozen and a ticking sound is played.
---
--- This mechanic is used in the base game by the items Unstable Watch and Time Keeper’s Secret.
---
--- # Example
---   Stop time for 6 seconds.
---   ```lua
---   misc.setTimeStop(6 * 60)
---   ```
---
---@param value number The number of steps to stop time for
function misc.setTimeStop(value) end

--- Get the time on the in-game clock.
---
--- # Example
---   Do something when the time displayed on the clock is 20:20.
---   ```lua
---   local m, s = misc.getTime()
---   if m == 20 and s == 20 then
---       -- Do something
---   end
---   ```
---
---@return number minutes, number seconds
function misc.getTime() end

--- Causes screenshake for the specified number of frames.
---
---@param frames number The number of frames to shake the screen for
function misc.shakeScreen(frames) end

--- Creates a hitscan bullet.
---
--- This function is similar to the [ActorInstance:fireBullet()](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html#actorinstance-bullet) method with a few key differences:
--- * Exact damage is specified
--- * Team is specified
--- * This function can be called without an actor
---
--- Example
---   Fire a bullet from the position (`x`, `y`) traveling 400 pixels left, dealing 30 damage, and on the team `neutral`.
---   ```lua
---   misc.fireBullet(x, y, 180, 400, 30, "neutral", hitSprite)
---   ```
---
---@param x number Horizontal origin of the bullet
---@param y number Vertical origin of the bullet
---@param direction number Direction the bullet "travels" in
---@param distance number Max distance of the bullet
---@param damage number Damage of the bullet
---@param team string The team to create the bullet on. Usually `player`, `enemy`, or `neutral`
---@param hitSprite? Sprite The sprite of the sparks spawned when the damager hits something, *if nil sparks won’t be created*
---@ TEST: saturn's docs says this is the only property that is supported...
---@       but there is a good chance that is wrong.
---@param properties? `DAMAGER_BULLET_PIERCE` A combination of damager property constants, as seen below, added together
---@return DamagerInstance The created [DamagerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
function misc.fireBullet(x, y, direction, distance, damage, team, hitSprite, properties) end

--- Creates an explosion.
---
--- This function is similar to the [ActorInstance:fireExplosion](https://saturnyoshi.gitlab.io/RoRML-Docs/class/actorInstance.html#actorinstance-explosion) method with a few key differences:
--- * Exact damage is specified
--- * Team is specified
--- * This function can be called without an actor.
---
--- # Example
---   Fire an explosion from the instance `target` on the `player` team which deals 25 damage.
---   ```lua
---   misc.fireExplosion(target.x, target.y, 3, 1.5, 25, "player", explosionSprite, hitSprite)
---   ```
---
---@param x number Horizontal origin of the explosion
---@param y number Vertical origin of the explosion
---@param width number The width of the explosion, as a multiple of 19
---@param height number The height of the explosion, as a multiple of 4
---@param damage number The damage of the explosion.
---@param team string The team to create the explosion on. Usually `player`, `enemy`, or `neutral`
---@param explosionSprite? Sprite The animation used by the explosion itself, *if nil then the explosion won’t be visible*
---@param hitSprite? Sprite The sprite of the sparks spawned when the damager hits something, *if nil sparks won’t be created*
---@ TEST: saturn's docs include that this function has a properties field,
---@       but dont give valid values. I am going to assume it's the same
---@       as ActorInstance:fireExplosion()
---@param properties? FireBulletProperties The created [DamagerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html)
---@return DamagerInstance
function misc.fireExplosion(x, y, width, height, damage, team, explosionSprite, hitSprite, properties) end

--- Creates damage text.
---
--- # Example:
---   Create a damage text displaying the number 200 in the color orange.
---   ```lua
---   misc.damage(200, target.x, target.y, false, Color.ORANGE)
---   ```
---
---@param damage number The value to be displayed in the damage text
---@param x number The x position for the damage text to be created at
---@param y number The y position for the damage text to be created at
---@param critical boolean Whether the damage text should appear like a critical hit does or not
---@param color Color The [Color](https://saturnyoshi.gitlab.io/RoRML-Docs/class/color.html) of the damage text
function misc.damage(damage, x, y, critical, color) end

--- Sets the level seed of the next run.
---
--- The seed determines the level and location of objects but does not currently affect item RNG.
---
---@param seed? number *must be an integer value greater than 0*
function misc.setRunSeed(seed) end

---@return boolean '' false when called in menus, otherwise true
function misc.getIngame() end
