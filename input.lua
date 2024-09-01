---@meta _

--- The `input` module is used to check and manage player input.
input = {}

input.NEUTRAL = 0  -- Not pressed
input.RELEASED = 1 -- Just pressed
input.HELD = 2     -- Being held
input.PRESSED = 3  -- Just released

--[[
---- general functions
--]]

--- Used to check the press status of one of the player’s inputs.
---
--- Functionally the same as [PlayerInstance:control](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html#player-instance-control).
---
--- # Example
---   Check whenever the `player` is holding the down key and increases a counter continuously.
---   ```lua
---   if input.checkControl("down", player) == input.HELD then
---       superjumpcharge = superjumpcharge + 1
---   end
---   ```
---
---@param control PlayerControl The control to check. *case insensitive*
---@param player? PlayerInstance The player whose controls to check. *defaults to player 1*
---@return PressStatus '' The press status of the control
function input.checkControl(control, player) end

--- Gets a string representation of one of the player’s inputs.
---
--- **Note**: Strings of gamepad controls use special characters and will only display
---       correctly on the `graphics.FONT_DEFAULT` and `graphics.FONT_LARGE` fonts.
---
---@param control string The control to get a string of. *case insensitive*
---@param player? PlayerInstance Used to determine gamepad type. *defaults to player 1*
---@return string '' The string representation of the control
function input.getControlString(control, player) end

--[[
---- keyboard functions
--]]

--- Gets the status of a keyboard key.
---
--- Button names should be mostly intuitive, for example `'a'` meaning the A button, `'6'`
--- meaning the number 6 key. Other keys are represented as a single string without spaces or punctuation,
--- for example `'numpad4'` and `'pageup'`.
---
--- Also included is the `'anykey'` and `'nokey'` meta keys, which can be used to check if any or no key is pressed.
---
--- # Example
---   Create an instance of the item `eggplant_item` on the `player` when the 5 key
---   on the numpad is pressed; Useful for testing.
---   ```lua
---   if input.checkKeyboard("numpad5") == input.PRESSED then
---       eggplant_item:create(player.x, player.y)
---   end
---   ```
---
---@param key KeyboardKey String representation of the keyboard key to check for
---@return PressStatus '' The press status of the key
function input.checkKeyboard(key) end

--[[
---- controller functions
--]]

--- Gets the status of a button on a gamepad.
---
--- # Example
---   Do something when the left stick is pressed on the controller with the ID `gamepad`.
---   ```lua
---   if input.checkGamepad("stickl", gamepad) then
---       -- Do Something
---   end
---   ```
---
---@param button GamepadButton String representation of the keyboard key to check for
---@param gamepad GamepadId The ID of the controller to check button presses on
---@return PressStatus '' The press status of the button
function input.checkGamepad(button, gamepad) end

--- Gets the ID of a player’s currently active gamepad.
---
--- # Example
---   Get the gamepad index of `player`.
---   ```lua
---   local gamepad = input.getPlayerGamepad(player)
---   ```
---
---@param player? PlayerInstance The player to get the controller ID of. *defaults to player 1*
---@return GamepadId? '' The controller index as a number, or nil if the keyboard is in use
function input.getPlayerGamepad(player) end

--- Gets the status of a gamepad control stick axis.
---
--- # Example
---   Do something when the left stick on `gamepad` is tilted upwards at least 20%.
---   ```lua
---   if input.getGamepadAxis("lv", gamepad) < -0.2 then
---       -- Do something
---   end
---   ```
--- 
---@param axis GamepadAxis String representation of the axis to check
---@param gamepad GamepadId The ID of the controller to check axis movement on
---@return number position A number between -1 and 1, depending on how far the stick is tilted in the checked direction
function input.getGamepadAxis(axis, gamepad) end

--[[
---- mouse functions
--]]

--- Gets the status of a mouse button.
---
--- # Example
---   Spawns the item `eggplant_item` at the cursor position when the middle mouse button is pressed.
---   ```lua
---   if input.checkMouse("middle") == input.PRESSED then
---           eggplant_item:create(input.getMousePos())
---   end
---   ```
---
---@param button MouseButton String representation of the mouse button to check for
---@return PressStatus '' The press status of the button.
function input.checkMouse(button) end

--- Gets the position of the mouse either on screen or in the game world.
---
--- # Example
---   Draw the sprite `eggplant_sprite` at the mouse’s game world coordinates.
---   ```lua
---   local x, y = input.getMousePos()
---   eggplant_sprite:draw(x, y)
---   ```
---
---@param screen? boolean *true*: returns the position of the mouse in the game window. *false*: returns the position of the mouse in the world. *defaults to false*
---@return number x, number y
function input.getMousePos(screen) end

--- # Example
---   Draw the sprite `eggplant_sprite` at a position relative to `player`
---   which can be controlled by moving the mouse wheel up and down.
---   ```lua
---   scroll = scroll + input.getMouseScroll()
---   eggplant_sprite:draw(player.x, player.y + scroll)
---   ```
---
---@return ScrollState
function input.getMouseScroll() end
