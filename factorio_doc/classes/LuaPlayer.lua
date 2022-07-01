---@meta

---A player in the game. Pay attention that a player may or may not have a character, which is the [LuaEntity](LuaEntity) of the little guy running around the world doing things.
---@class LuaPlayer
---`true` if the player is an admin.`[RW]`
---
---Trying to change player admin status from the console when you aren't an admin does nothing.
---@field admin boolean
---@field afk_time uint @How many ticks since the last action of this player`[R]`
---@field auto_sort_main_inventory boolean @If the main inventory will be auto sorted.`[R]`
---@field blueprint_to_setup LuaItemStack @The item stack containing a blueprint to be setup.`[R]`
---The character attached to this player, or `nil` if no character.`[RW]`
---
---Will also return `nil` when the player is disconnected (see [LuaPlayer::connected](LuaPlayer::connected)).
---@field character LuaEntity
---@field chat_color Color @The color used when this player talks in game.`[RW]`
---@field color Color @The color associated with the player. This will be used to tint the player's character as well as their buildings and vehicles.`[RW]`
---@field connected boolean @`true` if the player is currently connected to the game.`[R]`
---@field controller_type defines.controllers @`[R]`
---When in a cutscene; the character this player would be using once the cutscene is over.`[R]`
---
---Will also return `nil` when the player is disconnected (see [LuaPlayer::connected](LuaPlayer::connected)).
---@field cutscene_character LuaEntity
---The display resolution for this player.`[R]`
---
---During [on_player_created](on_player_created), this attribute will always return a resolution of `{width=1920, height=1080}`. To get the actual resolution, listen to the [on_player_display_resolution_changed](on_player_display_resolution_changed) event raised shortly afterwards.
---@field display_resolution DisplayResolution
---The display scale for this player.`[R]`
---
---During [on_player_created](on_player_created), this attribute will always return a scale of `1`. To get the actual scale, listen to the [on_player_display_scale_changed](on_player_display_scale_changed) event raised shortly afterwards.
---@field display_scale double
---@field entity_copy_source LuaEntity @The source entity used during entity settings copy-paste if any.

`nil` if there isn't currently a source entity.`[R]`
---@field game_view_settings GameViewSettings @The player's game view settings.`[RW]`
---@field gui LuaGui @`[R]`
---@field hand_location ItemStackLocation @The original location of the item in the cursor, marked with a hand. When writing, the specified inventory slot must be empty and the cursor stack must not be empty.`[RW]`
---@field index uint @This player's unique index in [LuaGameScript::players](LuaGameScript::players). It is given to them when they are [created](on_player_created) and remains assigned to them until they are [removed](on_player_removed).`[R]`
---@field infinity_inventory_filters InfinityInventoryFilter[] @The filters for this map editor infinity inventory settings.`[RW]`
---@field last_online uint @At what tick this player was last online.`[R]`
---@field map_view_settings MapViewSettings @The player's map view settings. To write to this, use a table containing the fields that should be changed.`[W]`
---@field minimap_enabled boolean @`true` if the minimap is visible.`[RW]`
---Gets the current per-player settings for the this player, indexed by prototype name. Returns the same structure as [LuaSettings::get_player_settings](LuaSettings::get_player_settings).`[R]`
---
---This table will become invalid if its associated player does.
---@field mod_settings table<string, ModSetting>
---@field name string @The player's username.`[R]`
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.`[R]`
---@field online_time uint @How many ticks did this player spend playing this save (all sessions combined)`[R]`
---@field opened_self boolean @`true` if the player opened itself. I.e. if they opened the character or god-controller GUI.`[R]`
---@field permission_group LuaPermissionGroup @The permission group this player is part of or `nil` if not part of any group.`[RW]`
---@field remove_unfiltered_items boolean @If items not included in this map editor infinity inventory filters should be removed.`[RW]`
---@field render_mode defines.render_mode @The render mode of the player, like map or zoom to world. The render mode can be set using [LuaPlayer::open_map](LuaPlayer::open_map), [LuaPlayer::zoom_to_world](LuaPlayer::zoom_to_world) and [LuaPlayer::close_map](LuaPlayer::close_map).`[R]`
---@field show_on_map boolean @If `true`, circle and name of given player is rendered on the map/chart.`[RW]`
---@field spectator boolean @If `true`, zoom-to-world noise effect will be disabled and environmental sounds will be based on zoom-to-world view instead of position of player's character.`[RW]`
---The stashed controller type or `nil` if no controller is stashed.`[R]`
---
---This is mainly useful when a player is in the map editor.
---@field stashed_controller_type defines.controllers
---@field tag string @The tag that is shown after the player in chat and on the map.`[RW]`
---The number of ticks until this player will respawn or `nil` if not waiting to respawn.`[RW]`
---
---Set to `nil` to immediately respawn the player.
---\
---Set to any positive value to trigger the respawn state for this player.
---@field ticks_to_respawn uint
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.`[R]`
---@field zoom double @The player's zoom-level.`[W]`
local LuaPlayer = {}

