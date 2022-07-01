---@meta

---`LuaForce` encapsulates data local to each "force" or "faction" of the game. Default forces are player, enemy and neutral. Players and mods can create additional forces (up to 64 total).
---@class LuaForce
---Enables some higher-level AI behaviour for this force. When set to `true`, biters belonging to this force will automatically expand into new territories, build new spawners, and form unit groups. By default, this value is `true` for the enemy force and `false` for all others.`[RW]`
---
---Setting this to `false` does not turn off biters' AI. They will still move around and attack players who come close.
---\
---It is necessary for a force to be AI controllable in order to be able to create unit groups or build bases from scripts.
---@field ai_controllable boolean
---@field artillery_range_modifier double @`[RW]`
---@field character_build_distance_bonus uint @`[RW]`
---@field character_health_bonus double @`[RW]`
---@field character_inventory_slots_bonus uint @the number of additional inventory slots the character main inventory has.`[RW]`
---@field character_item_drop_distance_bonus uint @`[RW]`
---@field character_item_pickup_distance_bonus double @`[RW]`
---@field character_logistic_requests boolean @`true` if character requester logistics is enabled.`[RW]`
---@field character_loot_pickup_distance_bonus double @`[RW]`
---@field character_reach_distance_bonus uint @`[RW]`
---@field character_resource_reach_distance_bonus double @`[RW]`
---@field character_running_speed_modifier double @Modifies the running speed of all characters in this force by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`.`[RW]`
---@field character_trash_slot_count double @Number of character trash slots.`[RW]`
---The connected players belonging to this force.
---
---This is primarily useful when you want to do some action against all online players of this force.`[R]`
---
---This does *not* index using player index. See [LuaPlayer::index](LuaPlayer::index) on each player instance for the player index.
---@field connected_players LuaPlayer[]
---@field current_research LuaTechnology @The current technology in research, or `nil` if no research is currently ongoing.`[R]`
---@field deconstruction_time_to_live uint @The time, in ticks, before a deconstruction order is removed.`[RW]`
---@field entity_build_count_statistics LuaFlowStatistics @The entity build statistics for this force (built and mined)`[R]`
---@field evolution_factor double @Evolution factor of this force.`[RW]`
---@field evolution_factor_by_killing_spawners double @`[RW]`
---@field evolution_factor_by_pollution double @`[RW]`
---@field evolution_factor_by_time double @`[RW]`
---@field fluid_production_statistics LuaFlowStatistics @The fluid production statistics for this force.`[R]`
---@field following_robots_lifetime_modifier double @Additional lifetime for following robots.`[RW]`
---@field friendly_fire boolean @If friendly fire is enabled for this force.`[RW]`
---@field ghost_time_to_live uint @The time, in ticks, before a placed ghost disappears.`[RW]`
---@field index uint @Unique ID associated with this force.`[R]`
---@field inserter_stack_size_bonus double @The inserter stack size bonus for non stack inserters`[RW]`
---@field item_production_statistics LuaFlowStatistics @The item production statistics for this force.`[R]`
---@field items_launched table<string, uint> @All of the items that have been launched in rockets. The attribute is a dictionary mapping the item prototype names to the launched amounts.`[R]`
---@field kill_count_statistics LuaFlowStatistics @The kill counter statistics for this force.`[R]`
---@field laboratory_productivity_bonus double @`[RW]`
---@field laboratory_speed_modifier double @`[RW]`
---@field logistic_networks table<string, LuaLogisticNetwork[]> @List of logistic networks, grouped by surface.`[R]`
---Multiplier of the manual crafting speed. Default value is `0`. The actual crafting speed will be multiplied by `1 + manual_crafting_speed_modifier`.`[RW]`
---
---Double the player's crafting speed 
---```lua
---game.player.force.manual_crafting_speed_modifier = 1
---```
---@field manual_crafting_speed_modifier double
---Multiplier of the manual mining speed. Default value is `0`. The actual mining speed will be multiplied by `1 + manual_mining_speed_modifier`.`[RW]`
---
---Double the player's mining speed 
---```lua
---game.player.force.manual_mining_speed_modifier = 1
---```
---@field manual_mining_speed_modifier double
---@field max_failed_attempts_per_tick_per_construction_queue uint @`[RW]`
---@field max_successful_attempts_per_tick_per_construction_queue uint @`[RW]`
---@field maximum_following_robot_count uint @Maximum number of follower robots.`[RW]`
---@field mining_drill_productivity_bonus double @`[RW]`
---Name of the force.`[R]`
---
---Prints "`player`" 
---```lua
---game.player.print(game.player.force.name)
---```
---@field name string
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.`[R]`
---@field players LuaPlayer[] @Players belonging to this force.`[R]`
---@field previous_research LuaTechnology @The previous research if any.`[RW]`
---Recipes available to this force, indexed by `name`.`[R]`
---
---Prints the category of the given recipe 
---```lua
---game.player.print(game.player.force.recipes["transport-belt"].category)
---```
---@field recipes table<string, LuaRecipe>
---@field research_enabled boolean @Whether research is enabled for this force, see [LuaForce::enable_research](LuaForce::enable_research) and [LuaForce::disable_research](LuaForce::disable_research)`[R]`
---@field research_progress double @Progress of current research, as a number in range [0, 1].`[RW]`
---The research queue of this force. The first technology in the array is the currently active one. Reading this attribute gives an array of [LuaTechnology](LuaTechnology).
---
---To write to this, the entire table must be written. Providing an empty table or `nil` will empty the research queue and cancel the current research. Writing to this when the research queue is disabled will simply set the last research in the table as the current research.`[RW]`
---
---This only allows mods to queue research that this force is able to research in the first place. As an example, an already researched technology or one whose prerequisites are not fulfilled will not be queued, but dropped silently instead.
---@field research_queue TechnologyIdentification[]
---@field research_queue_enabled boolean @Whether the research queue is available for this force.`[RW]`
---@field rockets_launched uint @The number of rockets launched.`[RW]`
---@field share_chart boolean @If sharing chart data is enabled for this force.`[RW]`
---@field stack_inserter_capacity_bonus uint @Number of items that can be transferred by stack inserters. When writing to this value, it must be >= 0 and <= 254.`[RW]`
---Technologies owned by this force, indexed by `name`.`[R]`
---
---Researches the technology for the player's force 
---```lua
---game.player.force.technologies["steel-processing"].researched = true
---```
---@field technologies table<string, LuaTechnology>
---@field train_braking_force_bonus double @`[RW]`
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.`[R]`
---@field worker_robots_battery_modifier double @`[RW]`
---@field worker_robots_speed_modifier double @`[RW]`
---@field worker_robots_storage_bonus double @`[RW]`
---@field zoom_to_world_blueprint_enabled boolean @Ability to create new blueprints using empty blueprint item when using zoom-to-world.`[RW]`
---@field zoom_to_world_deconstruction_planner_enabled boolean @Ability to use deconstruction planner when using zoom-to-world.`[RW]`
---@field zoom_to_world_enabled boolean @Ability to use zoom-to-world on map.`[RW]`
---@field zoom_to_world_ghost_building_enabled boolean @Ability to build ghosts through blueprint or direct ghost placement, or "mine" ghosts when using zoom-to-world.`[RW]`
---@field zoom_to_world_selection_tool_enabled boolean @Ability to use custom selection tools when using zoom-to-world.`[RW]`
local LuaForce = {}

---Adds a custom chart tag to the given surface and returns the new tag or `nil` if the given position isn't valid for a chart tag.
---
---The chunk must be charted for a tag to be valid at that location.
---@param surface SurfaceIdentification @Which surface to add the tag to.
---@param tag ChartTagSpec @The tag to add.
---@return LuaCustomChartTag
function LuaForce.add_chart_tag(surface, tag) end

---Add this technology to the back of the research queue if the queue is enabled. Otherwise, set this technology to be researched now.
---@param technology TechnologyIdentification
---@return boolean @Whether the technology was successfully added.
function LuaForce.add_research(technology) end

---Cancels pending chart requests for the given surface or all surfaces.
---@param surface? SurfaceIdentification
function LuaForce.cancel_charting(surface) end

---Stop the research currently in progress. This will remove any dependent technologies from the research queue.
function LuaForce.cancel_current_research() end

---Chart a portion of the map. The chart for the given area is refreshed; it creates chart for any parts of the given area that haven't been charted yet.
---
---Charts a 2048x2048 rectangle centered around the origin. 
---```lua
---game.player.force.chart(game.player.surface, {{x = -1024, y = -1024}, {x = 1024, y = 1024}})
---```
---@param area BoundingBox @The area on the given surface to chart.
---@param surface SurfaceIdentification
function LuaForce.chart(area, surface) end

---Chart all generated chunks.
---@param surface? SurfaceIdentification @Which surface to chart or all if not given.
function LuaForce.chart_all(surface) end

---Erases chart data for this force.
---@param surface? SurfaceIdentification @Which surface to erase chart data for or if not provided all surfaces charts are erased.
function LuaForce.clear_chart(surface) end

---Disable all recipes and technologies. Only recipes and technologies enabled explicitly will be useable from this point.
function LuaForce.disable_all_prototypes() end

---Disable research for this force.
function LuaForce.disable_research() end

---Enables all recipes and technologies. The opposite of [LuaForce::disable_all_prototypes](LuaForce::disable_all_prototypes)
function LuaForce.enable_all_prototypes() end

---Unlock all recipes.
function LuaForce.enable_all_recipes() end

---Unlock all technologies.
function LuaForce.enable_all_technologies() end

---Enable research for this force.
function LuaForce.enable_research() end

---Finds all custom chart tags within the given bounding box on the given surface.
---@param area? BoundingBox
---@param surface SurfaceIdentification
---@return LuaCustomChartTag[]
function LuaForce.find_chart_tags(area, surface) end

---
---@param position MapPosition @Position to find a network for
---@param surface SurfaceIdentification @Surface to search on
---@return LuaLogisticNetwork @The found network or `nil`.
function LuaForce.find_logistic_network_by_position(position, surface) end

---
---@param ammo string @Ammo category
---@return double
function LuaForce.get_ammo_damage_modifier(ammo) end

---Is `other` force in this force's cease fire list?
---@param other ForceIdentification
---@return boolean
function LuaForce.get_cease_fire(other) end

---Count entities of given type.
---
---This function has O(1) time complexity as entity counts are kept and maintained in the game engine.
---@param name string @Prototype name of the entity.
---@return uint @Number of entities of given prototype belonging to this force.
function LuaForce.get_entity_count(name) end

---Is `other` force in this force's friends list.
---@param other ForceIdentification
---@return boolean
function LuaForce.get_friend(other) end

---
---@param ammo string @Ammo category
---@return double
function LuaForce.get_gun_speed_modifier(ammo) end

---Gets if the given recipe is explicitly disabled from being hand crafted.
---@param recipe string|LuaRecipe
---@return boolean
function LuaForce.get_hand_crafting_disabled_for_recipe(recipe) end

---Gets the count of a given item launched in rockets.
---@param item string @The item to get
---@return uint @The count of the item that has been launched.
function LuaForce.get_item_launched(item) end

---Gets the linked inventory for the given prototype and link ID if it exists or `nil`.
---@param link_id uint
---@param prototype EntityPrototypeIdentification
---@return LuaInventory
function LuaForce.get_linked_inventory(link_id, prototype) end

---Gets the saved progress for the given technology or `nil` if there is no saved progress.
---@param technology TechnologyIdentification @The technology
---@return double @The progress as a percent.
function LuaForce.get_saved_technology_progress(technology) end

---
---@param surface SurfaceIdentification
---@return MapPosition
function LuaForce.get_spawn_position(surface) end

---Gets train stops matching the given filters.
---@param name? string|string[]
---@param surface? SurfaceIdentification
---@return LuaEntity[]
function LuaForce.get_train_stops(name, surface) end

---
---@param surface? SurfaceIdentification @If given only trains on the surface are returned.
---@return LuaTrain[]
function LuaForce.get_trains(surface) end

---
---@param turret string @Turret prototype name
---@return double
function LuaForce.get_turret_attack_modifier(turret) end

---All methods and properties that this object supports.
---@return string
function LuaForce.help() end

---Has a chunk been charted?
---@param position ChunkPosition @Position of the chunk.
---@param surface SurfaceIdentification
---@return boolean
function LuaForce.is_chunk_charted(position, surface) end

---Is the given chunk currently charted and visible (not covered by fog of war) on the map.
---@param position ChunkPosition
---@param surface SurfaceIdentification
---@return boolean
function LuaForce.is_chunk_visible(position, surface) end

---Is this force an enemy? This differs from `get_cease_fire` in that it is always false for neutral force. This is equivalent to checking the `enemy` ForceCondition.
---@param other ForceIdentification
---@return boolean
function LuaForce.is_enemy(other) end

---Is this force a friend? This differs from `get_friend` in that it is always true for neutral force. This is equivalent to checking the `friend` ForceCondition.
---@param other ForceIdentification
---@return boolean
function LuaForce.is_friend(other) end

---Is pathfinder busy? When the pathfinder is busy, it won't accept any more pathfinding requests.
---@return boolean
function LuaForce.is_pathfinder_busy() end

---Kill all units and flush the pathfinder.
function LuaForce.kill_all_units() end

---Play a sound for every player in this force.
---@param override_sound_type? SoundType @The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.
---@param path SoundPath @The sound to play.
---@param position? MapPosition @Where the sound should be played. If not given, it's played at the current position of each player.
---@param volume_modifier? double @The volume of the sound to play. Must be between 0 and 1 inclusive.
function LuaForce.play_sound(override_sound_type, path, position, volume_modifier) end

---Print text to the chat console of all players on this force.
---
---Messages that are identical to a message sent in the last 60 ticks are not printed again.
---@param color? Color
---@param message LocalisedString
function LuaForce.print(color, message) end

---Force a rechart of the whole chart.
function LuaForce.rechart() end

---Research all technologies.
---@param include_disabled_prototypes? boolean @Whether technologies that are explicitly disabled in the prototype should also be researched. Defaults to `false`.
function LuaForce.research_all_technologies(include_disabled_prototypes) end

---Reset everything. All technologies are set to not researched, all modifiers are set to default values.
function LuaForce.reset() end

---Resets evolution for this force to zero.
function LuaForce.reset_evolution() end

---Load the original version of all recipes from the prototypes.
function LuaForce.reset_recipes() end

---Load the original versions of technologies from prototypes. Preserves research state of technologies.
function LuaForce.reset_technologies() end

---Reapplies all possible research effects, including unlocked recipes. Any custom changes are lost. Preserves research state of technologies.
function LuaForce.reset_technology_effects() end

---
---@param ammo string @Ammo category
---@param modifier double
function LuaForce.set_ammo_damage_modifier(ammo, modifier) end

---Add `other` force to this force's cease fire list. Forces on the cease fire list won't be targeted for attack.
---@param cease_fire boolean
---@param other ForceIdentification
function LuaForce.set_cease_fire(cease_fire, other) end

---Add `other` force to this force's friends list. Friends have unrestricted access to buildings and turrets won't fire at them.
---@param friend boolean
---@param other ForceIdentification
function LuaForce.set_friend(friend, other) end

---
---@param ammo string @Ammo category
---@param modifier double
function LuaForce.set_gun_speed_modifier(ammo, modifier) end

---Sets if the given recipe can be hand-crafted. This is used to explicitly disable hand crafting a recipe - it won't allow hand-crafting otherwise not hand-craftable recipes.
---@param hand_crafting_disabled boolean
---@param recipe string|LuaRecipe
function LuaForce.set_hand_crafting_disabled_for_recipe(hand_crafting_disabled, recipe) end

---Sets the count of a given item launched in rockets.
---@param count uint @The count to set
---@param item string @The item to set
function LuaForce.set_item_launched(count, item) end

---Sets the saved progress for the given technology. The technology must not be in progress, must not be completed, and the new progress must be < 100%.
---@param progress double @Progress as a percent. Set to `nil` to remove the saved progress.
---@param technology TechnologyIdentification @The technology
function LuaForce.set_saved_technology_progress(progress, technology) end

---
---@param position MapPosition @The new position on the given surface.
---@param surface SurfaceIdentification @Surface to set the spawn position for.
function LuaForce.set_spawn_position(position, surface) end

---
---@param modifier double
---@param turret string @Turret prototype name
function LuaForce.set_turret_attack_modifier(modifier, turret) end

---
---@param position ChunkPosition @The chunk position to unchart.
---@param surface SurfaceIdentification @Surface to unchart on.
function LuaForce.unchart_chunk(position, surface) end

