---@meta _

--- The `Sound` class is used to control and play pieces of audio.
---
--- For a full list of sounds added by the base game, see [this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/vanillaSounds.html).
---
--- **Note**: Please keep in mind when using this class that audio playback is not synced to the game speed and
---       will not do anything if the volume level is at 0%. As such, the `isPlaying` method should not be used
---       to check the timing of events.
---
---@class Sound
---@field id Id The sound’s GameMaker resource ID
---@field ID Id alias for `id`
---
---@overload fun(name: string, fname: string): Sound
Sound = {}


--[[
---- static functions
--]]

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Sound
function Sound.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Sound[]
function Sound.findAll(namespace) end

--- Loads a sound from the path `fname` relative to the mod’s directory. Only `.wav` and `.ogg` files are supported.
---
--- If a name is not provided then the filename will be used.
---
--- # Examples
---   Load the file `glass.ogg` from the mod’s `sounds` folder and assign it to the variable `smash`.
---   ```lua
---   local smash = Sound.load("Smash", "sounds/glass.ogg")
---   ```
---
---   Load the file `bang.ogg` from the mod’s `sounds` folder.
---   As no name is provided, the sound will automatically be assigned the name `bang`.
---   ```lua
---   local bang = Sound.load("sounds/bang.ogg")
---   ```
---
---@param name string The name to give the sound within the current namespace
---@param fname string The path to the file, relative to the mod’s base path. *file extension is optional*
---@return Sound
function Sound.load(name, fname) end

--- Returns the currently playing music as a Sound object.
---
---@return Sound? '' The currently playing music, nil if no music is playing
function Sound.getMusic() end

--- Sets the music.
---
---@param music Sound? The sound object to use as the new music. *if nil, music will be stopped*
function Sound.setMusic(music) end

--- Used to fetch a Sound object from its GameMaker resource ID.
---
--- Useful for getting sounds from instance variables which contain a sound ID.
---
---@param id number The GameMaker ID of the sound
---@return Sound? '' The Sound if found, otherwise nil
function Sound.fromID(id) end


--[[
---- methods
--]]

--- Plays the sound.
---
--- # Examples
---   This would play the `smash` sound at the default pitch and volume.
---   ```lua
---   smash:play()
---   ```
---
---   This would play the `smash` sound at 80% pitch and 150% volume.
---   ```lua
---   smash:play(0.8, 1.5)
---   ```
---
---@param pitch number? The pitch to play the sound at. A higher pitch means a higher and faster sound, a lower pitch means a lower and slower sound. *defaults to 1*
---@param volume number? The volume to play the sound at. *defaults to 1*
function Sound:play(pitch, volume) end

--- Stops all playing instances of the sound.
---
--- # Example
---   Stop any currently playing instanecs of the `smash` sound.
---   ```lua
---   smash:stop()
---   ```
---
function Sound:stop() end

--- Returns whether any instance of the sound is currently playing.
---
--- # Example
---   Check if the sound `smash` is currently playing, and if it is, execute some code.
---   ```lua
---   if smash:isPlaying() then
---        -- Some Code
---   end
---   ```
---
---@return boolean '' true if any instances of the sound are playing, otherwise false
function Sound:isPlaying() end

--- Loops the sound, playing it repeatedly until the [`Sound:stop()`](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sound.html#sound-stop) method is called.
---
--- # Example
---   Play the `smash` sound on loop until `smash:stop()` is called.
---   ```lua
---   smash:loop()
---   ```
---
function Sound:loop() end

--- Used to effectively replace the sound when it is referenced by the base game.
---
--- **Note**: that this does not affect what sound plays when mods reference the sound.
---
---@param remap Sound? The sound to be replaced with. *if nil removes the remap*
function Sound:setRemap(remap) end

--- Used to check whether a sound has been remapped.
---
---@return '' Sound The remapped sound if applicable, otherwise nil
function Sound:getRemap() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the sound
function Sound:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the sound
function Sound:getName() end
