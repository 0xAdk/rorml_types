---@meta _

--- The `net` module is used when writing online co-op compatible code.
net = {}

net.ALL = 'all'         -- Sends the packet to all connected clients. `player` can be nil when using this
net.EXCLUDE = 'exclude' -- Sends the packet to all players except for the specified player
net.DIRECT = 'direct'   -- Only sends the packet to the specified player

---@alias SendTarget
---| `net.ALL`     Sends the packet to all connected clients. `player` can be nil when using this
---| `net.EXCLUDE` Sends the packet to all players except for the specified player
---| `net.DIRECT`  Only sends the packet to the specified player

---@type boolean? Whether the game is currently online co-op.
net.online = nil

---@type boolean? When `net.online` is true indicates whether the user is the host, otherwise always true
net.host = nil

---@type PlayerInstance? The [PlayerInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/playerInstance.html) of the local player.
net.localPlayer = nil

--- When passing RoRML types (except [NetInstance](https://saturnyoshi.gitlab.io/RoRML-Docs/class/netInstance.html)) the resource must exist on both the sender and the receiver.
--- If you cannot be sure, send the name of the resource over as a string and `find` it on the receiving end.
---
--- *WARNING*: As of the current version, passing nil as an argument to a packet will cut off any following arguments.
---
---@alias NetType
---| number
---| string
---| GMObject
---| Sprite
---| Sound
---| Item
---| NetInstance
---| boolean
---| nil

--- The `net.Packet` class is used to transfer information between clients in online co-op.
---
---@class Packet
---
---@overload fun(name: string, handle: fun(player: PlayerInstance, ...: NetType)): Packet
net.Packet = {}

--- Defines a new packet type.
---
--- Takes a function which is called when the packet is received.
---
---@param name string The name of the packet. Used to identify the packet between clients
---@param handle fun(player: PlayerInstance, ...: NetType) The function called when the packet is received. The first argument is the `PlayerInstance` of the sender, followed by arguments the packet was sent with
---@return Packet '' The new packet type
function net.Packet.new(name, handle) end

--- Sends the packet to the game host.
---
--- Does nothing if in singleplayer or if the local player is the host.
---
---@param ... NetType
function net.Packet:sendAsClient(...) end

--- Sends the packet to clients.
---
--- Does nothing if in singleplayer or if the local player is not the host.
---
---@param target SendTarget Any of the above 3 sending types
---@param player? PlayerInstance The player to send to or exclude when using the `DIRECT` or `EXCLUDE` settings respectively. *can be nil when using the `ALL` setting
---@param ... NetType Any number of valid net type arguments
function net.Packet:sendAsHost(target, player, ...) end
