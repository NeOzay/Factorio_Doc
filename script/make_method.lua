local Docomentation = require"script.make_doc"

---@class MethodDescription
local MethodDoc = {}
MethodDoc.__index = MethodDoc
---@param param Parameter
local function make_param(param)
	local def = ("---@param %s %s"):format(param.name, tostring(param.type))
	if param.description ~= "" then
		def = def.." @"..param.description
	end
	return def.."\n"
end

---@param method Method
---@param parent? string
function MethodDoc.new(method, parent)
	---@class MethodDescription
	local methodDoc = setmetatable({}, MethodDoc)
	methodDoc.raw = method
	methodDoc.name = method.name
	methodDoc.parent = parent and parent.."."
	methodDoc.documentation = Docomentation.new(method.description, method.notes, method.examples)
	methodDoc.parameters = method.parameters
	methodDoc.returns = method.return_values
	return methodDoc
end

function MethodDoc:tostring()
	local description = ""
	description = description .. self.documentation:tostring()
	local paramList = {}
	for index, param in ipairs(self.parameters) do
		description = description..make_param(param)
		table.insert(paramList, param.name)
	end

	local name = ("%s%s"):format(self.parent or "", self.name)
	local defFunction = ("function %s(%s) end"):format(name, table.concat(paramList, ", "))
	description = description..defFunction
	return description.."\n"
end

return MethodDoc
