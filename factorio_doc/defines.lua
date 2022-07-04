---@meta

---@class Defines
---@field alert_type Defines.alert_type
---@field behavior_result Defines.behavior_result @AI command exit status. See [LuaEntity::set_command](LuaEntity::set_command)
---@field build_check_type Defines.build_check_type
---@field chain_signal_state Defines.chain_signal_state @State of a chain signal.
---@field chunk_generated_status Defines.chunk_generated_status
---@field circuit_condition_index Defines.circuit_condition_index
---@field circuit_connector_id Defines.circuit_connector_id
---@field command Defines.command @Command given to units describing what they should do.
---@field compound_command Defines.compound_command @How commands are joined together in a compound command (see [defines.command.compound](defines.command.compound)).
---@field control_behavior Defines.control_behavior
---@field controllers Defines.controllers
---@field deconstruction_item Defines.deconstruction_item
---@field difficulty Defines.difficulty
---@field difficulty_settings Defines.difficulty_settings
---@field direction Defines.direction
---@field disconnect_reason Defines.disconnect_reason
---@field distraction Defines.distraction
---@field entity_status Defines.entity_status
---@field events Defines.events @See the [events page](events.html) for more info on what events contain and when they get raised.
---@field flow_precision_index Defines.flow_precision_index
---@field group_state Defines.group_state
---@field gui_type Defines.gui_type
---@field input_action Defines.input_action
---@field inventory Defines.inventory
---@field logistic_member_index Defines.logistic_member_index
---@field logistic_mode Defines.logistic_mode
---@field mouse_button_type Defines.mouse_button_type
---@field prototypes Defines.prototypes @A dictionary mapping all top-level prototypes by name to a list of their associated subtypes. This list is organized as a lookup table, meaning it maps the sub-prototype names to `0`. As an example, `defines.prototypes['entity']` looks like this: `{furnace=0, inserter=0, container=0, ...}`.
---@field rail_connection_direction Defines.rail_connection_direction
---@field rail_direction Defines.rail_direction
---@field relative_gui_position Defines.relative_gui_position
---@field relative_gui_type Defines.relative_gui_type
---@field render_mode Defines.render_mode
---@field rich_text_setting Defines.rich_text_setting
---@field riding Defines.riding
---@field shooting Defines.shooting
---@field signal_state Defines.signal_state @State of an ordinary rail signal.
---@field train_state Defines.train_state
---@field transport_line Defines.transport_line
---@field wire_connection_id Defines.wire_connection_id
---@field wire_type Defines.wire_type

---@class Defines.alert_type
---@field custom any
---@field entity_destroyed any
---@field entity_under_attack any
---@field no_material_for_construction any
---@field no_storage any
---@field not_enough_construction_robots any
---@field not_enough_repair_packs any
---@field train_out_of_fuel any
---@field turret_fire any

---@class Defines.behavior_result
---@field deleted any
---@field fail any
---@field in_progress any
---@field success any

---@class Defines.build_check_type
---@field blueprint_ghost any
---@field ghost_revive any
---@field manual any
---@field manual_ghost any
---@field script any
---@field script_ghost any

---@class Defines.chain_signal_state
---@field all_open any
---@field none any
---@field none_open any
---@field partially_open any

---@class Defines.chunk_generated_status
---@field basic_tiles any
---@field corrected_tiles any
---@field custom_tiles any
---@field entities any
---@field nothing any
---@field tiles any

---@class Defines.circuit_condition_index
---@field arithmetic_combinator any
---@field constant_combinator any
---@field decider_combinator any
---@field inserter_circuit any
---@field inserter_logistic any
---@field lamp any
---@field offshore_pump any
---@field pump any

---@class Defines.circuit_connector_id
---@field accumulator any
---@field combinator_input any
---@field combinator_output any
---@field constant_combinator any
---@field container any
---@field electric_pole any
---@field inserter any
---@field lamp any
---@field offshore_pump any
---@field programmable_speaker any
---@field pump any
---@field rail_chain_signal any
---@field rail_signal any
---@field roboport any
---@field storage_tank any
---@field wall any

---@class Defines.command
---@field attack any @Attack another entity.
---@field attack_area any @Go to a place and attack what you see.
---@field build_base any @Go to a position and build a base there.
---@field compound any @Chain commands together, see [defines.compound_command](defines.compound_command).
---@field flee any @Flee from another entity.
---@field go_to_location any @Go to a specific position.
---@field group any @Do what your group wants you to do.
---@field stop any @Stop moving and stay where you are.
---@field wander any @Chill.

