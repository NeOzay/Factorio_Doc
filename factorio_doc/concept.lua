---@meta

---@class AchievementPrototypeFilter

---@class AdvancedMapGenSettings
---@field difficulty_settings DifficultySettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field pollution PollutionMapSettings

---@class Alert
---@field icon? SignalID @The SignalID used for a custom alert. Only present for custom alerts.
---@field message? LocalisedString @The message for a custom alert. Only present for custom alerts.
---@field position? MapPosition
---@field prototype? LuaEntityPrototype
---@field target? LuaEntity
---@field tick uint @The tick this alert was created.

---@class Alignment

---@class AmmoType
---@field action? TriggerItem[]
---@field category string @Ammo category of this ammo.
---@field clamp_position? boolean @When `true`, the gun will be able to shoot even when the target is out of range. Only applies when `target_type` is `position`. The gun will fire at the maximum range in the direction of the target position. Defaults to `false`.
---@field energy_consumption? double @Energy consumption of a single shot, if applicable. Defaults to `0`.
---@field target_type string @One of `"entity"` (fires at an entity), `"position"` (fires directly at a position), or `"direction"` (fires in a direction).

---@class Any

---@class AnyBasic

---@class ArithmeticCombinatorParameters
---@field first_constant? int @Constant to use as the first argument of the operation. Has no effect when `first_signal` is set. Defaults to `0`.
---@field first_signal? SignalID @First signal to use in an operation. If not specified, the second argument will be the value of `first_constant`.
---@field operation? string @Must be one of `"*"`, `"/"`, `"+"`, `"-"`, `"%"`, `"^"`, `"<<"`, `">>"`, `"AND"`, `"OR"`, `"XOR"`. When not specified, defaults to `"*"`.
---@field output_signal? SignalID @Specifies the signal to output.
---@field second_constant? int @Constant to use as the second argument of the operation. Has no effect when `second_signal` is set. Defaults to `0`.
---@field second_signal? SignalID @Second signal to use in an operation. If not specified, the second argument will be the value of `second_constant`.

---@class AttackParameterFluid
---@field damage_modifier double @Multiplier applied to the damage of an attack.
---@field type string @Name of the [LuaFluidPrototype](LuaFluidPrototype).

---@class AttackParameters
---@field ammo_categories? string[] @List of the names of compatible [LuaAmmoCategoryPrototypes](LuaAmmoCategoryPrototype).
---@field ammo_consumption_modifier float @Multiplier applied to the ammo consumption of an attack.
---@field ammo_type? AmmoType
---@field cooldown float @Minimum amount of ticks between shots. If this is less than `1`, multiple shots can be performed per tick.
---@field damage_modifier float @Multiplier applied to the damage of an attack.
---@field fire_penalty float @When searching for the nearest enemy to attack, `fire_penalty` is added to the enemy's distance if they are on fire.
---@field health_penalty float @When searching for an enemy to attack, a higher `health_penalty` will discourage targeting enemies with high health. A negative penalty will do the opposite.
---@field min_attack_distance float @If less than `range`, the entity will choose a random distance between `range` and `min_attack_distance` and attack from that distance. Used for spitters.
---@field min_range float @Minimum range of attack. Used with flamethrower turrets to prevent self-immolation.
---@field movement_slow_down_cooldown float
---@field movement_slow_down_factor double
---@field range float @Maximum range of attack.
---@field range_mode string @Defines how the range is determined. Either `'center-to-center'` or `'bounding-box-to-bounding-box'`.
---@field rotate_penalty float @When searching for an enemy to attack, a higher `rotate_penalty` will discourage targeting enemies that would take longer to turn to face.
---@field turn_range float @The arc that the entity can attack in as a fraction of a circle. A value of `1` means the full 360 degrees.
---@field type string @The type of AttackParameter. One of `'projectile'`, `'stream'` or `'beam'`.
---@field warmup uint @Number of ticks it takes for the weapon to actually shoot after it has been ordered to do so.

---@class AutoplaceControl
---@field frequency MapGenSize @For things that are placed as spots such as ores and enemy bases, frequency is generally proportional to number of spots placed per unit area. For continuous features such as forests, frequency is how compressed the probability function is over distance, i.e. the inverse of 'scale' (similar to terrain_segmentation). When the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) is of the category `"terrain"`, then scale is shown in the map generator GUI instead of frequency.
---@field richness MapGenSize @Has different effects for different things, but generally affects the 'health' or density of a thing that is placed without affecting where it is placed. For trees, richness affects tree health. For ores, richness multiplies the amount of ore at any given tile in a patch. Metadata about autoplace controls (such as whether or not 'richness' does anything for them) can be found in the [LuaAutoplaceControlPrototype](LuaAutoplaceControlPrototype) by looking up `game.autoplace_control_prototypes[(control prototype name)]`, e.g. `game.autoplace_control_prototypes["enemy-base"].richness` is false, because enemy base autoplacement doesn't use richness.
---@field size MapGenSize @For things that are placed as spots, size is proportional to the area of each spot. For continuous features, size affects how much of the map is covered with the thing, and is called 'coverage' in the GUI.

---@class AutoplaceSettings
---@field settings table<string, AutoplaceControl>
---@field treat_missing_as_default boolean @Whether missing autoplace names for this type should be default enabled.

---@class AutoplaceSpecification
---@field control? string @Control prototype name.
---@field coverage double
---@field default_enabled boolean
---@field force string
---@field max_probability double
---@field order string
---@field peaks? AutoplaceSpecificationPeak[]
---@field placement_density uint
---@field probability_expression NoiseExpression
---@field random_probability_penalty double
---@field richness_base double
---@field richness_expression NoiseExpression
---@field richness_multiplier double
---@field richness_multiplier_distance_bonus double
---@field sharpness double
---@field starting_area_size uint
---@field tile_restriction? AutoplaceSpecificationRestriction[]

