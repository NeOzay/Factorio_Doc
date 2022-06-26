local json = require("json")

local rawData
do
	local f = io.open("data.json","r")
	rawData = f:read("*a")
	f:close()
end
---@type Toplevel
local data = json.decode(rawData)

local classes = data.classes