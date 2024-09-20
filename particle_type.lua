---@meta _

--- The `ParticleType` class is used to define the behavior of particles. This class is primarily an interface for [GML's own particle types](https://docs.yoyogames.com/source/dadiospice/002_reference/particles/particle%20types/index.html).
---
--- A ParticleType object has no accessible fields, instead all of its properties must be altered through methods.
---
--- For a full list of particles added by the base game, [see this page](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/vanillaParticles.html).
---
---@class ParticleType
---
---@overload fun(name: string): ParticleType
ParticleType = {}

--[[
---- static functions
--]]

--- Creates a new ParticleType.
---
--- If a name is not provided then an automatically generated name will be used.
---
--- # Example
---   Create a new particle type called `Eggplant`.
---   ```lua
---   local eggplant = Particles.new("Eggplant")
---   ```
---
---@param name? string The name to give the particle type within the current namespace
---@return ParticleType
function ParticleType.new(name) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find) for more information.
---
---@param name string
---@param namespace? Namespace
---@return ParticleType
function ParticleType.find(name, namespace) end

--- Executes a [namespace search](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html) to find an existing Item.
---
--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-find-all) for more information.
---
---@param namespace? Namespace
---@return ParticleType[]
function ParticleType.findAll(namespace) end

--[[
---- methods
--]]

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-origin) for more information.
---
---@return Namespace '' The namespace containing the particle type
function ParticleType:getOrigin() end