---@class AutoplaceSpecificationPeak
---@field aux_max_range double
---@field aux_optimal double
---@field aux_range double
---@field aux_top_property_limit double
---@field distance_max_range double
---@field distance_optimal double
---@field distance_range double
---@field distance_top_property_limit double
---@field elevation_max_range double
---@field elevation_optimal double
---@field elevation_range double
---@field elevation_top_property_limit double
---@field influence double
---@field max_influence double
---@field min_influence double
---@field noisePersistence double
---@field noise_layer? string @Prototype name of the noise layer.
---@field noise_octaves_difference double
---@field richness_influence double
---@field starting_area_weight_max_range double
---@field starting_area_weight_optimal double
---@field starting_area_weight_range double
---@field starting_area_weight_top_property_limit double
---@field temperature_max_range double
---@field temperature_optimal double
---@field temperature_range double
---@field temperature_top_property_limit double
---@field tier_from_start_max_range double
---@field tier_from_start_optimal double
---@field tier_from_start_range double
---@field tier_from_start_top_property_limit double
---@field water_max_range double
---@field water_optimal double
---@field water_range double
---@field water_top_property_limit double

---@class AutoplaceSpecificationRestriction
---@field first? string @Tile prototype name
---@field second? string @Second prototype name

---@class BeamTarget
---@field entity? LuaEntity @The target entity.
---@field position? MapPosition @The target position.

---@class BlueprintEntity
---@field connections? BlueprintCircuitConnection @The circuit network connections of the entity, if there are any. Only relevant for entities that support circuit connections.
---@field control_behavior? BlueprintControlBehavior @The control behavior of the entity, if it has one. The format of the control behavior depends on the entity's type. Only relevant for entities that support control behaviors.
---@field direction? defines.direction @The direction the entity is facing. Only present for entities that can face in different directions and when the entity is not facing north.
---@field entity_number uint @The entity's unique identifier in the blueprint.
---@field items? table<string, uint> @The items that the entity will request when revived, if there are any. It's a mapping of prototype names to amounts. Only relevant for entity ghosts.
---@field name string @The prototype name of the entity.
---@field position MapPosition @The position of the entity.
---@field schedule? TrainScheduleRecord[] @The schedule of the entity, if it has one. Only relevant for locomotives.
---@field tags? Tags @The entity tags of the entity, if there are any. Only relevant for entity ghosts.

---@class BlueprintItemIcon
---@field index uint @Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].
---@field name string @Name of the item prototype whose icon should be used.

---@class BlueprintSignalIcon
---@field index uint @Index of the icon in the blueprint icons slots. Has to be an integer in the range [1, 4].
---@field signal SignalID @The icon to use. It can be any item icon as well as any virtual signal icon.

---@class BoundingBox
---@field left_top MapPosition
---@field [1] MapPosition
---@field right_bottom MapPosition
---@field [2] MapPosition
---@field orientation? RealOrientation
---@field [3] RealOrientation

---@class CapsuleAction
---@field attack_parameters? AttackParameters @Only present when `type` is `"throw"` or `"use-on-self"`.
---@field equipment? string @Only present when `type` is `"equipment-remote"`. It is the equipment prototype name.
---@field type string @One of `"throw"`, `"equipment-remote"`, `"use-on-self"`.

---@class ChartTagSpec
---@field icon? SignalID
---@field last_user? PlayerIdentification
---@field position MapPosition
---@field text? string

---@class ChunkPosition
---@field x int
---@field [1] int
---@field y int
---@field [2] int

---@class ChunkPositionAndArea
---@field area BoundingBox
---@field x int
---@field y int

---@class CircuitCondition
---@field comparator? ComparatorString @Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
---@field constant? int @Constant to compare `first_signal` to. Has no effect when `second_signal` is set. When neither `second_signal` nor `constant` are specified, the effect is as though `constant` were specified with the value `0`.
---@field first_signal? SignalID @Defaults to blank
---@field second_signal? SignalID @What to compare `first_signal` to. If not specified, `first_signal` will be compared to `constant`.

---@class CircuitConditionDefinition
---@field condition CircuitCondition
---@field fulfilled? boolean @Whether the condition is currently fulfilled

---@class CircuitConnectionDefinition
---@field source_circuit_id defines.circuit_connector_id
---@field target_circuit_id defines.circuit_connector_id
---@field target_entity LuaEntity
---@field wire defines.wire_type @Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).

---@class CircularParticleCreationSpecification
---@field center Vector @This vector is a table with `x` and `y` keys instead of an array.
---@field creation_distance double
---@field creation_distance_orientation double
---@field direction float
---@field direction_deviation float
---@field height float
---@field height_deviation float
---@field name string @Name of the [LuaEntityPrototype](LuaEntityPrototype)
---@field speed float
---@field speed_deviation float
---@field starting_frame_speed float
---@field starting_frame_speed_deviation float
---@field use_source_position boolean
---@field vertical_speed float
---@field vertical_speed_deviation float

---@class CircularProjectileCreationSpecification

---@class CliffOrientation

---@class CliffPlacementSettings
---@field cliff_elevation_0 float @Elevation at which the first row of cliffs is placed. The default is `10`, and this cannot be set from the map generation GUI.
---@field cliff_elevation_interval float @Elevation difference between successive rows of cliffs. This is inversely proportional to 'frequency' in the map generation GUI. Specifically, when set from the GUI the value is `40 / frequency`.
---@field name string @Name of the cliff prototype.
---@field richness MapGenSize @Corresponds to 'continuity' in the GUI. This value is not used directly, but is used by the 'cliffiness' noise expression, which in combination with elevation and the two cliff elevation properties drives cliff placement (cliffs are placed when elevation crosses the elevation contours defined by `cliff_elevation_0` and `cliff_elevation_interval` when 'cliffiness' is greater than `0.5`). The default 'cliffiness' expression interprets this value such that larger values result in longer unbroken walls of cliffs, and smaller values (between `0` and `1`) result in larger gaps in cliff walls.

---@class CollisionMask

---@class CollisionMaskLayer

---@class CollisionMaskWithFlags

---@class Color
---@field r? float
---@field [1] float
---@field g? float
---@field [2] float
---@field b? float
---@field [3] float
---@field a? float
---@field [4] float

---@class ColorModifier
---@field r? float
---@field [1] float
---@field g? float
---@field [2] float
---@field b? float
---@field [3] float
---@field a? float
---@field [4] float

---@class Command
---@field type defines.command @Type of command. The remaining fields depend on the value of this field.

---@class ComparatorString

