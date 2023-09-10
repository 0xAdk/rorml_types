---@meta _

--- TODO
graphics = {}


--- TODO
---
---@param target Surface TODO
function graphics.setTarget(target) end

--- TODO
function graphics.resetTarget() end

--- TODO
---
---@return Surface
function graphics.getTarget() end

--- TODO
---
---@param value number TODO
function graphics.alpha(value) end

--- TODO
---
---@return number
function graphics.getAlpha() end

--- TODO
---
---@param value Color TODO
function graphics.color(value) end

graphics.colour = graphics.color

--- TODO
---
---@return Color
function graphics.getColor() end

graphics.getColour = graphics.getColor

--- TODO
---
---@return number width, number height
function graphics.getHUDResolution() end

--- TODO
---
---@return number width, number height
function graphics.getGameResolution() end

--- TODO
---
---@param red boolean TODO
---@param green boolean TODO
---@param blue boolean TODO
---@param alpha boolean TODO
function graphics.setChannels(red, green, blue, alpha) end

--- TODO
function graphics.resetChannels() end

--- TODO
---
---@alias BlendMode
---| 'normal' TODO
---| 'additive' TODO
---| 'subtract' TODO
---| 'max' TODO

--- TODO
---
---@param mode BlendMode TODO
function graphics.setBlendMode(mode) end

--- TODO
---
---@alias AdvancedBlendMode
---| 'zero' TODO
---| 'one' TODO
---| 'sourceColour' TODO
---| 'sourceColourInv' TODO
---| 'sourceAlpha' TODO
---| 'sourceAlphaInv' TODO
---| 'destColour' TODO
---| 'destColourInv' TODO
---| 'sourceColor' TODO
---| 'sourceColorInv' TODO
---| 'destColor' TODO
---| 'destColorInv' TODO
---| 'destAlpha' TODO
---| 'destAlphaInv' TODO
---| 'sourceAlphaSaturation' TODO

--- TODO
---
---@param source AdvancedBlendMode TODO
---@param dest AdvancedBlendMode TODO
function graphics.setBlendModeAdvanced(source, dest) end

--- TODO
---
---@class DrawImageArgs
---@field image Sprite TODO
---@field x number TODO
---@field y number TODO
---@field subimage number TODO
---@field [1] Sprite alias for `image`
---@field [2] number alias for `x`
---@field [3] number alias for `y`
---@field [4] number alias for `subimage`
---@field solidColor Color TODO
---@field solidColour Color alias for `solidColor`
---@field color Color TODO
---@field colour Color alias for `color`
---@field alpha number TODO
---@field angle number TODO
---@field width number TODO
---@field height number TODO
---@field xscale number TODO
---@field yscale number TODO
---@field scale number TODO
---@field region { x: number, y: number, width: number, height: number } TODO

--- TODO
---
---@param args DrawImageArgs TODO
function graphics.drawImage(args) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@param outline? boolean TODO
function graphics.rectangle(x1, y1, x2, y2, outline) end

--- TODO
---
---@param x number TODO
---@param y number TODO
---@param radius number TODO
---@param outline? boolean TODO
function graphics.circle(x, y, radius, outline) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@param outline? boolean TODO
function graphics.ellipse(x1, y1, x2, y2, outline) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@param x3 number TODO
---@param y3 number TODO
---@param outline? boolean TODO
function graphics.triangle(x1, y1, x2, y2, x3, y3, outline) end

--- TODO
---
---@param x1 number TODO
---@param y1 number TODO
---@param x2 number TODO
---@param y2 number TODO
---@param width? number TODO
function graphics.line(x1, y1, x2, y2, width) end

--- TODO
---
---@param x number TODO
---@param y number TODO
function graphics.pixel(x, y) end

---@class FontId

--- TODO
---
---@alias Font
---| `graphics.FONT_DEFAULT` TODO
---| `graphics.FONT_LARGE` TODO
---| `graphics.FONT_SMALL` TODO
---| `graphics.FONT_DAMAGE` TODO
---| `graphics.FONT_CRITICAL` TODO
---| `graphics.FONT_MONEY` TODO
---| FontId TODO

---@type Font
graphics.FONT_DEFAULT = nil  -- TODO

---@type Font
graphics.FONT_LARGE = nil    -- TODO

---@type Font
graphics.FONT_SMALL = nil    -- TODO

---@type Font
graphics.FONT_DAMAGE = nil   -- TODO

---@type Font
graphics.FONT_CRITICAL = nil -- TODO

---@type Font
graphics.FONT_MONEY = nil    -- TODO

graphics.ALIGN_LEFT = 0                       -- TODO
graphics.ALIGN_MIDDLE = 1                     -- TODO
graphics.ALIGN_RIGHT = 2                      -- TODO

graphics.ALIGN_TOP = 0                        -- TODO
graphics.ALIGN_CENTER = 1                     -- TODO
graphics.ALIGN_CENTRE = graphics.ALIGN_CENTER -- TODO
graphics.ALIGN_BOTTOM = 2                     -- TODO

--- TODO
---
---@alias HAlign
---| `graphics.ALIGN_LEFT` TODO
---| `graphics.ALIGN_MIDDLE` TODO
---| `graphics.ALIGN_RIGHT` TODO

--- TODO
---
---@alias VAlign
---| `graphics.ALIGN_TOP` TODO
---| `graphics.ALIGN_CENTER` TODO
---| `graphics.ALIGN_CENTRE` alias for `graphics.ALIGN_CENTER`
---| `graphics.ALIGN_BOTTOM` TODO

--- TODO
---
---@param text any TODO
---@param x number TODO
---@param y number TODO
---@param font? Font TODO
---@param halign? HAlign TODO
---@param valign? VAlign TODO
function graphics.print(text, x, y, font, halign, valign) end

--- TODO
---
---@param text string TODO
---@param x number TODO
---@param y number TODO
---@param font? Font TODO
function graphics.printColor(text, x, y, font) end

graphics.printColour = graphics.printColor

--- TODO
---@param fname string TODO
---@param size number TODO
---@param bold? boolean TODO
---@param italic? boolean TODO
---@return FontId
function graphics.fontFromFile(fname, size, bold, italic) end

--- TODO
---@param sprite Sprite TODO
---@param characters string TODO
---@param separation? number TODO
---@param monospace? boolean TODO
---@return FontId
function graphics.fontFromSprite(sprite, characters, separation, monospace) end

--- TODO
---
---@param font Font TODO
---@return boolean
function graphics.fontIsValid(font) end

--- TODO
---
---@param font Font TODO
function graphics.fontDelete(font) end

--- TODO
---
---@param original Font TODO
---@param new Font TODO
function graphics.fontReplace(original, new) end

--- TODO
---
---@param text string TODO
---@param font Font TODO
---@return number
function graphics.textWidth(text, font) end

--- TODO
---
---@param text string TODO
---@param font Font TODO
---@return number
function graphics.textHeight(text, font) end

--- TODO
---
---@param depth number TODO
---@param bind fun(self: Instance, frame: number) TODO
---@return Instance self TODO
function graphics.bindDepth(depth, bind) end
