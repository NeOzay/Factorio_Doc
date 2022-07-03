---@class MethodDescription
local MethodDoc = {}
MethodDoc.__index = MethodDoc
---@param param Parameter
local function make_param(param)
	local name = param.name..(param.optional and "?" or "")
	local def = ("---@param %s %s"):format(name, solve_type(param.type))
	if param.description ~= "" then
		def = def.." @"..param.description
	end
	return def.."\n"
end

---@param returns Parameter
local function make_returns(returns)
	local def = ("---@return %s"):format(solve_type(returns.type))
	if returns.description ~= "" then
		def = def.." @"..returns.description
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
	table.sort(methodDoc.parameters, function (a, b)
		return a.order < b.order
	end)
	methodDoc.returns = method.return_values
	table.sort(methodDoc.returns, function (a, b)
		return a.order < b.order
	end)

	return methodDoc
end

function MethodDoc:tostring()
	local description = ""
	description = description .. self.documentation:tostring()
	local paramNames = {}
	for index, param in ipairs(self.parameters) do
		param.name = "_"..param.name
		description = description..make_param(param)
		table.insert(paramNames, param.name)
	end

	for index, _return in ipairs(self.returns) do
		description = description..make_returns(_return)
	end

	local name = ("%s%s"):format(self.parent or "", self.name)
	local defFunction = ("function %s(%s) end"):format(name, table.concat(paramNames, ", "))
	description = description..defFunction
	return description.."\n"
end

return MethodDoc