---@class ConfigurationChangedData
---@field migration_applied boolean @`true` when mod prototype migrations have been applied since the last time this save was loaded.
---@field mod_changes table<string, ModChangeData> @Dictionary of mod changes. It is indexed by mod name.
---@field mod_startup_settings_changed boolean @`true` when mod startup settings have changed since the last time this save was loaded.
---@field new_version? string @New version of the map. Present only when loading map version other than the current version.
---@field old_version? string @Old version of the map. Present only when loading map version other than the current version.

---@class ConstantCombinatorParameters
---@field count int @Value of the signal to emit.
---@field index uint @Index of the constant combinator's slot to set this signal to.
---@field signal SignalID @Signal to emit.

---@class CraftingQueueItem
---@field count uint @The amount of items being crafted.
---@field index uint @The index of the item in the crafting queue.
---@field prerequisite boolean @The item is a prerequisite for another item in the queue.
---@field recipe string @The recipe being crafted.

---@class CursorBoxRenderType

---@class CustomCommandData
---@field name string @The name of the command.
---@field parameter? string @The parameter passed after the command, if there is one.
---@field player_index? uint @The player who issued the command, or `nil` if it was issued from the server console.
---@field tick uint @The tick the command was used in.

---@class CutsceneWaypoint
---@field position? MapPosition @Position to pan the camera to.
---@field target? LuaEntity|LuaUnitGroup @Entity or unit group to pan the camera to.
---@field time_to_wait uint @Time in ticks to wait before moving to the next waypoint.
---@field transition_time uint @How many ticks it will take to reach this waypoint from the previous one.
---@field zoom? double @Zoom level to be set when the waypoint is reached. When not specified, the previous waypoint's zoom is used.

---@class DeciderCombinatorParameters
---@field comparator? ComparatorString @Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
---@field constant? uint @Constant to use as the second argument of operation. Defaults to `0`.
---@field copy_count_from_input? boolean @Defaults to `true`. When `false`, will output a value of `1` for the given `output_signal`.
---@field first_signal? SignalID @Defaults to blank.
---@field output_signal? SignalID @Defaults to blank.
---@field second_signal? SignalID @Second signal to use in an operation, if any. If this is not specified, the second argument to a decider combinator's operation is assumed to be the value of `constant`.

---@class Decorative
---@field amount uint8
---@field name string @The name of the decorative prototype.
---@field position TilePosition

---@class DecorativePrototypeFilter

---@class DecorativeResult
---@field amount uint
---@field decorative LuaDecorativePrototype
---@field position TilePosition

---@class DifficultySettings
---@field recipe_difficulty defines.difficulty_settings.recipe_difficulty
---@field research_queue_setting string @Either `"after-victory"`, `"always"` or `"never"`. Changing this to `"always"` or `"after-victory"` does not automatically unlock the research queue. See [LuaForce](LuaForce) for that.
---@field technology_difficulty defines.difficulty_settings.technology_difficulty
---@field technology_price_multiplier double @A value in range [0.001, 1000].

---@class DisplayResolution
---@field height uint
---@field width uint

---@class EnemyEvolutionMapSettings
---@field destroy_factor double @The amount evolution progresses for every destroyed spawner. Defaults to `0.002`.
---@field enabled boolean @Whether enemy evolution is enabled at all.
---@field pollution_factor double @The amount evolution progresses for every unit of pollution. Defaults to `0.0000009`.
---@field time_factor double @The amount evolution naturally progresses by every second. Defaults to `0.000004`.

---@class EnemyExpansionMapSettings
---@field building_coefficient double @Defaults to `0.1`.
---@field enabled boolean @Whether enemy expansion is enabled at all.
---@field enemy_building_influence_radius uint @Defaults to `2`.
---@field friendly_base_influence_radius uint @Defaults to `2`.
---@field max_colliding_tiles_coefficient double @A chunk has to have at most this high of a percentage of unbuildable tiles for it to be considered a candidate to avoid chunks full of water as candidates. Defaults to `0.9`, or 90%.
---@field max_expansion_cooldown uint @The maximum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `60*3,600=216,000` ticks.
---@field max_expansion_distance uint @Distance in chunks from the furthest base around to prevent expansions from reaching too far into the player's territory. Defaults to `7`.
---@field min_expansion_cooldown uint @The minimum time between expansions in ticks. The actual cooldown is adjusted to the current evolution levels. Defaults to `4*3,600=14,400` ticks.
---@field neighbouring_base_chunk_coefficient double @Defaults to `0.4`.
---@field neighbouring_chunk_coefficient double @Defaults to `0.5`.
---@field other_base_coefficient double @Defaults to `2.0`.
---@field settler_group_max_size uint @The maximum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `20`.
---@field settler_group_min_size uint @The minimum size of a biter group that goes to build a new base. This is multiplied by the evolution factor. Defaults to `5`.

---@class EntityPrototypeFilter

---@class EntityPrototypeFlags

---@class EntityPrototypeIdentification

---@class EquipmentPoint
---@field x uint
---@field y uint

---@class EquipmentPosition
---@field x int
---@field [1] int
---@field y int
---@field [2] int

---@class EquipmentPrototypeFilter

---@class EventData
---@field mod_name? string @The name of the mod that raised the event if it was raised using [LuaBootstrap::raise_event](LuaBootstrap::raise_event).
---@field name defines.events @The identifier of the event this handler was registered to.
---@field tick uint @The tick during which the event happened.

---@class EventFilter

---@class Fluid
---@field amount double @Amount of the fluid.
---@field name string @Fluid prototype name of the fluid.
---@field temperature? double @The temperature. When reading from [LuaFluidBox](LuaFluidBox), this field will always be present. It is not necessary to specify it when writing, however. When not specified, the fluid will be set to the fluid's default temperature as specified in the fluid's prototype.

---@class FluidBoxConnection
---@field max_underground_distance? uint @The maximum tile distance this underground connection can connect at if this is an underground pipe.
---@field positions Vector[] @The 4 cardinal direction connection points for this pipe. This vector is a table with `x` and `y` keys instead of an array.
---@field type string @The connection type: "input", "output", or "input-output".

---@class FluidBoxFilter
---@field maximum_temperature double @The maximum temperature allowed into the fluidbox.
---@field minimum_temperature double @The minimum temperature allowed into the fluidbox.
---@field name string @Fluid prototype name of the filtered fluid.

