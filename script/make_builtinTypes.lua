local make_file = require("script.make_file")


local builtin_types = data.builtin_types

local baseTypes = {
	string = true,
	table = true,
	boolean = true
}

---@param types BuiltinType[]
local function makeType(types)
	local description = ""
	for index, _type in ipairs(types) do
		if not baseTypes[_type.name] then
			description = description..("---@alias %s %s #%s\n"):format(_type.name, "number", _type.description)
		end
	end
	make_file(description, "./factorio_doc/builtin_types.lua")
end

makeType(builtin_types)