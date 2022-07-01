---@meta

---
---@class LuaCombinatorControlBehavior
---@field signals_last_tick Signal[] @The circuit network signals sent by this combinator last tick.`[R]`
local LuaCombinatorControlBehavior = {}

---Gets the value of a specific signal sent by this combinator behavior last tick or `nil` if the signal didn't exist.
---@param signal SignalID @The signal to get
---@return int
function LuaCombinatorControlBehavior.get_signal_last_tick(signal) end

