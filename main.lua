json = require"json"
Documentation = require"script.make_doc"
Class = require"script.make_class"
Docomentation = require"script.make_doc"
FieldDescription = require"script.make_field"
MethodDescription = require"script.make_method"
solve_type = require"script.solve_type"

local make_types = require("script.make_builtinTypes")
local make_file = require("script.make_file")
local examples = require"examples"

local rawData
do
	local f = io.open("data.json","r")
	rawData = f:read("*a")
	f:close()
end
---@type Toplevel
local data = json.decode(rawData)--[[@as Toplevel]]

make_types(data.builtin_types)

---@type table
--local test = json.decode()

current = {}


for i = 1, #data.classes, 1 do
	local c = Class.new(data.classes[i])
	make_file(c:tostring(), "./factorio_doc/classes/"..c.name..".lua")
end