---Gets a copy of the currently selected blueprint in the clipboard queue into the player's cursor, as if the player activated Paste.
function LuaPlayer.activate_paste() end

---Adds an alert to this player for the given entity of the given alert type.
---@param entity LuaEntity
---@param type defines.alert_type
function LuaPlayer.add_alert(entity, type) end

---Adds a custom alert to this player.
---@param entity LuaEntity @If the alert is clicked, the map will open at the position of this entity.
---@param icon SignalID
---@param message LocalisedString
---@param show_on_map boolean
function LuaPlayer.add_custom_alert(entity, icon, message, show_on_map) end

---Adds the given recipe to the list of recipe notifications for this player.
---@param recipe string @Name of the recipe prototype to add.
function LuaPlayer.add_recipe_notification(recipe) end

---Adds the given blueprint to this player's clipboard queue.
---@param blueprint LuaItemStack @The blueprint to add.
function LuaPlayer.add_to_clipboard(blueprint) end

---Associates a character with this player.
---
---The character must not be connected to any controller.
---\
---If this player is currently disconnected (see [LuaPlayer::connected](LuaPlayer::connected)) the character will be immediately "logged off".
---\
---See [LuaPlayer::get_associated_characters](LuaPlayer::get_associated_characters) for more information.
---@param character LuaEntity @The character entity.
function LuaPlayer.associate_character(character) end

---Builds what ever is in the cursor on the surface the player is on.
---
---Anything built will fire normal player-built events.
---\
---The cursor stack will automatically be reduced as if the player built normally.
---@param alt? boolean @If alt build should be used instead of normal build. Defaults to normal.
---@param direction? defines.direction @Direction the entity would be placed
---@param position MapPosition @Where the entity would be placed
---@param skip_fog_of_war? boolean @If chunks covered by fog-of-war are skipped.
---@param terrain_building_size? uint @The size for building terrain if building terrain. Defaults to 2.
function LuaPlayer.build_from_cursor(alt, direction, position, skip_fog_of_war, terrain_building_size) end

---Checks if this player can build what ever is in the cursor on the surface the player is on.
---@param alt? boolean @If alt build should be used instead of normal build. Defaults to normal.
---@param direction? defines.direction @Direction the entity would be placed
---@param position MapPosition @Where the entity would be placed
---@param skip_fog_of_war? boolean @If chunks covered by fog-of-war are skipped.
---@param terrain_building_size? uint @The size for building terrain if building terrain. Defaults to 2.
---@return boolean
function LuaPlayer.can_build_from_cursor(alt, direction, position, skip_fog_of_war, terrain_building_size) end

---Checks if this player can build the give entity at the given location on the surface the player is on.
---@param direction? defines.direction @Direction the entity would be placed
---@param name string @Name of the entity to check
---@param position MapPosition @Where the entity would be placed
---@return boolean
function LuaPlayer.can_place_entity(direction, name, position) end

---Clear the chat console.
function LuaPlayer.clear_console() end

---Invokes the "clear cursor" action on the player as if the user pressed it.
---@return boolean @Whether the cursor is now empty.
function LuaPlayer.clear_cursor() end

---Clears all recipe notifications for this player.
function LuaPlayer.clear_recipe_notifications() end

---Clears the players selection tool selection position.
function LuaPlayer.clear_selection() end

---Queues request to switch to the normal game view from the map or zoom to world view. Render mode change requests are processed before rendering of the next frame.
function LuaPlayer.close_map() end

