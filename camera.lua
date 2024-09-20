---@meta _

--- The `camera` instance lets you interact with GameMaker's camera.
---
--- To update the camera's position, use the `onCameraUpdate` [callback](https://saturnyoshi.gitlab.io/RoRML-Docs/global/registerCallback.html).
---
---@class Camera
---@field width number The camera view's width. *must be between* `10` *and* `10000`
---@field height number The camera view's height. *must be between* `10` *and* `10000`
---@field x number The camera's `x` position. *can only change inside the* `onCameraUpdate` *callback*
---@field y number The camera's `y` position. *can only change inside the* `onCameraUpdate` *callback*
---@field angle number The camera's angle in degrees
camera = {}