---@class Defines.compound_command
---@field logical_and any @Fail on first failure. Only succeeds if all commands (executed one after another) succeed.
---@field logical_or any @Succeed on first success. Only fails if all commands (executed one after another) fail.
---@field return_last any @Execute all commands in sequence and fail or succeed depending on the return status of the last command.

---@class Defines.control_behavior.inserter.circuit_mode_of_operation
---@field enable_disable any
---@field none any
---@field read_hand_contents any
---@field set_filters any
---@field set_stack_size any

---@class Defines.control_behavior.inserter.hand_read_mode
---@field hold any
---@field pulse any

---@class Defines.control_behavior.inserter
---@field circuit_mode_of_operation Defines.control_behavior.inserter.circuit_mode_of_operation
---@field hand_read_mode Defines.control_behavior.inserter.hand_read_mode

---@class Defines.control_behavior.lamp.circuit_mode_of_operation
---@field use_colors any

---@class Defines.control_behavior.lamp
---@field circuit_mode_of_operation Defines.control_behavior.lamp.circuit_mode_of_operation

---@class Defines.control_behavior.logistic_container.circuit_mode_of_operation
---@field send_contents any
---@field set_requests any

---@class Defines.control_behavior.logistic_container
---@field circuit_mode_of_operation Defines.control_behavior.logistic_container.circuit_mode_of_operation

---@class Defines.control_behavior.mining_drill.resource_read_mode
---@field entire_patch any
---@field this_miner any

---@class Defines.control_behavior.mining_drill
---@field resource_read_mode Defines.control_behavior.mining_drill.resource_read_mode

---@class Defines.control_behavior.transport_belt.content_read_mode
---@field hold any
---@field pulse any

---@class Defines.control_behavior.transport_belt
---@field content_read_mode Defines.control_behavior.transport_belt.content_read_mode

---@class Defines.control_behavior.type
---@field accumulator any @[LuaAccumulatorControlBehavior](LuaAccumulatorControlBehavior)
---@field arithmetic_combinator any @[LuaArithmeticCombinatorControlBehavior](LuaArithmeticCombinatorControlBehavior)
---@field constant_combinator any @[LuaConstantCombinatorControlBehavior](LuaConstantCombinatorControlBehavior)
---@field container any @[LuaContainerControlBehavior](LuaContainerControlBehavior)
---@field decider_combinator any @[LuaDeciderCombinatorControlBehavior](LuaDeciderCombinatorControlBehavior)
---@field generic_on_off any @[LuaGenericOnOffControlBehavior](LuaGenericOnOffControlBehavior)
---@field inserter any @[LuaInserterControlBehavior](LuaInserterControlBehavior)
---@field lamp any @[LuaLampControlBehavior](LuaLampControlBehavior)
---@field logistic_container any @[LuaLogisticContainerControlBehavior](LuaLogisticContainerControlBehavior)
---@field mining_drill any @[LuaMiningDrillControlBehavior](LuaMiningDrillControlBehavior)
---@field programmable_speaker any @[LuaProgrammableSpeakerControlBehavior](LuaProgrammableSpeakerControlBehavior)
---@field rail_chain_signal any @[LuaRailChainSignalControlBehavior](LuaRailChainSignalControlBehavior)
---@field rail_signal any @[LuaRailSignalControlBehavior](LuaRailSignalControlBehavior)
---@field roboport any @[LuaRoboportControlBehavior](LuaRoboportControlBehavior)
---@field storage_tank any @[LuaStorageTankControlBehavior](LuaStorageTankControlBehavior)
---@field train_stop any @[LuaTrainStopControlBehavior](LuaTrainStopControlBehavior)
---@field transport_belt any @[LuaTransportBeltControlBehavior](LuaTransportBeltControlBehavior)
---@field wall any @[LuaWallControlBehavior](LuaWallControlBehavior)

---@class Defines.control_behavior
---@field inserter Defines.control_behavior.inserter
---@field lamp Defines.control_behavior.lamp
---@field logistic_container Defines.control_behavior.logistic_container
---@field mining_drill Defines.control_behavior.mining_drill
---@field transport_belt Defines.control_behavior.transport_belt
---@field type Defines.control_behavior.type

---@class Defines.controllers
---@field character any @The controller controls a character. This is the default controller in freeplay.
---@field cutscene any @The player can't interact with the world, and the camera pans around in a predefined manner.
---@field editor any @The Editor Controller near ultimate power to do almost anything in the game.
---@field ghost any @Can't interact with the world, can only observe. Used in the multiplayer waiting-to-respawn screen.
---@field god any @The controller isn't tied to a character. This is the default controller in sandbox.
---@field spectator any @Can't change anything in the world but can view anything.

---@class Defines.deconstruction_item.entity_filter_mode
---@field blacklist any
---@field whitelist any

