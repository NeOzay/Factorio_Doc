local json = require("json")
local Documentation = require("script.make_doc")
local Class = require("script.make_class")
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
local data = json.decode(rawData)

make_types(data.builtin_types)

---@type table
--local test = json.decode()

local c = Class.new(data.classes[2])

make_file(c:tostring(), "test.lua")
