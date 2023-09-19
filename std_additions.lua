---@meta _

--- In addition to most of the Lua standard library functions,
--- RoRML contains some useful functions not found in the standard library.

--- Used when you want to get a random element from a table with strictly numerical keys.
---
---@generic T
---@param t T[] The table to get a random element from
---@return T '' A random value from the table
function table.irandom(t) end

--- Used when you want to get a random element from a table with non-numerical keys.
---
---@generic T
---@param t table<any, T> The table to get a random element from
---@return T '' A random value from the table
function table.random(t) end

--- Useful for simple random item or visual effects.
---
--- The chance that the function will return true is specified by the user.
---
---@param percent number The chance that the function will return true. *from 0 to 100*
---@return boolean '' true the specified percent of the time
function math.chance(percent) end

--- Moves the parameter `value` towards the target by the amount specified by the parameter `step`.
--- The returned value never overshoots the target and the absolute value of `step` is used.
--- Works with both positive and negative values for all parameters.
---
--- # Examples
---     Make a `timer` variable approach 0 by 1 each step.
---     Do something once it reaches 0.
---
---     ```lua
---     timer = math.approach(timer, 0)
---     if timer == 0 then
---         -- Do something
---     end
---     ```
---
---
---     Move the value of `exp` towards the value of `max_exp` by the value of `bonus`.
---     It never overshoots.
---
---     ```lua
---     exp = math.approach(exp, max_exp, bonus)
---     ```
---
---@param value number The starting value
---@param target number The value to move towards
---@param step? number The amount to move the `value` towards `target` by. *defaults to 1*
---@return number '' The parameter `value` moved towards the `target` by the value step
function math.approach(value, target, step) end

---@param n number The value to get the sign of
---@return -1|0|1 '' `1` if `n` is positive, `-1` if `n` is negative, and `0` if `n` equals 0.
function math.sign(n) end

---@param n number The value to round
---@return number '' The value rounded to the nearest whole value
function math.round(n) end

--- Used to ensure a number stay within a certain range.
---
---@param value number The value to clamp
---@param lower number The lower bound of the clamp
---@param upper number The upper bound of the clamp
---@return number '' If `value` goes below `lower` or above `upper` then the corresponding boundary value is returned, otherwise returns `value`
function math.clamp(value, lower, upper) end

--- **WARNING**: `math.lerp` contains broken code, and so is currently usable.
---
--- Used to shift a value towards another by some `amount` of their difference
---
--- # Example
---     ```lua
---     assert(10 == math.lerp(10, 30, 0))
---     assert(20 == math.lerp(10, 30, 0.5))
---     assert(30 == math.lerp(10, 30, 1))
---     ```
---
---@param from number The value to lerp from
---@param to number The value to lerp to
---@param amount number The percent to lerp by. *1 repersents 100%*
---@return number '' `from` interpolated to `to` by `amount`
---
---@deprecated 'this function is broken'
function math.lerp(from, to, amount) end

--- TODO
---
function print(...) end

--- The same as `print` but the output is written to the error log as well.
---
function log(...) end

--- Checks whether a value is an instance of a class or any of its descendants.
---
--- # Examples
---     Check the type of a string value.
---
---     ```lua
---     assert(isa("Hello!", "string"))
---     assert(not isa("Hello!", "number"))
---     ```
---
---     The first print statement will display true, as the value is a string.
---     The second will display false as it is not a number.
---
---
---     Check whether the object `player` inherits from several different classes.
---
---     ```lua
---     local player = misc.players[1]
---
---     assert(isa(player, "PlayerInstance"))
---     assert(isa(player, "ActorInstance"))
---     assert(isa(player, "Instance"))
---     assert(not isa(player, "GMObject"))
---     ```
---
---     The first 3 asserts pass since the type of `player` is [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html) which inherits
---     from both [ActorInstance](player) and [Instance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/instance.html).
---
---     The final assert passes since the [GMObject](https://saturnyoshi.gitlab.io/RoRML-Docs/class/gmObject.html) class has no relation to [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html).
---
---@param instance any The instance to check the type of
---@param type string The type to check for
---@return boolean '' true if `instance` is `type` or a descendant of `type`
function isa(instance, type) end

--- The `export` function is used to expose functions and values defined in one mod to every other.
---
--- Inserts the provided value into the environment of all dependent mods.
---
--- # Examples
---     There are a multitude of ways the export function can be used.
---
---     These snippets both have the same effect.
---     A table of strings is created and added to all relevant mod environments under the key `Fruits`.
---
---     ```lua
---     Fruits = {"banana", "apple", "pear"}
---     export("Fruits")
---
---     export("Fruits", {"banana", "apple", "pear"})
---     ```
---
---
---     Creating custom libraries is simple with this function
---
---     ```lua
---     export("MyLibrary")
---     MyLibrary.happyPrint = function(str)
---         print(str .. " :)")
---     end
---     ```
---
---
---     You can also utilize this function to modify or expand built-in modules.
---
---     Create a new `add` function in the `math` library.
---
---     ```lua
---     function math.add(n1, n2)
---         return n1 + n2
---     end
---     export("math.add")
---     ```
---
---
---     Overwrite the `math.random` function with a replacement which always returns 1.
---
---     ```lua
---     function math.random()
---         return 1
---     end
---     export("math.random")
---     ```
---
---
---     When using table paths, all missing tables will automatically be created
---
---     ```lua
---     export("very.long.string.of.nested.tables.number", 1)
---     ```
---
---@param name string The key the value will be assigned to. *also supports table paths*
---@param value? any The value to be exported. *defaults to `_G[name] or {}`*
function export(name, value) end

--- The `newtype` function is used to create new datatypes and classes.
---
--- Used to create a type or class.
---
--- The current namespace followed by a colon will be prepended to the type name to prevent naming collisions.
---
--- # Examples
---     Set up a new type called `MyClass` and stores the constructor and metatable
---     in the `MyClass` and `classMT` variables respectively.
---
---     ```lua
---     local MyClass, classMT = newtype("MyClass")
---     ```
---
---
---     A custom defined type interacting with built-in functions.
---     Create a new object and then print its type to the console.
---
---     ```lua
---     local obj = MyClass()
---     print(type(obj))
---     ```
---
---
---     Use standard Lua metatable features to add a method named `greet` to our custom type.
---     Then calls it on our previously created object.
---
---     ```lua
---     classMT.__index = {}
---     function classMT.__index:greet()
---         print("Howdy!")
---     end
---
---     obj:greet()
---     ```
---
---
---     Use of the special `__init` metamethod.
---
---     ```lua
---     local obj_name = {}
---
---     function classMT:__init(name)
---        obj_name[self] = name
---     end
---
---     function classMT.__index:getName()
---         return obj_name[self]
---     end
---
---     local obj2 = MyClass("Apple")
---     print(obj2:getName())
---     ```
---
---@generic T
---@param name `T` The name of the type, such as `number`, `vector`, or `item`
---@return fun(): `T` new A function which returns a new object of the new type
---@return metatable<`T`> meta The metatable used by all objects of the new type
function newtype(name) end
