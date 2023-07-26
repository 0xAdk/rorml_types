---@meta _

--- TODO
input = {}

input.NEUTRAL = 0  -- TODO
input.RELEASED = 1 -- TODO
input.HELD = 2     -- TODO
input.PRESSED = 3  -- TODO

--[[
---- general functions
--]]

--- TODO
---
---@param control string TODO
---@param player? PlayerInstance TODO
---@return PressStatus
function input.checkControl(control, player) end

--- TODO
---
---@param control string TODO
---@param player? PlayerInstance TODO
---@return string
function input.getControlString(control, player) end

--[[
---- keyboard functions
--]]

--- TODO
---
---@param key KeyboardKey TODO
---@return PressStatus
function input.checkKeyboard(key) end

--[[
---- controller functions
--]]

--- TODO
---
---@param button GamepadButton TODO
---@param gamepad GamepadId TODO
---@return PressStatus
function input.checkGamepad(button, gamepad) end

--- TODO
---
---@param player? PlayerInstance TODO
---@return GamepadId?
function input.getPlayerGamepad(player) end

--- TODO
---
---@param axis GamepadAxis TODO
---@param gamepad GamepadId TODO
---@return number position TODO
function input.getGamepadAxis(axis, gamepad) end

--[[
---- mouse functions
--]]

--- TODO
---
---@param button MouseButton TODO
---@return PressStatus
function input.checkMouse(button) end

--- TODO
---
---@param screen? boolean TODO
---@return number x, number y TODO
function input.getMousePos(screen) end

--- TODO
---
---@return ScrollState
function input.getMouseScroll() end
