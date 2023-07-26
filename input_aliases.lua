---@meta _

--[[
---- general
--]]

--- TODO
---
---@alias PressStatus
---| `input.NEUTRAL`
---| `input.RELEASED`
---| `input.HELD`
---| `input.PRESSED`



--[[
---- keyboard
--]]

--- TODO
---
---@alias KeyboardKey
---|-- Special
---| 'nokey' TODO
---| 'anykey' TODO
---|
---|-- Modifiers
---| 'shift' TODO
---| 'control' TODO
---| 'alt' TODO
---|
---|-- Text
---| 'space' TODO
---| 'A' TODO
---| 'B' TODO
---| 'C' TODO
---| 'D' TODO
---| 'E' TODO
---| 'F' TODO
---| 'G' TODO
---| 'H' TODO
---| 'I' TODO
---| 'J' TODO
---| 'K' TODO
---| 'L' TODO
---| 'M' TODO
---| 'N' TODO
---| 'O' TODO
---| 'P' TODO
---| 'Q' TODO
---| 'R' TODO
---| 'S' TODO
---| 'T' TODO
---| 'U' TODO
---| 'V' TODO
---| 'W' TODO
---| 'X' TODO
---| 'Y' TODO
---| 'Z' TODO
---|
---|-- Numbers
---| '0' TODO
---| '1' TODO
---| '2' TODO
---| '3' TODO
---| '4' TODO
---| '5' TODO
---| '6' TODO
---| '7' TODO
---| '8' TODO
---| '9' TODO
---|
---|-- Numpad
---| 'numpad0' TODO
---| 'numpad1' TODO
---| 'numpad2' TODO
---| 'numpad3' TODO
---| 'numpad4' TODO
---| 'numpad5' TODO
---| 'numpad6' TODO
---| 'numpad7' TODO
---| 'numpad8' TODO
---| 'numpad9' TODO
---|
---|-- Math
---| 'decimal' TODO
---| 'multiply' TODO
---| 'divide' TODO
---| 'add' TODO
---| 'subtract' TODO
---|
---|-- Function Keys
---| 'f1' TODO
---| 'f2' TODO
---| 'f3' TODO
---| 'f4' TODO
---| 'f5' TODO
---| 'f6' TODO
---| 'f7' TODO
---| 'f8' TODO
---| 'f9' TODO
---| 'f10' TODO
---| 'f11' TODO
---| 'f12' TODO
---|
---|-- Arrow Keys
---| 'left' TODO
---| 'right' TODO
---| 'up' TODO
---| 'down' TODO
---|
---|-- Action Keys
---| 'enter' TODO
---| 'escape' TODO
---| 'home' TODO
---| 'end' TODO
---| 'delete' TODO
---| 'insert' TODO
---| 'pageup' TODO
---| 'pagedown' TODO
---| 'pause' TODO
---| 'printscreen' TODO
---| 'tab' TODO
---| 'backspace' TODO



--[[
---- controller
--]]

---@alias GamepadId number

--- TODO
---
---@alias GamepadButton
---| 'face1' TODO
---| 'face2' TODO
---| 'face3' TODO
---| 'face4' TODO
---| 'shoulderl' TODO
---| 'shoulderlb' TODO
---| 'shoulderr' TODO
---| 'shoulderrb' TODO
---| 'select' TODO
---| 'start' TODO
---| 'stickl' TODO
---| 'stickr' TODO
---| 'padu' TODO
---| 'padd' TODO
---| 'padl' TODO
---| 'padr' TODO

--- TODO
---
---@alias GamepadAxis
---| 'lh' TODO
---| 'lv' TODO
---| 'rh' TODO
---| 'rv' TODO



--[[
---- mouse functions
--]]

--- TODO
---
---@alias MouseButton
---| 'none' TODO
---| 'left' TODO
---| 'right' TODO
---| 'middle' TODO

--- TODO
---
---@alias ScrollState
---| `0`  no scroll
---| `-1` up scroll
---| `1`  down scroll
