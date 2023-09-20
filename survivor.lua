---@meta _

--- A `Survivor` is any one of the playable characters found in the game.
---
---@class Survivor
---@field disabled boolean When set to true the survivor will be hidden from all menus and be unable to be selected by the player
---@field displayName string The name of the survivor as displayed in-game
---@field loadoutSprite Sprite The sprite that shows up in the character select screen. It must have at least 4 frames. The animation speed for the loadout sprite is always 0.2, meaning it animates at 12 frames per second. The first frame is for when the character is yet to be unlocked. The second frame is the unselected sprite. The third frame is for when the character is hovered over. The fourth frame and onward make up the animation that plays when the character is selected, which stops on the last frame
---@field loadoutColor Color The color of the survivor’s skill names in the character select screen
---@field loadoutColour Color alias for `loadoutColor`
---@field loadoutWide boolean When set to true the survivor will take up 2 slots on the character select screen, like HAN-D does
---@field titleSprite Sprite The sprite displayed on the title screen when the survivor was previously selected, this will typically be the same as the survivor’s walk animation
---@field idleSprite Sprite The survivor’s idle sprite. Used by the tab menu and character select palette in online co-op. *only appears in menus and is not used in-game*
---@field endingQuote string The message displayed when the game is beaten as this character. *defaults to* `..and so they left, with everything but their humanity.`
---
---@overload fun(name: string): Survivor
Survivor = {}

--[[
---- static functions
--]]

--- Creates a new survivor.
---
--- # Example
---     Create a new survivor called `Cyborg`.
---
---     ```lua
---     local cyborg = Survivor.new("Cyborg")
---     ```
---
---@param name string The name to give the survivor within the current namespace
---@return Survivor
function Survivor.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return Survivor
function Survivor.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return Survivor[]
function Survivor.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the survivor
function Survivor:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the survivor
function Survivor:getName() end

---@alias SurvivorCallback
---| 'init' Fired when the player first spawns. **Note**: that this is executed before the first level is fully generated
---| 'step' Fired every step
---| 'draw' Fired whenever the player is drawn
---| 'useSkill' Fired when the player attempts to use any skill which is off cooldown
---| 'onSkill' Fired once each step the player is using a skill. The third argument is the frame of the animation when it’s incremented, otherwise it's 0
---| 'levelUp' Fired when the player levels up
---| 'scepter' Fired when the player picks up Ancient Scepter

--- Binds a function to be called when a specific callback is fired.
---
--- The arguments passed to the function vary by callback, but the first argument is always the player.
---
--- # Example
---     Increase the player’s running speed when they level up.
---
---     ```lua
---     commando:addCallback("levelUp", function(player)
---         player:set("pHmax", player:get("pHmax") + 0.1)
---     end)
---     ```
---
---@overload fun(self, callback: 'init', bind: fun(player: PlayerInstance))
---@overload fun(self, callback: 'step', bind: fun(player: PlayerInstance, player_id: number))
---@overload fun(self, callback: 'draw', bind: fun(player: PlayerInstance, x: number, y: number))
---@overload fun(self, callback: 'useSkill', bind: fun(player: PlayerInstance, index: number))
---@overload fun(self, callback: 'onSkill', bind: fun(player: PlayerInstance, index: number, animation_frame: number))
---@overload fun(self, callback: 'levelUp', bind: fun(player: PlayerInstance))
---@overload fun(self, callback: 'scepter', bind: fun(player: PlayerInstance))
---
---@-- FIXME: using `SurvivorCallback` as the type instead of `string` casues every callback to show up
---@--        twice in suggestions due to the overloads.
---@--        It's required for the callback docs, and the overloads for the autocomplete.
---@param callback SurvivorCallback The name of the callback to bind a function to
---@param bind function The function to be run when the callback is fired. *the function is always passed the relevant [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html)*
function Survivor:addCallback(callback, bind) end

--- Sets the description and name of one of the survivor’s skills on the character select screen.
---
--- # Example
---     Set the description and name of `commando`’s third skill: `Tactical Dive`.
---
---     ```lua
---     commando:setLoadoutSkill(
---         3, "Tactical Dive",
---         "&y&Roll forward&!& a small distance.\n"
---         .. "You &b&cannot&!& be hit while rolling."
---     )
---     ```
---
---@param index number The number of the skill to set the information of. *from 1 to 4*
---@param name string The name of the skill
---@param description string string A short description of the skill’s functionality. Supports colored text formatting. **Note**: that line breaks must be put in manually. There’s space for 2 lines vertically, except on the 4th skill
function Survivor:setLoadoutSkill(index, name, description) end

--- Sets the description of the survivor on the character select screen.
---
--- # Example
---     Set the description and skill icons for `commando`.
---
---     ```lua
---     commando:setLoadoutInfo(
---         "The &y&Commando&!& is characterized by long range and mobility.\n"
---         .. "Effective use of his &y&Tactical Dive&!& will grant increased survivability,\n"
---         .. "while &y&suppressive fire&!& deals massive damage.\n"
---         .. "&y&FMJ&!& can then be used to dispose of large mobs.",
---         skillsprite
---     )
---     ```
---
---@param description string A short description of the character’s play style and functionality. Supports colored text formatting. Note that line breaks must be put in manually. There’s space for 6 lines vertically
---@param skills Sprite A sprite containing 4 frames which will be displayed as the character’s skill icons in the character select screen
function Survivor:setLoadoutInfo(description, skills) end