---Asks the player if they would like to connect to the given server.
---
---This only does anything when used on a multiplayer peer. Single player and server hosts will ignore the prompt.
---@param address string @The server (address:port) if port is not given the default Factorio port is used.
---@param description? LocalisedString
---@param name? LocalisedString @The name of the server.
---@param password? string @The password if different from the one used to join this game. Note, if the current password is not empty but the one required to join the new server is an empty string should be given for this field.
function LuaPlayer.connect_to_server(address, description, name, password) end

---Creates and attaches a character entity to this player.
---
---The player must not have a character already connected and must be online (see [LuaPlayer::connected](LuaPlayer::connected)).
---@param character? string @The character to create else the default is used.
---@return boolean @Whether the character was created.
function LuaPlayer.create_character(character) end

---Spawn flying text that is only visible to this player. Either `position` or `create_at_cursor` are required. When `create_at_cursor` is `true`, all parameters other than `text` are ignored.
---
---If no custom `speed` is set and the text is longer than 25 characters, its `time_to_live` and `speed` are dynamically adjusted to give players more time to read it.
---\
---Local flying text is not saved, which means it will disappear after a save/load-cycle.
---@param color? Color @The color of the flying text. Defaults to white text.
---@param create_at_cursor? boolean @If `true`, the flying text is created at the player's cursor. Defaults to `false`.
---@param position? MapPosition @The location on the map at which to show the flying text.
---@param speed? double @The speed at which the text rises upwards in tiles/second. Can't be a negative value.
---@param text LocalisedString @The flying text to show.
---@param time_to_live? uint @The amount of ticks that the flying text will be shown for. Defaults to `80`.
function LuaPlayer.create_local_flying_text(color, create_at_cursor, position, speed, text, time_to_live) end

---Disables alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was disabled (false if it was already disabled).
function LuaPlayer.disable_alert(alert_type) end

---Disable recipe groups.
function LuaPlayer.disable_recipe_groups() end

---Disable recipe subgroups.
function LuaPlayer.disable_recipe_subgroups() end

---Disassociates a character from this player. This is functionally the same as setting [LuaEntity::associated_player](LuaEntity::associated_player) to `nil`.
---
---See [LuaPlayer::get_associated_characters](LuaPlayer::get_associated_characters) for more information.
---@param character LuaEntity @The character entity
function LuaPlayer.disassociate_character(character) end

---Start/end wire dragging at the specified location, wire type is based on the cursor contents
---@param position MapPosition @Position at which cursor was clicked. Used only to decide which side of arithmetic combinator, decider combinator or power switch is to be connected. Entity itself to be connected is based on the player's selected entity.
---@return boolean @`true` if the action did something
function LuaPlayer.drag_wire(position) end

---Enables alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was enabled (false if it was already enabled).
function LuaPlayer.enable_alert(alert_type) end

---Enable recipe groups.
function LuaPlayer.enable_recipe_groups() end

---Enable recipe subgroups.
function LuaPlayer.enable_recipe_subgroups() end

---Exit the current cutscene. Errors if not in a cutscene.
function LuaPlayer.exit_cutscene() end

---Gets which quick bar page is being used for the given screen page or `nil` if not known.
---@param index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
---@return uint8
function LuaPlayer.get_active_quick_bar_page(index) end

---Get all alerts matching the given filters, or all alerts if no filters are given.
---@param entity? LuaEntity
---@param position? MapPosition
---@param prototype? LuaEntityPrototype
---@param surface? SurfaceIdentification
---@param type? defines.alert_type
---@return table<uint, table<defines.alert_type, Alert[]>> @A mapping of surface index to an array of arrays of [alerts](Alert) indexed by the [alert type](defines.alert_type).
function LuaPlayer.get_alerts(entity, position, prototype, surface, type) end

---The characters associated with this player.
---
---The array will always be empty when the player is disconnected (see [LuaPlayer::connected](LuaPlayer::connected)) regardless of there being associated characters.
---\
---Characters associated with this player will be logged off when this player disconnects but are not controlled by any player.
---@return LuaEntity[]
function LuaPlayer.get_associated_characters() end

---Get the current goal description, as a localised string.
---@return LocalisedString
function LuaPlayer.get_goal_description() end

