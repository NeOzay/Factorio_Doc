---@class MethodDescription
local MethodDoc = {}
MethodDoc.__index = MethodDoc
---@param params Parameter[]
local function make_params(params)
	local def = ""
	for index, param in ipairs(params) do
		local name = param.name..(param.optional and "?" or "")
		def = def..("---@param %s %s"):format(name, solve_type(param.type))
		if param.description ~= "" then
			def = def.." @"..param.description
		end
		def = def.."\n"
	end
	return def
end

---@param params Parameter
local function make_table_params(params)
	local _type = solve_type({complex_type = "table", parameters = params})
	local def = ("---@param %s %s\n"):format("_table", _type)
	return def
end

---@param returns Parameter[]
local function make_returns(returns)
	local def = ""
	for index, _return in ipairs(returns) do
		def = def..("---@return %s"):format(solve_type(_return.type))
		if _return.description ~= "" then
			def = def.." @".._return.description
		end
		def = def.."\n"
	end
	return def
end

---@param method Method
---@param parent? string
function MethodDoc.new(method, parent)
	---@class MethodDescription
	local methodDoc = setmetatable({}, MethodDoc)
	
	---@diagnostic disable
	if method.custom then
		methodDoc.custom = method.custom
		return methodDoc
	end
	---@diagnostic enable
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
	
	methodDoc.table_type = method.takes_table
	
	return methodDoc
end

function MethodDoc:tostring()
	current.field = self.name
	if self.custom then
		return self.custom
	end
	
	local description = ""
	description = description .. self.documentation:tostring()

	local paramNames = {}

	if self.table_type then
		description = description..make_table_params(self.parameters)
		paramNames = {"_table"}
	else
		for index, param in ipairs(self.parameters) do
			param.name = "_" .. param.name
			paramNames[index] = param.name
		end
		description = description..make_params(self.parameters)
	end

	description = description..make_returns(self.returns)

	local name = ("%s%s"):format(self.parent or "", self.name)
	local defFunction = ("function %s(%s) end"):format(name, table.concat(paramNames, ", "))
	description = description..defFunction
	return description.."\n"
end

return MethodDoc