---@class Defines.deconstruction_item.tile_filter_mode
---@field blacklist any
---@field whitelist any

---@class Defines.deconstruction_item.tile_selection_mode
---@field always any
---@field never any
---@field normal any
---@field only any

---@class Defines.deconstruction_item
---@field entity_filter_mode Defines.deconstruction_item.entity_filter_mode
---@field tile_filter_mode Defines.deconstruction_item.tile_filter_mode
---@field tile_selection_mode Defines.deconstruction_item.tile_selection_mode

---@class Defines.difficulty
---@field easy any
---@field hard any
---@field normal any

---@class Defines.difficulty_settings.recipe_difficulty
---@field expensive any
---@field normal any

---@class Defines.difficulty_settings.technology_difficulty
---@field expensive any
---@field normal any

---@class Defines.difficulty_settings
---@field recipe_difficulty Defines.difficulty_settings.recipe_difficulty
---@field technology_difficulty Defines.difficulty_settings.technology_difficulty

---@class Defines.direction
---@field east any
---@field north any
---@field northeast any
---@field northwest any
---@field south any
---@field southeast any
---@field southwest any
---@field west any

---@class Defines.disconnect_reason
---@field afk any
---@field banned any
---@field cannot_keep_up any
---@field desync_limit_reached any
---@field dropped any
---@field kicked any
---@field kicked_and_deleted any
---@field quit any
---@field reconnect any
---@field switching_servers any
---@field wrong_input any

---@class Defines.distraction
---@field by_anything any @Attack closer enemy entities, including entities "built" by player (belts, inserters, chests).
---@field by_damage any @Attack when attacked.
---@field by_enemy any @Attack closer enemy entities with force.
---@field none any @Perform command even if someone attacks the unit.

---@class Defines.entity_status
---@field cant_divide_segments any @Used by rail signals.
---@field charging any @Used by accumulators.
---@field closed_by_circuit_network any
---@field disabled any @Used by constant combinators: Combinator is turned off via switch in GUI.
---@field disabled_by_control_behavior any
---@field disabled_by_script any
---@field discharging any @Used by accumulators.
---@field fluid_ingredient_shortage any @Used by crafting machines.
---@field full_output any @Used by crafting machines, boilers, burner energy sources and reactors: Reactor/burner has full burnt result inventory, boiler has full output fluidbox.
---@field fully_charged any @Used by accumulators.
---@field item_ingredient_shortage any @Used by crafting machines.
---@field launching_rocket any @Used by the rocket silo.
---@field low_input_fluid any @Used by boilers and fluid turrets: Boiler still has some fluid but is about to run out.
---@field low_power any
---@field low_temperature any @Used by heat energy sources.
---@field marked_for_deconstruction any
---@field missing_required_fluid any @Used by mining drills when the mining fluid is missing.
---@field missing_science_packs any @Used by labs.
---@field networks_connected any @Used by power switches.
---@field networks_disconnected any @Used by power switches.
---@field no_ammo any @Used by ammo turrets.
---@field no_fuel any
---@field no_ingredients any @Used by furnaces.
---@field no_input_fluid any @Used by boilers, fluid turrets and fluid energy sources: Boiler has no fluid to work with.
---@field no_minable_resources any @Used by mining drills.
---@field no_modules_to_transmit any @Used by beacons.
---@field no_power any
---@field no_recipe any @Used by assembling machines.
---@field no_research_in_progress any @Used by labs.
---@field normal any
---@field not_connected_to_rail any @Used by rail signals.
---@field not_plugged_in_electric_network any @Used by generators and solar panels.
---@field opened_by_circuit_network any
---@field out_of_logistic_network any @Used by logistic containers.
---@field preparing_rocket_for_launch any @Used by the rocket silo.
---@field recharging_after_power_outage any @Used by roboports.
---@field turned_off_during_daytime any @Used by lamps.
---@field waiting_for_source_items any @Used by inserters.
---@field waiting_for_space_in_destination any @Used by inserters and mining drills.
---@field waiting_for_target_to_be_built any @Used by inserters targeting entity ghosts.
---@field waiting_for_train any @Used by inserters targeting rails.
---@field waiting_to_launch_rocket any @Used by the rocket silo.
---@field working any

