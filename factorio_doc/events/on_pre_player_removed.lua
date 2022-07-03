---@meta

---Called before a player is removed (deleted) from the game. Not to be confused with the player logging of this is different in that the player is deleted as if he never existed in the save file.
---@class on_pre_player_removed
---@field name defines.events @Identifier of the event
---@field player_index uint @The player index that will be removed
---@field tick uint @Tick the event was generated.
local on_pre_player_removed = {}

