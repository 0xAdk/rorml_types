---@meta _

--- The `graphics` module is used to draw things to the screen, whether it’s an image, shape, or text.
---
--- **Note**:
---     Drawing functions can only be used either during a drawing callback, or to a surface.
---     Drawing functions will have no effect when called during a normal callback.
graphics = {}


--- Changes the render target to a [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html).
---
--- # Example
---   Set the render target to the surface called `vine`.
---   ```lua
---   graphics.setTarget(vine)
---   ```
---
---@param target Surface The surface to set the render target to
function graphics.setTarget(target) end

--- Resets the render target to go back to drawing as normal.
---
--- # Example
---   ```lua
---   graphics.setTarget(vine)
---   -- Some drawing functions ...
---   graphics.resetTarget()
---   ```
---   After drawing to a surface it is important to reset the drawing target so that drawing can return to functioning as usual.
---
function graphics.resetTarget() end

--- The current render target as set by `graphics.setTarget` and `graphics.resetTarget`
---
---@return Surface? '' A [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html) when one is being drawn to or nil when drawing to the screen
function graphics.getTarget() end

--- Sets the transparency which shapes will be drawn at. A `value` of 1 is fully opaque, while 0 is fully transparent.
---
--- # Example
---   Draw a 50x50 square with 30% opacity at the coordinates stored in `x` and `y`,
---   then reset the alpha back to 1 when finished.
---   ```lua
---   graphics.alpha(0.3)
---   graphics.rectangle(x, y, x + 50, y + 50, false)
---   graphics.alpha(1)
---   ```
---
---@param value number The new alpha value, from 0 to 1
function graphics.alpha(value) end

---@return number alpha The drawing alpha as set by `graphics.alpha`
function graphics.getAlpha() end

