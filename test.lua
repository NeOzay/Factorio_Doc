---@meta

---Entry point for registering event handlers. It is accessible through the global object named `script`.
---@class LuaBootstrap
---A dictionary listing the names of all currently active mods and mapping them to their version.`[R]`
---
---This will print the names and versions of all active mods to the console. 
---```lua
---for name, version in pairs(script.active_mods) do
---  game.print(name .. " version " .. version)
---end
---```
---@field active_mods table: 00C61F18
---@field level table: 00C62350 @Information about the currently running scenario/campaign/tutorial.`[R]`
---@field mod_name string @The name of the mod from the environment this is used in.`[R]`
---@field object_name string @This object's name.`[R]`
local LuaBootstrap = {}

---Generate a new, unique event ID that can be used to raise custom events with [LuaBootstrap::raise_event](LuaBootstrap::raise_event).
function LuaBootstrap.generate_event_name() end

---Gets the filters for the given event.
---@param event uint @ID of the event to get.
function LuaBootstrap.get_event_filter(event) end

---Find the event handler for an event.
---@param event uint @The event identifier to get a handler for.
function LuaBootstrap.get_event_handler(event) end

---Gets the mod event order as a string.
function LuaBootstrap.get_event_order() end

---Register a function to be run when mod configuration changes. This is called when the major game version or any mod version changed, when any mod was added or removed, when a startup setting has changed, or when any prototypes have been added or removed. It allows the mod to make any changes it deems appropriate to both the data structures in its [global](global) table or to the game state through [LuaGameScript](LuaGameScript).
---
---For more context, refer to the [Data Lifecycle](data-lifecycle) page.
---@param f table: 00C0D408 @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_configuration_changed(f) end

---Register a handler to run on the specified event(s). Each mod can only register once for every event, as any additional registration will overwrite the previous one. This holds true even if different filters are used for subsequent registrations.
---
---Register for the [on_tick](on_tick) event to print the current tick to console each tick. 
---```lua
---script.on_event(defines.events.on_tick,
---function(event) game.print(event.tick) end)
---```
---\
---Register for the [on_built_entity](on_built_entity) event, limiting it to only be received when a `"fast-inserter"` is built. 
---```lua
---script.on_event(defines.events.on_built_entity,
---function(event) game.print("Gotta go fast!") end,
---{{filter = "name", name = "fast-inserter"}})
---```
---@param event table: 00C0D6D8 @The event(s) or custom-input to invoke the handler on.
---@param f table: 00C0D840 @The handler for this event. Passing `nil` will unregister it.
---@param filters table: 00C34338 @The filters for this event. Can only be used when registering for individual events.
function LuaBootstrap.on_event(event, f, filters) end

---Register a function to be run on mod initialization. This is only called when a new save game is created or when a save file is loaded that previously didn't contain the mod. During it, the mod gets the chance to set up initial values that it will use for its lifetime. It has full access to [LuaGameScript](LuaGameScript) and the [global](global) table and can change anything about them that it deems appropriate. No other events will be raised for the mod until it has finished this step.
---
---For more context, refer to the [Data Lifecycle](data-lifecycle) page.
---
---Initialize a `players` table in `global` for later use. 
---```lua
---script.on_init(function()
---  global.players = {}
---end)
---```
---@param f table: 00C34360 @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_init(f) end

