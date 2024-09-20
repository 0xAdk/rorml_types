---@meta _

--- An Instance is anything in the game world which can be interacted with or interacts with other instances.
---
--- Instances can be created and accessed via their respective [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html).
---
--- There are multiple subclasses to the Instance class. Their differences are documented at the bottom of this page.
---
--- **Note**: Attempting to access instances which have already been destroyed will result in an error;
---       the `isValid` method can be used to ensure an instance still exists before accessing it.
---
--- **WARNING**: Attempting to access an instance during game load is prohibited and will result in an error.
---
---@class Instance
---@field sprite Sprite The sprite the instance is currently displaying
---@field mask Sprite|nil The sprite used by the instance for collision checking. Appearance modifying fields (like xscale or angle) also apply to the mask
---@field blendColor Color Value the sprite's colour is multiplied by when rendering
---@field blendColour Color alias for `blendColor`
---@field xscale number Multiplier for the sprite's horiontal size
---@field yscale number Multiplier for the sprite's vertical size
---@field angle number Rotation of the sprite in degrees
---@field alpha number The transparency of the sprite, from 1 to 0
---@field spriteSpeed number The speed the instance's sprite will be played at. A value of 1 is 60 FPS, 0.5 is 30, etc
---@field subimage number The current displayed frame of the instance's sprite. *starts at 1*
---@field depth number Controls what the instance will be rendered in front or behind of. Instances are rendered from highest to lowest depth
---@field visible number When set to false the instance's rendering will be disabled
---@field x number The horizontal position of the instance in the room
---@field y number The vertical position of the instance in the room
---@field id Id The internal ID of the instance
---@field ID Id alias for `id`
local Instance = {}

--- Checks whether the instance still exists.
---
--- # Example
---   Do something if `eggplantinst` still exists.
---   ```lua
---   if eggplantinst:isValid() then
---       -- Do something
---   end
---   ```
---
---@return boolean '' true if the instance exists, false if it doesn't
function Instance:isValid() end

--- Destroys the instance.
---
--- # Example
---   Destroy a `peach` instance.
---   ```lua
---   peach:destroy()
---   ```
---
function Instance:destroy() end

--- Destroys the instance, but doesn't trigger the `destroy` event.
--- 
--- # Example
---   Destroy a `peach` instance, but doesn't trigger its `destroy` event.
---   ```lua
---   peach:delete()
---   ```
--- 
--- **WARNING**: Using this too frivolously can create issues, especially with objects that clean up after themselves in the `destroy` event.
--- 
function Instance:delete() end

--- Gets the GMObject that the instance is a type of.
--- 
--- # Example
---   Create a new `cherry` instance on top of the `cherry` instance already present.
---   ```lua
---   cherry:getObject():create(cherry.x, cherry.y)
---   ```
---
---@return GMObject
function Instance:getObject() end

--- Directly gets a variable from the instance.
---
--- Also supports variable argument count to get multiple values in a single call.
---
--- # Examples
---   Get the `pHspeed` of the instance `player`
---   ```lua
---   local speed = player:get("pHspeed")
---   ```
---
---   Get both the `pHspeed` and `pVspeed` of the instance `player`
---   ```lua
---   local hspeed, vspeed = player:get("pHspeed", "pVspeed")
---   ```
---
--- **Note**: Since booleans are stored as numbers internally, a variable which is expected to have a `true` or `false` result will instead usually return a 0 or 1.
---
---@param ... string The name of the instance variable(s) to get
---@return number|string|nil ... The value of the variable(s), as a string, number, or nil
function Instance:get(...) end

--- Directly sets a variable in the instance.
--- 
--- # Examples
---   Set the `pHspeed` of `player` to 0.
---   ```lua
---   player:set("pHspeed", 0)
---   ```
---
---   Use the chainability of the method to set both the `pHspeed` and the `pVspeed` of `player` to 0.
---   ```lua
---   player:set("pHspeed", 0):set("pVspeed", 0)
---   ```
---
---@param varName string The name of the instance variable to set
---@param value number|string|nil The value to give the variable
---@return Instance self The calling instance to allow setters to be chained
function Instance:set(varName, value) end

--- Gets the instance's associated `InstanceAccessor` object.
--- 
--- The `InstanceAccessor` class is a special class; it does not have any methods or inherent fields but instead acts as a direct interface for getting and setting variables within instances.
--- 
--- An `InstanceAccessor` can be used like a typical table, using any string as a key to get or set instance fields.
---
--- # Example
---   Increase a `timer` variable of `myInstance` by 1 each time it's ran.
---   ```lua
---   local accessor = myInstance:getAccessor()
---   accessor.timer = (accessor.timer or 0) + 1
---   ```
---
---@return InstanceAccessor '' An `InstanceAccessor` object
function Instance:getAccessor() end

