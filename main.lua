json = require"json"
DocDescription = require"script.make_doc"
ClassDescription = require"script.make_class"
FieldDescription = require"script.make_field"
MethodDescription = require"script.make_method"
solve_type = require"script.solve_type"

make_file = require("script.make_file")


local rawData
do
	local f = io.open("data.json","r")
	rawData = f:read("*a")
	f:close()
end

data = json.decode(rawData)--[[@as Toplevel]]


current = {}
require("custom")

local function setupClass()
	for i = 1, #data.classes, 1 do
		local c = ClassDescription.new(data.classes[i])
		make_file(c:tostring(), "./factorio_doc/classes/"..c.name..".lua")
	end
end


require("script.make_builtinTypes")
setupClass()
require("script.make_define")
require("script.make_event")
require("script.make_globalObject")
require("script.make_consept")
