---@param s string
---@param name string
return function (s, name)
	local f = io.open(name, "w")
	f:write("---@meta\n\n"..s)
	f:close()
end
