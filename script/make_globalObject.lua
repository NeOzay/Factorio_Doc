
local global_objects = data.global_objects

table.insert(global_objects, {name = "defines", description = "", type = "Defines"})
local def = ""

for index, global_object in ipairs(global_objects) do
	local g = [[
---%s
---@type %s
%s = {}

]]
	def = def..g:format(global_object.description, global_object.type, global_object.name)
end
make_file(def, "./factorio_doc/global_objects.lua")