---@class FluidBoxFilterSpec
---@field force? boolean @Force the filter to be set, regardless of current fluid content.
---@field maximum_temperature? double @The maximum temperature allowed into the fluidbox.
---@field minimum_temperature? double @The minimum temperature allowed into the fluidbox.
---@field name string @Fluid prototype name of the filtered fluid.

---@class FluidIdentification

---@class FluidPrototypeFilter

---@class ForceCondition

---@class ForceIdentification

---@class GameViewSettings

---@class GuiAnchor
---@field gui defines.relative_gui_type
---@field name? string @If provided, only anchors the GUI element when the opened thing matches the name. `name` takes precedence over `names`.
---@field names? string[] @If provided, only anchors the GUI element when the opened thing matches one of the names. When reading an anchor, `names` is always populated.
---@field position defines.relative_gui_position
---@field type? string @If provided, only anchors the GUI element when the opened things type matches the type.

---@class GuiArrowSpecification
---@field type string @This determines which of the following fields will be required. Must be one of `"nowhere"` (will remove the arrow entirely), `"goal"` (will point to the current goal), `"entity_info"`, `"active_window"`, `"entity"`, `"position"`, `"crafting_queue"` or `"item_stack"` (will point to a given item stack in an inventory). Depending on this value, other fields may have to be specified.

---@class GuiLocation
---@field x int
---@field [1] int
---@field y int
---@field [2] int

---@class HeatConnection
---@field direction defines.direction
---@field position Vector