---Gets the filter for this map editor infinity filters at the given index or `nil` if the filter index doesn't exist or is empty.
---@param index uint @The index to get.
---@return InfinityInventoryFilter
function LuaPlayer.get_infinity_inventory_filter(index) end

---Gets the quick bar filter for the given slot or `nil`.
---@param index uint @The slot index. 1 for the first slot of page one, 2 for slot two of page one, 11 for the first slot of page 2, etc.
---@return LuaItemPrototype
function LuaPlayer.get_quick_bar_slot(index) end

---All methods and properties that this object supports.
---@return string
function LuaPlayer.help() end

---If the given alert type is currently enabled.
---@param alert_type defines.alert_type
---@return boolean
function LuaPlayer.is_alert_enabled(alert_type) end

---If the given alert type is currently muted.
---@param alert_type defines.alert_type
---@return boolean
function LuaPlayer.is_alert_muted(alert_type) end

---Is a custom Lua shortcut currently available?
---@param prototype_name string @Prototype name of the custom shortcut.
---@return boolean
function LuaPlayer.is_shortcut_available(prototype_name) end

---Is a custom Lua shortcut currently toggled?
---@param prototype_name string @Prototype name of the custom shortcut.
---@return boolean
function LuaPlayer.is_shortcut_toggled(prototype_name) end

---Jump to the specified cutscene waypoint. Only works when the player is viewing a cutscene.
---@param waypoint_index uint
function LuaPlayer.jump_to_cutscene_waypoint(waypoint_index) end

---Logs a dictionary of chunks -> active entities for the surface this player is on.
function LuaPlayer.log_active_entity_chunk_counts() end

---Logs a dictionary of active entities -> count for the surface this player is on.
function LuaPlayer.log_active_entity_counts() end

---Mutes alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was muted (false if it was already muted).
function LuaPlayer.mute_alert(alert_type) end

---Queues a request to open the map at the specified position. If the map is already opened, the request will simply set the position (and scale). Render mode change requests are processed before rendering of the next frame.
---@param position MapPosition
---@param scale? double
function LuaPlayer.open_map(position, scale) end

---Invokes the "smart pipette" action on the player as if the user pressed it.
---@param entity string|LuaEntity|LuaEntityPrototype
---@return boolean @Whether the smart pipette found something to place.
function LuaPlayer.pipette_entity(entity) end

---Play a sound for this player.
---@param override_sound_type? SoundType @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.
---@param path SoundPath @The sound to play.
---@param position? MapPosition @Where the sound should be played. If not given, it's played at the current position of the player.
---@param volume_modifier? double @The volume of the sound to play. Must be between 0 and 1 inclusive.
function LuaPlayer.play_sound(override_sound_type, path, position, volume_modifier) end

---Print text to the chat console.
---
---Messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param color? Color
---@param message LocalisedString
function LuaPlayer.print(color, message) end

---Print entity statistics to the player's console.
---@param entities? string[] @Entity prototypes to get statistics for. If not specified or empty, display statistics for all entities.
function LuaPlayer.print_entity_statistics(entities) end

---Print LuaObject counts per mod.
function LuaPlayer.print_lua_object_statistics() end

---Print construction robot job counts to the players console.
function LuaPlayer.print_robot_jobs() end

---Removes all alerts matching the given filters or if an empty filters table is given all alerts are removed.
---@param entity? LuaEntity
---@param icon? SignalID
---@param message? LocalisedString
---@param position? MapPosition
---@param prototype? LuaEntityPrototype
---@param surface? SurfaceIdentification
---@param type? defines.alert_type
function LuaPlayer.remove_alert(entity, icon, message, position, prototype, surface, type) end

---Requests a translation for the given localised string. If the request is successful the [on_string_translated](on_string_translated) event will be fired at a later time with the results.
---
---Does nothing if this player is not connected. (see [LuaPlayer::connected](LuaPlayer::connected)).
---@param localised_string LocalisedString
---@return boolean @Whether the request was sent or not.
function LuaPlayer.request_translation(localised_string) end

---Sets which quick bar page is being used for the given screen page.
---@param page_index uint @The new quick bar page.
---@param screen_index uint @The screen page. Index 1 is the top row in the gui. Index can go beyond the visible number of bars on the screen to account for the interface config setting change.
function LuaPlayer.set_active_quick_bar_page(page_index, screen_index) end

