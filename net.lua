---@meta _

--- TODO
net = {}

net.ALL = 'all'         -- TODO
net.EXCLUDE = 'exclude' -- TODO
net.DIRECT = 'direct'   -- TODO

--- TODO
---
---@alias SendTarget
---| `net.ALL` TODO
---| `net.EXCLUDE` TODO
---| `net.DIRECT` TODO

--- TODO
---
---@type boolean?
net.online = nil

--- TODO
---
---@type boolean?
net.host = nil

--- TODO
---
---@type PlayerInstance?
net.localPlayer = nil

---@alias NetType
---| number TODO
---| string TODO
---| GMObject TODO
---| Sprite TODO
---| Sound TODO
---| Item TODO
---| NetInstance TODO
---| boolean TODO
---| nil TODO

--- TODO
---
---@class Packet
---
---@overload fun(name: string, handle: fun(player: PlayerInstance, ...: NetType)): Packet
net.Packet = {}

--- TODO
---
---@param name string TODO
---@param handle fun(player: PlayerInstance, ...: NetType) TODO
---@return Packet
function net.Packet.new(name, handle) end

--- TODO
---
---@param ... NetType TODO
function net.Packet:sendAsClient(...) end

--- TODO
---
---@param target SendTarget TODO
---@param player? PlayerInstance TODO
---@param ... NetType TODO
function net.Packet:sendAsHost(target, player, ...) end