---@class Defines.events
---@field on_ai_command_completed on_ai_command_completed
---@field on_area_cloned on_area_cloned
---@field on_biter_base_built on_biter_base_built
---@field on_brush_cloned on_brush_cloned
---@field on_build_base_arrived on_build_base_arrived
---@field on_built_entity on_built_entity
---@field on_cancelled_deconstruction on_cancelled_deconstruction
---@field on_cancelled_upgrade on_cancelled_upgrade
---@field on_character_corpse_expired on_character_corpse_expired
---@field on_chart_tag_added on_chart_tag_added
---@field on_chart_tag_modified on_chart_tag_modified
---@field on_chart_tag_removed on_chart_tag_removed
---@field on_chunk_charted on_chunk_charted
---@field on_chunk_deleted on_chunk_deleted
---@field on_chunk_generated on_chunk_generated
---@field on_combat_robot_expired on_combat_robot_expired
---@field on_console_chat on_console_chat
---@field on_console_command on_console_command
---@field on_cutscene_cancelled on_cutscene_cancelled
---@field on_cutscene_waypoint_reached on_cutscene_waypoint_reached
---@field on_difficulty_settings_changed on_difficulty_settings_changed
---@field on_entity_cloned on_entity_cloned
---@field on_entity_damaged on_entity_damaged
---@field on_entity_destroyed on_entity_destroyed
---@field on_entity_died on_entity_died
---@field on_entity_logistic_slot_changed on_entity_logistic_slot_changed
---@field on_entity_renamed on_entity_renamed
---@field on_entity_settings_pasted on_entity_settings_pasted
---@field on_entity_spawned on_entity_spawned
---@field on_equipment_inserted on_equipment_inserted
---@field on_equipment_removed on_equipment_removed
---@field on_force_cease_fire_changed on_force_cease_fire_changed
---@field on_force_created on_force_created
---@field on_force_friends_changed on_force_friends_changed
---@field on_force_reset on_force_reset
---@field on_forces_merged on_forces_merged
---@field on_forces_merging on_forces_merging
---@field on_game_created_from_scenario on_game_created_from_scenario
---@field on_gui_checked_state_changed on_gui_checked_state_changed
---@field on_gui_click on_gui_click
---@field on_gui_closed on_gui_closed
---@field on_gui_confirmed on_gui_confirmed
---@field on_gui_elem_changed on_gui_elem_changed
---@field on_gui_location_changed on_gui_location_changed
---@field on_gui_opened on_gui_opened
---@field on_gui_selected_tab_changed on_gui_selected_tab_changed
---@field on_gui_selection_state_changed on_gui_selection_state_changed
---@field on_gui_switch_state_changed on_gui_switch_state_changed
---@field on_gui_text_changed on_gui_text_changed
---@field on_gui_value_changed on_gui_value_changed
---@field on_land_mine_armed on_land_mine_armed
---@field on_lua_shortcut on_lua_shortcut
---@field on_marked_for_deconstruction on_marked_for_deconstruction
---@field on_marked_for_upgrade on_marked_for_upgrade
---@field on_market_item_purchased on_market_item_purchased
---@field on_mod_item_opened on_mod_item_opened
---@field on_permission_group_added on_permission_group_added
---@field on_permission_group_deleted on_permission_group_deleted
---@field on_permission_group_edited on_permission_group_edited
---@field on_permission_string_imported on_permission_string_imported
---@field on_picked_up_item on_picked_up_item
---@field on_player_alt_selected_area on_player_alt_selected_area
---@field on_player_ammo_inventory_changed on_player_ammo_inventory_changed
---@field on_player_armor_inventory_changed on_player_armor_inventory_changed
---@field on_player_banned on_player_banned
---@field on_player_built_tile on_player_built_tile
---@field on_player_cancelled_crafting on_player_cancelled_crafting
---@field on_player_changed_force on_player_changed_force
---@field on_player_changed_position on_player_changed_position
---@field on_player_changed_surface on_player_changed_surface
---@field on_player_cheat_mode_disabled on_player_cheat_mode_disabled
---@field on_player_cheat_mode_enabled on_player_cheat_mode_enabled
---@field on_player_clicked_gps_tag on_player_clicked_gps_tag
---@field on_player_configured_blueprint on_player_configured_blueprint
---@field on_player_configured_spider_remote on_player_configured_spider_remote
---@field on_player_crafted_item on_player_crafted_item
---@field on_player_created on_player_created
---@field on_player_cursor_stack_changed on_player_cursor_stack_changed
---@field on_player_deconstructed_area on_player_deconstructed_area
---@field on_player_demoted on_player_demoted
---@field on_player_died on_player_died
---@field on_player_display_resolution_changed on_player_display_resolution_changed
---@field on_player_display_scale_changed on_player_display_scale_changed
---@field on_player_driving_changed_state on_player_driving_changed_state
---@field on_player_dropped_item on_player_dropped_item
---@field on_player_fast_transferred on_player_fast_transferred
---@field on_player_flushed_fluid on_player_flushed_fluid
---@field on_player_gun_inventory_changed on_player_gun_inventory_changed
---@field on_player_joined_game on_player_joined_game
---@field on_player_kicked on_player_kicked
---@field on_player_left_game on_player_left_game
---@field on_player_main_inventory_changed on_player_main_inventory_changed
---@field on_player_mined_entity on_player_mined_entity
---@field on_player_mined_item on_player_mined_item
---@field on_player_mined_tile on_player_mined_tile
---@field on_player_muted on_player_muted
---@field on_player_pipette on_player_pipette
---@field on_player_placed_equipment on_player_placed_equipment
---@field on_player_promoted on_player_promoted
---@field on_player_removed on_player_removed
---@field on_player_removed_equipment on_player_removed_equipment
---@field on_player_repaired_entity on_player_repaired_entity
---@field on_player_respawned on_player_respawned
---@field on_player_reverse_selected_area on_player_reverse_selected_area
---@field on_player_rotated_entity on_player_rotated_entity
---@field on_player_selected_area on_player_selected_area
---@field on_player_set_quick_bar_slot on_player_set_quick_bar_slot
---@field on_player_setup_blueprint on_player_setup_blueprint
---@field on_player_toggled_alt_mode on_player_toggled_alt_mode
---@field on_player_toggled_map_editor on_player_toggled_map_editor
---@field on_player_trash_inventory_changed on_player_trash_inventory_changed
---@field on_player_unbanned on_player_unbanned
---@field on_player_unmuted on_player_unmuted
---@field on_player_used_capsule on_player_used_capsule
---@field on_player_used_spider_remote on_player_used_spider_remote
---@field on_post_entity_died on_post_entity_died
---@field on_pre_build on_pre_build
---@field on_pre_chunk_deleted on_pre_chunk_deleted
---@field on_pre_entity_settings_pasted on_pre_entity_settings_pasted
---@field on_pre_ghost_deconstructed on_pre_ghost_deconstructed
---@field on_pre_permission_group_deleted on_pre_permission_group_deleted
---@field on_pre_permission_string_imported on_pre_permission_string_imported
---@field on_pre_player_crafted_item on_pre_player_crafted_item
---@field on_pre_player_died on_pre_player_died
---@field on_pre_player_left_game on_pre_player_left_game
---@field on_pre_player_mined_item on_pre_player_mined_item
---@field on_pre_player_removed on_pre_player_removed
---@field on_pre_player_toggled_map_editor on_pre_player_toggled_map_editor
---@field on_pre_robot_exploded_cliff on_pre_robot_exploded_cliff
---@field on_pre_script_inventory_resized on_pre_script_inventory_resized
---@field on_pre_surface_cleared on_pre_surface_cleared
---@field on_pre_surface_deleted on_pre_surface_deleted
---@field on_research_cancelled on_research_cancelled
---@field on_research_finished on_research_finished
---@field on_research_reversed on_research_reversed
---@field on_research_started on_research_started
---@field on_resource_depleted on_resource_depleted
---@field on_robot_built_entity on_robot_built_entity
---@field on_robot_built_tile on_robot_built_tile
---@field on_robot_exploded_cliff on_robot_exploded_cliff
---@field on_robot_mined on_robot_mined
---@field on_robot_mined_entity on_robot_mined_entity
---@field on_robot_mined_tile on_robot_mined_tile
---@field on_robot_pre_mined on_robot_pre_mined
---@field on_rocket_launch_ordered on_rocket_launch_ordered
---@field on_rocket_launched on_rocket_launched
---@field on_runtime_mod_setting_changed on_runtime_mod_setting_changed
---@field on_script_inventory_resized on_script_inventory_resized
---@field on_script_path_request_finished on_script_path_request_finished
---@field on_script_trigger_effect on_script_trigger_effect
---@field on_sector_scanned on_sector_scanned
---@field on_selected_entity_changed on_selected_entity_changed
---@field on_spider_command_completed on_spider_command_completed
---@field on_string_translated on_string_translated
---@field on_surface_cleared on_surface_cleared
---@field on_surface_created on_surface_created
---@field on_surface_deleted on_surface_deleted
---@field on_surface_imported on_surface_imported
---@field on_surface_renamed on_surface_renamed
---@field on_technology_effects_reset on_technology_effects_reset
---@field on_tick on_tick
---@field on_train_changed_state on_train_changed_state
---@field on_train_created on_train_created
---@field on_train_schedule_changed on_train_schedule_changed
---@field on_trigger_created_entity on_trigger_created_entity
---@field on_trigger_fired_artillery on_trigger_fired_artillery
---@field on_unit_added_to_group on_unit_added_to_group
---@field on_unit_group_created on_unit_group_created
---@field on_unit_group_finished_gathering on_unit_group_finished_gathering
---@field on_unit_removed_from_group on_unit_removed_from_group
---@field on_worker_robot_expired on_worker_robot_expired
---@field script_raised_built script_raised_built
---@field script_raised_destroy script_raised_destroy
---@field script_raised_revive script_raised_revive
---@field script_raised_set_tiles script_raised_set_tiles