---Set the controller type of the player.
---
---Setting a player to [defines.controllers.editor](defines.controllers.editor) auto promotes the player to admin and enables cheat mode.
---\
---Setting a player to [defines.controllers.editor](defines.controllers.editor) also requires the calling player be an admin.
---@param character? LuaEntity @Entity to control. Mandatory when `type` is [defines.controllers.character](defines.controllers.character), ignored otherwise.
---@param chart_mode_cutoff? double @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the game will switch to chart-mode (map zoomed out) rendering when the zoom level is less than this value.
---@param final_transition_time? uint @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), it is the time in ticks it will take for the camera to pan from the final waypoint back to the starting position. If not given the camera will not pan back to the start position/zoom.
---@param start_position? MapPosition @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the cutscene will start at this position. If not given the start position will be the player position.
---@param start_zoom? double @If specified and `type` is [defines.controllers.cutscene](defines.controllers.cutscene), the cutscene will start at this zoom level. If not given the start zoom will be the players zoom.
---@param type defines.controllers @Which controller to use.
---@param waypoints? CutsceneWaypoint @List of waypoints for the cutscene controller. This parameter is mandatory when `type` is [defines.controllers.cutscene](defines.controllers.cutscene).
function LuaPlayer.set_controller(character, chart_mode_cutoff, final_transition_time, start_position, start_zoom, type, waypoints) end

---Setup the screen to be shown when the game is finished.
---@param file? string @Path to image to be shown.
---@param message LocalisedString @Message to be shown.
function LuaPlayer.set_ending_screen_data(file, message) end

---Set the text in the goal window (top left).
---@param only_update? boolean @When `true`, won't play the "goal updated" sound.
---@param text? LocalisedString @The text to display. Lines can be delimited with `\n`. Passing an empty string or omitting this parameter entirely will make the goal window disappear.
function LuaPlayer.set_goal_description(only_update, text) end

---Sets the filter for this map editor infinity filters at the given index.
---@param filter InfinityInventoryFilter @The new filter or `nil` to clear the filter.
---@param index uint @The index to set.
function LuaPlayer.set_infinity_inventory_filter(filter, index) end

---Sets the quick bar filter for the given slot.
---@param filter string|LuaItemPrototype|LuaItemStack @The filter or `nil`.
---@param index uint @The slot index. 1 for the first slot of page one, 2 for slot two of page one, 11 for the first slot of page 2, etc.
function LuaPlayer.set_quick_bar_slot(filter, index) end

---Make a custom Lua shortcut available or unavailable.
---@param available boolean
---@param prototype_name string @Prototype name of the custom shortcut.
function LuaPlayer.set_shortcut_available(available, prototype_name) end

---Toggle or untoggle a custom Lua shortcut
---@param prototype_name string @Prototype name of the custom shortcut.
---@param toggled boolean
function LuaPlayer.set_shortcut_toggled(prototype_name, toggled) end

---Starts selection with selection tool from the specified position. Does nothing if the players cursor is not a selection tool.
---@param position MapPosition @The position to start selection from.
---@param selection_mode string @The type of selection to start. Can be `select`, `alternative-select`, `reverse-select`.
function LuaPlayer.start_selection(position, selection_mode) end

---Toggles this player into or out of the map editor. Does nothing if this player isn't an admin or if the player doesn't have permission to use the map editor.
function LuaPlayer.toggle_map_editor() end

---Unlock the achievements of the given player. This has any effect only when this is the local player, the achievement isn't unlocked so far and the achievement is of the type "achievement".
---@param name string @name of the achievement to unlock
function LuaPlayer.unlock_achievement(name) end

---Unmutes alerts for the given alert category.
---@param alert_type defines.alert_type
---@return boolean @Whether the alert type was unmuted (false if it was wasn't muted).
function LuaPlayer.unmute_alert(alert_type) end

---Uses the current item in the cursor if it's a capsule or does nothing if not.
---@param position MapPosition @Where the item would be used.
function LuaPlayer.use_from_cursor(position) end

---Queues a request to zoom to world at the specified position. If the player is already zooming to world, the request will simply set the position (and scale). Render mode change requests are processed before rendering of the next frame.
---@param position MapPosition
---@param scale? double
function LuaPlayer.zoom_to_world(position, scale) end

