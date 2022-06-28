local make_file = require("script.make_file")

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
			description = description..string.format("---@alias %s %s @%s", type.name, "number", type.description).."\n"
		end
	end
	make_file(description, "./factorio_doc/builtin_types.lua")
end

return makeType