---@class HeatSetting
---@field mode? string @`"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.
---@field temperature? double @The target temperature. Defaults to the minimum temperature of the heat buffer.

---@class InfinityInventoryFilter
---@field count? uint @The count of the filter.
---@field index uint @The index of this filter in the filters list.
---@field mode? string @`"at-least"`, `"at-most"`, or `"exactly"`. Defaults to `"at-least"`.
---@field name string @Name of the item.

---@class InfinityPipeFilter
---@field mode? string @`"at-least"`, `"at-most"`, `"exactly"`, `"add"`, or `"remove"`. Defaults to `"at-least"`.
---@field name string @Name of the fluid.
---@field percentage? double @The fill percentage the pipe (e.g. 0.5 for 50%). Can't be negative.
---@field temperature? double @The temperature of the fluid. Defaults to the default/minimum temperature of the fluid.

---@class Ingredient
---@field amount double @Amount of the item or fluid.
---@field catalyst_amount? uint|double @How much of this ingredient is a catalyst.
---@field name string @Prototype name of the required item or fluid.
---@field type string @`"item"` or `"fluid"`.

---@class InserterCircuitConditions
---@field circuit? CircuitCondition
---@field logistics? CircuitCondition

---@class InventoryFilter
---@field index uint @Position of the corresponding filter slot.
---@field name string @Item prototype name of the item to filter.

---@class ItemPrototypeFilter

---@class ItemPrototypeFlags

---@class ItemPrototypeIdentification

---@class ItemStackDefinition
---@field ammo? double @Amount of ammo in the ammo items in the stack.
---@field count? uint @Number of items the stack holds. If not specified, defaults to `1`.
---@field durability? double @Durability of the tool items in the stack.
---@field health? float @Health of the items in the stack. Defaults to `1.0`.
---@field name string @Prototype name of the item the stack holds.
---@field tags? string[] @Tags of the items with tags in the stack.

---@class ItemStackIdentification

---@class ItemStackLocation
---@field inventory defines.inventory
---@field slot uint

---@class LocalisedString

---@class LogisticFilter
---@field count uint @The count for this filter.
---@field index uint @The index this filter applies to.
---@field name string @The item name for this filter.

---@class LogisticParameters
---@field max? uint
---@field min? uint
---@field name? string @The item. `nil` clears the filter.

---@class Loot
---@field count_max double @Maximum amount of loot to drop.
---@field count_min double @Minimum amount of loot to drop.
---@field item string @Item prototype name of the result.
---@field probability double @Probability that any loot at all will drop, as a number in range [0, 1].

---@class LuaEntityClonedEventFilter

---@class LuaEntityDamagedEventFilter

---@class LuaEntityDeconstructionCancelledEventFilter

---@class LuaEntityDiedEventFilter

---@class LuaEntityMarkedForDeconstructionEventFilter

---@class LuaEntityMarkedForUpgradeEventFilter

---@class LuaPlayerBuiltEntityEventFilter

---@class LuaPlayerMinedEntityEventFilter

---@class LuaPlayerRepairedEntityEventFilter

---@class LuaPostEntityDiedEventFilter

---@class LuaPreGhostDeconstructedEventFilter

---@class LuaPrePlayerMinedEntityEventFilter

---@class LuaPreRobotMinedEntityEventFilter

---@class LuaRobotBuiltEntityEventFilter

---@class LuaRobotMinedEntityEventFilter

---@class LuaScriptRaisedBuiltEventFilter

---@class LuaScriptRaisedDestroyEventFilter

---@class LuaScriptRaisedReviveEventFilter

---@class LuaSectorScannedEventFilter

---@class LuaUpgradeCancelledEventFilter

---@class MapAndDifficultySettings
---@field difficulty_settings DifficultySettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field max_failed_behavior_count uint @If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.
---@field path_finder PathFinderMapSettings
---@field pollution PollutionMapSettings
---@field steering SteeringMapSettings
---@field unit_group UnitGroupMapSettings

---@class MapExchangeStringData
---@field map_gen_settings MapGenSettings
---@field map_settings MapAndDifficultySettings

---@class MapGenPreset
---@field advanced_settings? AdvancedMapGenSettings
---@field basic_settings? MapGenSettings
---@field default? boolean @Whether this is the preset that is selected by default.
---@field order string @The string used to alphabetically sort the presets. It is a simple string that has no additional semantic meaning.

---@class MapGenSettings
---@field autoplace_controls table<string, AutoplaceControl> @Indexed by autoplace control prototype name.
---@field autoplace_settings table<string, AutoplaceSettings> @Each setting in this dictionary maps the string type to the settings for that type. Valid types are `"entity"`, `"tile"` and `"decorative"`.
---@field cliff_settings CliffPlacementSettings @Map generation settings for entities of the type "cliff".
---@field default_enable_all_autoplace_controls boolean @Whether undefined `autoplace_controls` should fall back to the default controls or not. Defaults to `true`.
---@field height uint @Height in tiles. If `0`, the map has 'infinite' height, with the actual limitation being one million tiles in each direction from the center.
---@field peaceful_mode boolean @Whether peaceful mode is enabled for this map.
---Overrides for tile property value generators. Values either name a NamedNoiseExpression or can be literal numbers, stored as strings (e.g. `"5"`). All other controls can be overridden by a property expression names. Notable properties: 
---- `moisture` - a value between 0 and 1 that determines whether a tile becomes sandy (low moisture) or grassy (high moisture).
---- `aux` - a value between 0 and 1 that determines whether low-moisture tiles become sand or red desert.
---- `temperature` - provides a value (vaguely representing degrees Celsius, varying between -20 and 50) that is used (together with moisture and aux) as part of tree and decorative placement.
---- `elevation` - tiles values less than zero become water. Cliffs are placed along certain contours according to [CliffPlacementSettings](CliffPlacementSettings).
---- `cliffiness` - determines whether (when >0.5) or not (when <0.5) a cliff will be placed at an otherwise suitable (according to [CliffPlacementSettings](CliffPlacementSettings)) location.
---- `enemy-base-intensity` - a number that is referenced by both `enemy-base-frequency` and `enemy-base-radius`. i.e. if this is overridden, enemy base frequency and size will both be affected and do something reasonable. By default, this expression returns a value proportional to distance from any starting point, clamped at about 7.
---- `enemy-base-frequency` - a number representing average number of enemy bases per tile for a region, by default in terms of `enemy-base-intensity`.
---- `enemy-base-radius` - a number representing the radius of an enemy base, if one were to be placed on the given tile, by default proportional to a constant plus `enemy-base-intensity`. Climate controls ('Moisture' and 'Terrain type' at the bottom of the Terrain tab in the map generator GUI) don't have their own dedicated structures in MapGenSettings. Instead, their values are stored as property expression overrides with long names: 
---- `control-setting:moisture:frequency:multiplier` - frequency (inverse of scale) multiplier for moisture noise. Default is 1.
---- `control-setting:moisture:bias` - global bias for moisture (which normally varies between 0 and 1). Default is 0.
---- `control-setting:aux:frequency:multiplier` - frequency (inverse of scale) multiplier for aux (called 'terrain type' in the GUI) noise. Default is 1.
---- `control-setting:aux:bias` - global bias for aux/terrain type (which normally varies between 0 and 1). Default is 0. All other MapGenSettings feed into named noise expressions, and therefore placement can be overridden by including the name of a property in this dictionary. The probability and richness functions for placing specific tiles, entities, and decoratives can be overridden by including an entry named `{tile|entity|decorative}:(prototype name):{probability|richness}`.
---@field property_expression_names table<string, string>
---@field seed uint @The random seed used to generated this map.
---@field starting_area MapGenSize @Size of the starting area.
---@field starting_points MapPosition[] @Positions of the starting areas.
---@field terrain_segmentation MapGenSize @The inverse of 'water scale' in the map generator GUI. Lower `terrain_segmentation` increases the scale of elevation features (lakes, continents, etc). This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
---@field water MapGenSize @The equivalent to 'water coverage' in the map generator GUI. Specifically, when this value is non-zero, `water_level = 10 * log2` (the value of this field), and the elevation generator subtracts water level from elevation before adding starting lakes. If water is set to 'none', elevation is clamped to a small positive value before adding starting lakes. This behavior can be overridden with alternate elevation generators (see `property_expression_names`, below).
---@field width uint @Width in tiles. If `0`, the map has 'infinite' width, with the actual limitation being one million tiles in each direction from the center.

---@class MapGenSize

---@class MapPosition
---@field x double
---@field [1] double
---@field y double
---@field [2] double

---@class MapSettings
---@field enemy_evolution EnemyEvolutionMapSettings
---@field enemy_expansion EnemyExpansionMapSettings
---@field max_failed_behavior_count uint @If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters getting stuck within their own base.
---@field path_finder PathFinderMapSettings
---@field pollution PollutionMapSettings
---@field steering SteeringMapSettings
---@field unit_group UnitGroupMapSettings

---@class MapViewSettings
---@field show-electric-network? boolean
---@field show-logistic-network? boolean
---@field show-networkless-logistic-members? boolean
---@field show-non-standard-map-info? boolean
---@field show-player-names? boolean
---@field show-pollution? boolean
---@field show-train-station-names? boolean
---@field show-turret-range? boolean

---@class ModChangeData
---@field new_version string @New version of the mod. May be `nil` if the mod is no longer present (i.e. it was just removed).
---@field old_version string @Old version of the mod. May be `nil` if the mod wasn't previously present (i.e. it was just added).

---@class ModSetting
---@field value uint|double|boolean|string @The value of the mod setting. The type depends on the setting.

---@class ModSettingPrototypeFilter

---@class ModuleEffectValue
---@field bonus float @The percentual increase of the attribute. A value of `0.6` means a 60% increase.

---@class ModuleEffects
---@field consumption? ModuleEffectValue
---@field pollution? ModuleEffectValue
---@field productivity? ModuleEffectValue
---@field speed? ModuleEffectValue

---@class MouseButtonFlags

---@class NoiseExpression
---@field type string @Names the type of the expression and determines what other fields are required.

---@class NthTickEventData
---@field nth_tick uint @The nth tick this handler was registered to.
---@field tick uint @The tick during which the event happened.

---@class Offer
---@field offer TechnologyModifier @The action that will take place when a player accepts the offer. Usually a `"give-item"` modifier.
---@field price Ingredient[] @List of prices.

---@class OldTileAndPosition
---@field old_tile LuaTilePrototype
---@field position TilePosition

---@class PathFinderMapSettings
---@field cache_accept_path_end_distance_ratio double @When looking for a path from cache, make sure it doesn't end too far from the requested end in relative terms. This is typically more lenient than the start ratio since the end target could be moving. Defaults to `0.15`.
---@field cache_accept_path_start_distance_ratio double @When looking for a path from cache, make sure it doesn't start too far from the requested start in relative terms. Defaults to `0.2`.
---@field cache_max_connect_to_cache_steps_multiplier uint @When looking for a connection to a cached path, search at most for this number of steps times the original estimate. Defaults to `100`.
---@field cache_path_end_distance_rating_multiplier double @When assigning a rating to the best path, this multiplier times end distances is considered. This value is typically higher than the start multiplier as this results in better end path quality. Defaults to `20`.
---@field cache_path_start_distance_rating_multiplier double @When assigning a rating to the best path, this multiplier times start distances is considered. Defaults to `10`.
---@field direct_distance_to_consider_short_request uint @The maximum direct distance in tiles before a request is no longer considered short. Defaults to `100`.
---@field enemy_with_different_destination_collision_penalty double @A penalty that is applied for another unit that is too close and either not moving or has a different goal. Defaults to `30`.
---@field extended_collision_penalty double @The collision penalty for collisions in the extended bounding box but outside the entity's actual bounding box. Defaults to `3`.
---@field fwd2bwd_ratio uint @The pathfinder performs a step of the backward search every `fwd2bwd_ratio`'th step. The minimum allowed value is `2`, which means symmetric search. The default value is `5`.
---@field general_entity_collision_penalty double @The general collision penalty with other units. Defaults to `10`.
---@field general_entity_subsequent_collision_penalty double @The collision penalty for positions that require the destruction of an entity to get to. Defaults to `3`.
---@field goal_pressure_ratio double @When looking at which node to check next, their heuristic value is multiplied by this ratio. The higher it is, the more the search is directed straight at the goal. Defaults to `2`.
---@field ignore_moving_enemy_collision_distance double @The distance in tiles after which other moving units are not considered for pathfinding. Defaults to `5`.
---@field long_cache_min_cacheable_distance double @The minimal distance to the goal in tiles required to be searched in the long path cache. Defaults to `30`.
---@field long_cache_size uint @Number of elements in the long cache. Defaults to `25`.
---@field max_clients_to_accept_any_new_request uint @The amount of path finder requests accepted per tick regardless of the requested path's length. Defaults to `10`.
---@field max_clients_to_accept_short_new_request uint @When the `max_clients_to_accept_any_new_request` amount is exhausted, only path finder requests with a short estimate will be accepted until this amount (per tick) is reached. Defaults to `100`.
---@field max_steps_worked_per_tick double @The maximum number of nodes that are expanded per tick. Defaults to `1,000`.
---@field max_work_done_per_tick uint @The maximum amount of work each pathfinding job is allowed to do per tick. Defaults to `8,000`.
---@field min_steps_to_check_path_find_termination uint @The minimum amount of steps that are guaranteed to be performed for every request. Defaults to `2000`.
---@field negative_cache_accept_path_end_distance_ratio double @Same principle as `cache_accept_path_end_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
---@field negative_cache_accept_path_start_distance_ratio double @Same principle as `cache_accept_path_start_distance_ratio`, but used for negative cache queries. Defaults to `0.3`.
---@field negative_path_cache_delay_interval uint @The delay in ticks between decrementing the score of all paths in the negative cache by one. Defaults to `20`.
---@field overload_levels uint[] @The thresholds of waiting clients after each of which the per-tick work limit will be increased by the corresponding value in `overload_multipliers`. This is to avoid clients having to wait too long. Must have the same number of elements as `overload_multipliers`. Defaults to `{0, 100, 500}`.
---@field overload_multipliers double[] @The multipliers to the amount of per-tick work applied after the corresponding thresholds in `overload_levels` have been reached. Must have the same number of elements as `overload_multipliers`. Defaults to `{2, 3, 4}`.
---@field short_cache_min_algo_steps_to_cache uint @The minimal number of nodes required to be searched in the short path cache. Defaults to `50`.
---@field short_cache_min_cacheable_distance double @The minimal distance to the goal in tiles required to be searched in the short path cache. Defaults to `10`.
---@field short_cache_size uint @Number of elements in the short cache. Defaults to `5`.
---@field short_request_max_steps uint @The maximum amount of nodes a short request will traverse before being rescheduled as a long request. Defaults to `1000`.
---@field short_request_ratio double @The amount of steps that are allocated to short requests each tick, as a percentage of all available steps. Defaults to `0.5`, or 50%.
---@field stale_enemy_with_same_destination_collision_penalty double @A penalty that is applied for another unit that is on the way to the goal. This is mainly relevant for situations where a group of units has arrived at the target they are supposed to attack, making units further back circle around to reach the target. Defaults to `30`.
---@field start_to_goal_cost_multiplier_to_terminate_path_find double @If the actual amount of steps is higher than the initial estimate by this factor, pathfinding is terminated. Defaults to `2000.0`.
---@field use_path_cache boolean @Whether to cache paths at all. Defaults to `true`.