---@class Defines.flow_precision_index
---@field fifty_hours any
---@field five_seconds any
---@field one_hour any
---@field one_minute any
---@field one_thousand_hours any
---@field ten_hours any
---@field ten_minutes any
---@field two_hundred_fifty_hours any

---@class Defines.group_state
---@field attacking_distraction any
---@field attacking_target any
---@field finished any
---@field gathering any
---@field moving any
---@field pathfinding any
---@field wander_in_group any

---@class Defines.gui_type
---@field achievement any
---@field blueprint_library any
---@field bonus any
---@field controller any
---@field custom any
---@field entity any
---@field equipment any
---@field item any
---@field logistic any
---@field none any
---@field other_player any
---@field permissions any
---@field player_management any
---@field production any
---@field research any
---@field server_management any
---@field tile any
---@field trains any
---@field tutorials any

---@class Defines.input_action
---@field activate_copy any
---@field activate_cut any
---@field activate_paste any
---@field add_permission_group any
---@field add_train_station any
---@field admin_action any
---@field alt_select_area any
---@field alt_select_blueprint_entities any
---@field alternative_copy any
---@field begin_mining any
---@field begin_mining_terrain any
---@field build any
---@field build_rail any
---@field build_terrain any
---@field cancel_craft any
---@field cancel_deconstruct any
---@field cancel_new_blueprint any
---@field cancel_research any
---@field cancel_upgrade any
---@field change_active_character_tab any
---@field change_active_item_group_for_crafting any
---@field change_active_item_group_for_filters any
---@field change_active_quick_bar any
---@field change_arithmetic_combinator_parameters any
---@field change_decider_combinator_parameters any
---@field change_entity_label any
---@field change_item_description any
---@field change_item_label any
---@field change_multiplayer_config any
---@field change_picking_state any
---@field change_programmable_speaker_alert_parameters any
---@field change_programmable_speaker_circuit_parameters any
---@field change_programmable_speaker_parameters any
---@field change_riding_state any
---@field change_shooting_state any
---@field change_train_stop_station any
---@field change_train_wait_condition any
---@field change_train_wait_condition_data any
---@field clear_cursor any
---@field connect_rolling_stock any
---@field copy any
---@field copy_entity_settings any
---@field copy_opened_blueprint any
---@field copy_opened_item any
---@field craft any
---@field cursor_split any
---@field cursor_transfer any
---@field custom_input any
---@field cycle_blueprint_book_backwards any
---@field cycle_blueprint_book_forwards any
---@field deconstruct any
---@field delete_blueprint_library any
---@field delete_blueprint_record any
---@field delete_custom_tag any
---@field delete_permission_group any
---@field destroy_item any
---@field destroy_opened_item any
---@field disconnect_rolling_stock any
---@field drag_train_schedule any
---@field drag_train_wait_condition any
---@field drop_blueprint_record any
---@field drop_item any
---@field edit_blueprint_tool_preview any
---@field edit_custom_tag any
---@field edit_permission_group any
---@field export_blueprint any
---@field fast_entity_split any
---@field fast_entity_transfer any
---@field flush_opened_entity_fluid any
---@field flush_opened_entity_specific_fluid any
---@field go_to_train_station any
---@field grab_blueprint_record any
---@field gui_checked_state_changed any
---@field gui_click any
---@field gui_confirmed any
---@field gui_elem_changed any
---@field gui_location_changed any
---@field gui_selected_tab_changed any
---@field gui_selection_state_changed any
---@field gui_switch_state_changed any
---@field gui_text_changed any
---@field gui_value_changed any
---@field import_blueprint any
---@field import_blueprint_string any
---@field import_blueprints_filtered any
---@field import_permissions_string any
---@field inventory_split any
---@field inventory_transfer any
---@field launch_rocket any
---@field lua_shortcut any
---@field map_editor_action any
---@field market_offer any
---@field mod_settings_changed any
---@field open_achievements_gui any
---@field open_blueprint_library_gui any
---@field open_blueprint_record any
---@field open_bonus_gui any
---@field open_character_gui any
---@field open_current_vehicle_gui any
---@field open_equipment any
---@field open_gui any
---@field open_item any
---@field open_logistic_gui any
---@field open_mod_item any
---@field open_parent_of_opened_item any
---@field open_production_gui any
---@field open_technology_gui any
---@field open_tips_and_tricks_gui any
---@field open_train_gui any
---@field open_train_station_gui any
---@field open_trains_gui any
---@field paste_entity_settings any
---@field place_equipment any
---@field quick_bar_pick_slot any
---@field quick_bar_set_selected_page any
---@field quick_bar_set_slot any
---@field reassign_blueprint any
---@field remove_cables any
---@field remove_train_station any
---@field reset_assembling_machine any
---@field reset_item any
---@field reverse_select_area any
---@field rotate_entity any
---@field select_area any
---@field select_blueprint_entities any
---@field select_entity_slot any
---@field select_item any
---@field select_mapper_slot any
---@field select_next_valid_gun any
---@field select_tile_slot any
---@field send_spidertron any
---@field set_auto_launch_rocket any
---@field set_autosort_inventory any
---@field set_behavior_mode any
---@field set_car_weapons_control any
---@field set_circuit_condition any
---@field set_circuit_mode_of_operation any
---@field set_controller_logistic_trash_filter_item any
---@field set_deconstruction_item_tile_selection_mode any
---@field set_deconstruction_item_trees_and_rocks_only any
---@field set_entity_color any
---@field set_entity_energy_property any
---@field set_entity_logistic_trash_filter_item any
---@field set_filter any
---@field set_flat_controller_gui any
---@field set_heat_interface_mode any
---@field set_heat_interface_temperature any
---@field set_infinity_container_filter_item any
---@field set_infinity_container_remove_unfiltered_items any
---@field set_infinity_pipe_filter any
---@field set_inserter_max_stack_size any
---@field set_inventory_bar any
---@field set_linked_container_link_i_d any
---@field set_logistic_filter_item any
---@field set_logistic_filter_signal any
---@field set_player_color any
---@field set_recipe_notifications any
---@field set_request_from_buffers any
---@field set_research_finished_stops_game any
---@field set_signal any
---@field set_splitter_priority any
---@field set_train_stopped any
---@field set_trains_limit any
---@field set_vehicle_automatic_targeting_parameters any
---@field setup_assembling_machine any
---@field setup_blueprint any
---@field setup_single_blueprint_record any
---@field smart_pipette any
---@field spawn_item any
---@field stack_split any
---@field stack_transfer any
---@field start_repair any
---@field start_research any
---@field start_walking any
---@field stop_building_by_moving any
---@field switch_connect_to_logistic_network any
---@field switch_constant_combinator_state any
---@field switch_inserter_filter_mode_state any
---@field switch_power_switch_state any
---@field switch_to_rename_stop_gui any
---@field take_equipment any
---@field toggle_deconstruction_item_entity_filter_mode any
---@field toggle_deconstruction_item_tile_filter_mode any
---@field toggle_driving any
---@field toggle_enable_vehicle_logistics_while_moving any
---@field toggle_entity_logistic_requests any
---@field toggle_equipment_movement_bonus any
---@field toggle_map_editor any
---@field toggle_personal_logistic_requests any
---@field toggle_personal_roboport any
---@field toggle_show_entity_info any
---@field translate_string any
---@field undo any
---@field upgrade any
---@field upgrade_opened_blueprint_by_item any
---@field upgrade_opened_blueprint_by_record any
---@field use_artillery_remote any
---@field use_item any
---@field wire_dragging any
---@field write_to_console any