--- See the page on [namespace searching](https://saturnyoshi.gitlab.io/RoRML-Docs/misc/contextSearch.html#context-name) for more information.
---
---@return string '' The name of the particle type
function ParticleType:getName() end

--- Sets the sprite and animation settings of the particle type.
---
--- Replaces any `shape` that the particle might already have.
---
--- # Example
---     Set the sprite of the particle `eggplant` to the sprite `eggplantSprite`.
---   Its animation is stretched to match the life of the particle.
---   ```lua
---   eggplant:sprite(eggplantSprite, true, true, false)
---   ```
---
---@param sprite Sprite The sprite that the particle will have
---@param animate boolean Whether the sprite should animate or not
---@param stretch boolean Whether to stretch the sprite's animation to match the particle's lifespan
---@param random boolean Whether to choose a random sub-image
function ParticleType:sprite(sprite, animate, stretch, random) end

---@alias ParticleShape
---| 'pixel'
---| 'disc'
---| 'square'
---| 'line'
---| 'star'
---| 'circle'
---| 'ring'
---| 'sphere'
---| 'flare'
---| 'spark'
---| 'explosion'
---| 'cloud'
---| 'smoke'
---| 'snow'

--- Sets the shape of the particle type from a predetermined set of shapes.
---
--- Replaces any `sprite` that the particle might already have.
---
--- To see a visual representation for each shape [see this image](https://saturnyoshi.gitlab.io/RoRML-Docs/_images/particletypes.png)
--- (Image taken from the GML documentation page for particles.)
---
--- # Example
---   Set the shape of `circleParticle` to `circle`.
---   ```lua
---   circleParticle:shape("circle")
---   ```
---
---@param shape ParticleShape The name of the shape to set the particle as
function ParticleType:shape(shape) end

--- Sets the color of the particle type.
---
--- Using the optional arguments you can make particles fade between different colors during their lifespan.
---
--- Example:
---   Make the particle `stoplight` fade from red to yellow to green over the course of its lifespan.
---   ```lua
---   stoplight:color(Color.RED, Color.YELLOW, Color.GREEN)
---   ```
---
---@param c1 Color The color that the particle will have
---@param c2? Color If set, the particle's color will fade to this color over its lifespan
---@param c3? Color If set, the particle's color will fade first to `c2` during the first half of its lifespan and then fade from `c2` to this color during the second half.
function ParticleType:color(c1, c2, c3) end

--- Sets the transparency of the particle type.
---
--- Using the optional arguments you can make particles fade between different transparency levels during their lifespan.
---
--- # Example
---   Make the particle `pulseLight` fade into full opacity and then out again over the course of its lifespan.
---   ```lua
---   pulseLight:alpha(0, 1, 0)
---   ```
---
---@param a1 number The alpha value that the particle will have, 0 is fully transparent and 1 is fully opaque
---@param a2? number If set, the particle's transparency will fade to this transparency over its lifespan
---@param a3? number If set, the particle's transparency will fade first to `a2` during the first half of its lifespan and then fade from `a2` to this transparency during the second half
function ParticleType:alpha(a1, a2, a3) end

--- Scales the sprite or shape of the particle type before any other size changes are applied.
---
--- # Example
---   Make the particle type `eggplant` 40% wider and 30% shorter.
---   ```lua
---   eggplant:scale(1.4, 0.7)
---   ```
---
---@param xscale number The horizontal scaling of the image
---@param yscale number The vertical scaling of the image
function ParticleType:scale(xscale, yscale) end

--- Determines the size range of the particle type.
---
--- Size is multiplicative, meaning a size of 0.5 is half and a size of 2 is twice as big.
--- When spawned, a particle's size will be selected randomly between the minimum and the maximum.
---
--- # Example
---     Make the particle `eggplant` start at a random scale between 0.8 and 1.2 times the base size.
---   Grow by 1 to 3 percent each step.
---   ```lua
---   eggplant:size(0.8, 1.2, 0.02, 0.01)
---   ```
---
---@param min number The minimum size a particle can start at
---@param max number The maximum size a particle can start at
---@param add number How much a particle should grow or shrink per step, negative values indicate shrinking
---@param wiggle number Randomly added or subtracted from a particle's size each step
function ParticleType:size(min, max, add, wiggle) end

--- Sets whether particles of the type should use additive blend mode or not.
---
--- This is useful for example in fire effects or things that have a glow to them. *defaults to false *
---
--- # Example
---   Make the particle `fairydust` be drawn additively
---   ```lua
---   fairydust:additive(true)
---   ```
---
---@param additive boolean Whether the particle type should use the additive blend mode
function ParticleType:additive(additive) end

--- Determines the rotation of a particle's sprite or shape.
---
--- An angle of 0 is straight right, an angle of 90 is straight up, and so on.
--- When spawned, a particle's angle will be selected randomly between the minimum and the maximum.
---
--- # Example
---   Make the particle `eggplant` start rotated to a random angle, and turn continuously counterclockwise.
---   ```lua
---   eggplant:angle(0, 360, 6, 0, true)
---   ```
---
---@param min number The minimum angle a particle can start at. *in degrees*
---@param max number The maximum angle a particle can start at. *in degrees*
---@param add number How much a particle should rotate each step. *in degrees*
---@param wiggle number Randomly added or subtracted from a particle's angle each step
---@param relative boolean Whether the particle should rotate in the direction it's moving
function ParticleType:angle(min, max, add, wiggle, relative) end

--- Determines the speed at which a particle will move.
---
--- When spawned, a particle's speed will be selected randomly between the minimum and the maximum.
---
--- # Example
---   Make the particle `boomerang` spawn with a speed of 2, which will slowly decrease over its lifespan.
---   ```lua
---   boomerang:speed(2, 2, -0.02, 0)
---   ```
---
---@param min number The minimum speed the particle can start at
---@param max number The maximum speed the particle can start at
---@param add number How much the particle should accelerate or decelerate each step. Can be both negative and positive
---@param wiggle number Randomly added or subtracted from the particle's speed each step
function ParticleType:speed(min, max, add, wiggle) end

--- Determines the direction a particle will move.
--- An angle of 0 is straight right, an angle of 90 is straight up, and so on.
--- When spawned, a particle's direction will be selected randomly between the minimum and the maximum.
---
--- # Example
---     Make Rotating particle `firework` spawn pointing up, with 10 degrees of variance.
---   Rotating slightly as it travels.
---   ```lua
---   firework:direction(85, 95, 0, 1)
---   ```
---
---@param min number The minimum angle the particle can start out heading towards. *in degrees*
---@param max number The maximum angle the particle can start out heading towards. *in degrees*
---@param add number How much the particle should turn each step. *in degrees*
---@param wiggle number Randomly added or subtracted from the particle's direction each step
function ParticleType:direction(min, max, add, wiggle) end

--- Determines the direction and speed of gravity on a particle.
---
--- # Example
---   Gives the particle `rock` a downwards gravity of 0.5 pixels per frame.
---   ```lua
---   rock:gravity(0.5, 270)
---   ```
---
---@param amount number How much the gravity will affect a particle. *in pixels per step squared*
---@param direction number The direction the gravity will pull the particle towards
function ParticleType:gravity(amount, direction) end

--- Determines the lifespan of the particle.
---
--- When spawned, a particle's lifespan will be selected randomly between the minimum and the maximum.
---
--- # Example
---   Give each particle `fog` a random lifespan between 5 and 7 seconds.
---   ```lua
---   fog:life(60 * 5, 60 * 7)
---   ```
---
---@param min number The minimum lifespan of a particle. *in steps*
---@param max number The maximum lifespan of a particle. *in steps*
function ParticleType:life(min, max) end

--- Used to make all particles of the type create another particle type each step.
---
--- **Note**: Be very careful when using this as it can greatly increase the number of particles on-screen at a time and cause the game to slow down noticeably.
---
--- # Examples
---   Make the particle `rocket` spawn two of the particle `smoke` each step.
---   ```lua
---   rocket:createOnStep(smoke, 2)
---   ```
---
---   Give the particle `firework` a chance to spawn the particle `smoke` an average of once every 3 steps.
---   ```lua
---   firework:createOnStep(smoke, -3)
---   ```
---
---@param child ParticleType The child particle to spawn. *can not be the same particle type*
---@param amount number  The number of particles to spawn. *If a negative it will be used as a chance to spawn another particle*
function ParticleType:createOnStep(child, amount) end

--- Determines what child particles a particle of this type should spawn at the end of its lifespan.
---
--- **Note**: Be very careful when using this as it can greatly increase the number of particles on-screen at a time and cause the game to slow down noticeably.
---
--- # Example
---   Make particle `firework` spawn 7 of the particle `ember` at the end of its life.
---   ```lua
---   firework:createOnDeath(ember, 7)
---   ```
---
---@param child ParticleType The child particle to spawn. (can not be the same particle type)
---@param amount number The amount of particles to spawn. *If a negative it will be used as a chance to spawn another particle*
function ParticleType:createOnDeath(child, amount) end

--- Clears all defined properties of the particle type, reverting it back to when it was created.
---
--- # Example
---   Reset the particle `eggplant` back to an empty shell.
---   ```lua
---   eggplant:reset()
---   ```
---
function ParticleType:reset() end

--- Creates a burst of particles at a location.
---
--- # Example
---   Create 5 of the particle `eggplant` on the layer `above`.
---   ```lua
---   eggplant:burst("above", x, y, 5)
---   ```
---
---@param depth 'above'|'below'|'middle' The layer to spawn the particles on
---@param x number The horizontal coordinate to spawn the particles at
---@param y number The vertical coordinate to spawn the particles at
---@param amount number The amount of particles to spawn
---@param color? Color The color that the particles will have. *defaults to white, meaning no added coloration*
function ParticleType:burst(depth, x, y, amount, color) end
