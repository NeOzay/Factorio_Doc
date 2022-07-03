
local events = data.events


for index, event in ipairs(events) do
	local c = ClassDescription.fromEvent(event)
	make_file(c:tostring(), "./factorio_doc/events/"..c.name..".lua")
end