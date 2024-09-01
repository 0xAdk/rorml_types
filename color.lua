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

--- Colors starting with ROR_ are commonly used for UI or instance blending.
---
--- Colors starting with DAMAGE_ are commonly used as damage indicator colors.
---
--- **Note**: All fields are read only and all fields other than `hex` and `gml` are from 0 to 255.
---
---@class Color
---@field red number The red component of the color in RGB
---@field green number The green component of the color in RGB
---@field blue number The blue component of the color in RGB.
---@field hue number The hue component of the color in HSV
---@field saturation number The saturation component of the color in HSV
---@field value number The value component of the color in HSV
---@field hex number The color as a single RRGGBB hex value
---@field gml number The color as a GameMaker (BBGGRR) color value
---
---@overload fun(r: number, g: number, b: number): Color
---@overload fun(hex: number): Color
Color = {}

--- Alias for `Color`
Colour = Color

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

--- Produces a new Color object taking RGB values as input.
---
--- # Example
---   Create a new color, assigning it to the variable `blurple`.
---   ```lua
---   local blurple = Color.fromRGB(114, 137, 218)
---   ```
---
---@param red number The red value of the color. *from 0 to 255*
---@param green number The green value of the color. *from 0 to 255*
---@param blue number The blue value of the color. *from 0 to 255*
---@return Color
function Color.fromRGB(red, green, blue) end

--- Produces a new Color object taking HSV values as input.
---
--- # Example
---   Create a new color, assigning it to the variable `blurple`.
---   ```lua
---   local blurple = Color.fromHSV(226, 120, 217)
---   ```
---
---@param hue number The hue of the color. *from 0 to 255*
---@param saturation number The saturation of the color. *from 0 to 255*
---@param value number The value of the color. *from 0 to 255*
---@return Color
function Color.fromHSV(hue, saturation, value) end

--- Produces a new Color object taking a single number as input.
---
--- # Example
---   Create a new color, assigning it to the variable `blurple`.
---   ```lua
---   local blurple = Color.fromHex(0x7289DA)
---   ```
---
---@param value number The color as a single RRGGBB formated number
---@return Color '' A new Color object.
function Color.fromHex(value) end

--- Produces a new Color object by mixing together 2 existing colors a specified amount.
---
--- # Examples
---   Create a new color that's 50% yellow and 50% orange.
---   ```lua
---   local yellorange = Color.mix(Color.YELLOW, Color.ORANGE, 0.5)
---   ```
---
---   Create a new color that's 75% green and 25% blue.
---   ```lua
---   local bluish_green = Color.mix(Color.GREEN, Color.BLUE, 0.25)
---   ```
---
---@param color1 Color The base color
---@param color2 Color The color to mix with
---@param amount number The amount to mix as a decimal value. *from 0 to 1*
---@return Color
function Color.mix(color1, color2, amount) end

--- Produces a darkened version of the provided Color object.
---
--- Works the same as merging the provided color with `Color.BLACK`.
---
--- # Example
---   roduce a yellow color 25% darker than the original.
---   ```lua
---   local dark_yellow = Color.darken(Color.YELLOW, 0.25)
---   ```
---
---@param color Color The base color
---@param amount number The amount to darken as a decimal value. *from 0 to 1*
---@return Color
function Color.darken(color, amount) end

--- Produces a lightened version of the provided Color object.
---
--- Works the same as merging the provided color with `Color.WHITE`.
---
--- # Example
---   Produce a yellow color 75% lighter than the original.
---   ```lua
---   local light_yellow = Color.lighten(Color.YELLOW, 0.75)
---   ```
---
---@param color Color The base color
---@param amount number The amount to darken as a decimal value. *from 0 to 1*
---@return Color
function Color.lighten(color, amount) end

--- Compares 2 Color objects to see if they contain is the same color.
---
---@param color1 Color The first color to compare
---@param color2 Color The second color to compare
---@return boolean '' Whether the objects match
function Color.equals(color1, color2) end

--- Produces a new Color object taking a GameMaker color as input.
---
--- You’ll typically expect to find these values stored in instance variables used to represent colors.
---
--- # Example
---     Get the blend color of the instance `inst`.
---   This is identical to accessing the instance’s `blendColor` field.
---   ```lua
---   local blend = Color.fromGML(inst:get("image_blend"))
---   ```
---
---@param color number The color in GameMaker format
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
Color.DAMAGE_NEUTRAL = Color(124, 136, 184)
