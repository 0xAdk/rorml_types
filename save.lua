---@meta _

--- The `save` module provides a simple way of writing custom values to the save file.
save = {}

---@alias Mod string

---@alias SaveType
---| number
---| string
---| boolean
---| nil

--- Writes a value to the user's save file.
---
--- This is limited in scope to the current mod and will not overwrite values saved by other mods.
---
--- # Example
---   Keep track of the total number of runs the player has had with the mod active.
---   ```lua
---   local runCount = save.read("runCount")
---   if runCount == nil then
---       runCount = 0
---   end
---
---   callback.register("onGameStart", function()
---       runCount = runCount + 1
---       save.write("runCount", runCount)
---   end)
---   ```
---
---@param key string The name of the save key to write
---@param value SaveType The value that will be written to the save
function save.write(key, value) end

--- Reads a value from the user's save file.
---
--- This is limited in scope to the current mod and will not return values saved by other mods.
---
---@param key string The name of the save key to read
---@return SaveType value The value in the save file. *if no value exists nil is returned*
function save.read(key) end

--- Writes a value to the user's save file.
---
--- This is used to write to the save data of other mods. The mod's internal name is used to identify it.
---
---@param mod Mod The internal name of the mod to write to. *case insensitive*
---@param key string the name of the save key to write
---@param value savetype the value that will be written to the save
function save.writemod(mod, key, value) end

--- reads a value from the user's save file.
---
--- this is used to read from the save data of other mods. the mod's internal name is used to identify it.
---
---@param mod mod the internal name of the mod to read from. *case insensitive*
---@param key string the name of the save key to read
---@return savetype value the value in the save file. *if no value exists nil is returned*
function save.readmod(mod, key) end

--- returns a list of all of the keys in a mod's save data.
---
--- # Example
---   Print all save keys of the current mod alongside their values.
---   ```lua
---   local keys = save.getKeys()
---   for _, v in ipairs(keys) do
---       print(v, save.read(v))
---   end
---   ```
---
---@param mod? Mod the internal name of the mod to read keys from. *case insensitive*, *defaults to the current mod*
---@return string[] keys A numerically indexed table of all the keys
function save.getKeys(mod) end

--- Returns a list of all mods with save data in lowercase.
---
--- # Example
---   Read in all saved mod data and print it to the console.
---   ```lua
---   local mods = save.getMods()
---   local data = {}
---   for _, m in ipairs(mods) do
---       data[m] = {}
---       local keys = save.getKeys(m)
---       for _, v in ipairs(keys) do
---           data[m][v] = save.readMod(m, v)
---       end
---   end
---   print(data)
---   ```
---
---@return Mod[] mods A numerically indexed table of mod internal names. *all lowercase*
function save.getMods() end