---Register a function to be run on save load. This is only called for mods that have been part of the save previously, or for players connecting to a running multiplayer session. It gives the mod the opportunity to do some very specific actions, should it need to. Doing anything other than these three will lead to desyncs, which breaks multiplayer and replay functionality. Access to [LuaGameScript](LuaGameScript) is not available. The [global](global) table can be accessed and is safe to read from, but not write to, as doing so will lead to an error.
---
---The only legitimate uses of this event are the following:
---- Re-setup [metatables](https://www.lua.org/pil/13.html) as they are not persisted through the save/load cycle.
---- Re-setup conditional event handlers, meaning subscribing to an event only when some condition is met to save processing time.
---- Create local references to data stored in the [global](global) table.
---
---For all other purposes, [LuaBootstrap::on_init](LuaBootstrap::on_init), [LuaBootstrap::on_configuration_changed](LuaBootstrap::on_configuration_changed) or [migrations](migrations) should be used instead.
---
---For more context, refer to the [Data Lifecycle](data-lifecycle) page.
---@param f table: 00C345B8 @The handler for this event. Passing `nil` will unregister it.
function LuaBootstrap.on_load(f) end

---Register a handler to run every nth-tick(s). When the game is on tick 0 it will trigger all registered handlers.
---@param f table: 00C344C8 @The handler to run. Passing `nil` will unregister it for the provided nth-tick(s).
---@param tick table: 00C34400 @The nth-tick(s) to invoke the handler on. Passing `nil` as the only parameter will unregister all nth-tick handlers.
function LuaBootstrap.on_nth_tick(f, tick) end

---
---@param entity LuaEntity @The entity that was built.
function LuaBootstrap.raise_biter_base_built(entity) end

---
---@param message string @The chat message to send.
---@param player_index uint @The player doing the chatting.
function LuaBootstrap.raise_console_chat(message, player_index) end

---Raise an event. Only events generated with [LuaBootstrap::generate_event_name](LuaBootstrap::generate_event_name) and the following can be raised:
---
---- [on_console_chat](on_console_chat)
---- [on_player_crafted_item](on_player_crafted_item)
---- [on_player_fast_transferred](on_player_fast_transferred)
---- [on_biter_base_built](on_biter_base_built)
---- [on_market_item_purchased](on_market_item_purchased)
---- [script_raised_built](script_raised_built)
---- [script_raised_destroy](script_raised_destroy)
---- [script_raised_revive](script_raised_revive)
---- [script_raised_set_tiles](script_raised_set_tiles)
---
---Raise the [on_console_chat](on_console_chat) event with the desired message 'from' the first player. 
---```lua
---local data = {player_index = 1, message = "Hello friends!"}
---script.raise_event(defines.events.on_console_chat, data)
---```
---@param data table @Table with extra data that will be passed to the event handler. Any invalid LuaObjects will silently stop the event from being raised.
---@param event uint @ID of the event to raise.
function LuaBootstrap.raise_event(data, event) end

---
---@param count uint @The amount of offers purchased.
---@param market LuaEntity @The market entity.
---@param offer_index uint @The index of the offer purchased.
---@param player_index uint @The player who did the purchasing.
function LuaBootstrap.raise_market_item_purchased(count, market, offer_index, player_index) end

---
---@param item_stack LuaItemStack @The item that has been crafted.
---@param player_index uint @The player doing the crafting.
---@param recipe LuaRecipe @The recipe used to craft this item.
function LuaBootstrap.raise_player_crafted_item(item_stack, player_index, recipe) end

---
---@param entity LuaEntity @The entity transferred from or to.
---@param from_player boolean @Whether the transfer was from player to entity. If `false`, the transfer was from entity to player.
---@param player_index uint @The player transferred from or to.
function LuaBootstrap.raise_player_fast_transferred(entity, from_player, player_index) end

---
---@param entity LuaEntity @The entity that has been built.
function LuaBootstrap.raise_script_built(entity) end

---
---@param entity LuaEntity @The entity that was destroyed.
function LuaBootstrap.raise_script_destroy(entity) end

---
---@param entity LuaEntity @The entity that was revived.
---@param tags Tags @The tags associated with this entity, if any.
function LuaBootstrap.raise_script_revive(entity, tags) end

---
---@param surface_index uint @The surface whose tiles have been changed.
---@param tiles table: 00C629B8 @The tiles that have been changed.
function LuaBootstrap.raise_script_set_tiles(surface_index, tiles) end

---Registers an entity so that after it's destroyed, [on_entity_destroyed](on_entity_destroyed) is called. Once an entity is registered, it stays registered until it is actually destroyed, even through save/load cycles. The registration is global across all mods, meaning once one mod registers an entity, all mods listening to [on_entity_destroyed](on_entity_destroyed) will receive the event when it is destroyed. Registering the same entity multiple times will still only fire the destruction event once, and will return the same registration number.
---
---Depending on when a given entity is destroyed, [on_entity_destroyed](on_entity_destroyed) will either be fired at the end of the current tick or at the end of the next tick.
---@param entity LuaEntity @The entity to register.
function LuaBootstrap.register_on_entity_destroyed(entity) end

---Sets the filters for the given event. The filters are only retained when set after the actual event registration, because registering for an event with different or no filters will overwrite previously set ones.
---
---Limit the [on_marked_for_deconstruction](on_marked_for_deconstruction) event to only be received when a non-ghost entity is marked for deconstruction. 
---```lua
---script.set_event_filter(defines.events.on_marked_for_deconstruction, {{filter = "ghost", invert = true}})
---```
---\
---Limit the [on_built_entity](on_built_entity) event to only be received when either a `unit` or a `unit-spawner` is built. 
---```lua
---script.set_event_filter(defines.events.on_built_entity, {{filter = "type", type = "unit"}, {filter = "type", type = "unit-spawner"}})
---```
---\
---Limit the [on_entity_damaged](on_entity_damaged) event to only be received when a `rail` is damaged by an `acid` attack. 
---```lua
---script.set_event_filter(defines.events.on_entity_damaged, {{filter = "rail"}, {filter = "damage-type", type = "acid", mode = "and"}})
---```
---@param event uint @ID of the event to filter.
---@param filters table: 00C62E18 @The filters or `nil` to clear them.
function LuaBootstrap.set_event_filter(event, filters) end