---@class PathfinderFlags
---@field allow_destroy_friendly_entities? boolean @Allows pathing through friendly entities. Defaults to `false`.
---@field allow_paths_through_own_entities? boolean @Allows the pathfinder to path through entities of the same force. Defaults to `false`.
---@field cache? boolean @Enables path caching. This can be more efficient, but might fail to respond to changes in the environment. Defaults to `true`.
---@field low_priority? boolean @Sets lower priority on the path request, meaning it might take longer to find a path at the expense of speeding up others. Defaults to `false`.
---@field no_break? boolean @Makes the pathfinder not break in the middle of processing this pathfind, no matter how much work is needed. Defaults to `false`.
---@field prefer_straight_paths? boolean @Makes the pathfinder try to path in straight lines. Defaults to `false`.

---@class PathfinderWaypoint
---@field needs_destroy_to_reach boolean @`true` if the path from the previous waypoint to this one goes through an entity that must be destroyed.
---@field position MapPosition @The position of the waypoint on its surface.

---@class PlaceAsTileResult
---@field condition CollisionMask
---@field condition_size uint
---@field result LuaTilePrototype @The tile prototype.

---@class PlayerIdentification

---@class PollutionMapSettings
---@field aeging double @The amount of pollution eaten by a chunk's tiles as a percentage of 1. Defaults to `1`.
---@field diffusion_ratio double @The amount that is diffused to a neighboring chunk (possibly repeated for other directions as well). Defaults to `0.02`.
---@field enabled boolean @Whether pollution is enabled at all.
---@field enemy_attack_pollution_consumption_modifier double @Defaults to `1`.
---@field expected_max_per_chunk double @Any amount of pollution larger than this value is visualized as this value instead. Defaults to `150`.
---@field max_pollution_to_restore_trees double @Defaults to `20`.
---@field min_pollution_to_damage_trees double @Defaults to `60`.
---@field min_to_diffuse double @The amount of PUs that need to be in a chunk for it to start diffusing. Defaults to `15`.
---@field min_to_show_per_chunk double @Any amount of pollution smaller than this value (but bigger than zero) is visualized as this value instead. Defaults to `50`.
---@field pollution_per_tree_damage double @Defaults to `50`.
---@field pollution_restored_per_tree_damage double @Defaults to `10`.
---@field pollution_with_max_forest_damage double @Defaults to `150`.