---@class Defines.inventory
---@field artillery_turret_ammo any
---@field artillery_wagon_ammo any
---@field assembling_machine_input any
---@field assembling_machine_modules any
---@field assembling_machine_output any
---@field beacon_modules any
---@field burnt_result any
---@field car_ammo any
---@field car_trunk any
---@field cargo_wagon any
---@field character_ammo any
---@field character_armor any
---@field character_corpse any
---@field character_guns any
---@field character_main any
---@field character_trash any
---@field character_vehicle any
---@field chest any
---@field editor_ammo any
---@field editor_armor any
---@field editor_guns any
---@field editor_main any
---@field fuel any
---@field furnace_modules any
---@field furnace_result any
---@field furnace_source any
---@field god_main any
---@field item_main any
---@field lab_input any
---@field lab_modules any
---@field mining_drill_modules any
---@field roboport_material any
---@field roboport_robot any
---@field robot_cargo any
---@field robot_repair any
---@field rocket any
---@field rocket_silo_result any
---@field rocket_silo_rocket any
---@field spider_ammo any
---@field spider_trash any
---@field spider_trunk any
---@field turret_ammo any

---@class Defines.logistic_member_index
---@field character_provider any
---@field character_requester any
---@field character_storage any
---@field generic_on_off_behavior any
---@field logistic_container any
---@field vehicle_storage any

