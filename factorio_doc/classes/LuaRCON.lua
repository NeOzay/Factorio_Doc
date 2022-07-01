---@meta

---An interface to send messages to the calling RCON interface.
---@class LuaRCON
---@field object_name string @This object's name.`[R]`
local LuaRCON = {}

---Print text to the calling RCON interface if any.
---@param message LocalisedString
function LuaRCON.print(message) end

