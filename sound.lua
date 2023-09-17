---@meta _

--- TODO
---
---@class Sound
---@field id Id TODO
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

--- TODO
---
---@param name string TODO
---@param fname? string TODO
---@return Sound '' TODO
function Sound.load(name, fname) end

--- TODO
---
---@return Sound? '' TODO
function Sound.getMusic() end

--- TODO
---
---@param music Sound? TODO
function Sound.setMusic(music) end

--- TODO
---
---@param id number
---@return Sound? '' TODO
function Sound.fromID(id) end


--[[
---- methods
--]]

--- TODO
---
---@param pitch number? TODO (default 1)
---@param volume number? TODO (default 1)
function Sound:play(pitch, volume) end

--- TODO
---
function Sound:stop() end

--- TODO
---
---@return boolean '' TODO
function Sound:isPlaying() end

--- TODO
---
function Sound:loop() end

--- TODO
---
---@param remap Sound? TODO
function Sound:setRemap(remap) end

--- TODO
---
function Sound:getRemap() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the sound
function Sound:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the sound
function Sound:getName() end
