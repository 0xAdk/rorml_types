---@meta _

--- The `modloader` module is used to get information about the current profile and loaded mods.
modloader = {}


--- Gets the name of the currently loaded profile.
---
--- This can be used for a multitude of things.
--- Including hiding secret fun eastereggs when using special profile names.
---
--- # Example
---   Check if the profile name is `Secret Profile Name`.
---   ```lua
---   if modloader.getProfileName() == "Secret Profile Name" then
---       -- unlock secret easter egg features
---   end
---   ```
---
---@return string '' The name of the loaded profile
function modloader.getProfileName() end

--- Gets the name of the currently selected save file.
---
--- # Example
---   Print the save name.
---   ```lua
---   print("Save name: "..modloader.getSaveName())
---   ```
---
---@return string '' The name of the loaded save file
function modloader.getSaveName() end

--- Get all of the launcher defiend flags.
---
--- Flags are a way for the end user to affect mod behavior directly from the launcher.
---
--- There are several built-in flags used to toggle useful legacy behavior and bugs,
--- a full list of them can be [found here](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/flags.html).
---
--- # Example
---   Print all currently active flags to the console.
---   ```lua
---   flags = modloader.getFlags()
---   if _, v in ipairs(flags) do
---           print(v)
---   end
---   ```
---
---@return string[]
function modloader.getFlags() end

--- Used to check whether a specific flag exists or not.
---
--- Flags are a way for the end user to affect mod behavior directly from the launcher.
---
--- There are several built-in flags used to toggle useful legacy behavior and bugs,
--- a full list of them can be [found here](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/flags.html).
---
--- # Example
---   Do something if the `fruits_should_bounce` flag is set.
---   ```lua
---   if modloader.checkFlag("fruits_should_bounce") then
---       -- Do something
---   end
---   ```
---
---@param flag string The flag to check for
---@return boolean '' true if the flag exists
function modloader.checkFlag(flag) end

--- Gets all loaded mods.
---
--- # Example
---   Print the number of loaded mods.
---   ```lua
---   print(string.format("%d mods loaded", #modloader.getMods()))
---   ```
---
---@return string[] '' A table of the internal names of all loaded mods
function modloader.getMods() end

--- Checks whether a mod is loaded or not.
---
--- # Example
---   Provide extra functionality when the `example-mod` mod is loaded.
---   ```lua
---   if modloader.checkMod("example-mod") then
---       -- enable extra functionality
---   end
---   ```
---
---@param mod string The mod’s internal name
---@return boolean '' true if the mod is loaded
function modloader.checkMod(mod) end

--- Gets the full name of the mod.
---
--- Calling this function on a mod that isn’t loaded will cause an error.
---
--- # Example
---   Print the name of each loaded mod.
---   ```lua
---   for _, mod in ipairs(modloader.getMods()) do
---       print(modloader.getModName(mod))
---   end
---   ```
---
---@param mod string The mod’s internal name
---@return string '' The display name of the mod
function modloader.getModName(mod) end

--- Gets the description of the mod.
---
--- Calling this function on a mod that isn’t loaded will cause an error.
---
---@param mod string The mod’s internal name.
---@return string '' The description of the mod
function modloader.getModDescription(mod) end

--- Gets the version of the mod.
---
--- Calling this function on a mod that isn’t loaded will cause an error.
---
---@param mod string The mod’s internal name.
---@return string '' The version string of the mod
function modloader.getModVersion(mod) end

--- Gets the author of the mod.
---
--- Calling this function on a mod that isn’t loaded will cause an error.
---
---@param mod string The mod’s internal name
---@return string '' The author of the mod
function modloader.getModAuthor(mod) end

--- Returns the namespace that new objects will be added to.
---
--- This will always match the internal name of the current mod.
---
--- # Example
---   Print the name of the mod running the code.
---   ```lua
---   print(modloader.getModName(modloader.getActiveNamespace()))
---   ```
---
---@return Namespace '' The current namespace as a string
function modloader.getActiveNamespace() end
