
local events = data.events

local def = ""
for index, event in ipairs(events) do
	def = def..ClassDescription.fromEvent(event):tostring()
end
make_file(def, "./factorio_doc/events.lua")
