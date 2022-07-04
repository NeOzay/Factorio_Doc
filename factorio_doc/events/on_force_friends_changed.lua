---@meta

---Called when the a forces friends change.
---@class on_force_friends_changed
---@field added boolean @If the other force was added or removed.
---@field force LuaForce @The force who's friends changed.
---@field name defines.events @Identifier of the event
---@field other_force LuaForce @Which force was added or removed.
---@field tick uint @Tick the event was generated.
local on_force_friends_changed = {}