---@class Product
---@field amount? double @Amount of the item or fluid to give. If not specified, `amount_min`, `amount_max` and `probability` must all be specified.
---@field amount_max? uint|double @Maximum amount of the item or fluid to give. Has no effect when `amount` is specified.
---@field amount_min? uint|double @Minimal amount of the item or fluid to give. Has no effect when `amount` is specified.
---@field catalyst_amount? uint|double @How much of this product is a catalyst.
---@field name string @Prototype name of the result.
---@field probability? double @A value in range [0, 1]. Item or fluid is only given with this probability; otherwise no product is produced.
---@field type string @`"item"` or `"fluid"`.

---@class ProgrammableSpeakerAlertParameters
---@field alert_message string
---@field icon_signal_id SignalID
---@field show_alert boolean
---@field show_on_map boolean

---@class ProgrammableSpeakerCircuitParameters
---@field instrument_id uint
---@field note_id uint
---@field signal_value_is_pitch boolean

---@class ProgrammableSpeakerInstrument
---@field name string
---@field notes string[]

---@class ProgrammableSpeakerParameters
---@field allow_polyphony boolean
---@field playback_globally boolean
---@field playback_volume double

---@class PrototypeFilter

---@class RealOrientation

---@class RecipePrototypeFilter

---@class RenderLayer

---@class Resistance
---@field decrease float @Absolute damage decrease
---@field percent float @Percentual damage decrease

---@class RidingState
---@field acceleration defines.riding.acceleration
---@field direction defines.riding.direction

---@class ScriptArea
---@field area BoundingBox
---@field color Color
---@field id uint
---@field name string

---@class ScriptPosition
---@field color Color
---@field id uint
---@field name string
---@field position MapPosition

---@class ScriptRenderTarget
---@field entity? LuaEntity
---@field entity_offset? Vector
---@field position? MapPosition

---@class ScriptRenderVertexTarget
---@field target MapPosition|LuaEntity
---@field target_offset? Vector @Only used if `target` is a LuaEntity.

---@class SelectedPrototypeData
---@field base_type string @E.g. `"entity"`.
---@field derived_type string @E.g. `"tree"`.
---@field name string @E.g. `"tree-05"`.

---@class SelectionModeFlags

---@class Signal
---@field count int @Value of the signal.
---@field signal SignalID @ID of the signal.

---@class SignalID
---@field name? string @Name of the item, fluid or virtual signal.
---@field type string @`"item"`, `"fluid"`, or `"virtual"`.

---@class SimpleItemStack

---@class SmokeSource
---@field deviation? MapPosition
---@field east_position? Vector
---@field frequency double
---@field height float
---@field height_deviation float
---@field name string
---@field north_position? Vector
---@field offset double
---@field position? Vector
---@field slow_down_factor uint8
---@field south_position? Vector
---@field starting_frame uint16
---@field starting_frame_deviation double
---@field starting_frame_speed uint16
---@field starting_frame_speed_deviation double
---@field starting_vertical_speed float
---@field starting_vertical_speed_deviation float
---@field vertical_speed_slowdown float
---@field west_position? Vector

---@class SoundPath

---@class SoundType

---@class SpawnPointDefinition
---@field evolution_factor double @Evolution factor for which this weight applies.
---@field weight double @Probability of spawning this unit at this evolution factor.

---@class SpritePath

---@class SteeringMapSetting
---@field force_unit_fuzzy_goto_behavior boolean @Used to make steering look better for aesthetic purposes.
---@field radius double @Does not include the radius of the unit.
---@field separation_factor double
---@field separation_force double

---@class SteeringMapSettings
---@field default SteeringMapSetting
---@field moving SteeringMapSetting

---@class SurfaceIdentification

---@class TabAndContent
---@field content LuaGuiElement
---@field tab LuaGuiElement

---@class Tags

---@class TechnologyIdentification

---@class TechnologyModifier
---@field type string @Modifier type. Specifies which of the other fields will be available. Possible values are: `"inserter-stack-size-bonus"`, `"stack-inserter-capacity-bonus"`, `"laboratory-speed"`, `"character-logistic-trash-slots"`, `"maximum-following-robots-count"`, `"worker-robot-speed"`, `"worker-robot-storage"`, `"ghost-time-to-live"`, `"turret-attack"`, `"ammo-damage"`, `"give-item"`, `"gun-speed"`, `"unlock-recipe"`, `"character-crafting-speed"`, `"character-mining-speed"`, `"character-running-speed"`, `"character-build-distance"`, `"character-item-drop-distance"`, `"character-reach-distance"`, `"character-resource-reach-distance"`, `"character-item-pickup-distance"`, `"character-loot-pickup-distance"`, `"character-inventory-slots-bonus"`, `"deconstruction-time-to-live"`, `"max-failed-attempts-per-tick-per-construction-queue"`, `"max-successful-attempts-per-tick-per-construction-queue"`, `"character-health-bonus"`, `"mining-drill-productivity-bonus"`, `"train-braking-force-bonus"`, `"zoom-to-world-enabled"`, `"zoom-to-world-ghost-building-enabled"`, `"zoom-to-world-blueprint-enabled"`, `"zoom-to-world-deconstruction-planner-enabled"`, `"zoom-to-world-upgrade-planner-enabled"`, `"zoom-to-world-selection-tool-enabled"`, `"worker-robot-battery"`, `"laboratory-productivity"`, `"follower-robot-lifetime"`, `"artillery-range"`, `"nothing"`, `"character-additional-mining-categories"`, `"character-logistic-requests"`.