--- Sets the [color](https://saturnyoshi.gitlab.io/RoRML-Docs/class/color.html) which shapes will be drawn with.
--- 
--- This should always be set when you begin drawing shapes,
--- as the initial color may vary from call to call.
---
--- # Example
---   Draw a 50x50 blue square at the coordinates stored in `x` and `y`.
---   ```lua
---   graphics.color(Color.BLUE)
---   graphics.rectangle(x, y, x + 50, y + 50, false)
---   ```
---
---@param value Color The color to begin drawing in
function graphics.color(value) end

--- Alias for `graphics.color`
graphics.colour = graphics.color

--- **Note**: that this will not be the same color object, but it will have the same RGB values as the set color.
---
---@return Color color The drawing alpha as set by `graphics.color`
function graphics.getColor() end

--- Alias for `graphics.getColor`
graphics.getColour = graphics.getColor

--- Returns the width and height of the HUD layer.
---
--- Useful for positioning UI elements correctly.
---
--- This will be the same as `getGameResolution` unless the `"hud_scale"` option in prefs.json is modified.
--- 
--- # Example
---   Draw a dark red rectangle over the middle of the HUD.
---   ```lua
---   callback.register("onHUDDraw", function()
---       local w, h = graphics.getHUDResolution()
---       graphics.color(Color.DARK_RED)
---       graphics.rectangle(w * 0.25, w * 0.25, w * 0.75, h * 0.75)
---   end)
---   ```
---
---@return number width, number height
function graphics.getHUDResolution() end

--- Returns the width and height of the game camera
--- 
--- # Example
---   Draw a dark red rectangle over the middle of the camera.
---   ```lua
---   callback.register("onDraw", function()
---       local w, h = graphics.getGameResolution()
---       graphics.color(Color.DARK_RED)
---       graphics.rectangle(w * 0.25, w * 0.25, w * 0.75, h * 0.75)
---   end)
---   ```
---
---@return number width, number height
function graphics.getGameResolution() end

--- Can be used to disable drawing to specific color channels.
--- Each parameter is a boolean indicating whether that channel should be drawn to.
---
---@param red boolean Whether to draw to the red channel
---@param green boolean Whether to draw to the green channel
---@param blue boolean Whether to draw to the blue channel
---@param alpha boolean Whether to draw to the alpha channel
function graphics.setChannels(red, green, blue, alpha) end

--- Enables drawing to all color channels again.
--- Effectively the same as calling `graphics.setChannels` with all parameters set to true.
--- This should always be called after using `graphics.setChannels` as the active color channels are not automatically reset.
function graphics.resetChannels() end

--- All accepted blend modes
---
---@alias BlendMode
---| 'normal' The default blend mode (FIXME what does this do?)
---| 'additive' Luminosity values of light areas are added
---| 'subtract' Luminosity values of light areas are subtracted
---| 'max' Similar to additive blending. (FIXME what does this do?)

--- Sets the current drawing blend mode.
---
--- see [guide to using blendmodes](https://manual.yoyogames.com/Additional_Information/Guide_To_Using_Blendmodes.htm) for more information
---
---@param mode BlendMode The blend mode to begin using
function graphics.setBlendMode(mode) end

--- All accepted blend factors
---
---@alias BlendModeFactor
---| 'zero' (0, 0, 0, 0)
---| 'one' (1, 1, 1, 1)
---|
---| 'sourceColor' (Rs, Gs, Bs, As)
---| 'sourceColorInv' (1-Rs, 1-Gs, 1-Bs, 1-As)
---| 'sourceColour' alias for `sourceColor`
---| 'sourceColourInv' alias for `sourceColorInv`
---| 'sourceAlpha' (As, As, As, As)
---| 'sourceAlphaInv' (1-As, 1-As, 1-As, 1-As)
---|
---| 'destColor' (Rd, Gd, Bd, Ad)
---| 'destColorInv' (1-Rd, 1-Gd, 1-Bd, 1-Ad)
---| 'destColour' alias for `destColor`
---| 'destColourInv' alias for `destColorInv`
---| 'destAlpha' (Ad, Ad, Ad, Ad)
---| 'destAlphaInv' (1-Ad, 1-Ad, 1-Ad, 1-Ad)
---|
---| 'sourceAlphaSaturation' (A, A, A, 1) where A = min(As, 1-Ad)

--- Sets the current drawing blend mode.
---
--- The blend modes of `graphics.setBlendMode` can be replicated using the following combinations:
---
---   | Name     | `source`      | `dest`            |
---   |----------|-------------|-----------------|
---   | normal   | sourceAlpha | sourceAlphaInv  |
---   | additive | sourceAlpha | one             |
---   | subtract | zero        | sourceColourInv |
---   | max      | sourceAlpha | sourceColourInv |
---
--- see [guide to using blendmodes](https://manual.yoyogames.com/Additional_Information/Guide_To_Using_Blendmodes.htm) for more information
---
---@param source BlendModeFactor Source blend mode factor
---@param dest BlendModeFactor Destination blend mode factor
function graphics.setBlendModeAdvanced(source, dest) end

---@class DrawImageArgs
---@field image? Sprite **required**: The image to be drawn
---@field x? number **required**: The X position to draw at
---@field y? number **required**: The Y position to draw at
---@field subimage? number Only applies to sprites. The frame of the sprite to draw, starting from 1
---@field [1]? Sprite alias for `image`
---@field [2]? number alias for `x`
---@field [3]? number alias for `y`
---@field [4]? number alias for `subimage`
---@field solidColor? Color TODO
---@field solidColour? Color alias for `solidColor`
---@field color? Color The color to tint the image with
---@field colour? Color alias for `color`
---@field alpha? number The transparency of the image, as a decimal value from 0 to 1
---@field angle? number The rotation of the image in degrees, counterclockwise
---@field width? number The width to draw the image as in pixels
---@field height? number The height to draw the image as in pixels
---@field xscale? number Horizontal size multiplier. Stacks with `width`
---@field yscale? number Vertical size multiplier. Stacks with `height`
---@field scale? number Horizontal and vertical size multiplier. Stacks with all previous scale modifying parameters
---@field region? { x: number, y: number, width: number, height: number } TODO

--- Draws a [Sprite](https://saturnyoshi.gitlab.io/RoRML-Docs/class/sprite.html) or [Surface](https://saturnyoshi.gitlab.io/RoRML-Docs/class/surface.html).
---
--- The color, transparency, and scaling of the image can all be specified using optional arguments.
---
--- # Examples
---   All 3 of these examples do the same thing, but decrease in complexity each time.
---   The second example utilizes the numerical aliases of the first few parameters.
---
---   Generally, simple image drawing is more of a use case for the image’s draw method.
---
---   1.
---   ```lua
---   graphics.drawImage{
---       image = myImage,
---       x = 50,
---       y = 50
---   }
---   ```
---
---   2.
---   ```lua
---   graphics.drawImage { myImage, 50, 50 }
---   ```
---
---   3.
---   ```lua
---   myImage:draw(50, 50)
---   ```
---
---   Draw `myImage` at 50% opacity, tinted red, and stretched by 50% horizontally.
---   ```lua
---   graphics.drawImage {
---       myImage, 50, 50,
---       alpha = 0.5,
---       color = Color.RED,
---       xscale = 1.5
---   }
---   ```
---
---@param args DrawImageArgs
function graphics.drawImage(args) end

--- Draws a rectangle between the coordinates `x1`, `y1` and `x2`, `y2`.
---
---@param x1 number The X position of the first corner of the rectangle
---@param y1 number The Y position of the first corner of the rectangle
---@param x2 number The X position of the second corner of the rectangle
---@param y2 number The Y position of the second corner of the rectangle
---@param outline? boolean Whether the rectangle should be drawn as an outline. *defaults to false*
function graphics.rectangle(x1, y1, x2, y2, outline) end

--- Draws a circle of specified radius centered on the coordinates `x`, `y`.
---
---@param x number The X position of the center of the circle
---@param y number The Y position of the center of the circle
---@param radius number The radius of the circle
---@param outline? boolean Whether the circle should be drawn as an outline. *defaults to false*
function graphics.circle(x, y, radius, outline) end

--- Draws an ellipse between the coordinates `x1`, `y1` and `x2`, `y2`.
---
---@param x1 number The X position of the first corner of the rectangle
---@param y1 number The Y position of the first corner of the rectangle
---@param x2 number The X position of the second corner of the rectangle
---@param y2 number The Y position of the second corner of the rectangle
---@param outline? boolean Whether the ellipse should be drawn as an outline. *defaults to false*
function graphics.ellipse(x1, y1, x2, y2, outline) end

--- Draws a triangle with a point landing on each of the 3 provided pairs of coordinates.
---
---@param x1 number The X position of the first point of the triangle
---@param y1 number The Y position of the first point of the triangle
---@param x2 number The X position of the second point of the triangle
---@param y2 number The Y position of the second point of the triangle
---@param x3 number The X position of the third point of the triangle
---@param y3 number The Y position of the third point of the triangle
---@param outline? boolean Whether the ellipse should be drawn as an outline. *defaults to false*
function graphics.triangle(x1, y1, x2, y2, x3, y3, outline) end

--- Draws a line between the points `x1`, `y1` and `x2`, `y2`.
---
---@param x1 number The X position of the first point of the line
---@param y1 number The Y position of the first point of the line
---@param x2 number The X position of the second point of the line
---@param y2 number The Y position of the second point of the line
---@param width? number The width of the line in pixels. defaults to 1
function graphics.line(x1, y1, x2, y2, width) end

--- Draws a single pixel at the provided coordinates.
---
---@param x number The X position of the pixel
---@param y number The Y position of the pixel
function graphics.pixel(x, y) end

-- When using the graphics.print or graphics.printColor functions,
-- there are a number of constants used when picking certain settings.
-- Here you can find a list of all the text drawing related constants.

---@class FontId

--- All built-in fonts
---
---@alias BuiltinFont
---| `graphics.FONT_DEFAULT` The most common font used for drawing
---| `graphics.FONT_LARGE` Used for things such as the level name when entering a stage and the number of minutes on the in-game timer
---| `graphics.FONT_SMALL` Used by RoRML in the command console
---| `graphics.FONT_DAMAGE` Used by damage indicators and the player’s health bar, only contains numbers and a few miscellaneous characters
---| `graphics.FONT_CRITICAL` Same as `graphics.FONT_DAMAGE` but has a red outline rather than a black one
---| `graphics.FONT_MONEY` Used by the player’s current gold display at the top left of the HUD

---@alias Font
---| BuiltinFont
---| FontId

---@type Font
graphics.FONT_DEFAULT = nil  -- The most common font used for drawing

---@type Font
graphics.FONT_LARGE = nil    -- Used for things such as the level name when entering a stage and the number of minutes on the in-game timer

---@type Font
graphics.FONT_SMALL = nil    -- Used by RoRML in the command console

---@type Font
graphics.FONT_DAMAGE = nil   -- Used by damage indicators and the player’s health bar, only contains numbers and a few miscellaneous characters

---@type Font
graphics.FONT_CRITICAL = nil -- Same as `graphics.FONT_DAMAGE` but has a red outline rather than a black one

---@type Font
graphics.FONT_MONEY = nil    -- Used by the player’s current gold display at the top left of the HUD


graphics.ALIGN_LEFT = 0
graphics.ALIGN_MIDDLE = 1
graphics.ALIGN_RIGHT = 2

graphics.ALIGN_TOP = 0
graphics.ALIGN_CENTER = 1
graphics.ALIGN_CENTRE = graphics.ALIGN_CENTER --- Alias for `graphics.ALIGN_CENTER`
graphics.ALIGN_BOTTOM = 2

--- The following is a list of all halign settings
---
---@alias HAlign
---| `graphics.ALIGN_LEFT`
---| `graphics.ALIGN_MIDDLE`
---| `graphics.ALIGN_RIGHT`

--- The following is a list of all valign settings
---
---@alias VAlign
---| `graphics.ALIGN_TOP`
---| `graphics.ALIGN_CENTER`
---| `graphics.ALIGN_CENTRE` alias for `graphics.ALIGN_CENTER`
---| `graphics.ALIGN_BOTTOM`

--- Draws a string.
---
--- # Examples
---   Display a counter for the variable `bonus` at the coordinates (16, 128).
---   The font and alignment of the text is never specified, so it will be drawn using
---   the standard font with the top left of the text at the specified coordinates.
---   ```lua
---   graphics.print("Bonus: " .. tostring(bonus), 16, 128)
---   ```
---
---   Display an indicator above the instance `target`.
---   The text will be drawn with the small font, drawn above the Y coordinate, and centered around the X coordinate.
---   ```lua
---   graphics.print("[Target]", target.x, target.y - 32, graphics.FONT_SMALL, graphics.ALIGN_MIDDLE, graphics.ALIGN_BOTTOM)
---   ```
---
---@param text any The text to be drawn. If the value is not a string then it will be converted to a human readable format
---@param x number The X coordinate to draw the text at
---@param y number The Y coordinate to draw the text at
---@param font? Font The ID of the font to use. *defaults to `graphics.FONT_DEFAULT`*
---@param halign? HAlign Decides where the text is drawn relative to the X coordinate. *defaults to `graphics.ALIGN_LEFT`*
---@param valign? VAlign Decides where the text is drawn relative to the Y coordinate. *defaults to `graphics.ALIGN_TOP`*
function graphics.print(text, x, y, font, halign, valign) end

--- Draws a string. Additionally supports Risk of Rain’s Supports [colored text formatting](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/coloredTextFormatting.html).
---
--- When using this function, keep in mind that it is slower than using `graphics.print` and that the alignment of the text cannot be changed from top left.
---
--- # Example
---   Display a message containing 3 parts:
---   1. The text `[New Record]` which will be drawn in yellow as indicated by the `&y&` tag.
---   2. The text `Enemies Defeated:` which will be drawn in the current drawing colour.
---   3. The value of variable `enemy_tally` which will be drawn in blue as indicated by the `&b&` tag.
---   ```lua
---   graphics.printColor("&y&[New Record]&!& Enemies defeated: &b&" .. tostring(enemy_tally) .. "&!&", x, y)
---   ```
---
---@param text string The text to be drawn
---@param x number The X coordinate to draw the text at
---@param y number The Y coordinate to draw the text at
---@param font? Font The ID of the font to use. *defaults to `graphics.FONT_DEFAULT`*
function graphics.printColor(text, x, y, font) end

--- Alias for `graphics.printColor`
graphics.printColour = graphics.printColor

--- Loads a font from a file to be used with other drawing.
---
--- **Note**: that this will not work well with pixel fonts due to anti-aliasing.
---
---@param fname string The name of a `ttf` file relative to the mod’s directory. The file extension is optional
---@param size number The font size in pixels
---@param bold? boolean If true the font will be bold
---@param italic? boolean If true the font will be italic
---@return FontId '' The ID of the new font
function graphics.fontFromFile(fname, size, bold, italic) end

--- Creates a font from an existing sprite.
---
---@param sprite Sprite The sprite with each character of the font as a subimage
---@param characters string A string containing all the characters in the font in order of subimage
---@param separation? number The distance in pixels between each character when rendered. *defaults to 1*
---@param monospace? boolean If true then each character of the font will take the font’s width, rather than being based on the width of the subimage
---@return FontId '' The ID of the new font
function graphics.fontFromSprite(sprite, characters, separation, monospace) end

--- Checks whether a font exists.
--- Always returns false for non-numerical values.
---
---@param font Font The value to check as a valid font ID
---@return boolean
function graphics.fontIsValid(font) end

--- Deletes a previously created font.
---
--- Built-in fonts cannot be deleted and will cause an error if attempting to delete them.
---
---@param font FontId The ID of the font to delete
function graphics.fontDelete(font) end

--- Replaces an existing font with another one.
---
--- Can be used to overwrite built-in fonts.
---
---@param original Font The ID of the font to be overwritten
---@param new Font The ID of the font to replace `original` with
function graphics.fontReplace(original, new) end

--- Returns the width of a string in a specific font as pixels.
---
--- # Example
---   Draws the string `str` with a black rectangle behind it.
---   ```lua
---   local str = "Hello!"
---   graphics.color(Color.BLACK)
---   graphics.rectangle(16, 16, 16 + graphics.textWidth(str, graphics.FONT_DEFAULT), 16 + graphics.textHeight(graphics.FONT_DEFAULT))
---   graphics.color(Color.WHITE)
---   graphics.print(str, 16, 16)
---   ```
---
---@param text string The text to get the width of
---@param font Font The ID of the font to use
---@return number '' The width of the text in pixels
function graphics.textWidth(text, font) end

--- Returns the height of a string in a specific font as pixels.
---
--- # Example
---   Draws the string `str` with a black rectangle behind it.
---   ```lua
---   local str = "Hello!"
---   graphics.color(Color.BLACK)
---   graphics.rectangle(16, 16, 16 + graphics.textWidth(str, graphics.FONT_DEFAULT), 16 + graphics.textHeight(graphics.FONT_DEFAULT))
---   graphics.color(Color.WHITE)
---   graphics.print(str, 16, 16)
---   ```
---
---@param text string The text to get the height of
---@param font Font The ID of the font to use
---@return number '' The height of the text in pixels
function graphics.textHeight(text, font) end

--- Used to draw things below or above other instances.
--- 
--- Calls the specified function when the game is drawing at the specified depth.
--- 
--- As the object controlling the function calls is an [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html),
--- it can be modified and destroyed at any time to store the state of drawing or stop it.
---
--- # Examples
---   Bind the function `myFunction` to be called each frame at depth -7, just behind players.
---
---   We call `graphics.bindDepth` at the start of every stage since the instance is removed between stages.
---   ```lua
---   local drawables = {}
---   local function myFunction()
---       for _, v in ipairs(drawables) do
---           graphics.drawImage(v)
---       end
---   end
---
---   callback.register("onStageEntry", function()
---       graphics.bindDepth(-7, myFunction)
---   end)
---   ```
---
---   Bind the function `drawEffect` to be called each frame at depth -9, just above players.
---
---   The function `drawEffect` itself draws a ring which grows over time and then is destroyed after 45 frames.
---   This example uses the fact that the object controlling function calls is an instance to contain a state
---   and destroy the instance when the effect is done.
---   The number of frames the instance has been around is also passed to the function,
---   and is used here to control the timing of instance destruction and the rate of circle growth.
---   ```lua
---   local function drawEffect(handler, frame)
---       if frame >= 45 then
---           handler:destroy()
---       else
---           graphics.color(Color.LIGHT_BLUE)
---           graphics.alpha(1 - frame / 45)
---           graphics.circle(handler.x, handler.y, frame * 3 + 12, true)
---           graphics.alpha(1)
---       end
---   end
---
---   -- Later in our code...
---   local handler = graphics.bindDepth(-9, drawEffect)
---   handler.x = x
---   handler.y = y
---   ```
---
---@param depth number The depth the function will be called at
---@param bind fun(self: Instance, frame: number) The function to be called
---@return Instance self The instance which controls the function calls
function graphics.bindDepth(depth, bind) end