---@class Defines.logistic_mode
---@field active_provider any
---@field buffer any
---@field none any
---@field passive_provider any
---@field requester any
---@field storage any

---@class Defines.mouse_button_type
---@field left any
---@field middle any
---@field none any
---@field right any

---@class Defines.prototypes

---@class Defines.rail_connection_direction
---@field left any
---@field none any
---@field right any
---@field straight any

---@class Defines.rail_direction
---@field back any
---@field front any

---@class Defines.relative_gui_position
---@field bottom any
---@field left any
---@field right any
---@field top any

---@class Defines.relative_gui_type
---@field accumulator_gui any
---@field achievement_gui any
---@field additional_entity_info_gui any
---@field admin_gui any
---@field arithmetic_combinator_gui any
---@field armor_gui any
---@field assembling_machine_gui any
---@field assembling_machine_select_recipe_gui any
---@field beacon_gui any
---@field blueprint_book_gui any
---@field blueprint_library_gui any
---@field blueprint_setup_gui any
---@field bonus_gui any
---@field burner_equipment_gui any
---@field car_gui any
---@field constant_combinator_gui any
---@field container_gui any
---@field controller_gui any
---@field decider_combinator_gui any
---@field deconstruction_item_gui any
---@field electric_energy_interface_gui any
---@field electric_network_gui any
---@field entity_variations_gui any
---@field entity_with_energy_source_gui any
---@field equipment_grid_gui any
---@field furnace_gui any
---@field generic_on_off_entity_gui any
---@field heat_interface_gui any
---@field infinity_pipe_gui any
---@field inserter_gui any
---@field item_with_inventory_gui any
---@field lab_gui any
---@field lamp_gui any
---@field linked_container_gui any
---@field loader_gui any
---@field logistic_gui any
---@field market_gui any
---@field mining_drill_gui any
---@field other_player_gui any
---@field permissions_gui any
---@field pipe_gui any
---@field power_switch_gui any
---@field production_gui any
---@field programmable_speaker_gui any
---@field rail_chain_signal_gui any
---@field rail_signal_gui any
---@field reactor_gui any
---@field rename_stop_gui any
---@field resource_entity_gui any
---@field roboport_gui any
---@field rocket_silo_gui any
---@field server_config_gui any
---@field spider_vehicle_gui any
---@field splitter_gui any
---@field standalone_character_gui any
---@field storage_tank_gui any
---@field tile_variations_gui any
---@field train_gui any
---@field train_stop_gui any
---@field trains_gui any
---@field transport_belt_gui any
---@field upgrade_item_gui any
---@field wall_gui any