---@class TechnologyPrototypeFilter

---@class Tile
---@field name string @The prototype name of the tile.
---@field position TilePosition @The position of the tile.

---@class TilePosition
---@field x int
---@field [1] int
---@field y int
---@field [2] int

---@class TilePrototypeFilter

---@class TrainSchedule
---@field current uint @Index of the currently active record
---@field records TrainScheduleRecord[]

---@class TrainScheduleRecord
---@field rail? LuaEntity @Rail to path to. Ignored if `station` is present.
---@field rail_direction? defines.rail_direction @When a train is allowed to reach rail target from any direction it will be `nil`. If rail has to be reached from specific direction, this value allows to choose the direction. This value corresponds to [LuaEntity::connected_rail_direction](LuaEntity::connected_rail_direction) of a TrainStop.
---@field station? string @Name of the station.
---@field temporary? boolean @Only present when the station is temporary, the value is then always `true`.
---@field wait_conditions? WaitCondition[]

---@class TriggerDelivery
---@field source_effects TriggerEffectItem[]
---@field target_effects TriggerEffectItem[]
---@field type string @One of `"instant"`, `"projectile"`, `"flame-thrower"`, `"beam"`, `"stream"`, `"artillery"`.

---@class TriggerEffectItem
---@field affects_target boolean
---@field repeat_count uint
---@field show_in_tooltip boolean
---@field type string @One of`"damage"`, `"create-entity"`, `"create-explosion"`, `"create-fire"`, `"create-smoke"`, `"create-trivial-smoke"`, `"create-particle"`, `"create-sticker"`, `"nested-result"`, `"play-sound"`, `"push-back"`, `"destroy-cliffs"`, `"show-explosion-on-chart"`, `"insert-item"`, `"script"`.

---@class TriggerItem
---@field action_delivery? TriggerDelivery[]
---@field collision_mask CollisionMask @The trigger will only affect entities that would collide with given collision mask.
---@field entity_flags? EntityPrototypeFlags @The trigger will only affect entities that contain any of these flags.
---@field force ForceCondition @If `"enemy"`, the trigger will only affect entities whose force is different from the attacker's and for which there is no cease-fire set. `"ally"` is the opposite of `"enemy"`.
---@field ignore_collision_condition boolean
---@field repeat_count uint
---@field trigger_target_mask TriggerTargetMask
---@field type string @One of `"direct"`, `"area"`, `"line"`, `"cluster"`.

---@class TriggerTargetMask

---@class UnitGroupMapSettings
---@field max_gathering_unit_groups uint @The maximum number of automatically created unit groups gathering for attack at any time. Defaults to `30`.
---@field max_group_gathering_time uint @The maximum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `10*3,600=36,000` ticks.
---@field max_group_member_fallback_factor double @When a member of a group falls back more than this factor times the group radius, the group will slow down to its `max_group_slowdown_factor` speed to let them catch up. Defaults to `3`.
---@field max_group_radius double @The maximum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `30.0`.
---@field max_group_slowdown_factor double @The minimum speed as a percentage of its maximum speed that a group will slow down to so members that fell behind can catch up. Defaults to `0.3`, or 30%.
---@field max_member_slowdown_when_ahead double @The minimum speed a percentage of its regular speed that a group member can slow down to when ahead of the group. Defaults to `0.6`, or 60%.
---@field max_member_speedup_when_behind double @The maximum speed a percentage of its regular speed that a group member can speed up to when catching up with the group. Defaults to `1.4`, or 140%.
---@field max_unit_group_size uint @The maximum number of members for an attack unit group. This only affects automatically created unit groups, manual groups created through the API are unaffected. Defaults to `200`.
---@field max_wait_time_for_late_members uint @After gathering has finished, the group is allowed to wait this long in ticks for delayed members. New members are not accepted anymore however. Defaults to `2*3,600=7,200` ticks.
---@field member_disown_distance double @When a member of a group falls back more than this factor times the group radius, it will be dropped from the group. Defaults to `10`.
---@field min_group_gathering_time uint @The minimum amount of time in ticks a group will spend gathering before setting off. The actual time is a random time between the minimum and maximum times. Defaults to `3,600` ticks.
---@field min_group_radius double @The minimum group radius in tiles. The actual radius is adjusted based on the number of members. Defaults to `5.0`.
---@field tick_tolerance_when_member_arrives uint

---@class UnitSpawnDefinition
---@field spawn_points SpawnPointDefinition[] @The points at which to spawn the unit.
---@field unit string @Prototype name of the unit that would be spawned.

---@class UpgradeFilter
---@field name? string @Name of the item, or entity.
---@field type string @`"item"`, or `"entity"`.

---@class Vector

---@class VehicleAutomaticTargetingParameters
---@field auto_target_with_gunner boolean
---@field auto_target_without_gunner boolean

---@class WaitCondition
---@field compare_type string @Either `"and"`, or `"or"`. Tells how this condition is to be compared with the preceding conditions in the corresponding `wait_conditions` array.
---@field condition? CircuitCondition @Only present when `type` is `"item_count"`, `"circuit"` or `"fluid_count"`.
---@field ticks? uint @Number of ticks to wait or of inactivity. Only present when `type` is `"time"` or `"inactivity"`.
---@field type string @One of `"time"`, `"inactivity"`, `"full"`, `"empty"`, `"item_count"`, `"circuit"`, `"robots_inactive"`, `"fluid_count"`, `"passenger_present"`, `"passenger_not_present"`.

---@class WireConnectionDefinition
---@field source_circuit_id? defines.circuit_connector_id @Mandatory if the source entity has more than one circuit connection using circuit wire.
---@field source_wire_id? defines.circuit_connector_id @Mandatory if the source entity has more than one wire connection using copper wire.
---@field target_circuit_id? defines.circuit_connector_id @Mandatory if the target entity has more than one circuit connection using circuit wire.
---@field target_entity LuaEntity @The entity to (dis)connect the source entity with.
---@field target_wire_id? defines.circuit_connector_id @Mandatory if the target entity has more than one wire connection using copper wire.
---@field wire defines.wire_type @Wire color, either [defines.wire_type.red](defines.wire_type.red) or [defines.wire_type.green](defines.wire_type.green).