--- Gets the remaining frames until an alarm is triggered.
---
--- Alarms in GameMaker are simple frame based timers.
--- There are 12 of them for each instance and they are decremented every frame until they reach 0,
--- at which point they're set to -1.
---
--- **Note**: Alarms are only usable with built-in Game Maker Objects. For modded objects you will have to use other methods.
---
--- # Example
---   Do something if the instance's 0th alarm is ticking.
---   ```lua
---   if inst:getAlarm(0) ~= -1 then
---       -- Do something
---   end
---   ```
---
---@param index number The index of the alarm. *between 0 and 11*
---@return number remaingTime the alarm's remaining time, a value of -1 means the alarm is not currently ticking
function Instance:getAlarm(index) end

--- Sets the remaining frames until an alarm is triggered.
--- 
--- Alarms in GameMaker are simple frame based timers.
--- There are 12 of them for each instance and they tick down one value every frame until they reach 0,
--- at which point they're set to -1.
---
--- **Note**: Alarms are only usable with built-in Game Maker Objects. For modded objects you will have to use other methods.
---
--- # Example
---   Set the instance's 0th alarm to half a second (30 frames).
---   ```lua
---   instance:setAlarm(0, 30)
---   ```
---
---@param index number The index of the alarm. *between 0 and 11*
---@param value number The time to set the alarm to
---@return Instance self The calling instance to allow setters to be chained
function Instance:setAlarm(index, value) end

--- Checks whether the instance would collide with another instance, or any instance of a [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html), at a position.
--- 
--- The Game Maker documentation describes this as moving the object to a new position, checking if it collides with anything there, then moving it back.
---
--- 
--- # Example
---   Check whether the `eggplant` instance is currently colliding with the other `eggplant` instance.
---   ```lua
---   if eggplant:collidesWith(othereggplant, eggplant.x, eggplant.y) then
---       -- Do something
---   end
---   ```
--- 
---   Check whether the `eggplant` instance would collide with a peach if it were to move 10 pixels upwards, and if it wouldn't, moves 10 pixels upwards.
---   ```lua
---   if not eggplant:collidesWith(peachObj, eggplant.x, eggplant.y - 10) then
---       eggplant.y = eggplant.y - 10
---   end
---   ```
---
---@param other Instance|GMObject The specific Instance or GMObject to check for collision with
---@param x number The horizontal coordinate of the position to check
---@param y number The vertical coordinate of the position to check
---@return boolean '' true if there was a collision otherwise false
function Instance:collidesWith(other, x, y) end

--- Checks whether the instance would collide with solid ground at a position.
---
--- # Example
---   This makes the `leaf` fall until it hits solid ground.
---   ```lua
---   if not leaf:collidesMap(leaf.x, leaf.y + 3) then
---           -- Move down
---   end
---   ```
---
---@param x number The horizontal coordinate of the position to check
---@param y number The vertical coordinate of the position to check
---@return boolean '' true if there was a collision otherwise false
function Instance:collidesMap(x, y) end

--- If this instance is used in networking by the vanilla game, this function can be used to easily identify it over the network.
--- If the instance is not networked then this will throw an error instead.
---
--- Networked instances include actors, map objects, and items.
---
---@return NetInstance '' A NetInstance representing the instance.
function Instance:getNetIdentity() end

--- Writes a list of all the instance's variables to a file in the logs directory.
--- Useful both as a debug tool and to find undocumented variables that can be edited.
---
--- **WARNING**: Only call this method once when you need to otherwise you'll quickly end up writing a lot to the log file.
---
---@param dumpValues? boolean When set to true the value of the variables will be written alongside the names. *defaults to false*
---@param advanced? boolean When set to true a handful of normally hidden variable names will be dumped too. These include single letter names, variables of unsupported types, and several hand-picked variables that aren't useful under normal circumstances. **Note**: there are some variables which are still hidden even with this option set to true, as you really should never touch those
function Instance:dumpVariables(dumpValues, advanced) end

--- Used to get the instance's mod data table.
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
---@return InstanceModData '' The mod-specific unique data table for the instance
function Instance:getData() end

--- Used to get the instance's data table from another mod.
---
---@param mod string The internal name of the mod to get the data from
---@return table '' The unique data table for the instance from a specific mod.
function Instance:getModData(mod) end
