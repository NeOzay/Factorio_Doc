---@meta

---An array of fluid boxes of an entity. Entities may contain more than one fluid box, and some can change the number of fluid boxes -- for instance, an assembling machine will change its number of fluid boxes depending on its active recipe.
---
---See [Fluid](Fluid)
---
---Do note that reading from a [LuaFluidBox](LuaFluidBox) creates a new table and writing will copy the given fields from the table into the engine's own fluid box structure. Therefore, the correct way to update a fluidbox of an entity is to read it first, modify the table, then write the modified table back. Directly accessing the returned table's attributes won't have the desired effect.
---
---Double the temperature of the fluid in `entity`'s first fluid box. 
---```lua
---fluid = entity.fluidbox[1]
---fluid.temperature = fluid.temperature * 2
---entity.fluidbox[1] = fluid
---```
---@class LuaFluidBox
---@field object_name string @The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.`[R]`
---@field owner LuaEntity @The entity that owns this fluidbox.`[R]`
---@field valid boolean @Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.`[R]`
local LuaFluidBox = {}

---Flushes all fluid from this fluidbox and its fluid system.
---@param fluid? FluidIdentification @If provided, only this fluid is flushed.
---@param index uint
---@return table<string, float> @The removed fluid.
function LuaFluidBox.flush(fluid, index) end

---The capacity of the given fluidbox index.
---@param index uint
---@return double
function LuaFluidBox.get_capacity(index) end

---The fluidboxes to which the fluidbox at the given index is connected.
---@param index uint
---@return LuaFluidBox[]
function LuaFluidBox.get_connections(index) end

---Get a fluid box filter
---@param index uint @The index of the filter to get.
---@return FluidBoxFilter @The filter at the requested index, or `nil` if there isn't one.
function LuaFluidBox.get_filter(index) end

---Flow through the fluidbox in the last tick. It is the larger of in-flow and out-flow.
---
---Fluid wagons do not track it and will return 0.
---@param index uint
---@return double
function LuaFluidBox.get_flow(index) end

---Gets unique fluid system identifier of selected fluid box. May return nil for fluid wagon, fluid turret's internal buffer or a fluidbox which does not belong to a fluid system
---@param index uint
---@return uint
function LuaFluidBox.get_fluid_system_id(index) end

---Returns the fluid the fluidbox is locked onto
---@param index uint
---@return string @`nil` if the fluidbox is not locked to any fluid.
function LuaFluidBox.get_locked_fluid(index) end

---The prototype of this fluidbox index.
---@param index uint
---@return LuaFluidBoxPrototype
function LuaFluidBox.get_prototype(index) end

---All methods and properties that this object supports.
---@return string
function LuaFluidBox.help() end

---Set a fluid box filter.
---
---Some entities cannot have their fluidbox filter set, notably fluid wagons and crafting machines.
---@param filter? FluidBoxFilterSpec @The filter to set. Setting `nil` clears the filter.
---@param index uint @The index of the filter to set.
---@return boolean @Whether the filter was set successfully.
function LuaFluidBox.set_filter(filter, index) end