---@class Defines.render_mode
---@field chart any
---@field chart_zoomed_in any
---@field game any

---@class Defines.rich_text_setting
---@field disabled any
---@field enabled any
---@field highlight any

---@class Defines.riding.acceleration
---@field accelerating any
---@field braking any
---@field nothing any
---@field reversing any

---@class Defines.riding.direction
---@field left any
---@field right any
---@field straight any

---@class Defines.riding
---@field acceleration Defines.riding.acceleration
---@field direction Defines.riding.direction

---@class Defines.shooting
---@field not_shooting any
---@field shooting_enemies any
---@field shooting_selected any

---@class Defines.signal_state
---@field closed any @Red.
---@field open any @Green.
---@field reserved any @Orange.
---@field reserved_by_circuit_network any @Red - From circuit network.

---@class Defines.train_state
---@field arrive_signal any @Braking before a rail signal.
---@field arrive_station any @Braking before a station.
---@field destination_full any @Same as no_path but all candidate train stops are full
---@field manual_control any @Can move if user explicitly sits in and rides the train.
---@field manual_control_stop any @Switched to manual control and has to stop.
---@field no_path any @Has no path and is stopped.
---@field no_schedule any @Doesn't have anywhere to go.
---@field on_the_path any @Normal state -- following the path.
---@field path_lost any @Had path and lost it -- must stop.
---@field wait_signal any @Waiting at a signal.
---@field wait_station any @Waiting at a station.

---@class Defines.transport_line
---@field left_line any
---@field left_split_line any
---@field left_underground_line any
---@field right_line any
---@field right_split_line any
---@field right_underground_line any
---@field secondary_left_line any
---@field secondary_left_split_line any
---@field secondary_right_line any
---@field secondary_right_split_line any

---@class Defines.wire_connection_id
---@field electric_pole any
---@field power_switch_left any
---@field power_switch_right any

---@class Defines.wire_type
---@field copper any
---@field green any
---@field red any