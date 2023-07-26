---@meta

---@alias Callback
---| string
---|
---|-- Items
---| 'onItemRoll'
---| 'onItemDropped'
---| 'onItemInit'
---| 'onItemPickup'
---| 'onUseItemUse'
---| 'postUseItemUse'
---|
---|-- Actor
---| 'onNPCDeath'
---| 'onNPCDeathProc'
---| 'onActorInit'
---| 'onEliteInit'
---| 'onDamage'
---|
---|-- Player
---| 'onPlayerInit'
---| 'onPlayerStep'
---| 'onPlayerDrawBelow'
---| 'onPlayerDraw'
---| 'onPlayerDrawAbove'
---| 'onPlayerLevelUp'
---| 'onPlayerDeath'
---| 'onPlayerHUDDraw'
---|
---|-- Damagers
---| 'onFire'
---| 'onFireSetProcs'
---| 'onHit'
---| 'preHit'
---| 'postHit'
---| 'onImpact'
---|
---|-- Map objects
---| 'onMapObjectActivate'
---|
---|-- Game
---| 'onStageEntry'
---| 'onSecond'
---| 'onMinute'
---| 'onGameStart'
---| 'onGameEnd'
---|
---|-- General
---| 'onStep'
---| 'preStep'
---| 'postStep'
---| 'onDraw'
---| 'onHUDDraw'
---| 'preHUDDraw'
---| 'onLoad'
---| 'postLoad'
---| 'onCameraUpdate'
---|
---|-- Global
---| 'globalStep'
---| 'globalPreStep'
---| 'globalPostStep'
---| 'globalRoomStart'
---| 'globalRoomEnd'

--- TODO
---
---@overload fun(name: Callback, fn: fun(...), priority?: number)
callback = {}



--[[
---- static functions
--]]

--- TODO
---
---@ Items
---@overload fun(name: 'onItemRoll', fn: (fun(pool: ItemPool, item: Item): override: Item), priority?: number)
---@overload fun(name: 'onItemDropped', fn: fun(...), priority?: number) TODO: is this implemented?
---@overload fun(name: 'onItemInit', fn: fun(item: ItemInstance), priority?: number)
---@overload fun(name: 'onItemPickup', fn: fun(item: ItemInstance, player: PlayerInstance), priority?: number)
---@overload fun(name: 'onUseItemUse', fn: fun(player: PlayerInstance, item: Item), priority?: number)
---@overload fun(name: 'postUseItemUse', fn: fun(player: PlayerInstance, item: Item), priority?: number)
---
---@ Actor
---@overload fun(name: 'onNPCDeath', fn: fun(npc: ActorInstance), priority?: number)
---@overload fun(name: 'onNPCDeathProc', fn: fun(npc: ActorInstance, player: PlayerInstance), priority?: number)
---@overload fun(name: 'onActorInit', fn: fun(actor: ActorInstance), priority?: number)
---@overload fun(name: 'onEliteInit', fn: fun(elite: ActorInstance), priority?: number)
---@overload fun(name: 'onDamage', fn: fun(target: ActorInstance, damage: number, source: Instance), priority?: number)
---
---@ Player
---@overload fun(name: 'onPlayerInit', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerStep', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerDrawBelow', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerDraw', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerDrawAbove', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerLevelUp', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerDeath', fn: fun(player: PlayerInstance), priority?: number)
---@overload fun(name: 'onPlayerHUDDraw', fn: fun(player: PlayerInstance, x: number, y: number), priority?: number)
---
---@ Damagers
---@overload fun(name: 'onFire', fn: fun(damager: DamagerInstance ), priority?: number)
---@overload fun(name: 'onFireSetProcs', fn: fun(damager: DamagerInstance, parent: ActorInstance ), priority?: number)
---@overload fun(name: 'onHit', fn: fun(damager: DamagerInstance, hit: ActorInstance, x: number, y: number), priority?: number)
---@overload fun(name: 'preHit', fn: fun(damager: DamagerInstance, hit: ActorInstance ), priority?: number)
---@overload fun(name: 'postHit', fn: fun(damager: DamagerInstance ), priority?: number)
---@overload fun(name: 'onImpact', fn: fun(damager: DamagerInstance, x: number, y: number), priority?: number)
---
---@ Map objects
---@overload fun(name: 'onMapObjectActivate', fn: fun(mapObject: Instance, activator: PlayerInstance), priority?: number)
---
---@ Game
---@overload fun(name: 'onStageEntry', fn: fun(), priority?: number)
---@overload fun(name: 'onSecond', fn: fun(minute: number, second: number), priority?: number)
---@overload fun(name: 'onMinute', fn: fun(minute: number, second: number), priority?: number)
---@overload fun(name: 'onGameStart', fn: fun(), priority?: number)
---@overload fun(name: 'onGameEnd', fn: fun(), priority?: number)
---
---@ General
---@overload fun(name: 'onStep', fn: fun(), priority?: number)
---@overload fun(name: 'preStep', fn: fun(), priority?: number)
---@overload fun(name: 'postStep', fn: fun(), priority?: number)
---@overload fun(name: 'onDraw', fn: fun(), priority?: number)
---@overload fun(name: 'onHUDDraw', fn: fun(), priority?: number)
---@overload fun(name: 'preHUDDraw', fn: fun(), priority?: number)
---@overload fun(name: 'onLoad', fn: fun(), priority?: number)
---@overload fun(name: 'postLoad', fn: fun(), priority?: number)
---@overload fun(name: 'onCameraUpdate', fn: fun(), priority?: number)
---
---@ Global
---@overload fun(name: 'globalStep', fn: fun(room: Room), priority?: number)
---@overload fun(name: 'globalPreStep', fn: fun(room: Room), priority?: number)
---@overload fun(name: 'globalPostStep', fn: fun(room: Room), priority?: number)
---@overload fun(name: 'globalRoomStart', fn: fun(room: Room), priority?: number)
---@overload fun(name: 'globalRoomEnd', fn: fun(room: Room), priority?: number)
---
---@param name string TODO
---@param fn function TODO
---@param priority? number TODO
---
function callback.register(name, fn, priority) end

--- TODO
---
---@param name string TODO
---@return fun(...) callbackRunner
function callback.create(name) end



--[[
---- legacy
--]]

--- For legacy compatibility. Use `callback.register` instead.
---
---@param name Callback TODO
---@param fn fun(...) TODO
---@param priority? number TODO
---
---@deprecated
function registercallback(name, fn, priority) end

--- For legacy compatibility. Use `callback.create` instead.
---
---@param name string TODO
---@return fun(...) callbackRunner
---
---@deprecated
function createcallback(name) end