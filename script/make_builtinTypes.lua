local make_file = require("script.make_file")


local builtin_types = data.builtin_types

local baseTypes = {
	string = true,
	table = true,
	boolean = true
}

---@param types table
local function makeType(types)
	local description = ""
	for index, type in ipairs(types) do
		if not baseTypes[type.name] then
			description = description..("---@alias %s %s @%s\n"):format(type.name, "number", type.description)
		end
	end
	make_file(description, "./factorio_doc/builtin_types.lua")
end

makeType(builtin_types)