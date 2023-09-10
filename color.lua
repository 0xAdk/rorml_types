---@meta _

---@alias ColorText
---| "r" Red
---| "b" Blue
---| "g" Green
---| "y" Yellow
---| "or" Orange
---| "bl" Black
---| "lt" Light Gray
---| "dk" Dark gray
---| "w" White
---| "p" Pink
---| "!" Reset

--- TODO
---
---@class Color
---@field red number TODO
---@field green number TODO
---@field blue number TODO
---@field hue number TODO
---@field saturation number TODO
---@field value number TODO
---@field hex number TODO
---@field gml number TODO
---
---@overload fun(r: number, g: number, b: number): Color
---@overload fun(gray: number): Color
Color = {}

Color.r = Color.red        -- alias for `red`
Color.R = Color.red        -- alias for `red`
Color.g = Color.green      -- alias for `green`
Color.G = Color.green      -- alias for `green`
Color.b = Color.blue       -- alias for `blue`
Color.B = Color.blue       -- alias for `blue`
Color.h = Color.hue        -- alias for `hue`
Color.H = Color.hue        -- alias for `hue`
Color.s = Color.saturation -- alias for `saturation`
Color.S = Color.saturation -- alias for `saturation`
Color.v = Color.value      -- alias for `value`
Color.V = Color.value      -- alias for `value`

--- TODO
---
---@param red number TODO
---@param green number TODO
---@param blue number TODO
---@return Color
function Color.fromRGB(red, green, blue) end

--- TODO
---
---@param hue number TODO
---@param saturation number TODO
---@param value number TODO
---@return Color
function Color.fromHSV(hue, saturation, value) end

--- TODO
---
---@param value number TODO
---@return Color
function Color.fromHex(value) end

--- TODO
---
---@param color1 Color TODO
---@param color2 Color TODO
---@param amount number TODO
---@return Color
function Color.mix(color1, color2, amount) end

--- TODO
---
---@param color Color TODO
---@param amount number TODO
---@return Color
function Color.darken(color, amount) end

--- TODO
---
---@param color Color TODO
---@param amount number TODO
---@return Color
function Color.lighten(color, amount) end

--- TODO
---
---@param color1 Color TODO
---@param color2 Color TODO
---@return boolean
function Color.equals(color1, color2) end

--- TODO
---
---@param color number TODO
---@return Color
function Color.fromGML(color) end

Color.WHITE = Color(255, 255, 255)
Color.DARK_GREY = Color(64, 64, 64)
Color.GREY = Color(128, 128, 128)
Color.LIGHT_GREY = Color(192, 192, 192)
Color.DARK_GRAY = Color.DARK_GREY
Color.GRAY = Color.GREY
Color.LIGHT_GRAY = Color.LIGHT_GREY
Color.BLACK = Color(0, 0, 0)

Color.RED = Color(255, 0, 0)
Color.GREEN = Color(0, 255, 0)
Color.BLUE = Color(0, 0, 255)

Color.DARK_RED = Color(128, 0, 0)
Color.DARK_GREEN = Color(0, 128, 0)
Color.DARK_BLUE = Color(0, 0, 128)

Color.LIGHT_RED = Color(255, 128, 128)
Color.LIGHT_GREEN = Color(128, 255, 128)
Color.LIGHT_BLUE = Color(128, 128, 255)

Color.AQUA = Color(128, 255, 255)
Color.FUCHSIA = Color(255, 0, 255)
Color.YELLOW = Color(255, 255, 0)
Color.ORANGE = Color(255, 128, 0)
Color.LIME = Color(128, 255, 0)
Color.PURPLE = Color(128, 0, 255)
Color.PINK = Color(255, 0, 128)
Color.CORAL = Color(255, 128, 128)

Color.ROR_RED = Color(207, 102, 102)
Color.ROR_GREEN = Color(126, 182, 134)
Color.ROR_BLUE = Color(124, 136, 184)
Color.ROR_YELLOW = Color(239, 210, 123)
Color.ROR_ORANGE = Color(243, 165, 86)

Color.DAMAGE_HEAL = Color(132, 215, 104)
Color.DAMAGE_POISON = Color(201, 242, 77)
Color.DAMAGE_ENEMY = Color(124, 97, 169)
Color.DAMAGE_NEUTRAL = Color.ROR_BLUE
